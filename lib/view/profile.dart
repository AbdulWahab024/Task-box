import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_box/provider/hide_password.dart';
import 'package:task_box/provider/theme_provider.dart';
import 'package:task_box/utils/widgets/custom_button.dart';

import 'login_view.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Switch(
              value: themeProvider.isDarkMode,
              onChanged: (value) {
                themeProvider.toggleTheme(value);
              },
            ),
          ),
        ],
        title: const Text("Profile"),
        centerTitle: true,
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.primary,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Column(
              children: [
                // 🔹 Profile Header
                Container(
                  width: 330,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: colorScheme.surfaceContainerHigh,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 55,
                          backgroundColor: colorScheme.primaryContainer,
                          child: Icon(
                            Icons.person,
                            size: 70,
                            color: colorScheme.primary,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          "Abdul Wahab",
                          style: Theme.of(context).textTheme.titleLarge
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                // 🔹 Info Tiles
                _infoTile(
                  context,
                  icon: Icons.person_outline,
                  title: "Name",
                  value: "Abdul Wahab",
                ),
                _infoTile(
                  context,
                  icon: Icons.email_outlined,
                  title: "Email",
                  value: "abdulwahab@email.com",
                ),
                _passwordTile(context),
                SizedBox(height: 200,),
                CustomButton(onPressd: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginView()));
                }, btnText: "Logout"),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // 🔹 Normal Info Tile
  Widget _infoTile(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Container(
      width: 330,
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHigh,
        borderRadius: BorderRadius.circular(14),
      ),
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
        subtitle: Text(value, style: const TextStyle(fontSize: 16)),
      ),
    );
  }

  // 🔐 Password Tile
  Widget _passwordTile(BuildContext context) {
    return Container(
      width: 330,
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHigh,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Consumer<HidePassword>(
        builder: (context, value, child) {
          return ListTile(
            leading: const Icon(Icons.lock_outline),
            title: const Text("Password"),
            subtitle: Text(
              value.hidePassword ? "********" : "my_secure_password",
              style: const TextStyle(fontSize: 16),
            ),
            trailing: IconButton(
              icon: Icon(
                value.hidePassword ? Icons.visibility_off : Icons.visibility,
              ),
              onPressed: () => value.toggle(),
            ),
          );
        },
      ),
    );
  }
}
