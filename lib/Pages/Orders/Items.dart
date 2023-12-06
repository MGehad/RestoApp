import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant/core/theme/app_color/app_color.dart';

import '../../models/Order_list.dart';
import 'StriperPage.dart';

class OrderItem extends StatelessWidget {
  final Order order;
  bool Iscompleted ;
  OrderItem({required this.order,required this.Iscompleted});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.black,width: 1)
      ),
      child: ExpansionTile(
        title: Container(
          margin: EdgeInsets.all(5),
          padding: EdgeInsets.all(5),
          child: Row(
            children: [
              Container(
                height: 50,
                width: 50,
                color: AppColorsLight.secondaryColor,
                child: Image.network(
                    order.photoUrl,
                    fit: BoxFit.cover
                ),

              ),
              SizedBox(width: 8.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "order: "+ order.title,
                        style: GoogleFonts.aladin(
                          color: AppColorsLight.primaryColor,
                          fontSize: 25,
                        ),                      ),
                      SizedBox(width: 35,),
                      SizedBox(
                        child: Iscompleted ? Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColorsLight.secondaryColor
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child:   Text(
                              "Is completed",
                              style: GoogleFonts.aladin(
                                color: AppColorsLight.lightColor,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ):  Container(
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                              color: Colors.green),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child:   Text(
                              "is pending",
                              style: GoogleFonts.aladin(
                                color: AppColorsLight.lightColor,
                                fontSize: 12,
                              ),                          ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    '${order.date.toString().substring(0,10)}',
                    style: GoogleFonts.aladin(
                      color: AppColorsLight.primaryColor,
                      fontSize: 14,
                    ),
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
                Divider(thickness: 2),
                Text(
                  'Order Contents: ${order.description}',
                  style: GoogleFonts.aladin(
                    color: AppColorsLight.primaryColor,
                    fontSize: 20,
                  ),                ),
                Divider(thickness: 2),
                SizedBox(height: 8.0),
                Text(
                  'Address: ${order.address}',
                  style: GoogleFonts.aladin(
                    color: AppColorsLight.primaryColor,
                    fontSize: 20,
                  ),
                ),
                Divider(thickness: 2),

                SizedBox(height: 8.0),
                Text(
                  'Status: ${order.status}',
                  style: GoogleFonts.aladin(
                    color: AppColorsLight.primaryColor,
                    fontSize: 20,
                  ),                ),
                Divider(thickness: 2),

                SizedBox(height: 8.0),
                Text(
                  'Time: ${order.date.toString().substring(0,10)}',
                  style: GoogleFonts.aladin(
                    color: AppColorsLight.primaryColor,
                    fontSize: 20,
                  ),                ),
                SizedBox(height: 8.0),
                Divider(thickness: 2),

                MaterialButton(onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => Stiper(isrecevied: order.isrecevied,
                        indelivary: order.indelivary,
                        isdelivred: order.indelivary,
                        orderId: order.title,)));

                },
                 child:Container(
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColorsLight.primaryColor
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        "Status",
                        style: GoogleFonts.aladin(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}