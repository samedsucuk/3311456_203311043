
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:path_provider/path_provider.dart';

class FileStorageServices {
  _getFilePath() async {
    var filePath = await getApplicationDocumentsDirectory();
    return filePath.path;
  }

  FileStorageServices() {
    _createFile();
  }

  Future<File> _createFile() async {
    var file = File(await _getFilePath() + "/data.txt");
    return file;
  }

  Future<void> dataInsert(String date) async {
    var file = await _createFile();
    await file.writeAsString(date);
  }

  Future<String> dataRead() async {
    try {
      var file = await _createFile();
      var fileContent = await file.readAsString();

      return fileContent;
    } catch (e) {
      debugPrint(e.toString());
    }
    return "";
  }
}
