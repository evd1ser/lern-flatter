import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class CounterStorage {
  Future<String> get _localePath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localeFile async {
    final path = await _localePath;

    return File("$path/counter.txt");
  }

  Future<int> readCounter() async {
    try {
      final file = await _localeFile;

      final content = await file.readAsString();

      return int.parse(content);
    } catch (e) {
      return 0;
    }
  }

  Future<File> writeCounter(int count) async {
    final file = await _localeFile;
    return file.writeAsString('$count');
  }
}
