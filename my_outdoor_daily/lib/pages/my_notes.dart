import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../widgets/imaged_sized_box.dart';

class MyNotes extends StatefulWidget {
  const MyNotes({Key? key}) : super(key: key);

  @override
  State<MyNotes> createState() => _MyNotesState();
}

class _MyNotesState extends State<MyNotes> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: const Text(
          "MY NOTES",
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                ImagedSizedBox(
                  title: "Notes",
                  target: "/notes",
                  imagetarget: "assets/images/notes.png",
                  topmargin: 25,
                ),
                ImagedSizedBox(
                  title: "Add Note",
                  target: "/noteadd",
                  imagetarget: "assets/images/noteadd.png",
                ),
                Lottie.asset(
                  'assets/animations/mynotescamping.json',
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
