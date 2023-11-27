import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant/Pages/itemMain.dart';
import 'package:restaurant/models/food.dart';

class MyADS extends StatefulWidget {
  final Food food;
  final int discount;

  const MyADS({
    super.key,
    required this.food,
    required this.discount,
  });

  @override
  State<MyADS> createState() => _MyADSState();
}

class _MyADSState extends State<MyADS> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .push(
            MaterialPageRoute(builder: (context) => ItemMain(food: widget.food,selectedPage: 0),)
        );
      },
      child: Ink(
        child: Center(
          child: Container(
            height:MediaQuery.of(context).size.height*0.25,
            padding: EdgeInsets.symmetric(vertical: 25,horizontal: 20),
            margin: EdgeInsets.symmetric(horizontal: 25),
            decoration:BoxDecoration(
                color: Colors.deepOrange,
                borderRadius: BorderRadius.circular(20)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 18),
                    Text("${widget.food.name}",style: GoogleFonts.aladin(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w600
                    )),

                    SizedBox(height: 9,),

                    Container(
                      decoration: BoxDecoration(
                        color: Colors.deepOrange.shade300,
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child: Text(" Get ${widget.discount}% Discount ",style: GoogleFonts.aBeeZee(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w600
                      )),
                    ),

                    SizedBox(height: 15),

                  ],
                ),
                Image.asset(widget.food.imagePath,height: 90,fit: BoxFit.fill),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


