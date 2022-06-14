import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_outdoor_daily/model/note_model.dart';
import 'package:my_outdoor_daily/service/firestrore_services.dart';

// ignore: must_be_immutable
class NoteAdd extends StatefulWidget {
  const NoteAdd({Key? key}) : super(key: key);

  @override
  State<NoteAdd> createState() => _NoteAddState();
}

class _NoteAddState extends State<NoteAdd> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  late FireStoreServices _services;
  late FirebaseAuth _auth;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _services = FireStoreServices();
    _auth = FirebaseAuth.instance;
  }

  @override
  Widget build(BuildContext context) {
    String title = "";
    String content = "";
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.black,
          title: const Text(
            "ADD NOTE",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ),
        body: SingleChildScrollView(
          child: Form(
              key: formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15, right: 15, top: 20),
                    child: TextFormField(
                      onChanged: (value) {
                        title = value;
                      },
                      validator: (value) {
                        if (value!.length < 2) {
                          return "Please write your note title. (min 2 character)";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        hintText: "Note title",
                        label: Text("Note title"),
                        labelStyle: TextStyle(color: Colors.black),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: TextFormField(
                      onChanged: (value) {
                        content = value;
                      },
                      validator: (value) {
                        if (value!.length < 2) {
                          return "Please write your note contents. (min 2 character)";
                        }
                        return null;
                      },
                      maxLines: 4,
                      decoration: const InputDecoration(
                          hintText: "Note contents",
                          label: Text("Note contents"),
                          labelStyle: TextStyle(color: Colors.black),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          fillColor: Colors.black),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: ElevatedButton.icon(
                        onPressed: () {
                          DateTime date = DateTime.now();
                          String insertDate =
                              "${date.day}/${date.month}/${date.year}";
                          try {
                            if (formkey.currentState!.validate()) {
                              NodeModel newModel = NodeModel(
                                  userId: _auth.currentUser!.uid,
                                  content: content,
                                  title: title,
                                  dateTime: insertDate);
                              print(insertDate);
                              _services.addNode(newModel);
                              Navigator.pop(context);
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          "Your note has been successfully added.")));
                            }
                          } catch (e) {
                            print(e.toString());
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            primary: Colors.black, onPrimary: Colors.white),
                        icon: const Icon(FontAwesomeIcons.plus,
                            size: 17, color: Colors.white),
                        label: const Text("Add")),
                  )
                ],
              )),
        ));
  }
}
