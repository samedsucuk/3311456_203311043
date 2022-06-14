import 'package:flutter/material.dart';
import 'package:my_outdoor_daily/data/local_storage.dart';
import 'package:my_outdoor_daily/main.dart';
import 'package:my_outdoor_daily/model/dont_forget_task.dart';
import 'package:my_outdoor_daily/widgets/dontforget_list_item.dart';

class DontForget extends StatefulWidget {
  const DontForget({Key? key}) : super(key: key);

  @override
  State<DontForget> createState() => _DontForgetState();
}

class _DontForgetState extends State<DontForget> {
  late List<Task> _allTasks;
  late LocalStorage _localStorage;
  @override
  void initState() {
    super.initState();
    _localStorage = locator<LocalStorage>();
    _allTasks = <Task>[];
    _getAllTaskFromDb();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: GestureDetector(
          onTap: () {
            _showAddTaskBottomSheet(context);
          },
          child: const Text("DON'T FORGET LIST",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              _showAddTaskBottomSheet(context);
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: _allTasks.isNotEmpty
          ? ListView.builder(
              itemBuilder: (context, index) {
                var _oankiListeElemani = _allTasks[index];
                return Dismissible(
                  background: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.delete, color: Colors.black),
                      SizedBox(
                        width: 8,
                      ),
                      Text('Item deleted.')
                    ],
                  ),
                  key: Key(_oankiListeElemani.id),
                  onDismissed: (direction) {
                    _allTasks.removeAt(index);
                    _localStorage.deleteTask(task: _oankiListeElemani);
                    setState(() {});
                  },
                  child: DontForgetListItem(task: _oankiListeElemani),
                );
              },
              itemCount: _allTasks.length)
          : const Center(
              child: Text('Add'),
            ),
    );
  }

  void _showAddTaskBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            width: MediaQuery.of(context).size.width,
            child: ListTile(
              title: TextField(
                autofocus: true,
                style: const TextStyle(fontSize: 20),
                decoration: const InputDecoration(
                    hintText: 'What do you want to add?',
                    border: InputBorder.none),
                onSubmitted: (value) {
                  Navigator.of(context).pop();
                  if (value.length > 3) {
                    var yeniEklenecekOge = Task.create(name: value);
                    _allTasks.add(yeniEklenecekOge);
                    _localStorage.addTask(task: yeniEklenecekOge);
                    setState(() {});
                  }
                },
              ),
            ),
          );
        });
  }

  void _getAllTaskFromDb() async {
    _allTasks = await _localStorage.getAllTask();
    setState(() {});
  }
}
