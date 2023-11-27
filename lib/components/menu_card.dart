import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:restaurant/Pages/Favorite.dart';
import 'package:restaurant/Pages/item.dart';
import 'package:restaurant/components/cart_list.dart';
import 'package:restaurant/core/theme/app_color/app_color_light.dart';
import 'package:restaurant/models/food.dart';

class MenuCard extends StatefulWidget {
  final int selectedPage;
  final Food food;
  const MenuCard({
    super.key,
    required this.food,
    required this.selectedPage
  });

  @override
  State<MenuCard> createState() => _FoodTileState();
}

class _FoodTileState extends State<MenuCard> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0,right: 20.0,top: 10.0,bottom: 10.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context)
              .push(
              MaterialPageRoute(builder: (context) => Item(
                  food: widget.food,selectedPage: widget.selectedPage,),)
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
                  color: AppColorsLight.secondaryColor[100],
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
                                  color: AppColorsLight.primaryColor,
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

                        Consumer<Favorite>(
                          builder: (context, favorite, child) {
                            return IconButton(
                              onPressed: () {
                                if (widget.food.isFav)
                                  favorite.delete(widget.food);
                                if (!widget.food.isFav) favorite.add(widget.food);
                                widget.food.isFav = !widget.food.isFav;
                              },
                              icon:Icon(
                                (widget.food.isFav == false)
                                    ? Icons.favorite_outline
                                    : Icons.favorite,
                                color: (widget.food.isFav == false)
                                    ? Colors.black
                                    : AppColorsLight.primaryColor,
                                size: 30,
                              ),
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(AppColorsLight.secondaryColor.shade300)
                              ),
                            );
                          },
                        ),

                        SizedBox(height: 10),

                        if (widget.food.inStook)
                          IconButton(
                            onPressed: () {
                              setState(() {
                                if (widget.food.inCart)
                                  CartList.delete(widget.food);
                                if (!widget.food.inCart) CartList.add(widget.food);
                                widget.food.inCart = !widget.food.inCart;
                              });
                            },
                            icon: Icon(
                              (widget.food.inCart == false)
                                  ? Icons.add
                                  : Icons.shopping_cart_checkout,
                              color: (widget.food.inCart == false)
                                  ? Colors.black
                                  : Colors.deepOrange,
                              size: 30,
                            ),
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(AppColorsLight.secondaryColor.shade300)
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