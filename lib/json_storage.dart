import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:productivity_app/models/plan.dart';

class JsonStorage {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    //print(directory.path.toString());

    return directory.path;
  }

  Future<File> get _localJsonFile async {
    final path = await _localPath;
    return File('$path/plans.json');
  }

  Future<List<Plan>> loadPlans() async {
    final file = await _localJsonFile;
    final response = await file.readAsString();
    final List<dynamic> data = jsonDecode(response);

    print(response);

    return data.map((json) => Plan.fromJson(json)).toList();
  }

  Future<void> writePlans(List<Plan> plans) async {
    final file = await _localJsonFile;
    final jsonData = plans.map((plan) => plan.toJson()).toList();
    final jsonString = jsonEncode(jsonData);

    await file.writeAsString(jsonString);
    print('saving:');
    print(jsonString);
  }
}
