import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant/Pages/Menu.dart';
import 'package:restaurant/Pages/item.dart';
import 'package:restaurant/core/theme/app_color/app_color.dart';
import 'package:restaurant/models/food.dart';

class MostPopularCard extends StatefulWidget {
  final int selectedPage;
  final Food food;
  const MostPopularCard({
    super.key,
    required this.food,
    required this.selectedPage
  });

  @override
  State<MostPopularCard> createState() => _MostPopularCardState();
}

class _MostPopularCardState extends State<MostPopularCard> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context)
              .push(
              MaterialPageRoute(builder: (context) => Item(
                  food: widget.food,
                  selectedPage: widget.selectedPage,
                sliding: 0,
              ),)
          );
        },
        child: Ink(
          child: Tooltip(
            message: widget.food.name,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
              child: Container(
                width: MediaQuery.of(context).size.width*0.38,
                decoration: BoxDecoration(
                  color: AppColorsLight.secondaryColor[100],
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Image.asset(
                        (widget.food.inStook == true)
                            ? widget.food.imagePath
                            : "Images/Chicken/images.png",
                        fit: BoxFit.contain,
                      ),
                      height: 110
                    ),
                    Container(
                      width: 120,
                      child: Column(
                        children: [
                          Center(
                            child: Text(
                              widget.food.name,
                              style: GoogleFonts.dmSerifDisplay(
                                fontSize: 20,
                              ),
                            ),
                          ),
                          SizedBox(height: 5,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(children: [
                                Icon(Icons.star,color: AppColorsLight.primaryColor),
                                Text(widget.food.rating.toString(),
                                    style: TextStyle(fontWeight: FontWeight.bold,
                                        fontSize: 15))
                              ]),
                              Text(
                                '\$' + widget.food.price.toString(),
                                style: GoogleFonts.dmSerifDisplay(
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}