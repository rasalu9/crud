import 'dart:js_interop';

import 'package:crud/practice2.dart';
import 'package:crud/practice3.dart';
import 'package:crud/practice4.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Practice1 extends StatefulWidget {
  const Practice1({super.key});

  @override
  State<Practice1> createState() => _Practice1State();
}

class _Practice1State extends State<Practice1> {
  var list = <String>["Aashna", "jaspreet"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Crud Screen"),
      ),
      body: ListView.builder(
          shrinkWrap: true,
          itemCount: list.length,
          itemBuilder: (context, index) {
            return Row(
              children: [
                Expanded(child: Text(list[index])),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    child: Icon(Icons.edit),
                    onTap: () {
                      showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (context) => Practice3()).then((value) {
                        list[index] = value;
                        setState(() {});
                      });
                    },
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                        child: Icon(Icons.delete),
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return Dialog(
                                    child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(10, 0, 0, 0),
                                        child: ElevatedButton(
                                            style: ButtonStyle(
                                                iconColor:
                                                    WidgetStateProperty.all(
                                                        Colors.black)),
                                            onPressed: () {
                                              list.removeAt(index);
                                              Navigator.of(context).pop();
                                              setState(() {});
                                            },
                                            child: Text("Yes")),
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(10, 10, 0, 0),
                                        child: ElevatedButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: Text("No")),
                                      )
                                    ]));
                              });
                        }))
              ],
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) => Practice2()).then((value) {
            list.add(value);
            setState(() {});
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
