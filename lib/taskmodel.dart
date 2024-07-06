import 'dart:ffi';

class Taskmodel {
  int? id;
  String? task;
  bool? iscompleted;
  int? taskId;

  Taskmodel({
    this.id,
    this.task,
    this.iscompleted,
    this.taskId,
  });

  factory Taskmodel.fromJson(Map<String, dynamic> json) => Taskmodel(
        id: json["id"],
        task: json["task"],
        iscompleted: json["iscompleted"],
        taskId: json["taskId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "task": task,
        "iscompleted": iscompleted,
        "taskId": taskId,
      };
}
