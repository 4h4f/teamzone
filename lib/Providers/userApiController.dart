import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:teamzone/Models/UserModels.dart';

class userApiContoller {
  Future<Welcome> getUserInfo() async {
    final response = await http.post(
      Uri.parse('http://137.184.88.117/api/users/admin/login'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      },
      body: jsonEncode(<String, String>{
        'username': 'Chadrick Friesen',
        'password': 'password'
      }),
    );
    if (response.statusCode == 200) {
      final users = welcomeFromJson(response.body);
      print(users);
      return users;
    } else {
      final body = response.body;
      final error = welcomeFromJson(body);
      print(error);
      return error;
    }
  }
}
