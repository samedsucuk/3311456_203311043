import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_outdoor_daily/service/firestrore_services.dart';

class NotesDetay extends StatefulWidget {
  var node;
  NotesDetay({required this.node, Key? key}) : super(key: key);

  @override
  State<NotesDetay> createState() => _NotesDetayState();
}

class _NotesDetayState extends State<NotesDetay> {
  late FireStoreServices _services;
  late FirebaseAuth _auth;
  @override
  void initState() {
    super.initState();
    _services = FireStoreServices();
    _auth = FirebaseAuth.instance;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text(
          widget.node["title"],
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.all(8),
        child: SingleChildScrollView(
          child: Text(widget.node["content"]),
        ),
      ),
    );
  }
}
