import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_outdoor_daily/model/note_model.dart';

class FireStoreServices {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addNode(NodeModel newNode) async {
    var ref = _firestore.collection("Nodes");
    var documenRef = await ref.add({
      "content": newNode.content,
      "title": newNode.title,
      "userId": newNode.userId,
      "dateTime": newNode.dateTime
    });
  }

  Stream<QuerySnapshot> getuserNode(String userId) {
    var doc = _firestore
        .collection("Nodes")
        .where("userId", isEqualTo: userId)
        .snapshots();
    return doc;
  }

  Future<void> deleteNode(String docId) {
    var ref = _firestore.collection("Nodes").doc(docId).delete();
    return ref;
  }
}
