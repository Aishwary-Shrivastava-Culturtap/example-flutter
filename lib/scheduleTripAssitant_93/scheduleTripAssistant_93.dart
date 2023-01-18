import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';

class scheduelTripAssistent_93 extends StatefulWidget {
  const scheduelTripAssistent_93({super.key});

  @override
  State<scheduelTripAssistent_93> createState() =>
      _scheduelTripAssistent_93State();
}

class _scheduelTripAssistent_93State extends State<scheduelTripAssistent_93> {
  final _controller1 = TextEditingController();
  final _controller2 = TextEditingController();

// ==============================   date 1 ==============================

  Future<void> _show1() async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(), //get today's date
        firstDate: DateTime(
            2000), //DateTime.now() - not to allow to choose before today.
        lastDate: DateTime(2101));

    if (pickedDate != null) {
      print(
          pickedDate); //get the picked date in the format => 2022-07-04 00:00:00.000
      String formattedDate = DateFormat.yMMMMd().format(
          pickedDate); // format date in required form here we use yyyy-MM-dd that means time is removed
      print(
          formattedDate); //formatted date output using intl package =>  2022-07-04
      //You can format date as per your need

      setState(() {
        _controller1.text =
            formattedDate; //set foratted date to TextField value.
      });
    } else {
      print("Date is not selected");
    }

    // _selectedTime = result.format(context);
  }

  Widget date1() {
    return SizedBox(
        width: 150,
        child: TextField(
          cursorColor: Color(0xffFB8C00),
          controller: _controller1,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Date  ',
            hintText: 'Enter Your Date  ',
            prefixIcon: Icon(
              Icons.date_range_outlined,
              color: Color(0xffFB8C00),
            ),
            suffixIcon: _controller1.text.length > 0
                ? GestureDetector(
                    onTap:
                        _controller1.clear, // removes the content in the field
                    child: Icon(Icons.clear_rounded, color: Color(0xffFB8C00)),
                  )
                : null,
          ),
          onTap: () {
            _show1();
          },
        ));
  }

// ==============================   date 2 ==============================
  Future<void> _show2() async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(), //get today's date
        firstDate: DateTime(
            2000), //DateTime.now() - not to allow to choose before today.
        lastDate: DateTime(2101));

    if (pickedDate != null) {
      print(
          pickedDate); //get the picked date in the format => 2022-07-04 00:00:00.000
      String formattedDate = DateFormat.yMMMMd().format(
          pickedDate); // format date in required form here we use yyyy-MM-dd that means time is removed
      print(
          formattedDate); //formatted date output using intl package =>  2022-07-04
      //You can format date as per your need

      setState(() {
        _controller2.text =
            formattedDate; //set foratted date to TextField value.
      });
    } else {
      print("Date is not selected");
    }

    // _selectedTime = result.format(context);
  }

  Widget date2() {
    return SizedBox(
        width: 150,
        child: TextField(
          cursorColor: Color(0xffFB8C00),
          controller: _controller2,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Date  ',
            hintText: 'Enter Your Date  ',
            prefixIcon: Icon(
              Icons.date_range_outlined,
              color: Color(0xffFB8C00),
            ),
            suffixIcon: _controller1.text.length > 0
                ? GestureDetector(
                    onTap:
                        _controller1.clear, // removes the content in the field
                    child: Icon(Icons.clear_rounded, color: Color(0xffFB8C00)),
                  )
                : null,
          ),
          onTap: () {
            _show1();
          },
        ));
  }

  _updateValue() {
    setState(() {}); // this causes the widget to be built again
  }

