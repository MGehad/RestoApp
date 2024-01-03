import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant/Pages/item.dart';
import 'package:restaurant/models/favorite_list.dart';
import 'package:restaurant/models/food.dart';
import 'package:restaurant/theme/app_color.dart';

class FavoriteCard extends StatefulWidget {
  final Food food;
  final Function update;
  const FavoriteCard({
    super.key,
    required this.food,
    required this.update
  });

  @override
  State<FavoriteCard> createState() => _FavoriteCardState();
}

class _FavoriteCardState extends State<FavoriteCard> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0,right: 20.0,top: 10.0,bottom: 10.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () {
          Navigator.of(context)
              .push(
              MaterialPageRoute(builder: (context) => Item(
                food: widget.food,
              ),)
          );
        },
        child: Ink(
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Tooltip(
              message: widget.food.name,
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.secondaryColor[100],
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width * 0.85,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          child: Image.asset(
                            (widget.food.inStook == true)
                                ? widget.food.imagePath
                                : "Images/Chicken/images.png",
                            width: 120,
                            fit: BoxFit.contain,
                          ),
                          height: 120,
                        ),
                        SizedBox(width: 10),
                        Container(
                          width: 120,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.food.name,
                                style: GoogleFonts.dmSerifDisplay(
                                  fontSize: 22,
                                ),
                              ),
                              SizedBox(height: 7),
                              Text(
                                '\$' + widget.food.price.toString(),
                                style: GoogleFonts.dmSerifDisplay(
                                  fontSize: 20,
                                ),
                              ),
                              SizedBox(height: 7),
                              RatingBarIndicator(
                                rating: widget.food.rating,
                                itemBuilder: (context, index) => Icon(
                                  Icons.star,
                                  color: AppColors.primaryColor,
                                ),
                                itemCount: 5,
                                itemSize: 20.0,
                                direction: Axis.horizontal,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              if (widget.food.isFav)
                                FavoriteList.delete(widget.food);
                              if (!widget.food.isFav) FavoriteList.add(widget.food);
                              widget.food.isFav = !widget.food.isFav;
                              widget.update();
                            });
                          },
                          icon:Icon(
                            (widget.food.isFav == false)
                                ? Icons.favorite_outline
                                : Icons.favorite,
                            color: (widget.food.isFav == false)
                                ? Colors.black
                                : AppColors.primaryColor,
                            size: 30,
                          ),
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(AppColors.secondaryColor.shade300)
                          ),
                        ),
                      ],
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