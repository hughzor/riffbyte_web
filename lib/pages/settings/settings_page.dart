import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:riffbyte_web/providers/user_provider.dart';
import '../../layout/dashboard_layout.dart';
import '../../services/firestore_service.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return DashboardLayout(
      child: Center(
        child: Container(
          width: 700,
          margin: const EdgeInsets.all(60),
          padding: const EdgeInsets.all(40),
          decoration: BoxDecoration(
            color: const Color(0xFF202325),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: const Color(0xFF31363A)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Ajustes",
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 35),

              ListTile(
                leading: const Icon(Icons.email_outlined),
                title: const Text("Correo"),
                subtitle: Text(user?.email ?? "-"),
              ),

              const Divider(),

              ListTile(
                leading: const Icon(Icons.person_outline),
                title: const Text("Nombre"),
                subtitle: Text(user?.displayName ?? "Sin configurar"),
              ),

              const Divider(),

              ListTile(
                leading: const Icon(Icons.lock_outline),
                title: const Text("Cambiar contraseña"),
                trailing: const Icon(Icons.chevron_right),
                onTap: () async {
                  if (user?.email == null) return;

                  try {
                    await FirebaseAuth.instance.sendPasswordResetEmail(
                      email: user!.email!,
                    );

                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            "Revisa tu correo. Te hemos enviado un enlace para cambiar la contraseña.",
                          ),
                        ),
                      );
                    }
                  } on FirebaseAuthException catch (e) {
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            e.message ?? "No se ha podido enviar el correo.",
                          ),
                        ),
                      );
                    }
                  }
                },
              ),

              ListTile(
                leading: const Icon(Icons.badge_outlined),
                title: const Text("Cambiar nombre"),
                trailing: const Icon(Icons.chevron_right),
                onTap: () async {
                  final controller = TextEditingController(
                    text: user?.displayName ?? "",
                  );

                  final newName = await showDialog<String>(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text("Cambiar nombre"),
                        content: TextField(
                          controller: controller,
                          decoration: const InputDecoration(
                            labelText: "Nuevo nombre",
                          ),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text("Cancelar"),
                          ),
                          FilledButton(
                            onPressed: () {
                              Navigator.pop(context, controller.text.trim());
                            },
                            child: const Text("Guardar"),
                          ),
                        ],
                      );
                    },
                  );

                  if (newName != null && newName.isNotEmpty && user != null) {
                    await user.updateDisplayName(newName);

                    await FirestoreService().updateDisplayName(
                      uid: user.uid,
                      displayName: newName,
                    );

                    await context.read<UserProvider>().loadUser();

                    await user.reload();

                    setState(() {});

                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Nombre actualizado correctamente."),
                        ),
                      );
                    }
                  }
                },
              ),

              const SizedBox(height: 30),

              FilledButton.icon(
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();

                  if (context.mounted) {
                    context.go('/');
                  }
                },
                icon: const Icon(Icons.logout),
                label: const Text("Cerrar sesión"),
              ),

              const SizedBox(height: 15),

              OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.red,
                  side: const BorderSide(color: Colors.red),
                ),
                onPressed: () async {
                  final confirm = await showDialog<bool>(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text("Eliminar cuenta"),
                        content: const Text(
                          "Esta acción es irreversible.\n\n¿Seguro que quieres eliminar tu cuenta de Riffbyte?",
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context, false),
                            child: const Text("Cancelar"),
                          ),
                          FilledButton(
                            style: FilledButton.styleFrom(
                              backgroundColor: Colors.red,
                            ),
                            onPressed: () => Navigator.pop(context, true),
                            child: const Text("Eliminar"),
                          ),
                        ],
                      );
                    },
                  );

                  if (confirm != true) return;

                  try {
                    await user?.delete();

                    if (context.mounted) {
                      context.go('/');
                    }
                  } catch (e) {
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            "Por seguridad debes volver a iniciar sesión antes de eliminar la cuenta.",
                          ),
                        ),
                      );
                    }
                  }
                },
                icon: const Icon(Icons.delete_forever),
                label: const Text("Eliminar cuenta"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
