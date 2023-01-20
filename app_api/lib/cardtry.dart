// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class mycard2 extends StatelessWidget {
  const mycard2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.fromLTRB(16, 27, 16, 4),
        decoration: BoxDecoration(
          border: Border.all(),
        ),
        child: Padding(
            padding: EdgeInsets.fromLTRB(30, 22, 29, 30),
            child: Container(
                height: 270,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                        margin: EdgeInsets.only(right: 166, bottom: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              'assets/person.png',
                              height: 36,
                              width: 36,
                            ),
                            Text(" {item.name}",
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w800, fontSize: 18)),
                          ],
                        )),
                    Container(
                      width: double.infinity,
                      child: Table(children: [
                        TableRow(children: [
                          Text("Profession -",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w700, fontSize: 18)),
                          Text("{item.profession}",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400, fontSize: 18)),
                        ]),
                        TableRow(children: [
                          Text("Age / Gender -",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w700, fontSize: 18)),
                          Text("24 Yr / Male",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400, fontSize: 18)),
                        ]),
                        TableRow(children: [
                          Text("Language -",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w700, fontSize: 18)),
                          Text("{item.language}",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400, fontSize: 18)),
                        ]),
                      ]),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 16.91, 0, 0),
                      padding: EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Icon(
                                Icons.person_add,
                              ),
                              Text('{item.followers}',
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 15)),
                            ],
                          ),
                          Column(
                            children: [
                              Icon(Icons.group_add),
                              Text('{item.following}',
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 15)),
                            ],
                          ),
                          Column(
                            children: [
                              Icon(Icons.add_location_alt),
                              Text('{item.location}',
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 15)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ))));
  }
}