import 'package:my_outdoor_daily/model/note_model.dart';

class DataControl {
  static List<NodeModel> weathers = [];

  static addNode(NodeModel addLocation) {
    weathers.add(addLocation);
  }

  static removeNode(int index) {
    weathers.removeAt(index);
  }
}
