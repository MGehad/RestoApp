import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant/Pages/item.dart';
import 'package:restaurant/models/food.dart';
import 'package:restaurant/theme/app_color.dart';

class MyADS extends StatefulWidget {
  final Food food;

  const MyADS({
    super.key,
    required this.food,
  });

  @override
  State<MyADS> createState() => _MyADSState();
}

class _MyADSState extends State<MyADS> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        borderRadius:BorderRadius.circular(20),
        onTap: () {
          Navigator.of(context)
              .push(
              MaterialPageRoute(builder: (context) => Item(food: widget.food),)
          );
        },
        child: Ink(
          child: Container(
            height:MediaQuery.of(context).size.height*0.25,
            padding: EdgeInsets.symmetric(vertical: 25,horizontal: 20),
            margin: EdgeInsets.symmetric(horizontal: 10),
            decoration:BoxDecoration(
                color: AppColorsLight.primaryColor,
                borderRadius: BorderRadius.circular(20)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("${widget.food.name}",
                        style: GoogleFonts.aladin(
                        color: AppColorsLight.lightColor,
                        fontSize: 30,
                        fontWeight: FontWeight.w600
                    )),
                    SizedBox(height: 9,),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color:AppColorsLight.primaryColor.shade300,
                            borderRadius: BorderRadius.circular(5)
                        ),
                        width: MediaQuery.of(context).size.width*0.3,
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(" Try ${widget.food.description}%",
                              style: GoogleFonts.aBeeZee(
                              color: Colors.white,
                              fontSize: 5,
                              fontWeight: FontWeight.w600
                          )),
                        ),
                      ),
                    ),
                  ],
                ),

                Container(
                  width: MediaQuery.of(context).size.width*0.3,
                  child: Image.asset(widget.food.imagePath,fit: BoxFit.contain),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


