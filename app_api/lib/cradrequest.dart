import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'main.dart';

class cardrequest extends StatelessWidget {
  User item;

    cardrequest({super.key,required this.item});

  @override
  Widget build(BuildContext context) {
    return card1;
  }
}

final card1 = Card(
    margin: EdgeInsets.all(20),
    elevation: 50,
    shadowColor: Colors.black,
    child: Container(
        height: 250,
        padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset("assets/person.png"),
                Icon(Icons.double_arrow, color: Color.fromARGB(255, 0, 0, 0)),
                Icon(Icons.account_circle,
                    color: Color.fromARGB(255, 0, 0, 0), size: 36)
              ],
            )),
            RichText(
              text: TextSpan(
                // Note: Styles for TextSpans must be explicitly defined.
                // Child text spans will inherit styles from parent
                style: const TextStyle(
                  fontSize: 14.0,
                  color: Colors.black,
                ),
                children: <TextSpan>[
                  TextSpan(
                      text: 'You are hired as local guide by  ',
                      style: GoogleFonts.poppins(
                          fontSize: 18, fontWeight: FontWeight.w600)),
                  TextSpan(
                      text: "Aishwarya",
                      style: GoogleFonts.poppins(
                          fontSize: 18, fontWeight: FontWeight.w800)),
                ],
              ),
            ),
            Container(
                child: Column(
              children: [
                Row(
                  children: [
                    Icon(Icons.calendar_today,
                        color: Color.fromARGB(255, 0, 0, 0), size: 18),
                    Text("Date : 15 Nov 2023 to 20 Nov 2023",
                        style: GoogleFonts.poppins(
                            fontSize: 18, fontWeight: FontWeight.w400))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Your earnings will be ",
                        style: GoogleFonts.poppins(
                            fontSize: 18, fontWeight: FontWeight.w600)),
                    Text("10,000 INR",
                        style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                            color: Colors.green))
                  ],
                ),
              ],
            )),
            Container(
                margin: EdgeInsets.only(left: 200),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                        child: Text("cancel",
                            style: GoogleFonts.poppins(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                color: Colors.orange)),
                        onPressed: () {
                          print('Pressed');
                        }),
                    TextButton(
                        child: Text("Accept",
                            style: GoogleFonts.poppins(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: Colors.orange)),
                        onPressed: () {
                          print('Pressed');
                        }),
                  ],
                ))
          ],
        )));
