import 'package:c12_track/main_ui/constants.routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF008080),
      appBar: AppBar(
        title: const Text("Login"),
        backgroundColor: const Color(0xFF013030),
        foregroundColor: const Color(0xFFFDFCE9),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 16,
              horizontal: 14,
            ),
            child: TextField(
              controller: _email,
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                label: Text("Enter email address"),
                floatingLabelStyle: TextStyle(color: Color(0xFFFDFCE9)),
                prefixIcon: Icon(Icons.email),
                prefixIconColor: Color(0xFF013030),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFFFDFCE9),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFF013030),
                    width: 1,
                  ),
                ),
              ),
              style: const TextStyle(
                color: Color(0xFFFDFCE9),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 4,
              horizontal: 14,
            ),
            child: TextField(
              controller: _password,
              obscureText: true,
              autocorrect: false,
              enableSuggestions: false,
              decoration: const InputDecoration(
                label: Text("Enter your password"),
                floatingLabelStyle: TextStyle(
                  color: Color(0xFFFDFCE9),
                ),
                prefixIcon: Icon(Icons.password),
                prefixIconColor: Color(0xFF013030),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFFFDFCE9),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFF013030),
                    width: 1,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          ElevatedButton(
            onPressed: () async {
              final email = _email.text;
              final password = _password.text;

              await FirebaseAuth.instance.signInWithEmailAndPassword(
                email: email,
                password: password,
              );
              final user = FirebaseAuth.instance.currentUser;
              if (user?.emailVerified ?? false) {
                // ignore: use_build_context_synchronously
                Navigator.of(context).pushNamedAndRemoveUntil(
                  homeRoute,
                  (route) => false,
                );
              } else {
                // ignore: use_build_context_synchronously
                Navigator.of(context).pushNamed(
                  emailVerifyRoute,
                );
              }
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                vertical: 14,
                horizontal: 24,
              ),
            ),
            child: const Text(
              "Login",
              style: TextStyle(
                color: Color(0xFF013030),
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pushNamedAndRemoveUntil(
                registerRoute,
                (route) => false,
              );
            },
            child: const Text(
              "New user? Regsiter now",
              style: TextStyle(
                color: Color(0xFFFDFCE9),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
