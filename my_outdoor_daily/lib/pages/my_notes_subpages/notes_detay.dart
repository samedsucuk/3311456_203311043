import 'package:flutter/material.dart';
import 'package:my_outdoor_daily/model/data_control.dart';

class NotesDetay extends StatefulWidget {
  const NotesDetay({Key? key, required int index}) : super(key: key);
  @override
  State<NotesDetay> createState() => _NotesDetayState();
}

class _NotesDetayState extends State<NotesDetay> {
  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text(
          DataControl.notes[2].content,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
