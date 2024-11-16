import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rxdart/rxdart.dart';
import 'package:quiz_app/services/auth.dart';
import 'package:quiz_app/services/models.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<List<Topic>> getTopics() async {
    var ref = _db.collection('topics');
    var snapshot = await ref.get();
    // the snapshot contains a lot of meta data that we dont need. We itterate over each comopnent and just get the data using map method
    var data = snapshot.docs.map((s) => s.data());
    // convert each data element to a topic object that is defined in the models file. This allows us to use it an object.
    var topics = data.map((d) => Topic.fromJson(d));
    return topics.toList();
  }

  Future<Quiz> getQuiz(String quizId) async {
    var ref = _db.collection('quizzes').doc(quizId);
    var snapshot = await ref.get();
    return Quiz.fromJson(snapshot.data() ?? {});
  }
}
