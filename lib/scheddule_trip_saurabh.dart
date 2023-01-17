import 'package:flutter/material.dart';


class MyAppsaurabh extends StatelessWidget {
  const MyAppsaurabh({super.key});

  @override
  Widget build(BuildContext context) {

    return 
    
    MaterialApp(
     
      home: 
      
      Scaffold(
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

        title:Text("demo")
        //  Image.asset('img/1/logo.png', 
        // fit: BoxFit.cover,
        //  height: 48.75,
        //     width: 156,
        // ),
      ),
        
        body: Column(children: [
         Padding( padding: EdgeInsets.fromLTRB(20,0,40,0),
        child: Container(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children:[
              Padding( padding: EdgeInsets.fromLTRB(0,20,40,20),
                child: Container(
                          height: 48,
                         width: 173,
                          child: Column(
                          children: [
                              Text("Choose your travelling dates !",style:TextStyle(fontWeight:FontWeight.bold))
                                    ]
                                       )
                                ),
                       ),
              Container(
                height: 42,
                width: 289,
                child: Text("You are schedualing the assistance with Hemant for your next Bengaluru trip.")
              ),
              Padding(padding: EdgeInsets.fromLTRB(0,10,500,20),
               child: Container(
                
                child:Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children:[
                    Container(
                      child:
                     // Padding(padding: EdgeInsets.fromLTRB(25,25,25,25),
                    Text("select dates"),),

                    Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children:[
                        Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children:[
                            Text("From"),
                            Container(
                              margin: const EdgeInsets.fromLTRB(0,15,15,15),
                              //padding: EdgeInsets.all(3.0),
                              decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                              child:Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                Text("15/NOV"),
                                Icon(Icons.schedule,
                                color:Colors.yellow[400])
                              ],)
                            )
                          ]
                        ),
                        Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children:[
                            Text("till"),
                            Container(
                              margin: const EdgeInsets.fromLTRB(0,15,15,15),
                              padding: EdgeInsets.all(3.0),
                              decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                              child:Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                Text("20/NOV"),
                                Icon(Icons.schedule,
                                color:Colors.yellow[400])
                              ],)
                            )
                          ]
                        )
                      ]
                    ),
                  ]
                )
              ),
          ),
              Padding(padding: EdgeInsets.fromLTRB(0,10,40,20),
              child: Container(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children:[
                    Text("hemant's availability",style:TextStyle(fontWeight:FontWeight.bold)),
                    Text("available",style:TextStyle(fontWeight:FontWeight.bold,color: Colors.green))
                          ]
                )
              ),
              ),
              Container(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children:[
                    Text("Cost Of Trip Assistance In Bengaluru"),
                    Text("500 INR/Event",style:TextStyle(fontSize:18,fontWeight:FontWeight.bold,color:Colors.green))
                  ]
                )
              )
            ]
          )
        ),
        ),
        TextButton(
              child: Text("Schedual Trip Assistance",
                style: TextStyle(fontSize: 15),
              ),
              onPressed: () {},
              style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  elevation: 2,
                  backgroundColor: Colors.amber),
        ),
        ],
        ) 
      ),
    );
  }
}