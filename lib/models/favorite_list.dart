import 'package:restaurant/models/food.dart';

class FavoriteList{
  static List<Food> _items = [];

  static void add(Food item){
    _items.add(item);
  }

  static void delete(Food item){
    _items.remove(item);
  }

  static int get count{
    return _items.length;
  }

  static List<Food> get items{
    return _items;
  }

  static clear(){
    _items.clear();
  }

}