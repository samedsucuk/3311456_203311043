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
              child: Dismissible(
            key: UniqueKey(),
            direction: DismissDirection.endToStart,
            onDismissed: (_) {
              setState(() {
                DataControl.removeNode(index);
              });
            },
            child: ListTile(
              onTap: () {
                Navigator.pushNamed(context, '/notesdetay', arguments: index);
              },
              title: Text(DataControl.notes[index].content),
              subtitle: Text(DataControl.notes[index].title),
            ),
          ));
        },
      ),
    );
  }
}
