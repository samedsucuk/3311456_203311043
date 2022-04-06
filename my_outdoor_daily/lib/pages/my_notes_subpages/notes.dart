import 'package:flutter/material.dart';
import 'package:my_outdoor_daily/model/data_control.dart';

class Notes extends StatefulWidget {
  const Notes({Key? key}) : super(key: key);

  @override
  State<Notes> createState() => _NotesState();
}

class _NotesState extends State<Notes> {
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
      body: ListView.builder(
        itemCount: DataControl.notes.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
              child: ListTile(
            onTap: () {
              Navigator.pushNamed(context, '/notesdetay');
            },
            title: Text(DataControl.notes[index].title),
            subtitle: Text(DataControl.notes[index].title),
          ));
        },
      ),
    );
  }
}
