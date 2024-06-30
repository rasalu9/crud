import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Practice3 extends StatefulWidget {
  const Practice3({super.key});

  @override
  State<Practice3> createState() => _Practice3State();
}

class _Practice3State extends State<Practice3> {
  var practice3controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        children: [
          TextField(
            controller: practice3controller,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                onPressed: () {
                  if (practice3controller.text.isEmpty) {
                    Fluttertoast.showToast(msg: "Enter Details first");
                  } else {
                    Navigator.of(context).pop(practice3controller.text);
                  }
                },
                child: Text("Update")),
          )
        ],
      ),
    );
    ;
  }
}
