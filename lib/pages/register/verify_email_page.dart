import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';

import '../../theme/app_colors.dart';

class VerifyEmailPage extends StatelessWidget {
  final String email;

  const VerifyEmailPage({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Container(
          width: 560,
          padding: const EdgeInsets.all(45),
          decoration: BoxDecoration(
            color: const Color(0xFF202325),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: const Color(0xFF31363A)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.mark_email_read_rounded,
                color: Colors.green,
                size: 75,
              ),

              const SizedBox(height: 25),

              const Text(
                "¡Cuenta creada!",
                style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 18),

              Text(
                "Hemos enviado un correo de verificación a:",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 17,
                ),
              ),

              const SizedBox(height: 15),

              SelectableText(
                email,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 25),

              const Text(
                "Antes de iniciar sesión debes pulsar el enlace que encontrarás en ese correo.",
                textAlign: TextAlign.center,
                style: TextStyle(color: AppColors.textSecondary, height: 1.6),
              ),

              const SizedBox(height: 15),

              const Text(
                "Si no encuentras el correo, revisa la carpeta de spam o correo no deseado.",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.orange, height: 1.5),
              ),

              const SizedBox(height: 35),

              SizedBox(
                width: double.infinity,
                child: FilledButton.icon(
                  icon: const Icon(Icons.refresh),
                  label: const Text("Reenviar correo"),
                  onPressed: () async {
                    final user = FirebaseAuth.instance.currentUser;

                    if (user != null) {
                      await user.sendEmailVerification();

                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Correo de verificación reenviado."),
                          ),
                        );
                      }
                    }
                  },
                ),
              ),

              const SizedBox(height: 15),

              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () async {
                    await FirebaseAuth.instance.signOut();

                    if (context.mounted) {
                      context.go('/login');
                    }
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Text("Ir al inicio de sesión"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
