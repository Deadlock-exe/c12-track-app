import 'package:c12_track/main_ui/constants.routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class EmailVerification extends StatelessWidget {
  const EmailVerification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF008080),
      appBar: AppBar(
        backgroundColor: const Color(0xFF008080),
        foregroundColor: const Color(0xFFFDFCE9),
        title: const Text("Email verification"),
      ),
      body: Column(
        children: [
          const Text("Verification email sent"),
          const Text("Didn't receive an email?"),
          ElevatedButton(
            onPressed: () async {
              final user = FirebaseAuth.instance.currentUser;
              await user?.sendEmailVerification();
            },
            child: const Text("Resend email"),
          ),
          ElevatedButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              // ignore: use_build_context_synchronously
              Navigator.of(context).pushNamedAndRemoveUntil(
                registerRoute,
                (route) => false,
              );
            },
            child: const Text("Cancel"),
          ),
        ],
      ),
    );
  }
}
