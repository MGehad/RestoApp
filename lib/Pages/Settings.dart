import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant/Pages/Profile.dart';
import 'package:restaurant/Pages/cart.dart';
import 'package:restaurant/components/cart_list.dart';

class Settings extends StatefulWidget {
  final int selectedPage;
  const Settings({super.key,required this.selectedPage});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title:
        Center(
          child: Text(
              "Settings",
              style: GoogleFonts.aladin(
                color: Colors.deepOrange,
                fontSize: 45,
              )
          ),
        ),
      ),

      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15.0,right: 10.0,left: 10.0),
            child: Column(
              children: [
                Tooltip(
                  message: 'Edit Profile',
                  child:  InkWell(
                    onTap: () {
                      Navigator.of(context)
                          .push(
                          MaterialPageRoute(builder: (context) => Profile(selectedPage: widget.selectedPage),)
                      );
                    },
                    child: Ink(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(15)

                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15.0,right: 15,bottom: 10,top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.person,color: Colors.deepOrange,size: 25),
                                  SizedBox(width: 10,),
                                  Text("Profile",
                                      style: TextStyle(color: Colors.deepOrange,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500)),
                                ],
                              ),
                              Icon(Icons.chevron_right,
                              color:  Colors.deepOrange,
                                size:22 ,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 15,),

                InkWell(
                  onTap: () {
                    Navigator.of(context)
                        .push(
                        MaterialPageRoute(builder: (context) =>
                            Cart(selectedPage:widget.selectedPage,
                        items: CartList.items,
                        ),)
                    );
                  },
                  child: Ink(
                    child:  Tooltip(
                      message: 'Go To Cart',
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(15)

                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15.0,right: 15,bottom: 10,top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.shopping_cart,color: Colors.deepOrange,size: 25),
                                  SizedBox(width: 10,),
                                  Text("Cart",
                                      style: TextStyle(color: Colors.deepOrange,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500)),
                                ],
                              ),
                              Icon(Icons.chevron_right,
                                color:  Colors.deepOrange,
                                size:22 ,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 15,),

                Tooltip(
                  message: 'Edit Apearance',
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(15)

                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0,right: 15,bottom: 10,top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.sunny,color: Colors.deepOrange,size: 25),
                              SizedBox(width: 10,),
                              Text("Apearance",
                                  style: TextStyle(color: Colors.deepOrange,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500)),
                            ],
                          ),
                          Icon(Icons.chevron_right,
                            color:  Colors.deepOrange,
                            size:22 ,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 50,),

                Tooltip(
                  message: 'Read Privacy Policy',
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(15)

                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0,right: 15,bottom: 10,top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.contact_page_outlined,color: Colors.deepOrange,size: 25),
                              SizedBox(width: 10,),
                              Text("Privacy Policy",
                                  style: TextStyle(color: Colors.deepOrange,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500)),
                            ],
                          ),
                          Icon(Icons.chevron_right,
                            color:  Colors.deepOrange,
                            size:22 ,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 15,),

                Tooltip(
                  message: 'Read Terms & Conditions',
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(15)

                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0,right: 15,bottom: 10,top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.contact_page,color: Colors.deepOrange,size: 25),
                              SizedBox(width: 10,),
                              Text("Terms & Conditions",
                                  style: TextStyle(color: Colors.deepOrange,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500)),
                            ],
                          ),
                          Icon(Icons.chevron_right,
                            color:  Colors.deepOrange,
                            size:22 ,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 15,),

                Tooltip(
                  message: 'About Us',
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(15)

                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0,right: 15,bottom: 10,top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                  child: Icon(Icons.question_mark,color: Colors.white,size: 22),
                                  decoration:BoxDecoration(shape: BoxShape.circle,
                                      color: Colors.deepOrange),
                                ),
                              SizedBox(width: 10,),
                              Text("About Us",
                                  style: TextStyle(color: Colors.deepOrange,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500)),
                            ],
                          ),
                          Icon(Icons.chevron_right,
                            color:  Colors.deepOrange,
                            size:22 ,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}

