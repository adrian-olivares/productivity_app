import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:productivity_app/models/plan.dart';

class JsonStorage {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localJsonFile async {
    final path = await _localPath;
    return File('$path/plans.json');
  }

  Future<Map<String, dynamic>> readJsonFile() async {
    final file = await _localJsonFile;
    final contents = await file.readAsString();
    //print(contents);

    return json.decode(contents);
  }

  Future<Plan> writeJsonFile(String title, String description) async {
    final Plan plan = Plan(name: title, description: description);

    final file = await _localJsonFile;
    await file.writeAsString(json.encode(plan));
    print(plan);
    return plan;
  }
}
