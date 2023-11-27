import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paypal_checkout/flutter_paypal_checkout.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:restaurant/Pages/Main.dart';
import 'package:restaurant/components/cart_card.dart';
import 'package:restaurant/components/cart_list.dart';
import 'package:restaurant/models/food.dart';

class Cart extends StatefulWidget{
  final int selectedPage;
  final List<Food> items;
  Cart({super.key,required this.selectedPage,required this.items});


  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart>{
  @override
  Widget build(BuildContext context) {

    return Scaffold(
    backgroundColor: Colors.white,
    appBar: AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    title:Text("Shooping Cart",
        style: GoogleFonts.aladin(
        color: Colors.deepOrange,
        fontSize: 40,
        )
    ),
    leading: IconButton(
    onPressed: () {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => Main(selectedPage: widget.selectedPage),));
    },
    icon: const Icon(Icons.arrow_back_ios,color: Colors.deepOrange),),
    ),

    body: Column(
      mainAxisAlignment: MainAxisAlignment.end,
        children: [
           Container(
             height: MediaQuery.of(context).size.height*0.52,
             child: ListView.builder(
               shrinkWrap: true,
             scrollDirection: Axis.vertical,
             itemCount: CartList.items.length,
             itemBuilder: (context, index) => CartCard(
               food: CartList.items[index],
               selectedPage: widget.selectedPage,
             ),
             ),
           ),
          Container(
            color: Colors.transparent,
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.deepOrange.shade300,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                    topLeft: Radius.circular(15),
                  ),
                ),
                width: MediaQuery.of(context).size.width * 0.9,
                child: Padding(
                  padding: const EdgeInsets.only(top: 15.0,left: 15.0,right: 15.0,bottom: 8.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Subtotal:",
                            style: GoogleFonts.dmSerifDisplay(
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            "${CartList.totalPrice}",
                            style: GoogleFonts.dmSerifDisplay(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Delivery Fee:",
                            style: GoogleFonts.dmSerifDisplay(
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            "Free!",
                            style: GoogleFonts.dmSerifDisplay(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 10),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            color: Colors.deepOrange.shade200,
                            child: Container(
                              width: 80,
                              height: 80,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.location_on),
                                  SizedBox(height: 5),
                                  Text(
                                    "Location",
                                    style: GoogleFonts.dmSerifDisplay(
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          InkWell(
                            onTap: () {
                              openPayment(selector);
                            },
                            child: Ink(
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                color: Colors.deepOrange.shade200,
                                child: Container(
                                  width: 80,
                                  height: 80,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.payments_outlined),
                                      SizedBox(height: 5),
                                      Text(
                                        "Payment",
                                        style: GoogleFonts.dmSerifDisplay(
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 10),

                           Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            color: Colors.deepOrange.shade500,
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.6,
                              child: TextButton(
                                onPressed: () async {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (BuildContext context) => PaypalCheckout(
                                      sandboxMode: true,
                                      clientId: "AZDDFOVhWgqhO3iG_yu0pbfT_wV96i_VZMvL17A5dgUQw2xiVI2kC6Qz_MAZtcmzeDyt3wl8HBkf5WDK",
                                      secretKey: "EFiP_5IhzWUqbFCD7mt_P7hRYjn3aZCqENbX2-kIVQXwZNnhdh0zuFlZ170QD-792xfpZHOmyW3E5tpC",
                                      returnURL: "success.snippetcoder.com",
                                      cancelURL: "cancel.snippetcoder.com",
                                      transactions: [
                                        {
                                          "amount": {
                                            "total": CartList.totalPrice,
                                            "currency": "USD",
                                            "details": {
                                              "subtotal": CartList.totalPrice,
                                              "shipping": '0',
                                              "shipping_discount": 0
                                            }
                                          },
                                          "description": "The payment transaction description.",
                                          // "payment_options": {
                                          //   "allowed_payment_method":
                                          //       "INSTANT_FUNDING_SOURCE"
                                          // },
                                          "item_list": {
                                            "items": [
                                              {
                                                "name": "A demo product",
                                                "quantity": 1,
                                                "price": CartList.totalPrice,
                                                "currency": "USD"
                                              },
                                            ],

                                            // shipping address is not required though
                                            //   "shipping_address": {
                                            //     "recipient_name": "Raman Singh",
                                            //     "line1": "Delhi",
                                            //     "line2": "",
                                            //     "city": "Delhi",
                                            //     "country_code": "IN",
                                            //     "postal_code": "11001",
                                            //     "phone": "+00000000",
                                            //     "state": "Texas"
                                            //  },
                                          }
                                        }
                                      ],
                                      note: "Contact us for any questions on your order.",
                                      onSuccess: (Map params) async {
                                        print("onSuccess: $params");
                                      },
                                      onError: (error) {
                                        print("onError: $error");
                                        Navigator.pop(context);
                                      },
                                      onCancel: () {
                                        print('cancelled:');
                                      },
                                    ),
                                  ));
                                },
                                style: TextButton.styleFrom(
                                  backgroundColor: Colors.deepOrange,
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Check Out",
                                      style: GoogleFonts.dmSerifDisplay(
                                        fontSize: 20,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Icon(
                                      Icons.arrow_right_outlined,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      )
    );
  }
  int selector=0;
  Future openPayment(int selector)=>showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Row(
          children: [
            Icon(Icons.payments,color: Colors.deepOrange.shade400),
            SizedBox(width: 10,),
            Text("Payment",
              style: TextStyle(fontWeight: FontWeight.w500,
                  fontSize: 27,
                color: Colors.grey.shade800
              )
            ),
          ],
        ),
        content: Container(
          padding: EdgeInsets.all(5.0),
          height: 220,
          child: Column(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        selector = 0;
                      });
                    },
                    child: Ink(
                      child: Container(
                        width: 80,
                        height: 80,
                        child: Padding(
                          padding: (selector == 0)? EdgeInsets.all(8.0):EdgeInsets.all(0),
                          child: Image.asset("Images/Payment/Paypal.png"),
                        ),
                        decoration: (selector == 0)?BoxDecoration(
                            color: Colors.deepOrange.shade200,
                            borderRadius: BorderRadius.circular(10)
                        ):BoxDecoration(),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        selector = 1;
                      });
                    },
                    child: Ink(
                      child: Container(
                        width: 80,
                        height: 80,
                        child: Padding(
                          padding: (selector == 1)? EdgeInsets.all(8.0):EdgeInsets.all(0),
                          child: Image.asset("Images/Payment/Visa.png"),
                        ),
                        decoration: (selector == 1)?BoxDecoration(
                            color: Colors.deepOrange.shade200,
                            borderRadius: BorderRadius.circular(10)
                        ):BoxDecoration(),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        selector=2;
                      });
                    },
                    child: Ink(
                      child: Container(
                        width: 80,
                        height: 80,
                        child: Padding(
                          padding: (selector == 2)? EdgeInsets.all(8.0):EdgeInsets.all(0),
                          child: Image.asset("Images/Payment/Mastercard.png"),
                        ),
                        decoration: (selector == 2)?BoxDecoration(
                            color: Colors.deepOrange.shade200,
                            borderRadius: BorderRadius.circular(10)
                        ):BoxDecoration(),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        selector=3;
                      });
                    },
                    child: Ink(
                      child: Container(
                        width: 80,
                        height: 80,
                        child: Padding(
                          padding: (selector == 3)? EdgeInsets.all(8.0):EdgeInsets.all(0),
                          child: Image.asset("Images/Payment/Bitcoin.png"),
                        ),
                        decoration: (selector == 3)?BoxDecoration(
                            color: Colors.deepOrange.shade200,
                            borderRadius: BorderRadius.circular(10)
                        ):BoxDecoration(),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        actions: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              color: Colors.deepOrange.shade300
            ),
            child: TextButton(
                onPressed: () {
                  if(selector==0)
                  Navigator.of(context).pop();
                },
                child: Text("Save",
                  style: GoogleFonts.dmSerifDisplay(
                      fontSize: 20,
                    color: Colors.white
                  ),)),
          )
        ],
      ),
  );
}





