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
}
