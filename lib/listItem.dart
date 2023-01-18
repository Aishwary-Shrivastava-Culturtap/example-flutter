import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';

class mylist extends StatelessWidget {
  const mylist({super.key});

  @override
  Widget build(BuildContext context) {
    List items = List<String>.generate(10000, (i) => 'Item $i');

    return Scaffold(
        body: ListView.builder(
            itemCount: 5,
            itemBuilder: ((context, index) {
              return ListTile(
                leading: const Icon(Icons.list),
                trailing: Text(
                  "${items}",
                  style: TextStyle(color: Colors.green, fontSize: 15),
                ),
                title: Text("list of ${items[index]}"),
              );
            })));
  }
}
