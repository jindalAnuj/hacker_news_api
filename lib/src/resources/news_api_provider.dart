import 'dart:convert';

import 'package:hacker_news_api/src/models/item_model.dart';
import 'package:http/http.dart' show Client;
//import only client from http.dart

class NewsApiProvider {
  Client client = Client();
  final _root = 'https://hacker-news.firebaseio.com/v0';

  fetchTopIds() async {
    final response = await client.get('$_root/topstories.json?');
    final ids = json.decode(response.body);
    return ids;
  }

  fetchItem(int id) async {
    final response = await client.get('$_root/item/$id.json');
    final parsedJson = json.decode(response.body);
    return ItemModel.fromJson(parsedJson);
  }
}
