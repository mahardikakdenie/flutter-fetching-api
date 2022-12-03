import 'package:flutter/material.dart';
import 'package:project_api/post_result_model.dart';
import 'package:project_api/user_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  // const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  PostResult postResult;
  User user;
  String output = 'Tidak ada Data';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Api Demo",
          ),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            const Text("Details"),
            Text(
                user != null ? "${user.id} |  ${user.name}" : 'Tidak ada data'),
            const Text("List Users"),
            Text(output),
            ElevatedButton(
              onPressed: () {
                User.connectToApi("5")
                    .then((value) => {user = value, setState((() => {}))});
              },
              child: const Text("Get Details"),
            ),
            ElevatedButton(
              onPressed: () {
                User.getUsers("1").then((users) => {
                      output = "",
                      for (int i = 0; i < users.length; i++)
                        {output = "$output [${users[i].name}]"},
                      setState((() => {}))
                    });
              },
              child: const Text("Get  List"),
            )
          ],
        )),
      ),
    );
  }
}
