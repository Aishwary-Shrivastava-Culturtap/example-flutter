import 'package:app_api/cardtry.dart';
import 'package:app_api/cradrequest.dart';
import 'package:app_api/mycard3.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:app_api/card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  List<User> videoDataList = [];

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // List<User> videoDataList = [];
// videoDataList = await fetchUsersFromGitHub();

    fetchUsersFromGitHub().then((list) {
      setState(() {
        videoDataList = list;
      });
    });

    // List<User> result =   fetchUsersFromGitHub();
    return Scaffold(
        appBar: AppBar(
          leadingWidth: 100,
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          leading: Container(
            padding: const EdgeInsets.fromLTRB(26, 12, 0, 0),
            child: Row(
              children: [
                Text(
                  "<",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
                TextButton(
                  child: Text(
                    "Back",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
          toolbarHeight: 105,
          elevation: 0.00,
          title:
              // Text("demo")
              Image.asset(
            'assets/logo.png',
            fit: BoxFit.cover,
          ),
        ),
        body:
            //  mycard3(item),
            videoDataList == null || videoDataList!.isEmpty
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    itemCount: videoDataList.length,
                    itemBuilder: (context, index) {
                      final item = videoDataList[index];

                      return cardrequest(item: item);
                    },
                  ));
  }
}

class User {
  int id;
  String name;
  String profession;
  String language;
  int followers;
  int following;
  String location;

  User({
    required this.id,
    required this.name,
    required this.profession,
    required this.language,
    required this.followers,
    required this.following,
    required this.location,
    // required this.id,
  });
}

Future<List<User>> fetchUsersFromGitHub() async {
  var i = 1;
  final response = await http.get(Uri.parse('http://localhost:3000/profile'));
  // print(response.body);
  List responseJson = json.decode(response.body.toString());
  List<User> userList = createUserList(responseJson);
  // print(userList[i++].name);
  print(i);
  i++;
  return userList;
}

List<User> createUserList(List data) {
  List<User> list = [];
  for (int i = 0; i < data.length; i++) {
    String title = data[i]["name"];
    int id = data[i]["_id"];
    String profession = data[i]["profession"];
    String language = data[i]["language"];
    int followers = data[i]["followers"];
    int following = data[i]["following"];
    String location = data[i]["location"];

    User movie = User(
      name: title,
      id: id,
      profession: profession,
      language: language,
      followers: followers,
      following: following,
      location: location,
    );

    list.add(movie);
  }
  return list;
}
