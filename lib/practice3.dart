import 'package:crud/todo_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Practice3 extends StatefulWidget {
  final TodoModel todoModel;
  const Practice3({super.key, required this.todoModel});

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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: practice3controller,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                onPressed: () {
                  if (practice3controller.text.isEmpty) {
                    Fluttertoast.showToast(msg: "Enter Details first");
                  } else {
                    widget.todoModel.title = practice3controller.text;
                    Navigator.of(context).pop(widget.todoModel);
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
