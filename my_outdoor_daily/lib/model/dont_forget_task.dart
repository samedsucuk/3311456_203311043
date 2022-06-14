import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';
part 'dont_forget_task.g.dart';

@HiveType(typeId: 1)
class Task extends HiveObject {
  @HiveField(0)
  final String id;
  @HiveField(1)
  String name;
  @HiveField(2)
  bool isCompleted;

  Task({required this.id, required this.name, required this.isCompleted});

  factory Task.create({required String name, required}) {
    return Task(id: const Uuid().v1(), name: name, isCompleted: false);
  }
}


