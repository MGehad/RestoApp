import 'package:restaurant/models/order.dart';

class OrderList{
  static List<OrderData> _orders = [];
  static List<OrderData> _pendingOrders = [];
  static List<OrderData> _completedOrders = [];

  static void add(OrderData order){
    _orders.add(order);
  }

  static void delete(OrderData order){
    _orders.remove(order);
  }

  static int get count{
    return _orders.length;
  }

  static List<OrderData> get Orders{
    return _orders;
  }

  static List<OrderData> get PendingOrders{
    _pendingOrders=[];
    for(var i in _orders){
      if(i.deliveryStatus<4)
        _pendingOrders.add(i);
    }
    return _pendingOrders;
  }

  static List<OrderData> get CompletedOrders{
    _completedOrders=[];
    for(var i in _orders){
      if(i.deliveryStatus>3)
        _completedOrders.add(i);
    }
    return _completedOrders;
  }

}