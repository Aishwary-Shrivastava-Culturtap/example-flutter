import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
 import 'package:schedule_a_call/scheddule_trip_saurabh.dart';
import 'package:schedule_a_call/schedulInterationCall_maching.dart';
import 'package:schedule_a_call/scheduleTripPlanning.dart';
import 'package:schedule_a_call/schedule_trip_assistance-92.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:developer';
import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<List<GetUserData>> fetchAlbum() async {
    String uri = 'https://jsonplaceholder.typicode.com/albums';
    final response = await http.get(Uri.parse(uri));

// Appropriate action depending upon the
// server response
    if (response.statusCode == 200) {
      List<GetUserData> data = getUserDataFromJson(response.body);
      return data;
    } else {
      throw Exception('Failed to load album');
    }
  }
}

List<GetUserData> getUserDataFromJson(String str) => json.decode(str) == null
    ? []
    : List<GetUserData>.from(
        json.decode(str)!.map((x) => GetUserData.fromJson(x)));

String getUserDataToJson(List<GetUserData?>? data) => json.encode(
    data == null ? [] : List<dynamic>.from(data!.map((x) => x!.toJson())));

class GetUserData {
  GetUserData({
    this.userId,
    this.id,
    this.title,
  });

  int? userId;
  int? id;
  String? title;

  factory GetUserData.fromJson(Map<String, dynamic> json) => GetUserData(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
      };
}

// class Album {
//   final int userId;
//   final int id;
//   final String title;

//   Album({required this.userId, required this.id, required this.title});

//   factory Album.fromJson(Map<String, dynamic> json) {
//     return Album(
//       userId: json['userId'],
//       id: json['id'],
//       title: json['title'],
//     );
//   }
// }

// void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // late Future<User> futureAlbum;
  late List<GetUserData>? _userModel = [];

  @override
  void initState() {
    super.initState();
    // futureAlbum = fetchAlbum();
        _getData();

  }

   void _getData() async {
    _userModel = (await ApiService().fetchAlbum())!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetching Data',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('hello'),
        ),
        body: Center(
          child: Container(
            child:_userModel == null || _userModel!.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          :  Text("data${_userModel![0].title}"),
          )
          
          // FutureBuilder<Album>(
          //   future: futureAlbum,
          //   builder: (context, snapshot) {
          //     if (snapshot.hasData) {
          //       return Text(snapshot.data!.title);
          //     } else if (snapshot.hasError) {
          //       return Text("${snapshot.error}");
          //     }
          //     return CircularProgressIndicator();
          //   },
          // ),


        ),
      ),
    );
  }
}


//  m


// class MyWidget extends StatefulWidget {
//   const MyWidget({super.key});

//   @override
//   State<MyWidget> createState() => _MyWidgetState();
// }

// class _MyWidgetState extends State<MyWidget> {
//   String? pickedDat;

//   Future<void> _show1() async {
//     DateTime? pickedDate = await showDatePicker(
//       context: context,

//       initialDate: DateTime.now(), //get today's date
//       firstDate: DateTime(
//           2000), //DateTime.now() - not to allow to choose before today.
//       lastDate: DateTime(2101),
//     );
//   }
  

//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//                 appBar: AppBar(
//                   centerTitle: true,

//                   leadingWidth: 100,
//                   // centerTitle: true,
//                   backgroundColor: Color.fromARGB(255, 255, 255, 255),

//                   leading: Container(
//                     padding: const EdgeInsets.fromLTRB(16, 16, 0, 0),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       // mainAxisAlignment: MainAxisAlignment.start,
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         Text(
//                           "<",
//                           style: TextStyle(
//                             fontSize: 22,
//                             fontWeight: FontWeight.bold,
//                             color: Color.fromARGB(255, 0, 0, 0),
//                           ),
//                         ),
//                         TextButton(
//                           child: Text(
//                             "Back",
//                             style: TextStyle(
//                               fontSize: 18,
//                               fontWeight: FontWeight.bold,
//                               color: Color.fromARGB(255, 0, 0, 0),
//                             ),
//                           ),
//                           onPressed: () {
//                             Navigator.pop(context);
//                           },
//                         ),
//                       ],
//                     ),
//                   ),
//                   // ========================
//                   actions: [
//                     Container(
//                       // padding: const EdgeInsets.fromLTRB(16, 16, 0, 0),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         // mainAxisAlignment: MainAxisAlignment.start,
//                         mainAxisSize: MainAxisSize.min,
//                         // this method can help you to set picture for end
//                         children: [
//                           Image.asset("assets/ping.png"),
//                           TextButton(
//                             child: Text(
//                               "Pings",
//                               style: TextStyle(
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.bold,
//                                 color: Color.fromARGB(255, 0, 0, 0),
//                               ),
//                             ),
//                             onPressed: () {
//                               Navigator.pop(context);
//                             },
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],

//                   toolbarHeight: 105,
//                   elevation: 0.00,

//                   title: Image.asset(
//                     'assets/logo.png',
//                     fit: BoxFit.cover,
//                     height: 48.75,
//                     width: 156,
//                   ),
//                 ),

