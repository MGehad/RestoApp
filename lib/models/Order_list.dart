class Order {
  final String title;
  final String description;
  final String date;
  final bool isCompleted;
  final String address;
  final String status;
  final String photoUrl;
  bool isrecevied=false;
  bool indelivary=false;
  bool isdelivred=false;
  String orderId;
  Order({
    required this.title,
    required this.description,
    required this.date,
    required this.isCompleted,
    required this.photoUrl,
    required this.isdelivred,
    required this.indelivary,
    required this.isrecevied,
    required this.orderId,
    required this.address,
    required this.status,
  });
}