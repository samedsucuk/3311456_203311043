import 'package:cloud_firestore/cloud_firestore.dart';

class NodeModel {
  String? title;
  String? content;
  String? userId;
  String? dateTime;
  NodeModel({this.title, this.content, this.userId, this.dateTime});

  factory NodeModel.fromSnapShot(DocumentSnapshot snapshot) {
    return NodeModel(
        content: snapshot["content"],
        title: snapshot["title"],
        userId: snapshot["userId"],
        dateTime: snapshot["dateTime"]);
  }
}
