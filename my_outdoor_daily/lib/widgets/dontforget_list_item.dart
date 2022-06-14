import 'package:flutter/material.dart';
import 'package:my_outdoor_daily/data/local_storage.dart';
import 'package:my_outdoor_daily/main.dart';
import '../model/dont_forget_task.dart';

class DontForgetListItem extends StatefulWidget {
  final Task task;
  const DontForgetListItem({Key? key, required this.task}) : super(key: key);

  @override
  State<DontForgetListItem> createState() => _DontForgetListItemState();
}

class _DontForgetListItemState extends State<DontForgetListItem> {
  final TextEditingController _taskNameController = TextEditingController();
  late LocalStorage _localStorage;
  @override
  void initState() {
    super.initState();
    _localStorage = locator<LocalStorage>();
    _taskNameController.text = widget.task.name;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(.2), blurRadius: 10)
          ]),
      child: ListTile(
        leading: GestureDetector(
          onTap: () {
            widget.task.isCompleted = !widget.task.isCompleted;
            _localStorage.updateTask(task: widget.task);
            setState(() {});
          },
          child: Container(
            child: const Icon(Icons.check, color: Colors.white),
            decoration: BoxDecoration(
                color: widget.task.isCompleted ? Colors.green : Colors.white,
                border: Border.all(color: Colors.grey, width: 0.8),
                shape: BoxShape.circle),
          ),
        ),
        title: widget.task.isCompleted
            ? Text(widget.task.name,
                style: const TextStyle(
                    decoration: TextDecoration.lineThrough, color: Colors.grey))
            : TextField(
                controller: _taskNameController,
                minLines: 1,
                maxLines: null,
                textInputAction: TextInputAction.done,
                decoration: const InputDecoration(border: InputBorder.none),
                onSubmitted: (yeniDeger) {
                  if (yeniDeger.length > 3) {
                    widget.task.name = yeniDeger;
                  }
                }),
      ),
    );
  }
}
