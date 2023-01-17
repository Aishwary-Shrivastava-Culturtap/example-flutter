import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:developer';

import '../model/model.dart';
import '../services/api_service.dart';

final heading = GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w900);
final normal = GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w500);
final small = GoogleFonts.poppins(
  fontSize: 14,
  fontWeight: FontWeight.w400,
);
final smallBold = GoogleFonts.poppins(
  fontSize: 14,
  fontWeight: FontWeight.w700,
);
final bold = GoogleFonts.poppins(
    fontSize: 22, fontWeight: FontWeight.w900, color: Color(0xffFB8C00));
// ------------------------------------------------------
// class ApiService {
//   Future<List<GetUserData>?> fetchAlbum() async {
//     final response = await http.get(Uri.parse('http://localhost:3000/posts'));
//     print("success...");
//     // Appropriate action depending upon the
//     // server response
//     // print(json.decode(response.body));
//     if (response.statusCode == 200) {
//       print("condition --------- converter");
//       List<GetUserData> _model = getUserDataFromJson(response.body);
//       print(" ${_model[0].id}");

//       return _model;
//     } else {
//       throw Exception('Failed to load album');
//     }
//   }
// }
// -----------------   model -----------------------------
// List<GetUserData> getUserDataFromJson(String str) => json.decode(str) == null
//     ? []
//     : List<GetUserData>.from(
//         json.decode(str)!.map((x) => GetUserData.fromJson(x)));

// String getUserDataToJson(List<GetUserData> data) => json.encode(
//     data == null ? [] : List<dynamic>.from(data!.map((x) => x!.toJson())));

// class GetUserData {
//   GetUserData({
//     this.id,
//     this.title,
//     this.author,
//   });

//   int? id;
//   String? title;
//   String? author;

//   factory GetUserData.fromJson(Map<String, dynamic> json) => GetUserData(
//         id: json["id"],
//         title: json["title"],
//         author: json["author"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "title": title,
//         "author": author,
//       };
// }
// --------------------------------------------------------------

class matching extends StatefulWidget {
  const matching({super.key});

  @override
  State<matching> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<matching> {
  String? pickedDat;
  String? time;
  bool isSwitched = false;
  TextEditingController timeinput1 = TextEditingController();
  Future? data;
  // late var _userModel;
  var person;
  late List<UserModel>? _userModel = [];
  @override
  void initState() {
    super.initState();
    _getData();
  }

  // print(_userModel!.length);
  void _getData() async {
    _userModel = (await ApiService().getUsers())!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  // void _getData() async {
  //   _userModel = (await ApiService().fetchAlbum())!;
  //   print(_userModel![0].id);
  //   Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {
  //      id =    _userModel![0].id;
  //      title =    _userModel![0].title;
  //      author =    _userModel![0].author;

  //       }));
  // }

  // Future<List<User>> getRequest() async {
  //   //replace your restFull API here.

  //   // String url = "https://jsonplaceholder.typicode.com/posts";
  //   final response =
  //       await http.get(Uri.parse(''));

  //   var responseData = json.decode(response.body);

  //   //Creating a list to store input data;
  //   List<User> users = [];
  //   for (var singleUser in responseData) {
  //     User user = User(
  //         id: singleUser["id"],
  //         name: singleUser["name"],
  //         phone_no: singleUser["phone_no"],
  //         // body: singleUser["body"]
  //         );

  //     //Adding user to the list.
  //     users.add(user);
  //   }
  //   return users;
  // }

// =-------------------------  API -----------------
  // void _getData() async {
  //   _userModel = (await ApiService().getUsers())!;
  //   Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  //   print(_userModel);
  // }

// --------------------------- POPUP -----------------------

  void _showDialog(BuildContext context) {
    Dialog errorDialog = Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0)), //this right here
      child: Container(
        height: 350.0,
        width: 350.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(15.0),
              child: Image.asset("assets/twoPerson.png"),
            ),
            Container(
                padding: EdgeInsets.all(15.0),
                child: Column(children: [
                  Text('Set your clock', style: smallBold),
                  Text('Please provide timing when you will ', style: small),
                  Text('be able to attend the calls from other turists.',
                      style: small),
                ])),
            TextButton(
                onPressed: () {
                  // Navigator.pop(context);
                  // print("pop");

                  // Navigator.of(context).pushNamed("/setTimePage");
                  // Navigator.push(
                  //                               context,
                  //                               MaterialPageRoute(
                  //                                   builder: (context) =>
                  //                                       const MyAppSecondPage()));

// Navigator.

                  print("push");

                  // Navigator.of(context).pop();
                  // Navigator.push(
                  //         context,
                  //         MaterialPageRoute(builder: (context) => MyAppSecondPage()));
                },
                child: Text(
                  'Continue',
                  style: bold,
                ))
          ],
        ),
      ),
    );
    showDialog(
        context: context, builder: (BuildContext context) => errorDialog);
  }
