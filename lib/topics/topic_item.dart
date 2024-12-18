import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/services/models.dart';
import 'package:quiz_app/shared/loading.dart';
import 'package:quiz_app/shared/progress_bar.dart';
import 'package:quiz_app/topics/topics.dart';

class TopicItem extends StatelessWidget {
  final Topic topic;
  const TopicItem({super.key, required this.topic});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: topic.img,
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) => TopicScreen(
                  topic: topic,
                ),
              ),
            );
          },
          child: Column(
            children: [
              Flexible(
                flex: 3,
                child: SizedBox(
                  child: Image.asset(
                    'assets/covers/${topic.img}',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Text(
                    topic.title,
                    style: const TextStyle(
                      height: 1.5,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.fade,
                    softWrap: false,
                  ),
                ),
              ),
              Flexible(child: TopicProgress(topic: topic))
            ],
          ),
        ),
      ),
    );
  }
}

class TopicScreen extends StatelessWidget {
  final Topic topic;
  const TopicScreen({super.key, required this.topic});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(topic.title),
        ),
        body: ListView(
          children: [
            Hero(
              tag: topic.img,
              child: Image.asset('assets/covers/${topic.img}'),
            ),
          ],
        ));
  }
}
