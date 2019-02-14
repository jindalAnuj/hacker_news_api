import 'dart:convert';

class ItemModel {
  final int id;
  final bool deleted;
  final String type;
  final String by;
  final int time;
  final String text;
  final bool dead;
  final int parent;
  final List<dynamic> kids;
  final String url;
  final int score;
  final String title;
  final int descendants;

  ItemModel.fromJson(Map<String, dynamic> json)
      : by = json["by"],
        descendants = json["descendants"],
        id = json["id"],
        deleted = json['deleted'],
        text = json['text'],
        dead = json['dead'],
        parent = json['parent'],
        kids = json["kids"],
        score = json["score"],
        time = json["time"],
        title = json["title"],
        type = json["type"],
        url = json["url"];

  //fromdb funtion is created because we have no booleans in sqflite
  ItemModel.fromDb(Map<String, dynamic> json)
      : by = json["by"],
        descendants = json["descendants"],
        id = json["id"],
        deleted = json['deleted'] == 1,
        text = json['text'],
        dead = json['dead'] == 1,
        parent = json['parent'],
        kids = jsonDecode(json["kids"]),
        score = json["score"],
        time = json["time"],
        title = json["title"],
        type = json["type"],
        url = json["url"];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "id": id,
      "type": type,
      "by": by,
      "time": time,
      "text": text,
      "parent": parent,
      "url": url,
      "score": score,
      "title": title,
      "descendants": descendants,
      "dead": dead ? 1 : 0,//if dead is true then 1 will be insertes
      "deleted": deleted ? 1 : 0,
      "kids": jsonEncode(kids), // creating a blog to save data to sqflite
    };
  }

}
