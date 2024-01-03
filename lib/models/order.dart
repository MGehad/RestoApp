import 'package:restaurant/models/food.dart';

class OrderData {
  final int orderId;
  final double longitudeAddress;
  final double latitudeAddress;
  final String dateOfOrder;
  int deliveryStatus;
  final double totalPrice;
  final List<Food> items;

  OrderData({
    required this.orderId,
    required this.longitudeAddress,
    required this.latitudeAddress,
    required this.dateOfOrder,
    required this.deliveryStatus,
    required this.items,
    required this.totalPrice
  });
}
