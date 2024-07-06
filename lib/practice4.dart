import 'package:flutter/material.dart';

class Practice4 extends StatefulWidget {
  const Practice4({super.key});

  @override
  State<Practice4> createState() => _Practice4State();
}

class _Practice4State extends State<Practice4> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
       child:  Column(mainAxisSize: MainAxisSize.min, children: [
      Padding(
        padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
        child: ElevatedButton(
            style:
                ButtonStyle(iconColor: WidgetStateProperty.all(Colors.black)),
            onPressed: () {
              
            },
            child: Text("Yes")),
      ),
      Padding(
        padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
        child: ElevatedButton(onPressed: () {}, child: Text("No")),
      )
    ]));
  }
}
