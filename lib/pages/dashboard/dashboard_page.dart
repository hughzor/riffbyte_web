import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riffbyte_web/models/app_user.dart';

import '../../services/firebase_auth_service.dart';
import '../../layout/dashboard_layout.dart';
import '../../widgets/footer.dart';

import 'package:provider/provider.dart';
import '../../providers/user_provider.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<UserProvider>();
    final appUser = provider.user;

    if (provider.loading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return DashboardLayout(
      child: Column(children: const [_WelcomeSection(), Footer()]),
    );
  }
}

class _WelcomeSection extends StatefulWidget {
  const _WelcomeSection();

  @override
  State<_WelcomeSection> createState() => _WelcomeSectionState();
}

class _WelcomeSectionState extends State<_WelcomeSection> {
  AppUser? get appUser => context.watch<UserProvider>().user;

  @override
  Widget build(BuildContext context) {
    final user = appUser;

    if (user == null) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.fromLTRB(80, 80, 80, 30),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(45),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF20262A), Color(0xFF181A1B)],
          ),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: const Color(0xFF31363A)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        appUser == null
                            ? "¡Bienvenido! 👋"
                            : appUser!.displayName.isEmpty
                            ? "¡Bienvenido! 👋"
                            : "Hola, ${appUser!.displayName} 👋",
                        style: Theme.of(context).textTheme.displaySmall
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),

                      const SizedBox(height: 10),

                      Text(
                        appUser?.email ?? "",
                        style: const TextStyle(
                          fontSize: 19,
                          color: Colors.white70,
                        ),
                      ),

                      const SizedBox(height: 18),

                      const Text(
                        "Este es tu panel personal de Riffbyte. Desde aquí podrás gestionar tus productos, descargas y futuras licencias.",
                        style: TextStyle(
                          fontSize: 17,
                          height: 1.7,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),

                OutlinedButton.icon(
                  onPressed: () async {
                    await FirebaseAuthService().signOut();

                    if (context.mounted) {
                      context.go('/');
                    }
                  },
                  icon: const Icon(Icons.logout),
                  label: const Text("Cerrar sesión"),
                ),
              ],
            ),

            const SizedBox(height: 45),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Divider(color: Color(0xFF31363A)),

                const SizedBox(height: 25),

                const Text(
                  "Información de la cuenta",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 25),

                _InfoRow(
                  icon: Icons.email_outlined,
                  title: "Correo electrónico",
                  value: appUser?.email ?? "",
                ),

                const SizedBox(height: 18),

                _InfoRow(
                  icon: Icons.person_outline,
                  title: "Nombre",
                  value: user.displayName,
                ),

                const SizedBox(height: 18),

                _InfoRow(
                  icon: Icons.verified_user_outlined,
                  title: "Estado",
                  value: "Cuenta activa",
                ),

                const SizedBox(height: 35),

                Wrap(
                  spacing: 18,
                  runSpacing: 18,
                  children: [
                    FilledButton.icon(
                      onPressed: () {
                        context.go('/dashboard/informeventas');
                      },
                      icon: const Icon(Icons.description_outlined),
                      label: const Text("Gestionar InformeVentas"),
                    ),

                    OutlinedButton.icon(
                      onPressed: () {
                        context.go('/dashboard/guitar-customizer');
                      },
                      icon: const Icon(Icons.music_note_outlined),
                      label: const Text("Guitar Customizer"),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _QuickActionsSection extends StatelessWidget {
  const _QuickActionsSection();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(80, 80, 80, 100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Ajustes",
            style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 40),

          Wrap(
            spacing: 25,
            runSpacing: 25,
            children: [
              _ActionTile(
                icon: Icons.lock_outline,
                title: "Cambiar contraseña",
                onTap: () {
                  context.go('/settings');
                },
              ),

              _ActionTile(
                icon: Icons.logout,
                title: "Cerrar sesión",
                onTap: () async {
                  await FirebaseAuth.instance.signOut();

                  if (context.mounted) {
                    context.go('/');
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ActionTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const _ActionTile({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        width: 180,
        height: 135,
        decoration: BoxDecoration(
          color: const Color(0xFF202325),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: const Color(0xFF31363A)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 36, color: Colors.lightBlueAccent),

            const SizedBox(height: 18),

            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const _InfoRow({
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Colors.lightBlueAccent, size: 24),

        const SizedBox(width: 16),

        SizedBox(
          width: 180,
          child: Text(
            title,
            style: const TextStyle(color: Colors.white60, fontSize: 16),
          ),
        ),

        Expanded(child: Text(value, style: const TextStyle(fontSize: 16))),
      ],
    );
  }
}
