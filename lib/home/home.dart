import 'package:flutter/material.dart';
import 'package:quiz_app/login/login.dart';
import 'package:quiz_app/services/auth.dart';
import 'package:quiz_app/shared/bottom_nav.dart';
import 'package:quiz_app/topics/topics.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: AuthService().userStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text('Loading...');
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('error'),
            );
          } else if (snapshot.hasData) {
            return const TopicsScreen();
          } else {
            return const LoginScreen();
          }
        });
  }
}
