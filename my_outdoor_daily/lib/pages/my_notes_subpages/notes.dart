import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_outdoor_daily/pages/my_notes_subpages/notes_detay.dart';
import 'package:my_outdoor_daily/service/firestrore_services.dart';

class Notes extends StatefulWidget {
  const Notes({Key? key}) : super(key: key);

  @override
  State<Notes> createState() => _NotesState();
}

class _NotesState extends State<Notes> {
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
        title: const Text(
          "NOTES",
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 2,
              child: StreamBuilder(
                stream: _services.getuserNode(_auth.currentUser!.uid),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  return !snapshot.hasData
                      ? const CircularProgressIndicator()
                      : ListView.builder(
                          itemCount: snapshot.data!.size,
                          itemBuilder: (BuildContext context, int index) {
                            var myNode = snapshot.data!.docs[index];
                            return Card(
                              child: ListTile(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => NotesDetay(
                                                node: myNode,
                                              )));
                                },
                                leading: GestureDetector(
                                    onDoubleTap: () {
                                      _services.deleteNode(myNode.id);
                                    },
                                    child: const Icon(Icons.delete)),
                                title: Text(myNode["title"]),
                                subtitle: Text(myNode["dateTime"]),
                              ),
                            );
                          },
                        );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
