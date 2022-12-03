// ignore: import_of_legacy_library_into_null_safe
import 'package:http/http.dart' as http;
import 'dart:convert';

class User {
  String id;
  String name;

  User({this.id, this.name});

  factory User.createUser(Map<String, dynamic> object) {
    return User(
      id: object['id'].toString(),
      name: "${object['first_name']} ${object['last_name']}",
    );
  }

  static Future<User> connectToApi(String id) async {
    String apiUrl = "https://reqres.in/api/users/$id";
    var apiResult = await http.get(apiUrl);
    var jsonObject = json.decode(apiResult.body);
    var userData = (jsonObject as Map<String, dynamic>)['data'];
    return User.createUser(userData);
  }

  static Future<List<User>> getUsers(String page) async {
    String apiUrl = 'https://reqres.in/api/users?page=$page';
    var apiResult = await http.get(apiUrl);
    var jsonObject = json.decode(apiResult.body);
    List<dynamic> listUser = (jsonObject as Map<String, dynamic>)['data'];
    List<User> users = [];
    for (int i = 0; i < listUser.length; i++) {
      users.add(User.createUser(listUser[i]));
    }
    return users;
  }
}
