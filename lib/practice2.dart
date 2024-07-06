import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Practice2 extends StatefulWidget {
  const Practice2({super.key});

  @override
  State<Practice2> createState() => _Practice2State();
}

class _Practice2State extends State<Practice2> {
  var practice2controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: practice2controller,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                onPressed: () {
                  if (practice2controller.text.isEmpty) {
                    Fluttertoast.showToast(msg: "Enter Details first");
                  } else {
                    Navigator.of(context).pop(practice2controller.text);
                  }
                },
                child: Text("Add")),
          )
        ],
      ),
    );
  }
}
