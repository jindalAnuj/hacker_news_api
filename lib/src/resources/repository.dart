import 'dart:async';
import 'news_api_provider.dart';
import 'news_db_provider.dart';
import '../models/item_model.dart';

//this class will take api and db class and will make appropriate fetch request
//before making pi call we will check if item exist in db
class Repository{
  NewsApiProvider apiProvider = NewsApiProvider();
  NewsDbProvider dbProvider = NewsDbProvider();

 Future<List<int>> fetTopIds()
  {
    return apiProvider.fetchTopIds();
  }

  Future<ItemModel> fetchItem(int id) async{
  var item =  await dbProvider.fetchItem(id);
  if(item!=null)
    {
      return item;
    }

   item =  await apiProvider.fetchItem(id);
  dbProvider.addItem(item);

  return item;
  }
}