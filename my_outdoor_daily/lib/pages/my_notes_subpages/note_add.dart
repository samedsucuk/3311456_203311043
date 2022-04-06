import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_outdoor_daily/model/data_control.dart';
import 'package:my_outdoor_daily/model/note_model.dart';

// ignore: must_be_immutable
class NoteAdd extends StatelessWidget {
  NoteAdd({Key? key}) : super(key: key);
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
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
                          return "Lütfen notunuzu giriniz. (en az 2 karekter)";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        hintText: "Not Başlığı",
                        label: Text("Not başlığı"),
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
                          return "Lütfen notunuzu giriniz. (en az 2 karekter)";
                        }
                        return null;
                      },
                      maxLines: 4,
                      decoration: const InputDecoration(
                          hintText: "Not içeriği",
                          label: Text("Not içeriği"),
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
                          if (formkey.currentState!.validate()) {
                            NodeModel newModel = NodeModel(title, content);
                            DataControl.addNode(newModel);
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content:
                                        Text("Notunuz başarıyla eklendi.")));
                            // ignore: avoid_print
                            print(DataControl.notes);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            primary: Colors.black, onPrimary: Colors.white),
                        icon: const Icon(FontAwesomeIcons.plus,
                            size: 17, color: Colors.white),
                        label: const Text("Ekle")),
                  )
                ],
              )),
        ));
  }
}
