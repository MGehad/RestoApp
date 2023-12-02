import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:restaurant/Pages/Main.dart';
import 'package:restaurant/Pages/cart.dart';
import 'package:restaurant/models/favorite_list.dart';
import 'package:restaurant/core/theme/app_color/app_color.dart';
import 'package:restaurant/models/food.dart';

class Item extends StatefulWidget {
  final int selectedPage;
  final int sliding;
  final Food food;
  const Item({super.key,required this.food,required this.selectedPage,required this.sliding});

  @override
  State<Item> createState() => _ItemState();
}

class _ItemState extends State<Item> {

  void decrementQuantity (){
    setState(() {
      if(!widget.food.inCart)
      if(widget.food.quantity>1)
        widget.food.quantity--;
    });
  }

  void incrementQuantity (){
    setState(() {
      if(!widget.food.inCart)
      if(widget.food.quantity<20)
        widget.food.quantity++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: AppColorsLight.lightColor,
        appBar: AppBar(
          elevation: 0,
          foregroundColor: AppColorsLight.primaryColor.shade900,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context)
                  .push(
                  MaterialPageRoute(builder: (context) =>
                      Main(selectedPage: widget.selectedPage,
                      sliding: widget.sliding),)
              );
            },
            icon: const Icon(Icons.arrow_back_ios,color: AppColorsLight.primaryColor),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.transparent)
            ),
          ),
          actions: <Widget>[
            IconButton(onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context)
                  .pushReplacement(
                  MaterialPageRoute(builder: (context) =>
                      Cart(selectedPage: widget.selectedPage,sliding: widget.sliding),)
              );
            },
              icon: Icon(Icons.shopping_cart_outlined,),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.transparent)
            ),)
          ],
        ),
        body: Stack(
          children: [
            Container(
              child: Image.asset((widget.food.inStook == true) ?
              widget.food.imagePath : "Images/Chicken/images.png",
                  width: MediaQuery.of(context).size.width,
                  height:  MediaQuery.of(context).size.height ,
                  fit: BoxFit.cover),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /*Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child:
                  Center(
                    child: Container(
                      child: Image.asset((widget.food.inStook == true) ?
                      widget.food.imagePath : "Images/Chicken/images.png",height: 200,),
                    ),
                  ),
                ),*/
                SizedBox(height: 100,),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: <Color>[AppColorsLight.lightColor.withOpacity(0.5),AppColorsLight.lightColor,],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter
                    ),
                     // color: Colors.deepOrange.shade400,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))
                  ),
                  padding: EdgeInsets.all(15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(width: 35,),
                          Text(widget.food.name,
                          style: GoogleFonts.dmSerifDisplay(
                            fontSize: 45,
                            color: AppColorsLight.secondaryColor.shade800
                          ),
                          ),
                          Container(
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  if (widget.food.isFav)
                                    FavoriteList.delete(widget.food);
                                  if (!widget.food.isFav) FavoriteList.add(widget.food);
                                  widget.food.isFav = !widget.food.isFav;
                                });
                              },
                              icon:Icon(
                                (widget.food.isFav == false)
                                    ? Icons.favorite_outline
                                    : Icons.favorite,
                                color: (widget.food.isFav == false)
                                    ? AppColorsLight.lightColor
                                    : Colors.red,
                                size: 30,
                              ),
                            ),
                            decoration: BoxDecoration(
                              color: AppColorsLight.primaryColor.shade300,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 5,),

                      Text("\$"+(widget.food.price).toString(),
                        style: GoogleFonts.dmSerifDisplay(
                            fontSize: 35,
                            color: AppColorsLight.secondaryColor.shade800
                        ),
                      ),

                      SizedBox(height: 5,),

                      RatingBarIndicator(
                        rating: widget.food.rating,
                        itemBuilder: (context, index) => Icon(
                          Icons.star,
                          color: Colors.yellowAccent,
                        ),
                        itemCount: 5,
                        itemSize: 20.0,
                        direction: Axis.horizontal,
                      ),

                      SizedBox(height: 10,),

                      Padding(
                        padding: const EdgeInsets.only(right: 15.0,left: 15.0,bottom: 10.0,top: 10.0),
                        child: Text(widget.food.description,
                          style: TextStyle(
                              color: AppColorsLight.secondaryColor.shade800,
                              fontWeight: FontWeight.w400,
                              fontSize: 13,
                              height: 2
                          ),),
                      ),
                      SizedBox(height: 15,),
                      if(widget.food.inStook)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              children: [
                                IconButton(
                                    onPressed: decrementQuantity,
                                    icon: const Icon(Icons.chevron_left,
                                      color: AppColorsLight.lightColor,
                                    ),
                                  style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all(
                                        AppColorsLight.primaryColor.shade400,
                                      )
                                  ),
                                ),

                                SizedBox(width: 7,),

                                Container(
                                  width: 55,
                                  padding: EdgeInsets.symmetric(horizontal:10),

                                  decoration: BoxDecoration(
                                      color: AppColorsLight.primaryColor.shade400,
                                      borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 5.0,top: 5.0),
                                    child: Center(
                                      child: Text(widget.food.quantity.toString(),
                                        style:TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 22,
                                            color: AppColorsLight.lightColor
                                        ) ,),
                                    ),
                                  ),
                                ),

                                SizedBox(width: 7,),

                                IconButton(
                                    onPressed: incrementQuantity,
                                    icon: const Icon(Icons.chevron_right,
                                      color: AppColorsLight.lightColor,),
                                  style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all(
                                        AppColorsLight.primaryColor.shade400,
                                      )
                                  ),
                                ),
                              ],
                            ),

                            Consumer<Cart>(builder: (context, cart, child) {
                              return  TextButton(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                      AppColorsLight.primaryColor.shade400,
                                    )
                                ),
                                onPressed: () {
                                    if(widget.food.inCart)
                                      cart.delete(widget.food);
                                    if(!widget.food.inCart)
                                      cart.add(widget.food);
                                    widget.food.inCart=!widget.food.inCart;
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon((widget.food.inCart)
                                        ?Icons.add_task
                                        :Icons.add,
                                      color: AppColorsLight.lightColor,),
                                    SizedBox(width: 5,),
                                    Text((widget.food.inCart)?"Added":"Add To Cart",
                                      style: GoogleFonts.dmSerifDisplay(
                                          fontSize: 20,
                                          color: AppColorsLight.lightColor
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },)
                          ],
                        ),
                    ],
                  ),
                )

              ],
            ),
          ],
        )
    );
  }

}

