import 'package:restaurant/models/food.dart';

class CartList{
  static List<Food> _items = [];
  static double _price = 0.0;
  static double _oldPrice = 0.0;
  static double? _descount;
  static String coupon = "Resto";
  static bool? couponstate;

  static void add(Food item){
    int len = _items.length;
       for(Food x in _items){
         if(item.name == x.name
         && item.description == x.description
         && item.rating == x.rating){
           x.quantity+=item.quantity;
           return;
         }
       }
      if(len == _items.length){
       _items.add(item);
     }
  }

  static void delete(Food item){
    _items.remove(item);
  }

  static int get count{
    return _items.length;
  }

  static double get totalPrice{
    _price=0.0;
    for(Food x in _items){
      _price += x.price*x.quantity;
    }
    if(couponstate==true&&_descount!=null){
      _price=_price-(_price/_descount!);
    }
    return _price;
  }
  static double get oldTotalPrice{
    _oldPrice=0.0;
    for(Food x in _items){
      _oldPrice+=x.price*x.quantity;
    }
    return _oldPrice;
  }

  static List<Food> get items{
    return _items;
  }

  static clear(){
    _items.clear();
    _price = 0.0;
  }

  static updatePrice(double descount){
    _descount = descount;
    couponstate = true;
  }

}