//                 // ==============================================
//                 // body:  form_dropout(),
//                 // body: profile_edit(),
//                 // body: expert_card,
//                 body: Container(
//                     padding: EdgeInsets.all(30),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Container(
//                           padding: EdgeInsets.only(top: 30, bottom: 30),
//                           child: Text(
//                             "Check Calender",
//                             style: GoogleFonts.poppins(
//                               fontSize: 20,
//                               fontWeight: FontWeight.w700,
//                             ),
//                           ),
//                         ),
//                         Text(
//                           "Hemant's provided available time for trip planning interaction calls-",
//                           style: GoogleFonts.poppins(
//                             fontSize: 18,
//                             fontWeight: FontWeight.w900,
//                           ),
//                         ),
//                         Container(
//                           padding: EdgeInsets.only(top: 10, bottom: 9),
//                           child: Row(=
//                             children: [
//                               Icon(Icons.schedule),
//                               Text(
//                                 "6:00 PM - 11:30 PM India",
//                                 style: GoogleFonts.poppins(
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.w400,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         Container(
//                             padding: EdgeInsets.only(top: 30, bottom: 60),
//                             child: Column(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceAround,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Container(
//                                       padding: EdgeInsets.only(bottom: 10),
//                                       child: Text(
//                                         "Select Date",
//                                         style: GoogleFonts.poppins(
//                                           fontSize: 18,
//                                           fontWeight: FontWeight.w700,
//                                         ),
//                                       )),
//                                   SizedBox(
//                                     height: 35,
//                                     width: 170,
//                                     child: TextButton(
//                                         onPressed: () async {
//                                             DateTime? pickedDate = await showDatePicker(

                                              
//                                                 builder: (context, child) {
//                                                         return Theme(
//                                                           data: Theme.of(context).copyWith(
//                                                             colorScheme: ColorScheme.light(
//                                                               primary: Color(0xffFB8C00), // header background color
//                                                               onPrimary: Color.fromARGB(255, 255, 255, 255), // header text color
//                                                               onSurface: Color(0xffFB8C00), // body text color 
//                                                             ),
//                                                             textButtonTheme: TextButtonThemeData(
//                                                               style: TextButton.styleFrom(
//                                                                 primary: Colors.black, // button text color
//                                                               ),
//                                                             ),
//                                                           ),
//                                                           child: child!,
//                                                         );
//                                                       },





//                                                 context: context,
//                                                 initialDate: DateTime.now(),
//                                                 firstDate: DateTime(1950),
//                                                 //DateTime.now() - not to allow to choose before today.
//                                                 lastDate: DateTime(2100));
                            
//                                             if (pickedDate != null) {
//                                               print(  pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
//                                               String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
//                                               print(
//                                                   formattedDate); //formatted date output using intl package =>  2021-03-16
//                                               setState(() {
//                                                 pickedDat = formattedDate; //set output date to TextField value.
//                                               });
//                                             } else {}
//                                           },


//                                         style: TextButton.styleFrom(
//                                           primary: Color.fromARGB(
//                                               255, 255, 254, 253),
//                                           backgroundColor: Color(
//                                               0xffFB8C00), // Background Color
//                                         ),   
//                                         child: Row(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.spaceAround,
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.center,
//                                           children: [
//                                             Icon(
//                                               Icons.calendar_month,
//                                               color: Colors.white,
//                                             ),
//                                             Text(
//                                               pickedDat != null
//                                                   ? "$pickedDat"
//                                                   : "--",
//                                               style: GoogleFonts.poppins(
//                                                 fontSize: 18,
//                                                 fontWeight: FontWeight.w900,
//                                               ),
//                                             ),
//                                             Icon(
//                                               Icons.expand_more,
//                                               color: Colors.white,
//                                             ),
//                                           ],
//                                         )),
//                                   )
//                                 ])),
//                         Text(
//                           "Day Plans",
//                           style: GoogleFonts.poppins(
//                             fontSize: 20,
//                             fontWeight: FontWeight.w700,
//                           ),
//                         ),
//                         multiselectNet,
//                       ],
//                     )));
//   }

//   final multiselectNet = Padding(
//       padding: EdgeInsets.only(top: 20),
//       child: Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(10.0),
//             topRight: Radius.circular(10.0),
//             bottomLeft: Radius.circular(10.0),
//             bottomRight: Radius.circular(10.0),
//           ),
//           boxShadow: [
//             BoxShadow(
//               color: Color.fromARGB(255, 231, 230, 230),
//               offset: const Offset(
//                 5.0,
//                 5.0,
//               ),
//               blurRadius: 10.0,
//               spreadRadius: 2.0,
//             ), //BoxShadow
//             BoxShadow(
//               color: Color.fromARGB(255, 255, 255, 255),
//               offset: const Offset(0.0, 0.0),
//               blurRadius: 0.0,
//               spreadRadius: 0.0,
//             ), //BoxShadow
//           ],
//         ),
//         padding: EdgeInsets.all(20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//                 " Nothing planned this day, you can schedule your slotes for interation",
//                 style: GoogleFonts.poppins(
//                   fontWeight: FontWeight.w500,
//                   fontSize: 20,
//                 )), //----------------------------------------   1
//             // Row(
//             //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             //   children: [
//             //     Flexible(
//             //         child: Image.asset(
//             //             "assets/pay/gpay.png")), //---------------------
//             //     Flexible(child: Image.asset("assets/pay/googlepay.png")),

//             //     Flexible(child: Image.asset("assets/pay/Paytm-UPI.png")),
//             //     Flexible(child: Image.asset("assets/pay/paypal.png")),
//             //     Flexible(child: Image.asset("assets/pay/PayU.png"))
//             //   ],
//             //   //----------------------------------------   2
//             // ),
//             // Text("You can save your cards as per new RBI ",
//             //     style: GoogleFonts.poppins(
//             //       fontWeight: FontWeight.w400,
//             //       fontSize: 16,
//             //     )),
//           ],
//         ),
//       ));
// }
