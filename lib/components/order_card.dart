import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Pages/Orders/DeliveryConfirm.dart';
import '../models/food.dart';
import '../theme/app_color.dart';
import '../models/order.dart';

class OrderCard extends StatelessWidget {
  final Function update;
  final OrderData order;
  OrderCard({
    required this.order,
    required this.update
  });
  final ScrollController yourScrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          title: Container(
            margin: const EdgeInsets.all(5),
            padding: const EdgeInsets.all(5),
            child: Row(
              children: [
                SizedBox(width: 8.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Column(
                          children: [
                            Text(
                              "Order #" + order.orderId.toString(),
                              style: GoogleFonts.aladin(
                                color: AppColors.primaryColor,
                                fontSize: 25,
                              ),
                            ),
                            Text(
                              '${order.dateOfOrder.substring(0, 10)}',
                              style: GoogleFonts.aladin(
                                color: AppColors.primaryColor,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          children: [
                            SizedBox(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: switch (order.deliveryStatus) {
                                    0 => AppColors.primaryColor.shade200,
                                    1 => AppColors.primaryColor.shade300,
                                    2 => AppColors.primaryColor.shade400,
                                    3 => AppColors.primaryColor.shade500,
                                    4 => Colors.green,
                                    int() => AppColors.primaryColor.shade200,
                                  },
                                ),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(8, 4, 8, 4),
                                  child: InkWell(
                                    onTap: () {
                                      if(order.deliveryStatus<4)
                                       order.deliveryStatus++;
                                      update();
                                    },
                                    child: Ink(
                                      child: Text(
                                        switch (order.deliveryStatus) {
                                          0 => 'Just Placed',
                                          1 => 'Order Processed',
                                          2 => 'Picked Up',
                                          3 => 'At Location',
                                          4 => 'Delivered',
                                          int() => 'Unknown'
                                        },
                                        style: GoogleFonts.aladin(
                                          color: AppColors.lightColor,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            if (order.deliveryStatus == 3)
                              FilledButton(
                                  style: const ButtonStyle(
                                      backgroundColor: MaterialStatePropertyAll(
                                          Colors.green)),
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(builder: (context) {
                                      return DeliveryConfirm(order: order);
                                    })
                                    ).whenComplete(() => update());
                                  },
                                  child: Text(
                                    'Recive Order',
                                    style: GoogleFonts.aladin(
                                      fontSize: 22,
                                    ),
                                  )
                              )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('  Order Price: ${order.totalPrice}',
                    style: GoogleFonts.aladin(
                      color: AppColors.primaryColor,
                      fontSize: 17,
                    ),
                  ),
                  const Divider(thickness: 2),
                  const SizedBox(height: 8.0),
                  Text('  Address: ${order.longitudeAddress} ${order.latitudeAddress}',
                    style: GoogleFonts.aladin(
                      color: AppColors.primaryColor,
                      fontSize: 17,
                    ),
                  ),
                  const Divider(thickness: 2),
                  const SizedBox(height: 8.0),
                  Text('  Items Ordered:',
                    style: GoogleFonts.aladin(
                      color: AppColors.primaryColor,
                      fontSize: 17,
                    ),
                  ),

                  Container(
                      height: 85,
                      child: Scrollbar(
                        controller: yourScrollController,
                        interactive: true,
                        scrollbarOrientation: ScrollbarOrientation.right,
                        child: Container(
                          constraints: const BoxConstraints(maxWidth: 600),
                          padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                          child: ListView.builder(
                            shrinkWrap: true,
                            controller: yourScrollController,
                            scrollDirection: Axis.vertical,
                            itemCount: order.items.length,
                            itemBuilder: (context, index) {
                              return Item(
                                itemData: order.items[index],
                              );
                              },
                          ),
                        ),
                      )
                  ),
                  Divider(thickness: 2),
                  SizedBox(height: 8.0),
                  Text('  Date Placed: ${order.dateOfOrder.toString().substring(0,10)}, '
                        '${order.dateOfOrder.toString().substring(11,16)}',
                    style: GoogleFonts.aladin(
                      color: AppColors.primaryColor,
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Item extends StatelessWidget {
  final Food itemData;
  const Item({super.key, required this.itemData});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 3.0),
        child: Container(
          padding: const EdgeInsetsDirectional.symmetric(horizontal: 10),
          decoration:
              BoxDecoration(borderRadius: BorderRadiusDirectional.circular(10)),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadiusDirectional.circular(10)),
                     child: Image.asset(itemData.imagePath,
                         width: 50,
                         fit: BoxFit.cover,
                         height: 50)
                   ),
                Text(
                  itemData.name,
                  style: GoogleFonts.dmSerifDisplay(
                    fontSize: 22,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Quantity: ${itemData.quantity}',
                      style: GoogleFonts.dmSerifDisplay(
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(width: 2),
                    Text('Price: \$${itemData.price}',
                      style: GoogleFonts.dmSerifDisplay(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
