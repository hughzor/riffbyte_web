import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../services/firebase_auth_service.dart';
import '../../services/firestore_service.dart';
import '../../theme/app_colors.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _loading = false;

  Future<void> _register() async {
    final displayName = _nameController.text.trim();
    final email = _emailController.text.trim();
    final password = _passwordController.text;
    final confirmPassword = _confirmPasswordController.text;

    if (displayName.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty) {
      _showError("Rellena todos los campos.");
      return;
    }

    if (password.length < 6) {
      _showError("La contraseña debe tener al menos 6 caracteres.");
      return;
    }

    if (password != confirmPassword) {
      _showError("Las contraseñas no coinciden.");
      return;
    }

    setState(() => _loading = true);

    try {
      final credential = await FirebaseAuthService().register(
        email: email,
        password: password,
      );

      await credential.user!.updateDisplayName(displayName);

      await credential.user!.sendEmailVerification();

      await FirestoreService().createUser(
        uid: credential.user!.uid,
        email: email,
        displayName: displayName,
      );

      if (mounted) {
        context.go('/verify-email', extra: email);
      }
    } on FirebaseAuthException catch (e) {
      String message;

      switch (e.code) {
        case 'email-already-in-use':
          message = "Ya existe una cuenta con ese correo.";
          break;

        case 'invalid-email':
          message = "El correo electrónico no es válido.";
          break;

        case 'weak-password':
          message = "La contraseña es demasiado débil.";
          break;

        default:
          message = e.message ?? "Ha ocurrido un error.";
      }

      _showError(message);
    } on FirebaseException catch (e) {
      _showError("Firestore: ${e.message}");
    } catch (e) {
      _showError(e.toString());
    } finally {
      if (mounted) {
        setState(() => _loading = false);
      }
    }
  }

  void _showError(String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
  }

  InputDecoration _input(String label, IconData icon) {
    return InputDecoration(
      labelText: label,
      prefixIcon: Icon(icon),
      filled: true,
      fillColor: const Color(0xFF181A1B),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: 430,
            margin: const EdgeInsets.all(30),
            padding: const EdgeInsets.all(40),
            decoration: BoxDecoration(
              color: const Color(0xFF202325),
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: const Color(0xFF31363A)),
            ),
            child: Column(
              children: [
                const Icon(
                  Icons.person_add_alt_1,
                  color: AppColors.primary,
                  size: 58,
                ),

                const SizedBox(height: 20),

                const Text(
                  "Crear cuenta",
                  style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 12),

                const Text(
                  "Crea tu cuenta para acceder al ecosistema de Riffbyte.",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: AppColors.textSecondary, height: 1.6),
                ),

                const SizedBox(height: 35),

                TextField(
                  controller: _nameController,
                  decoration: _input("Nombre", Icons.person_outline),
                ),

                const SizedBox(height: 22),

                TextField(
                  controller: _emailController,
                  decoration: _input(
                    "Correo electrónico",
                    Icons.email_outlined,
                  ),
                ),

                const SizedBox(height: 22),

                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: _input("Contraseña", Icons.lock_outline),
                ),

                const SizedBox(height: 22),

                TextField(
                  controller: _confirmPasswordController,
                  obscureText: true,
                  decoration: _input(
                    "Confirmar contraseña",
                    Icons.lock_reset_outlined,
                  ),
                ),

                const SizedBox(height: 35),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _loading ? null : _register,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      child: _loading
                          ? const SizedBox(
                              width: 22,
                              height: 22,
                              child: CircularProgressIndicator(
                                strokeWidth: 2.5,
                              ),
                            )
                          : const Text(
                              "Crear cuenta",
                              style: TextStyle(fontSize: 16),
                            ),
                    ),
                  ),
                ),

                const SizedBox(height: 18),

                TextButton(
                  onPressed: () {
                    context.go('/login');
                  },
                  child: const Text("Ya tengo una cuenta"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
