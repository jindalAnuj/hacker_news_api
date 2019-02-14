import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'dart:io';
import '../models/item_model.dart';

//path+provider lib gives temp path on mobile devices
class NewsDbProvider {
  Database db;
  String Items = 'Items';

  init()async{
     Directory documentDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentDirectory.path,"items.db");
    db = await openDatabase(path,
    version: 1,
    onCreate: (Database newDb,int version){
newDb.execute("""
CREATE TABLE $Items
(
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
              descendants INTEGER
            )
""");
    },);
  }

  fetchItem(int id) async{
  final maps =   await db.query(Items
    ,columns: null,
    where: "id= ?",
    whereArgs: [id]//whereArgs prevent from sqlInjection,
    );
  if(maps.length>0)
    {

    }

    return null;
  }
}
