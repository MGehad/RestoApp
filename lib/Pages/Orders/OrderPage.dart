import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant/models/order_list.dart';
import '../../../components/order_card.dart';

class OrdersPage extends StatefulWidget {
  final int status;
  OrdersPage({required this.status});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  final ScrollController yourScrollController = ScrollController();
  update() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (OrderList.Orders.length == 0) {
      return Container(
          alignment: Alignment.center,
          child: const Text(
            'Empty',
            style: TextStyle(fontSize: 20),
          )
      );
    } else {
      return (widget.status == 3)
          ? Scrollbar(
          controller: yourScrollController,
          interactive: true,
          scrollbarOrientation: ScrollbarOrientation.right,
          child: ListView.builder(
            itemCount: OrderList.PendingOrders.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: OrderCard(
                  update: update,
                  order: OrderList.PendingOrders[index],
                ),
              );
            },
          )
         )
          : Scrollbar(
          controller: yourScrollController,
          interactive: true,
          scrollbarOrientation: ScrollbarOrientation.right,
          child: ListView.builder(
            itemCount: OrderList.CompletedOrders.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: OrderCard(
                  update: update,
                  order: OrderList.CompletedOrders[index],
                ),
              );
            },
          )
      );
    }
  }
}
