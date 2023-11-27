import 'package:restaurant/models/food.dart';

class CartList{
  static List<Food> _items = [];
  static double _price = 0.0;

  static void add(Food item){
    _items.add(item);
    _price += item.price*item.quantity;
  }

  static void delete(Food item){
    _items.remove(item);
    _price-=item.price*item.quantity;
  }

  static int get count{
    return _items.length;
  }

  static double get totalPrice{
    return _price;
  }

  static List<Food> get items{
    return _items;
  }

}