/*Row(
                    children: [
                      Icon(Icons.star,
                      color: Colors.yellow.shade800,
                      ),

                      const SizedBox(width: 5,),

                      Text(widget.food.rating.toString(),
                          style: GoogleFonts.aladin(
                            color: Colors.grey.shade600,
                            fontWeight: FontWeight.bold,
                          )),
                    ],
                  ),

                  const SizedBox(height: 10,),

                  Text(widget.food.name,
                  style: GoogleFonts.aladin(
                    color: Colors.deepOrange,
                    fontSize: 30,),
                  ),

                  const SizedBox(height: 20,),

                  Text("Desciption",style: TextStyle(
                    color: Colors.grey.shade900,
                    fontWeight: FontWeight.bold,
                    fontSize: 16
                  ),),

                 const SizedBox(height: 10,),

                  Text(widget.food.description,
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontWeight: FontWeight.w400,
                      fontSize: 13,
                      height: 2
                  ),),
                  */
/*
if(widget.food.inStook)
            Container(
              decoration: BoxDecoration(
                color: Colors.deepOrange.shade600,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15))
              ),
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("\$"+widget.food.price.toString(),
                          style: GoogleFonts.aladin(
                            color: Colors.white,
                            fontSize: 25,
                          )),

                      Row(
                        children: [
                          Container(
                            child: IconButton(
                                onPressed: decrementQuantity,
                                icon: const Icon(Icons.remove),color: Colors.white),
                            decoration: BoxDecoration(
                              color: Colors.deepOrange.shade300,
                              shape: BoxShape.circle
                            ),
                          ),

                          SizedBox(
                            width: 40,
                            child: Center(
                              child: Text(widget.food.quantity.toString(),
                                style:TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20
                                ) ,),
                            ),
                          ),

                          Container(
                            child: IconButton(
                                onPressed: incrementQuantity,
                                icon: const Icon(Icons.add),color: Colors.white),
                            decoration: BoxDecoration(
                                color: Colors.deepOrange.shade300,
                                shape: BoxShape.circle
                            ),
                          ),
                        ],
                      )
                    ],
                  ),

                  SizedBox(height: 15,),

                  InkWell(
                    onTap: () {
                      Navigator.of(context)
                          .push(
                          MaterialPageRoute(builder:
                              (context) => PaypalMain(
                              food: widget.food,
                              ),
                          )
                      );
                    },
                    child: Ink(
                      child: Container(
                        width: MediaQuery.of(context).size.width*0.8,
                        padding: EdgeInsets.all(10),
                        decoration:BoxDecoration(
                          color: Colors.deepOrange.shade300,
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Buy Now",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w500,
                                )
                            ),
                            Icon(Icons.arrow_right_outlined,color: Colors.white,)
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
 */





