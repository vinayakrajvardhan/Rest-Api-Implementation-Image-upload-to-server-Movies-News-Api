import 'dart:developer';

import 'package:http/http.dart' as http;

import '../models/user_mdoel.dart';


class UserService {
  static final String url = "https://jsonplaceholder.typicode.com/users";

  static Future<List<Users>> getUser() async {
    try {
      http.Response response = await http.get(
        Uri.parse(url),
      );
      if (response.statusCode == 200) {
        final data = usersFromJson(response.body);
        return data;
      }
    } catch (e) {
      log(e.toString());
    }
    return [];
  }
}
