import 'dart:io';

import 'package:abc/product/file_operations/controllers/abstract/i_file_controller.dart';
import 'package:path_provider/path_provider.dart';

class FileController implements IFileController {
  @override
  Future<String> get getFilePath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  @override
  Future<File> get getFile async {
    final path = await getFilePath;
    return File('$path/post.txt');
  }

  @override
  Future<String> readFromFile() async {
    try {
      final file = await getFile;
      String fileContents = await file.readAsString();
      return fileContents;
    } catch (e) {
      return "";
    }
  }

  @override
  Future<File> saveToFile(String data) async {
    final file = await getFile;
    return file.writeAsString(data);
  }
}
