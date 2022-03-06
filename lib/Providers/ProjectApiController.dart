import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:teamzone/Models/ProjectModel.dart';

class ProjectApiController {
  static Future<ProjectModel> getProjectInfo() async {
    final response = await http.post(
      Uri.parse('http://137.184.88.117/api/client/project'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      },
    );
    return projectFromJson(response.body);
  }
}
