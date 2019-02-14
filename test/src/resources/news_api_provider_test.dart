import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_news_api/src/resources/news_api_provider.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';

//use fully specified name of package
//http testing  api

void main() {
  test('fetchTopIds return a list of ids', () async {
    //setup of test case

    final newsApi = NewsApiProvider();
    newsApi.client = MockClient((request) async {
      return Response(json.encode([1, 2, 3, 4]), 200);
    });
    // expectations
    final ids = await newsApi.fetchTopIds();
    expect(ids, [1, 2, 3, 4]);
  });

  test('fetchItm ret urn a item model', () async {
    final newsApi = NewsApiProvider();
    newsApi.client = MockClient((request) async {
      final jsonMap = {'id': 123};
      return Response(json.encode(jsonMap), 200);
    });

    final item = await newsApi.fetchItem(123);

    expect(item.id, 123);
  });
}
