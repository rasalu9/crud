import 'package:crud/database_provider.dart';
import 'package:crud/taskmodel.dart';
import 'package:crud/todo_model.dart';
import 'package:flutter/material.dart';

class NewTable extends StatefulWidget {
  final TodoModel newtable;
  const NewTable({super.key, required this.newtable});

  @override
  State<NewTable> createState() => _NewTableState();
}

class _NewTableState extends State<NewTable> {
  var isCompleted = false;
  DatabaseProvider databaseProvider = DatabaseProvider();
  var newtablecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("table"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text("Title"),
            Text("${widget.newtable.title ?? ""}"),
            Text("Description"),
            Text("${widget.newtable.description ?? ""}"),
            ListView.builder(
                shrinkWrap: true,
                itemCount: 9,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Expanded(child: Text("Test")),
                      Checkbox(value: false, onChanged: (value) {})
                    ],
                  );
                })
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: StatefulBuilder(builder: (context, state) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextField(
                          controller: newtablecontroller,
                          decoration: InputDecoration(hintText: "Enter "),
                        ),
                        Checkbox(
                            value: isCompleted,
                            onChanged: (value) {
                              isCompleted = value ?? false;
                            }),
                        OutlinedButton(
                            onPressed: () {
                              databaseProvider.inserttodomodel(Taskmodel(
                                  task: newtablecontroller.text.toString(),
                                  iscompleted: isCompleted,
                                  taskId: widget.newtable.id));
                              Navigator.of(context).pop();
                            },
                            child: Text("Add"))
                      ],
                    );
                  }),
                );
              });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
