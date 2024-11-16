import 'package:flutter/material.dart';
import 'package:quiz_app/services/firestore.dart';
import 'package:quiz_app/services/models.dart';
import 'package:quiz_app/shared/bottom_nav.dart';
import 'package:quiz_app/shared/error.dart';
import 'package:quiz_app/shared/loading.dart';

class TopicsScreen extends StatelessWidget {
  const TopicsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Topic>>(
      future: FirestoreService().getTopics(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingScreen();
        } else if (snapshot.hasError) {
          return Center(
            child: ErrorMessage(
              message: snapshot.error.toString(),
            ),
          );
        } else if (snapshot.hasData) {
          //
          return Scaffold(
            appBar: AppBar(
                backgroundColor: Colors.deepPurple,
                title: const Text('Topics')),
          );
        } else {
          //
          return Scaffold(
            appBar: AppBar(
                backgroundColor: Colors.deepPurple,
                title: const Text('No Data')),
          );
        }
      },
    );
  }
}
