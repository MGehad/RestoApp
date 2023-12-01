import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant/Pages/item.dart';
import 'package:restaurant/core/theme/app_color/app_color.dart';
import 'package:restaurant/models/cart_list.dart';
import 'package:restaurant/models/food.dart';

class CartCard extends StatefulWidget {
  final Function update;
  final int selectedPage;
  final Food food;
  const CartCard({
    super.key,
    required this.food,
    required this.selectedPage,
    required this.update
  });

  @override
  State<CartCard> createState() => _FoodTileState();
}

class _FoodTileState extends State<CartCard> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0,right: 20.0,top: 10.0,bottom: 10.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context)
              .push(
              MaterialPageRoute(builder: (context) => Item(food: widget.food,
                  selectedPage:widget.selectedPage,
                sliding: 0,
              ),)
          );
        },
        child: Ink(
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Container(
              decoration: BoxDecoration(
                color:AppColorsLight.secondaryColor[100],
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
                          widget.food.imagePath,
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
                                fontSize: 24,
                              ),
                            ),
                            SizedBox(height: 7),
                            Text(
                              'Quantity: ' + widget.food.quantity.toString(),
                              style: GoogleFonts.dmSerifDisplay(
                                fontSize: 17,
                                color: AppColorsLight.secondaryColor.shade800,
                              ),
                            ),
                            SizedBox(height: 7),
                            Text(
                              'Price: \$' + widget.food.price.toString(),
                              style: GoogleFonts.dmSerifDisplay(
                                fontSize: 17,
                                color: AppColorsLight.secondaryColor.shade800,
                              ),
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
                            widget.food.inCart=!widget.food.inCart;
                            CartList.delete(widget.food);
                            widget.update();
                          });
                        },
                        icon: Icon(
                          Icons.delete_forever_sharp,
                          color: Colors.black,
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
    );
  }
}