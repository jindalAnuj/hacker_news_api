import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../models/item_model.dart';

//path_provider lib gives temp path on mobile devices
class NewsDbProvider {
  Database db;
  String Items_table = 'Items';

  init() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentDirectory.path, "items.db");
    db = await openDatabase(
      path,
      version: 1,
      onCreate: (Database newDb, int version) {
        newDb.execute(""" CREATE TABLE $Items_table (
              id INTEGER PRIMARY KEY,
              type TEXT,
              by TEXT,
              time INTEGER,
              text TEXT,
              parent INTEGER,
              kids BLOB,
              dead INTEGER,
              deleted INTEGER,
              url TEXT,
              score INTEGER,
              title TEXT,
              descendants INTEGER ) """);
      },
    );
  }

  Future<ItemModel> fetchItem(int id) async {
    final maps = await db.query(Items_table,
        columns: null,
        where: "id= ?",
        whereArgs: [id] //whereArgs prevent from sqlInjection,
        );
    if (maps.length > 0) {
      return ItemModel.fromDb(maps.first);
    }

    return null;
  }

  Future<int> addItem(ItemModel item) {
    return db.insert(Items_table, item.toMap());
  }
}
