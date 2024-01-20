import 'package:c12_track/firebase_options.dart';
import 'package:c12_track/main_ui/constants/routes.dart';
import 'package:c12_track/main_ui/pages/email_verification.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:c12_track/main_ui/pages/home_page.dart';
import 'package:c12_track/main_ui/pages/login_page.dart';
import 'package:c12_track/main_ui/pages/register_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const MainScreen(),
      routes: {
        loginRoute: (context) => const LoginPage(),
        registerRoute: (context) => const RegisterPage(),
        emailVerifyRoute: (context) => const EmailVerification(),
        homeRoute: (context) => const HomePage(),
      },
    ),
  );
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            final user = FirebaseAuth.instance.currentUser;
            if (user != null) {
              if (user.emailVerified) {
                return const HomePage();
              } else {
                return const EmailVerification();
              }
            } else {
              return const LoginPage();
            }
          default:
            return const CircularProgressIndicator();
        }
      },
    );
  }
}