//  void toggleSwitch(bool value) {
//     if (isSwitched == false) {

//       setState(() {
//         isSwitched = true;
//        });
//        _showDialog(context);

//      } else {
//       setState(() {
//         isSwitched = false;
//        });
//      }
//   }
  @override
  Widget build(BuildContext context) {
    // print(users);
    // jsondata = The2.fromJson(data);
    // print(data![1].toString());
    Future<void> _showTime() async {
      final TimeOfDay? result =
          await showTimePicker(context: context, initialTime: TimeOfDay.now());
      if (result != null) {
        setState(() {
          timeinput1.text = result.format(context);

          // _selectedTime = result.format(context);
        });
      }
    }

//  print(author);
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,

          leadingWidth: 100,
          // centerTitle: true,
          backgroundColor: Color.fromARGB(255, 255, 255, 255),

          leading: Container(
            padding: const EdgeInsets.fromLTRB(16, 16, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
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
          // ========================
          actions: [
            Container(
              // padding: const EdgeInsets.fromLTRB(16, 16, 0, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                // this method can help you to set picture for end
                children: [
                  Image.asset("assets/ping.png"),
                  TextButton(
                    child: Text(
                      "Pings",
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
          ],

          toolbarHeight: 105,
          elevation: 0.00,

          title: Image.asset(
            'assets/logo.png',
            fit: BoxFit.cover,
            height: 48.75,
            width: 156,
          ),
        ),

        // ==============================================
        // body:  form_dropout(),
        // body: profile_edit(),
        // body: expert_card,
        body: _userModel == null || _userModel!.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : 
            //  Container(
            //     padding: EdgeInsets.all(16.0),
            //     child:
            // FutureBuilder(
            //   future: getRequest(),
            //   builder: (BuildContext ctx, AsyncSnapshot snapshot) {
            //     if (snapshot.data == null) {
            //       return Container(
            //         child: Center(
            //           child: CircularProgressIndicator(),
            //         ),
            //       );
            //     } else {
            //       return ListView.builder(
            //         itemCount: snapshot.data.length,
            //         itemBuilder: (ctx, index) => ListTile(
            //           title: Text(snapshot.data[index].title),
            //           subtitle: Text(snapshot.data[index].body),
            //           contentPadding: EdgeInsets.only(bottom: 20.0),
            //         ),
            //       );
            //     }
            //   },
            // ),
            // ));

            Container(
                color: Colors.white,
                padding: EdgeInsets.all(10),
                child: SingleChildScrollView(
                    child: Column(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      connetThumbnail(_userModel![0].name.toString()),

                      // )-----------------------------------------------
                      Padding(
                          padding:
                              EdgeInsets.only(top: 111, right: 20, left: 20),
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            // mainAxisAlignment: MainAxisAlignment.spaceAround,

                            children: [
                              Icon(Icons.schedule),
                              Text("  6:00 PM - 6:20  PM ",
                                  style: GoogleFonts.poppins(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                  )),
                              Text("  India   ",
                                  style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w900,
                                  )),
                            ],
                          )),

                      // -------------------
                      Padding(
                          padding:
                              EdgeInsets.only(bottom: 96, right: 20, left: 20),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            // mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Icon(Icons.calendar_month),
                              Text("  Date : 15 Nov 2022  “Monday”",
                                  style: GoogleFonts.poppins(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                  )),
                            ],
                          )),

                      Padding(
                        padding: EdgeInsets.only(
                            top: 20, bottom: 20, right: 20, left: 20),

                        // padding: EdgeInsets.all(20),
                        child: Text(
                          "Schedule call on your calendar by completing payment",
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),

                      Padding(
                          padding: EdgeInsets.only(
                              top: 50, bottom: 30, right: 20, left: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Cost of Trip Planning call",
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                "500 INR",
                                style: GoogleFonts.poppins(
                                  color: Color(0xff0A8100),
                                  fontSize: 22,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),

                              // ------------------------ button
                            ],
                          )),

                      Container(
                          width: double.infinity,
                          padding:
                              EdgeInsets.only(top: 40, left: 10, right: 10),
                          child: Align(
                              alignment: Alignment.center,
                              child: SizedBox(
                                  height: 53, //height of button
                                  width: double.infinity, //width of button
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Color(
                                            0xffFB8C00), //background color of button
                                        side: BorderSide(
                                            width: 0,
                                            color: Color(
                                                0xffFB8C00)), //border width and color
                                        elevation: 3, //elevation of button
                                        shape: RoundedRectangleBorder(
                                            //to set border radius to button
                                            borderRadius:
                                                BorderRadius.circular(3)),
                                        // padding:
                                        // EdgeInsets.all(10) //content padding inside button
                                      ),
                                      onPressed: () {
                                        _showDialog(context);
                                        // print("pressed");
                                        // Navigator.pop(context);

                                        // Navigator.of(context).pushNamed("/");
                                        // Navigator.pop(context);
                                        // Navigator.push(
                                        //     context,
                                        //     MaterialPageRoute(
                                        //         builder: (context) =>
                                        //             const myEditSetting()));
                                      },
                                      child: Text("Request Call",
                                          style: GoogleFonts.poppins(
                                              fontSize: 22,
                                              fontWeight: FontWeight.w800,
                                              color: Color.fromARGB(
                                                  255, 255, 255, 255)))))))
                    ]))
                // )
                ));
    // );
  }

  connetThumbnail(author) => Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(top: 30, bottom: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset("assets/person.png"),
                Icon(
                  Icons.sync_alt,
                ),
                Icon(
                  Icons.account_circle,
                )
              ],
            ),
          ),
          Text(
            "Schedual Call With",
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            "$author",
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      );

  //----------------------------------------  button

