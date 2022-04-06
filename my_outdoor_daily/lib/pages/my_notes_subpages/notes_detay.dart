import 'package:flutter/material.dart';
import 'package:my_outdoor_daily/model/data_control.dart';

class NotesDetay extends StatelessWidget {
  const NotesDetay({Key? key, required this.index}) : super(key: key);
  final int index;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text(
          DataControl.notes[index].title,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
      ),
      body: body(),
    );
  }

  Widget body() {
    return Align(
        alignment: Alignment.topCenter,
        child: Text(DataControl.notes[index].content));
  }
}
