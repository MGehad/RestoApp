import 'package:restaurant/models/food.dart';

class CartList{
  static List<Food> _items = [];
  static double _price = 0.0;
  static double _oldPrice = 0.0;

  static void add(Food item){
    _items.add(item);
    _price += item.price*item.quantity;
    _oldPrice += item.price*item.quantity;
  }

  static void delete(Food item){
    _items.remove(item);
    _price-=item.price*item.quantity;
    _oldPrice-=item.price*item.quantity;
  }

  static int get count{
    return _items.length;
  }

  static double get totalPrice{
    return _price;
  }
  static double get oldTotalPrice{
    return _oldPrice;
  }

  static List<Food> get items{
    return _items;
  }

  static clear(){
    _items.clear();
    _price = 0.0;
  }

  static updatePrice(double price){
    _price = price;
  }

}