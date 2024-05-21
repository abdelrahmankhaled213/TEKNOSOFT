import 'dart:async';
import 'dart:core';
import 'package:intl/intl.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:to_dolist_app/Features/HomeScreen/Data/model/getTasksData.dart';

abstract class DataBaseHelper {
  static Database? database;

  static Future<Database> getDatabase() async {
    if (database != null) {
      return database!;
    } else {
      database = await initDatabase();
      return database!;
    }
  }

  static Future<Database> initDatabase() async {
    return await openDatabase(
      join(await getDatabasesPath(), 'Taskworld3.db'),
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE Task(id INTEGER PRIMARY KEY NOT NULL , title TEXT NOT NULL , category TEXT NOT NULL, dates TEXT NOT NULL,priority TEXT)",

        );
      },

      version: 1,
    );
  }

  static Future<List<Task>> getDataDependsOnCategoryandPriority({
    required String category, required  String priority}) async {
    final mydb = await getDatabase();
    var data = await mydb.rawQuery(
        "select * from 'Task' where category = '$category' and  priority = '$priority'");
    return data.map((e) => Task.fromJson(e)).toList();
  }

  static Future<int> insertData(Task task) async {
    final mydb = await getDatabase();
    return await mydb.insert('Task', task.toJson());
  }

  static Future<int> deleteData(String sql) async {
    final mydb = await getDatabase();
    final iddeleted = await mydb.rawDelete(sql);
    return iddeleted;
  }

  static Future<int> updateData(
      {
        required String priority
        , required int id
        , required String title
        , required String date
      }) async {
    final mydb = await getDatabase();
    final data = {
      "title": title,
      "dates": date,
      "priority": priority
    };
    final update = await mydb.update(
        "Task", data, where: "id = ?", whereArgs: [id]);
    return update;
  }

  static Future<List<Task>> getAllDataToday(DateTime time) async {
    final mydb = await getDatabase();
    var data = await mydb.rawQuery(
        "select * from 'Task' where dates = '${DateFormat('yMMMd')
            .format(time)
            .toString()}'");
    return data.map((e) => Task.fromJson(e)).toList();
  }
  static Future<List<Task>> getAllDataUpcoming(String time) async {
    final mydb = await getDatabase();
    var data = await mydb.rawQuery(
        "select * from 'Task' where dates == '${
            time
            }'");
    return data.map((e) => Task.fromJson(e)).toList();
  }
  // static Future<List<Task>> getDataDependsOnPriority(String priority) async {
  //   final mydb = await getDatabase();
  //   var data = await mydb.rawQuery(
  //       "select * from 'Task' where priority = '$priority'");
  //   return data.map((e) => Task.fromJson(e)).toList();
  // }
}