//   final button = Container(
//       width: double.infinity,
//       padding: EdgeInsets.only(top: 40, left: 10, right: 10),
//       child: Align(
//           alignment: Alignment.center,
//           child: SizedBox(
//               height: 53, //height of button
//               width: double.infinity, //width of button
//               child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     primary: Color(0xffFB8C00), //background color of button
//                     side: BorderSide(
//                         width: 0,
//                         color: Color(0xffFB8C00)), //border width and color
//                     elevation: 3, //elevation of button
//                     shape: RoundedRectangleBorder(
//                         //to set border radius to button
//                         borderRadius: BorderRadius.circular(3)),
//                     // padding:
//                     // EdgeInsets.all(10) //content padding inside button
//                   ),
//                   onPressed: () {
//                     _showDialog(context);
//                     // print("pressed");
//                     // Navigator.pop(context);

//                     // Navigator.of(context).pushNamed("/");
//                     // Navigator.pop(context);
//                     // Navigator.push(
//                     //     context,
//                     //     MaterialPageRoute(
//                     //         builder: (context) =>
//                     //             const myEditSetting()));
//                   },
//                   child: Text("Request Call",
//                       style: GoogleFonts.poppins(
//                           fontSize: 22,
//                           fontWeight: FontWeight.w800,
//                           color: Color.fromARGB(255, 255, 255, 255)))))));
// }

// void _showDialog(BuildContext context) {
//   Dialog errorDialog = Dialog(
//     shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(12.0)), //this right here
//     child: Container(
//       height: 350.0,
//       width: 350.0,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           Padding(
//             padding: EdgeInsets.all(15.0),
//             child: Image.asset("assets/twoPerson.png"),
//           ),
//           Container(
//               padding: EdgeInsets.all(15.0),
//               child: Column(children: [
//                 Text('User is not available at ', style: smallBold),
//                 Text('your selected time ', style: small),
//                 // Text('be able to attend the calls from other turists.', style: small),
//               ])),
//           TextButton(
//               onPressed: () {
//                 Navigator.pop(context);
//                 // print("pop");

//                 // Navigator.of(context).pushNamed("/setTimePage");
//                 // Navigator.push(
//                 //               context,
//                 //               MaterialPageRoute(
//                 //                   builder: (context) =>
//                 //                       const MyAppSecondPage()));

//                 print("push");

//                 // Navigator.of(context).pop();
//                 // Navigator.push(
//                 //         context,
//                 //         MaterialPageRoute(builder: (context) => MyAppSecondPage()));
//               },
//               child: Text(
//                 'Check  User  Calendar',
//                 style: small,
//               ))
//         ],
//       ),
//     ),
//   );
//   showDialog(context: context, builder: (BuildContext context) => errorDialog);
}
