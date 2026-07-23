import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../services/firebase_auth_service.dart';
import '../../theme/app_colors.dart';

import 'package:provider/provider.dart';
import '../../providers/user_provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _loading = false;

  Future<void> _login() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Introduce el correo y la contraseña.")),
      );
      return;
    }

    setState(() => _loading = true);

    try {
      await FirebaseAuthService().signIn(email: email, password: password);

      final user = FirebaseAuth.instance.currentUser!;

      await user.reload();

      if (!user.emailVerified) {
        await FirebaseAuth.instance.signOut();

        if (!mounted) return;

        final resend = await showDialog<bool>(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text("Correo sin verificar"),
            content: const Text(
              "Todavía no has verificado tu correo electrónico.\n\n¿Quieres que te enviemos otro correo de verificación?",
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: const Text("Cancelar"),
              ),
              FilledButton(
                onPressed: () => Navigator.pop(context, true),
                child: const Text("Reenviar"),
              ),
            ],
          ),
        );

        if (resend == true) {
          await user.sendEmailVerification();

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Correo de verificación enviado.")),
          );
        }

        setState(() => _loading = false);
        return;
      }

      await context.read<UserProvider>().loadUser();

      if (mounted) {
        context.go('/dashboard');
      }
    } on FirebaseAuthException catch (e) {
      String message;

      switch (e.code) {
        case 'invalid-email':
          message = "El correo electrónico no es válido.";
          break;

        case 'invalid-credential':
        case 'wrong-password':
        case 'user-not-found':
          message = "Correo o contraseña incorrectos.";
          break;

        case 'too-many-requests':
          message =
              "Demasiados intentos. Inténtalo de nuevo dentro de unos minutos.";
          break;

        default:
          message = e.message ?? "Ha ocurrido un error.";
      }

      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(message)));
      }
    } catch (_) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Ha ocurrido un error inesperado.")),
        );
      }
    }

    if (mounted) {
      setState(() => _loading = false);
    }
  }

  void _showError(String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  InputDecoration _inputDecoration({
    required String label,
    required IconData icon,
  }) {
    return InputDecoration(
      labelText: label,
      prefixIcon: Icon(icon),
      filled: true,
      fillColor: const Color(0xFF181A1B),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
    );
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
                const Icon(Icons.bolt, color: AppColors.primary, size: 58),

                const SizedBox(height: 20),

                const Text(
                  "Bienvenido",
                  style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 12),

                const Text(
                  "Inicia sesión para acceder a tu panel de Riffbyte.",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: AppColors.textSecondary, height: 1.6),
                ),

                const SizedBox(height: 35),

                TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: _inputDecoration(
                    label: "Correo electrónico",
                    icon: Icons.email_outlined,
                  ),
                ),

                const SizedBox(height: 22),

                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: _inputDecoration(
                    label: "Contraseña",
                    icon: Icons.lock_outline,
                  ),
                ),

                const SizedBox(height: 35),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _loading ? null : _login,
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
                              "Iniciar sesión",
                              style: TextStyle(fontSize: 16),
                            ),
                    ),
                  ),
                ),

                const SizedBox(height: 18),

                TextButton(
                  onPressed: () {
                    context.go('/register');
                  },
                  child: const Text("Crear una cuenta"),
                ),

                const SizedBox(height: 10),

                TextButton(
                  onPressed: () {
                    context.go('/');
                  },
                  child: const Text("← Volver a la web"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
