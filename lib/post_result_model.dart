// ignore: import_of_legacy_library_into_null_safe
import 'package:http/http.dart' as http;
import 'dart:convert';

class PostResult {
  String id;
  String name;
  String job;
  String createdAt;

  PostResult({
    this.id,
    this.name,
    this.job,
    this.createdAt,
  });

  factory PostResult.createPostResult(Map<String, dynamic> object) {
    return PostResult(
        id: object['id'],
        name: object['name'],
        job: object['job'],
        createdAt: object['createdAt']);
  }

  static Future<PostResult> connectToApi(String name, String job) async {
    String apiUrl = "https://reqres.in/api/users";
    var apiResult = await http.post(apiUrl, body: {
      "name": name,
      "job": job,
    });

    var jsonObject = json.decode(apiResult.body);

    return PostResult.createPostResult(jsonObject);
  }
}
