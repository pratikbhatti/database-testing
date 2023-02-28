import 'dart:io';
import 'dart:typed_data';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbHelper {
  static DbHelper dbHelper = DbHelper._();

  DbHelper._();

  Database? database;

  Future<Database?> checkDB() async {
    if (database != null) {
      return database;
    } else {
      return await createDB();
    }
  }

  /// create table
  Future<Database> createDB() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, 'pratik.db');
    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        String query =
            "CREATE TABLE task (id INTEGER PRIMARY KEY AUTOINCREMENT,name TEXT,category TEXT)";
        db.execute(query);
      },
    );
  }

  ///insert Category table
  void insertData({required String name, required String category}) async {
    database = await checkDB();

    //insert image
    // Uint8List? data;
    // File file = File("$path");
    // await file.readAsBytes().then((value) => {
    //       data = value,
    //     });
    database!.insert("task", {
      "name": name,
      "category": category,
    });
  }

  /// read  table
  Future<List<Map>> readData() async {
    database = await checkDB();
    String query = "SELECT * FROM task";
    List<Map> dataList = await database!.rawQuery(query);

    return dataList;
  }

  /// delete  table
  Future<void> deleteData({required int id}) async {
    database = await checkDB();
    database!.delete("task", where: "id =? ", whereArgs: [id]);
  }

  /// update table
  Future<void> updateData(
      {required int id, required String name, required String category}) async {
    database = await checkDB();
    database!.update("task", {'name': name, 'category': category,},
        where: "id = ?", whereArgs: [id]);
  }

  /// read quotes drop down category
// Future<List<Map>> readQuotesData() async {
//   database = await checkDB();
//   String query = "SELECT category_name FROM category";
//   List<Map> dataList = await database!.rawQuery(query);
//   print("======================");
//   return dataList;
// }

// Future<List<Map>> readCategoryData() async {
//   database = await checkCategoryDB();
//   String query = "SELECT * FROM category";
//   List<Map> dataList = await database!.rawQuery(query);
//   // print("========= ${dataList[0]['id']}");
//   return dataList;
// }

// Future<void> deleteCategoryData({required int id}) async {
//   database = await checkCategoryDB();
//   database!.delete("category", where: "id =? ", whereArgs: [id]);
// }

// Future<void> deleteData({required int id}) async {
//   database = await checkCategoryDB();
//   database!.delete("std", where: "id =? ", whereArgs: [id]);
// }

// Future<void> updateData(
//     {required int id,
//     required String name,
//     required String std,
//     required String address}) async {
//   database = await checkCategoryDB();
//   database!.update("std", {'name': name, 'address': address, 'std': std},
//       where: "id = ?", whereArgs: [id]);
// }
}
