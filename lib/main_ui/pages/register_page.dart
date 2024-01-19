import 'package:c12_track/main_ui/constants.routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
        title: const Text("Regsiter"),
        backgroundColor: const Color(0xFF008080),
        foregroundColor: const Color(0xFFFDFCE9),
      ),
      body: Column(
        children: [
          TextField(
            controller: _email,
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              label: Text("Enter email address"),
            ),
          ),
          TextField(
            controller: _password,
            obscureText: true,
            autocorrect: false,
            enableSuggestions: false,
            decoration: const InputDecoration(
              label: Text("Enter your password"),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              final email = _email.text;
              final password = _password.text;

              await FirebaseAuth.instance.createUserWithEmailAndPassword(
                email: email,
                password: password,
              );
              final user = FirebaseAuth.instance.currentUser;
              user?.sendEmailVerification();
              // ignore: use_build_context_synchronously
              Navigator.of(context).pushNamed(
                emailVerifyRoute,
              );
            },
            child: const Text("Register"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamedAndRemoveUntil(
                loginRoute,
                (route) => false,
              );
            },
            child: const Text("Already a user?"),
          ),
        ],
      ),
    );
  }
}
