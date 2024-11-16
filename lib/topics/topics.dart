import 'package:flutter/material.dart';
import 'package:quiz_app/services/firestore.dart';
import 'package:quiz_app/services/models.dart';
import 'package:quiz_app/shared/bottom_nav.dart';
import 'package:quiz_app/shared/error.dart';
import 'package:quiz_app/shared/loading.dart';
import 'package:quiz_app/topics/drawer.dart';
import 'package:quiz_app/topics/topic_item.dart';

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
          var topics = snapshot.data!;
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.deepPurple,
              title: const Text('Topics'),
            ),
            body: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              primary: false,
              padding: const EdgeInsets.all(20),
              children: topics
                  .map(
                    (topic) => TopicItem(
                      topic: topic,
                    ),
                  )
                  .toList(),
            ),
            bottomNavigationBar: const BottomNavBar(),
            drawer: TopicDrawer(
              topics: topics,
            ),
          );
        } else {
          //
          return const Text('No topics found! Our database seems to be empty!');
        }
      },
    );
  }
}
