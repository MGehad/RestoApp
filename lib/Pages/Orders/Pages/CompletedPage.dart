import 'package:flutter/cupertino.dart';

import '../Items.dart';
import '../../../models/Order_list.dart';

class Completed_orders_page extends StatelessWidget {

  final List<Order> completed_orders=[
    Order(
      orderId:"454",
      isrecevied: true,
      isdelivred:true ,
      indelivary: true,
      title: '#3526',
      description: 'وراك فراخ بلبصل الاحمر',
      date: DateTime(2023, 11, 28).toString(),
      isCompleted: false,
      address: ' شارع بلا بلا بلا',
      status: ' جارى التوصيل ',
      photoUrl: '',
    ),
  ];


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: completed_orders.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: OrderItem(
            order: completed_orders[index],
            Iscompleted: true,
          ),
        );
      },
    );
  }
}