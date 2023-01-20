import 'package:app_api/main.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

var headingStyle =
    GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w900);

var valueStyle = GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w400);

class mycard3 extends StatelessWidget {
  User item;
  mycard3({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    // const descTextStyle = TextStyle(
    //   color: Colors.black,
    //   fontWeight: FontWeight.w800,
    //   fontFamily: 'Roboto',
    //   letterSpacing: 0.5,
    //   fontSize: 18,
    //   height: 2,
    // );

// DefaultTextStyle.merge() allows you to create a default text
// style that is inherited by its child and all subsequent children.
    final iconList = DefaultTextStyle.merge(
      // style:headingStyle,
      child: Container(
        padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Icon(
                  Icons.perm_identity,
                  color: Color.fromARGB(255, 0, 0, 0),
                  size: 21,
                ),
                Text(
                  '${item.followers} followers:',
                  style: headingStyle,
                ),
                // const Text('25 min'),
              ],
            ),
            Column(
              children: [
                Icon(Icons.person_add_alt, color: Color.fromARGB(255, 0, 0, 0)),
                Text(
                  '${item.following} following:',
                  style: headingStyle,
                ),
                // const Text('1 hr'),
              ],
            ),
            Column(
              children: [
                Icon(Icons.add_location_outlined,
                    color: Color.fromARGB(255, 0, 0, 0)),
                Text(
                  '${item.location} location:',
                  style: headingStyle,
                ),
                // const Text('4-6'),
              ],
            ),
          ],
        ),
      ),
    );

    return Card(
        margin: EdgeInsets.all(20),
        elevation: 50,
        shadowColor: Colors.black,
        // color: Colors.greenAccent[100],
        child: Container(
          height: 250,
          padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset("assets/person.png"),
                  Padding(
                    padding: EdgeInsets.only(left: 50),
                    child: Text(
                      "${item.name}",
                      style: headingStyle,
                    ),
                  )

                  // Icon(
                  //   Icons.share_rounded,
                  // color: Color.fromARGB(255, 0, 0, 0),
                  // )
                ],
              )),
              Container(
                  child: Column(
                      // mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                    Table(
                      // border: TableBorder.all(
                      //     width: 1, color: Colors.black45), //table border
                      children: [
                        TableRow(children: [
                          TableCell(
                              child: Text(
                            "Profession",
                            style: headingStyle,
                          )),
                          TableCell(child: Text("${item.profession}")),
                        ]),
                        TableRow(children: [
                          TableCell(
                              child: Text(
                            "Age / Gender",
                            style: headingStyle,
                          )),
                          TableCell(child: Text("24 / male")),
                        ]),
                        TableRow(children: [
                          TableCell(
                              child: Text(
                            "Language",
                            style: headingStyle,
                          )),
                          TableCell(child: Text("${item.language}")),
                        ]),
                      ],
                    )
                  ])),
              iconList
            ],
          ),
        ));
  }
}
