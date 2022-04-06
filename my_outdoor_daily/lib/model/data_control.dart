import 'package:my_outdoor_daily/model/note_model.dart';

class DataControl {
  static List<NodeModel> notes = [];

  static addNode(NodeModel addNote) {
    notes.add(addNote);
  }
}