// ============================ button      ==========================
  Widget button() {
    return Container(
        padding: const EdgeInsets.fromLTRB(50, 10, 50, 10),
        child: SizedBox(
          height: 50, //height of button
          // width: 300, //width of button
          width: double.infinity, //width of button equal to parent widget

          child: ElevatedButton(
            onPressed: (){},
            // searching
            //     ? () {
            //         Navigator.pushNamed(context, '/second');
            //       }
            //     : null,
            child: Text(
              'NEXT',
              style: GoogleFonts.poppins(
                  fontSize: 22,
                  fontWeight: FontWeight.w900,
                  color: Color.fromARGB(255, 255, 255, 255)),
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.disabled))
                    return Color.fromARGB(255, 0, 0, 0);
                  return Color.fromARGB(
                      255, 255, 141, 59); // Use the component's default.
                },
              ),
            ),
          ),
        ));
  }

  // ====================== check user calender =============
    Widget CalenderCheck1() {
    return DecoratedBox(
        decoration: BoxDecoration(
          color: Color.fromARGB(
              255, 255, 255, 255), //background color of dropdown button
          // border: (),
          // Border.all(
          //     color: Color(0xffD9D9D9), width: 3), //border of dropdown button
          borderRadius:
              BorderRadius.circular(5), //border raiuds of dropdown button
        ),
        child: Container(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Check User Calender",
                  style: GoogleFonts.poppins(
                    color: Color(0xffFB8C00),
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Icon(
                  Icons.navigate_next,
                  color: Color(0xffFB8C00),
                ),
              ],
            )));
  }
  // ------------------------------ 

  Widget CalenderCheck2() {
    return DecoratedBox(
        decoration: BoxDecoration(
          color: Color.fromARGB(
              255, 255, 255, 255), //background color of dropdown button
          // border: (),
          // Border.all(
          //     color: Color(0xffD9D9D9), width: 3), //border of dropdown button
          borderRadius:
              BorderRadius.circular(5), //border raiuds of dropdown button
        ),
        child: Container(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Check other profile",
                  style: GoogleFonts.poppins(
                    color: Color(0xffFB8C00),
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Icon(
                  Icons.navigate_next,
                  color: Color(0xffFB8C00),
                ),
              ],
            )));
  }

  @override
  void initState() {
    // whenever the value of the field changes, _updateValue is called
    _controller1.addListener(_updateValue);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,

        leadingWidth: 110,
        // centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        leading: Container(
            padding: const EdgeInsets.fromLTRB(26, 16, 0, 0),
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
            )

            //  TextButton(
            //   child: Text(
            //     "< Back",
            //     style: TextStyle(
            //       fontSize: 22,
            //       fontWeight: FontWeight.bold,
            //       color: Color.fromARGB(255, 0, 0, 0),
            //     ),
            //   ),
            //   onPressed: () {
            //     Navigator.pop(context);
            //   },
            // ),

            // Row(
            //   children: [
            // IconButton(
            //     icon: const Icon(
            //       Icons.arrow_back_ios,
            //       color: Colors.black,
            //     ),
            //     onPressed: () {
            //       Navigator.pop(context);
            //     }
            //     // const Icon(

            //     //   Icons.arrow_back_ios,
            //     //   color: Colors.black,
            //     ),

            // TextButton(
            //   child: Text(
            //     "< Back",
            //     style: TextStyle(
            //       color: Color.fromARGB(255, 0, 0, 0),
            //     ),
            //   ),
            //   onPressed: () {
            //     Navigator.pop(context);
            //   },
            // ),
            // Container(
            //     child: const Text(
            //   'Back',
            //   style: TextStyle(
            //       fontSize: 9,
            //       fontWeight: FontWeight.bold,
            //       color: Colors.black),
            // )),
            // ],
            // ),
            ),

        // leading: IconButton(
        //   icon: const Icon(Icons.arrow_back_ios),
        //   color: Color.fromARGB(255, 0, 0, 0),
        //   tooltip: 'Menu Icon',
        //   onPressed: () {},
        // ),

        toolbarHeight: 105,
        elevation: 0.00,

        title: Image.asset('assets/logo.png', fit: BoxFit.cover),
      ),
      body: Container(
        color: Color.fromARGB(255, 255, 255, 255),
              padding: EdgeInsets.all(30),



        child: 
        
        SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(

              height: 180,
              width: double.infinity,


              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Schedul Trip Assistance",
              style: GoogleFonts.poppins(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                    ),),
                  Text("Choose your travelling date!",
              style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                    ),),
                  Text(
                      "You are sScheduling the assistance with Hemant for your next Bengaluru trip",
              style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                    ),),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Select dates",
              style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  ),),
Container(
              padding: EdgeInsets.only(right: 50),

  child:Table( 
    defaultColumnWidth: FixedColumnWidth(200.0), children: [
                    TableRow(children: [
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          "From" ,
              style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                   ),
                          // textScaleFactor: 1.5,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Text("Till", 
              style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                   ),
                  //  textScaleFactor: 1.5
                   ),
                      )
                    ]),
                    TableRow(children: [
                      Padding(
                        padding: EdgeInsets.only(right: 50),
                        child: date1(),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 50),
                        child: date1(),
                      )
                    ]),
                  ]) ,
),
                  

                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //   children: [
                  //      date1(),
                  //      date2()         //  button

                  //   ],
                  // ),

                  Container(
              padding: EdgeInsets.fromLTRB(0,30,0,30),

                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                        Text("User available on selected days",
              style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                   ),),
                      Row(
                        children: [
                          Padding(padding: EdgeInsets.only(right: 10),
                          child:Icon(Icons.fiber_manual_record,size: 20,  color: Color(0xffFF0000) ,)
                          ,),


                          Text("unavailable",
                                    style: GoogleFonts.poppins(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xffFF0000)),),

                        ],
                      )

                       
                      ])),

                  Container(
              padding: EdgeInsets.fromLTRB(0,0,0,50),

                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                        Text(
                            "Hemant is not available st 15th & 16th of Nov, You can change your assistance dates or move to another profile",
              style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                   ),),
                      ])),

                  Container(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                        Text("Cost of Trip Assistance in bengaluru" ,
              style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                    ),),
                        Text("500 INR / Event",
              style: GoogleFonts.poppins(
                
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  color: Color(0xff0A8100)),),
                      ])),

Container(
  height: 124,
padding: EdgeInsets.fromLTRB(0, 20, 0, 0),

width: double.infinity,
  child: Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Container(
         color: Color.fromARGB(255, 184, 184, 184),
        height: 1,
      ),
       CalenderCheck1(),
       Container(
         color: Color.fromARGB(255, 184, 184, 184),
        height: 1,
      ),
                      CalenderCheck2(),
                      Container(
         color: Color.fromARGB(255, 184, 184, 184),
        height: 1,
      ),

    ],
  ),
)
                     
                ],
              ),

              
            )
          ],
        )),
      ),
    );
  }
}
