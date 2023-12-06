import 'package:flutter/cupertino.dart';
import '../Items.dart';
import '../../../models/Order_list.dart';

class Pending_orders_Page extends StatelessWidget {

  final List<Order> pending_orders=[
    Order(
      orderId:"454",
      isrecevied: true,
      isdelivred:false ,
      indelivary: false,
      title: '#3526',
      description: 'وراك فراخ بلبصل الاحمر ',
      date: DateTime(2023, 11, 28).toString(),
      isCompleted: false,
      address: ' شارع بلا بلا بلا',
      status: ' جارى التوصيل ', photoUrl: '',
    ),
    Order(
      orderId:"454",
      isrecevied: true,
      isdelivred:false ,
      indelivary: false,
      title: '#3526',
      description: 'وراك فراخ بلبصل الاحمر ',
      date: DateTime(2023, 11, 28).toString(),
      isCompleted: false,
      address: ' شارع بلا بلا بلا',
      status: ' جارى التوصيل ', photoUrl: '',
    ),
  ];




  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: pending_orders.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: OrderItem(order: pending_orders[index], Iscompleted: false,),
        );
      },
    );
  }
}
