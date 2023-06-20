import 'dart:io';

abstract class IFileController {
  Future<String> get getFilePath;
  Future<File> get getFile;
  Future<File> saveToFile(String data);
  Future<String> readFromFile();
}
