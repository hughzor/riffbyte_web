import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../theme/app_colors.dart';

import 'package:provider/provider.dart';

import '../../services/auth_service.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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

                const SizedBox(height: 18),

                const Text(
                  "Bienvenido",
                  style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 10),

                const Text(
                  "Inicia sesión para acceder a tu panel de Riffbyte.",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: AppColors.textSecondary, height: 1.6),
                ),

                const SizedBox(height: 35),

                const _InputField(
                  label: "Correo electrónico",
                  icon: Icons.email_outlined,
                ),

                const SizedBox(height: 22),

                const _InputField(
                  label: "Contraseña",
                  icon: Icons.lock_outline,
                  obscure: true,
                ),

                const SizedBox(height: 35),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      context.read<AuthService>().login();
                      context.go('/dashboard');
                    },
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 18),
                      child: Text(
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

                const SizedBox(height: 15),

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

class _InputField extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool obscure;

  const _InputField({
    required this.label,
    required this.icon,
    this.obscure = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscure,
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        labelText: label,
        filled: true,
        fillColor: const Color(0xFF181A1B),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
      ),
    );
  }
}
