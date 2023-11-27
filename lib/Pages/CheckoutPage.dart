import 'package:flutter/material.dart';
import 'package:flutter_paypal_checkout/flutter_paypal_checkout.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant/Pages/cart.dart';
import 'package:restaurant/models/food.dart';

class CheckoutPage extends StatefulWidget {

  final List<Food> items;
  final double total;

  CheckoutPage({super.key,
    required this.total,
    required this.items,
  });


  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    /* appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context)
                .push(
                MaterialPageRoute(builder: (context) => Cart(),)
            );
          },
          icon: const Icon(Icons.arrow_back_ios,color: Colors.white),
        ),
        title: const Text(
          "PayPal Checkout",
          style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w500),
        ),
        backgroundColor: Colors.deepOrange.shade600,
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.all(15),
            margin: EdgeInsets.only(bottom: 40,left: 5,right: 5,top: 50),
            child: Column(
              children: [
                Container(
                  child:Text(
                    "Resto",
                    style: GoogleFonts.aladin(
                      color: Colors.deepOrange,
                      fontSize: 50,
                    ),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Order:",style: GoogleFonts.alata(
                          fontWeight: FontWeight.w400,
                          fontSize: 25,
                          color: Colors.black,
                          height: 2
                        ),),
                        Text("Quantity:",style: GoogleFonts.alata(
                          fontWeight: FontWeight.w400,
                          fontSize: 25,
                          color: Colors.black,
                          height: 2
                        ),),
                        Text("Price:",style: GoogleFonts.alata(
                          fontWeight: FontWeight.w400,
                          fontSize: 25,
                          color: Colors.black,
                            height: 2
                        ),),
                        Text("shipping:",style: GoogleFonts.alata(
                          fontWeight: FontWeight.w400,
                          fontSize: 25,
                          color: Colors.black,
                            height: 2
                        ),),
                        Text("Total:",style: GoogleFonts.alata(
                          fontWeight: FontWeight.w400,
                          fontSize: 25,
                          color: Colors.black,
                            height: 2
                        ),),
                      ],
                    ),
                    Column(
                      children: [
                        Text("#FR55546",style: GoogleFonts.alata(
                            fontWeight: FontWeight.w400,
                            fontSize: 25,
                            color: Colors.black,
                            height: 2
                        ),),
                        Text("1111111",style: GoogleFonts.alata(
                            fontWeight: FontWeight.w400,
                            fontSize: 25,
                            color: Colors.black,
                            height: 2
                        ),),
                        Text("djjskkj",style: GoogleFonts.alata(
                            fontWeight: FontWeight.w400,
                            fontSize: 25,
                            color: Colors.black,
                            height: 2
                        ),),
                        Text("0.00\$",style: GoogleFonts.alata(
                            fontWeight: FontWeight.w400,
                            fontSize: 25,
                            color: Colors.black,
                            height: 2
                        ),),
                        Text(("${widget.total}\$") as String,
                          style: GoogleFonts.alata(
                              fontWeight: FontWeight.w400,
                              fontSize: 25,
                              color: Colors.black,
                              height: 2
                          ),),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(
                      MaterialPageRoute(builder: (context) => Cart(),)
                  );
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.deepOrange,
                  foregroundColor: Colors.white,
                  shape: const BeveledRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(3),
                    ),
                  ),
                ),
                child: const Text('Back'),
              ),
              TextButton(
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
                            "total": widget.total,
                            "currency": "USD",
                            "details": {
                              "subtotal": widget.total,
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
                                "price": widget.total,
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
                  shape: const BeveledRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(3),
                    ),
                  ),
                ),
                child: const Text('Continue'),
              ),
            ],
          ),
        ],
      ),*/
    );
  }
}