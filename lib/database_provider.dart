import 'package:crud/taskmodel.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';
import 'todo_model.dart';

class DatabaseProvider {
  static Database? database;
  var databasename = "todoDatabase.db";

  DatabaseProvider() {
    createdatabase();
  }

  Future<Database> createdatabase() async {
    print("in create table 17");

    //  if (database == null) {
    try {
      if (kIsWeb) {
        var databasefactory = databaseFactoryFfiWeb;
        database = await databasefactory.openDatabase(databasename,
            options: OpenDatabaseOptions(
              version: 1,
              onCreate: (db, version) async {
                await db.execute(
                    "CREATE TABLE todo (id INTEGER PRIMARY KEY AUTOINCREMENT , title TEXT, description TEXT)");
                await db.execute(
                    "CREATE TABLE IF NOT EXISTS todoitems(id INTEGER PRIMARY KEY AUTOINCREMENT ,task TEXT, iscompleted Bool,taskId INTEGER REFERENCE todo(id))");
              },
            ));
      } else {
        var path = join(await getDatabasesPath(), databasename);
        database = await openDatabase(
          path,
          version: 1,
          onCreate: (db, version) async {
            await db.execute(
                "CREATE TABLE todo (id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, description TEXT)");
            await db.execute(
                "CREATE TABLE IF NOT EXISTS todoitems(id INTEGER PRIMARY KEY AUTOINCREMENT ,task TEXT, iscompleted Bool,taskId INTEGER REFERENCE todo(id))");
            print("in create table 40");
          },
        );
      }
    } catch (exception) {
      print("exception $exception");
    }
    //  }
    return Future.value(database);
  }

  void insertTodo(TodoModel todoModel) async {
    var database = await createdatabase();
    database.insert("todo", todoModel.toJson());

    print("after insert");
  }

  Future<List<TodoModel>> getlist() async {
    var database = await createdatabase();
    final List<Map<String, dynamic>> maps = await database.query('todo');
    print("list ,$maps");
    return List.generate(maps.length, (i) {
      return TodoModel(
        id: maps[i]['id'],
        title: maps[i]['title'],
      );
    });
  }

  void updatetodo(
    TodoModel todoModel,
  ) async {
    var database = await createdatabase();
    database.update("todo", todoModel.toJson(),
        where: "id = ?", whereArgs: [todoModel.id]);
  }

  void removetodo(TodoModel todomodel) async {
    var database = await createdatabase();

    database.delete("todo", where: "id=?", whereArgs: [todomodel.id]);
  }

  void inserttodomodel(Taskmodel task_model) async {
    var database = await createdatabase();
    database.insert("todoitems", task_model.toJson());
  }
}
