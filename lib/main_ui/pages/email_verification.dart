import 'package:c12_track/main_ui/constants/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class EmailVerification extends StatelessWidget {
  const EmailVerification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF008080),
      appBar: AppBar(
        backgroundColor: const Color(0xFF013030),
        foregroundColor: const Color(0xFFFDFCE9),
        title: const Text("Email verification"),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 22,
            ),
            const Text(
              "Verification email sent",
              style: TextStyle(
                color: Color(0xFFFDFCE9),
                fontSize: 22,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamedAndRemoveUntil(
                  loginRoute,
                  (route) => false,
                );
              },
              child: const Text(
                "Go to login",
                style: TextStyle(
                  color: Color(0xFF013030),
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            const Text(
              "Didn't receive an email?",
              style: TextStyle(
                color: Color(0xFFFDFCE9),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            ElevatedButton(
              onPressed: () async {
                final user = FirebaseAuth.instance.currentUser;
                await user?.sendEmailVerification();
              },
              child: const Text(
                "Resend email",
                style: TextStyle(
                  color: Color(0xFF013030),
                ),
              ),
            ),
            TextButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                // ignore: use_build_context_synchronously
                Navigator.of(context).pushNamedAndRemoveUntil(
                  registerRoute,
                  (route) => false,
                );
              },
              child: const Text(
                "Cancel",
                style: TextStyle(
                  color: Color(0xFFFDFCE9),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
