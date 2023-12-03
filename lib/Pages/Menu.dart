import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:provider/provider.dart';
import 'package:restaurant/Pages/cart.dart';
import 'package:restaurant/components/menu_card.dart';
import 'package:restaurant/core/theme/app_color/app_color.dart';
import 'package:restaurant/models/cart_list.dart';
import 'package:restaurant/models/food.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Menu extends StatefulWidget {

  int sliding;
  final int selectedPage;
  Menu({super.key,required this.selectedPage,
    required this.sliding});

  @override
  State<Menu> createState() => _MenuState();

}
/*
Future<List<Food>> fetchFoodData() async {
  final response =
  await http.get(Uri.parse('http://localhost:3000/RESTO'));

  if (response.statusCode == 200) {
    return Food.toList(jsonDecode(response.body));
  } else {
    throw Exception('faild to fetch food card data');
  }
}

Future<void> sendFoodData(Food dataObj) async {
  final response = await http.post(
    Uri.parse('http://localhost:3000/RESTO'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'name': dataObj.name,
      'inStook': dataObj.inStook.toString(),
      'description': dataObj.description.toString(),
      'rating': dataObj.rating.toString(),
      'price': dataObj.price.toString(),
      'imagePath': dataObj.imagePath,
    }),
  );

  if (response.statusCode == 200) {
  } else {
    throw Exception('faild to send food card data');
  }
}

Future<void> updateFoodData(
    Food dataObj, func(String errMsg)) async {
  final response = await http.put(
    Uri.parse(
        'http://localhost:3000/RESTO${dataObj.name.toString()}'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'name': dataObj.name,
      'inStook': dataObj.inStook.toString(),
      'description': dataObj.description.toString(),
      'rating': dataObj.rating.toString(),
      'price': dataObj.price.toString(),
      'imagePath': dataObj.imagePath,
    }),
  );

  if (response.statusCode == 200) {
    func('pop');
  } else if (response.statusCode == 500) {
    func("Duplicate Entry In 'name' Column.\nTry another name!");
  } else {
    throw Exception('faild to update food card data');
  }
}
*/

class _MenuState extends State<Menu> {

  void update(){
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {

    //final Future<List<Food>> chickenMenu2 = fetchFoodData();

    Future<void> _refresh() async{
      return await Future.delayed(Duration(seconds: 1));
    }

    final List chickenMenu = [
      Food(name: "Burger",
        price: 10.50,
        imagePath: "Images/Chicken/Burger.png",
        rating: 1.5,
        description: "Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption ",
        inStook: true
      ),

      Food(name: "Chicken",
          price: 5.50,
          imagePath: "Images/Chicken/GrilledChicken.png",
          rating: 2.5,
          description: "Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption ",
          inStook: true
      ),

      Food(name: "Long Burger",
        price: 15.00,
        imagePath: "Images/Chicken/LongBurger.png",
        rating: 3.5,
          description: "Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption ",
          inStook: false
      ),

      Food(name: "Mini Burger",
          price: 5.00,
          imagePath: "Images/Chicken/MiniBurger.png",
          rating: 3.5,
          description: "Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption ",
          inStook: true
      ),

      Food(name: "Strips",
        price: 6.50,
        imagePath: "Images/Chicken/Strips1.png",
        rating: 4.9,
          description: "Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption ",
          inStook: true
      ),

      Food(name: "Strips",
          price: 7.50,
          imagePath: "Images/Chicken/Strips2.png",
          rating: 4.4,
          description: "Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption ",
          inStook: true
      ),
    ];
    final List meatMenu = [
      Food(name: "Big Burger",
        price: 10.50,
        imagePath: "Images/Meat/BigBurger.png",
        rating:4.8,
          description: "Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption ",
          inStook: true
      ),

      Food(name: "Burger",
          price: 5.50,
          imagePath: "Images/Meat/Burger.png",
          rating: 4.1,
          description: "Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption ",
          inStook: true
      ),

      Food(name: "Burger",
        price: 15.00,
        imagePath: "Images/Meat/Burger2.png",
        rating: 4.3,
          description: "Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption ",
          inStook: true
      ),

      Food(name: "Meat&Fries",
          price: 5.00,
          imagePath: "Images/Meat/Meat&Fries.png",
          rating: 3.5,
          description: "Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption ",
          inStook: true
      ),

      Food(name: "Meat",
          price: 5.00,
          imagePath: "Images/Meat/Meat.png",
          rating: 3.5,
          description: "Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption ",
          inStook: true
      ),

      Food(name: "Meat",
        price: 6.50,
        imagePath: "Images/Meat/Meat2.png",
        rating: 4.9,
          description: "Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption ",
          inStook: true
      ),
    ];
    final List drinksMenu = [
      Food(name: "Coca Cola",
        price: 10.50,
        imagePath: "Images/Drinks/CanCocaCola.png",
        rating: 4.8,
          description: "Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption ",
          inStook: true
      ),

      Food(name: "Coca Cola",
          price: 5.50,
          imagePath: "Images/Drinks/CocaCola.png",
          rating: 4.1,
          description: "Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption ",
          inStook: true
      ),

      Food(name: "Lemon Juice",
        price: 15.00,
        imagePath: "Images/Drinks/LemonJuice.png",
        rating: 4.3,
          description: "Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption ",
          inStook: true
      ),

      Food(name: "Lemon Juice",
          price: 5.00,
          imagePath: "Images/Drinks/LemonJuice2.png",
          rating: 3.5,
          description: "Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption ",
          inStook: true
      ),

      Food(name: "Mango Juice",
          price: 5.00,
          imagePath: "Images/Drinks/MangoJuice.png",
          rating: 3.5,
          description: "Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption ",
          inStook: true
      ),

      Food(name: "Mirinda",
        price: 6.50,
        imagePath: "Images/Drinks/Mirinda.png",
        rating: 4.9,
          description: "Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption ",
          inStook: true
      ),

      Food(name: "Monster",
          price: 7.50,
          imagePath: "Images/Drinks/Monster.png",
          rating: 4.4,
          description: "Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption ",
          inStook: true
      ),

      Food(name: "Orange Juice",
        price: 7.50,
        imagePath: "Images/Drinks/OrangeJuice.png",
        rating: 4.8,
          description: "Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption ",
          inStook: true
      ),

      Food(name: "Orange Juice",
        price: 4.50,
        imagePath: "Images/Drinks/OrangeJuice2.png",
        rating: 4.8,
          description: "Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption ",
          inStook: true
      ),

      Food(name: "Pepsi",
        price: 8.50,
        imagePath: "Images/Drinks/Pepsi.png",
        rating: 4.8,
          description: "Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption ",
          inStook: true
      ),

      Food(name: "Pepsi Black",
        price: 7.50,
        imagePath: "Images/Drinks/PepsiBlack.png",
        rating: 4.8,
          description: "Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption ",
          inStook: true
      ),

      Food(name: "Pepsi",
        price: 44.50,
        imagePath: "Images/Drinks/PepsiCan.png",
        rating: 4.8,
          description: "Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption ",
          inStook: true
      ),

      Food(name: "Red Bull",
        price: 14.50,
        imagePath: "Images/Drinks/RedBull.png",
        rating: 4.8,
          description: "Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption ",
          inStook: true
      ),

      Food(name: "Sprite",
        price: 4.50,
        imagePath: "Images/Drinks/Sprite.png",
        rating: 4.8,
          description: "Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption ",
          inStook: true
      ),

      Food(name: "Water Bottle",
        price: 2.50,
        imagePath: "Images/Drinks/WaterBottle.png",
        rating: 4.8,
          description: "Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption ",
          inStook: true
      ),
    ];
    final List appetizersMenu = [
      Food(name: "Apple Pie",
        price: 10.50,
        imagePath: "Images/Appetizers/ApplePie.png",
        rating: 4.8,
          description: "Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption ",
          inStook: true
      ),

      Food(name: "Cheesy Fries",
          price: 5.50,
          imagePath: "Images/Appetizers/CheesyFries.png",
          rating: 4.1,
          description: "Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption ",
          inStook: true
      ),

      Food(name: "Cookies",
        price: 15.00,
        imagePath: "Images/Appetizers/Cookies.png",
        rating: 4.3,
          description: "Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption ",
          inStook: true
      ),

      Food(name: "Fries",
          price: 5.00,
          imagePath: "Images/Appetizers/Fries.png",
          rating: 3.5,
          description: "Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption ",
          inStook: true
      ),

      Food(name: "Fries",
          price: 5.00,
          imagePath: "Images/Appetizers/Fries2.png",
          rating: 3.5,
          description: "Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption ",
          inStook: true
      ),

      Food(name: "IceCream",
        price: 6.50,
        imagePath: "Images/Appetizers/IceCream.png",
        rating: 4.9,
          description: "Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption ",
          inStook: true
      ),

      Food(name: "IceCream",
          price: 7.50,
          imagePath: "Images/Appetizers/IceCream2.png",
          rating: 4.4,
          description: "Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption ",
          inStook: true
      ),

      Food(name: "Mulukhiyah",
        price: 7.50,
        imagePath: "Images/Appetizers/Mulukhiyah .png",
        rating: 4.0,
          description: "Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption ",
          inStook: true
      ),
    ];

    return Scaffold(
      backgroundColor: AppColorsLight.lightColor,
      appBar: AppBar(
        elevation: 0,
        title:
        Text(
            "Menu",
            style: GoogleFonts.aladin(
              color: AppColorsLight.primaryColor,
              fontSize: 45,
            )
        ),
        actions: <Widget>[
          Consumer<Cart>(builder: (context, value, child) {
            return IconButton(onPressed: () {
              Navigator.of(context)
                  .push(
                  MaterialPageRoute(builder: (context) =>
                      Cart(selectedPage: widget.selectedPage,sliding: widget.sliding),)
              );
            },
              icon: Tooltip(
                message: 'Go To Cart',
                child: Icon((CartList.count==0)
                    ?Icons.shopping_cart_outlined
                    :Icons.shopping_cart,
                  color:AppColorsLight.primaryColor,
                ),
              ),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.transparent)
              ),
            );
          },),
        ],
      ),

      body: LiquidPullToRefresh(
        onRefresh: _refresh,
        color: AppColorsLight.appBarColor,
        backgroundColor: AppColorsLight.primaryColor,
        height: 150,
        animSpeedFactor:5,
        showChildOpacityTransition: false,
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Padding(
              padding: const EdgeInsets.only(left:15.0,right: 15.0,bottom: 15.0),
              child: SizedBox(
                height: 50,
                child: SearchAnchor(
                    builder: (BuildContext context, SearchController controller) {
                      return SearchBar(
                        backgroundColor: MaterialStateProperty.all(AppColorsLight.primaryColor.shade500),
                        hintText: "Search for your food..",
                        hintStyle: MaterialStateProperty.all(
                            TextStyle(color: AppColorsLight.lightColor)),
                        padding: const MaterialStatePropertyAll<EdgeInsets>(
                            EdgeInsets.symmetric(horizontal: 15.0)),
                        onTap: () {
                          controller.openView();
                        },
                        onChanged: (_) {
                          controller.openView();
                        },
                        leading: const Icon(Icons.search,color: AppColorsLight.lightColor),
                      );
                    }, suggestionsBuilder:
                    (BuildContext context, SearchController controller) {
                  return List<ListTile>.generate(5, (int index) {
                    final String item = 'item $index';
                    return ListTile(
                      title: Text(item),
                      onTap: () {
                        setState(() {
                          controller.closeView(item);
                        });
                      },
                    );
                  });
                }),
              ),
            ),

           /* Padding(
              padding: const EdgeInsets.only(left: 10,right: 10),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration:BoxDecoration(
                    color: Colors.deepOrange[200],
                    borderRadius: BorderRadius.circular(15)
                ) ,
                child: NavigationBar(
                  onDestinationSelected: (value) {
                    setState(() {
                      selectedPage = value;
                    });
                  },
                  selectedIndex: selectedPage,
                  height: 40,
                  backgroundColor: Colors.deepOrange[200],
                  destinations: [
                    NavigationDestination(icon: Icon(Icons.home),label: "Home",),
                    NavigationDestination(icon: Icon(Icons.restaurant_menu),label: "Menu",),
                    NavigationDestination(icon: Icon(Icons.table_restaurant),label: "Booking",),
                    NavigationDestination(icon: Icon(Icons.favorite),label: "Favorite",),
                    NavigationDestination(icon: Icon(Icons.settings),label: "Settings",),

                  ],
                ),
              ),
            ),*/


           /*Padding(
              padding: const EdgeInsets.only(left: 10,right: 10),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration:BoxDecoration(
                    color: Colors.deepOrange[200],
                    borderRadius: BorderRadius.circular(15)
                ) ,
                height: 35,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: 75,
                      margin: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Colors.deepOrange[400],
                          borderRadius: BorderRadius.circular(15)
                      ),
                      child: Text("Chicken",style: GoogleFonts.alata(
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                        color: Colors.white,
                      ),),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: 60,
                      margin: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Colors.deepOrange[200],
                          borderRadius: BorderRadius.circular(15)
                      ),
                      child: Text("Meat",style: GoogleFonts.alata(
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                          color: Colors.black,
                      ),),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: 60,
                      margin: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Colors.deepOrange[200],
                          borderRadius: BorderRadius.circular(15)
                      ),
                      child: Text("Drinks",style: GoogleFonts.alata(
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                           color: Colors.black,
                      ),),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: 90,
                      margin: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Colors.deepOrange[200],
                          borderRadius: BorderRadius.circular(15)
                      ),
                      child: Text("Appetizers",style: GoogleFonts.alata(
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                          color: Colors.black,
                      ),),
                    ),
                  ],
                ),
              ),
            ),*/

           Padding(
             padding: const EdgeInsets.only(right: 18.0,left: 18.0),
             child: Container(
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(100),
                 color: AppColorsLight.primaryColor.shade300
               ),
               child: CupertinoSlidingSegmentedControl(
                 backgroundColor: Colors.transparent,
                 thumbColor: AppColorsLight.primaryColor.shade600,
                 children: {
                      0: Text("Chicken",style: GoogleFonts.alata(
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                        color: AppColorsLight.lightColor,
                      ),),
                      1: Text("Meat",style: GoogleFonts.alata(
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                        color: AppColorsLight.lightColor,
                      ),),
                      2: Text("Drinks",style: GoogleFonts.alata(
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                        color: AppColorsLight.lightColor,
                      ),),
                      3: Text("Appetizers",style: GoogleFonts.alata(
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                        color: AppColorsLight.lightColor,
                      ),),

                    },
                    groupValue:widget.sliding ,
                    onValueChanged: (value) {
                      setState(() {
                        widget.sliding = value!;
                      });
                    },
                ),
             ),
           ),

            SizedBox(height: 5,),

            <Widget>[
              Center(
                child: Container(
                  height: MediaQuery.of(context).size.height*0.69 ,
                  child:
                  /*FutureBuilder(
                    future: chickenMenu2,
                    builder:(context, chickenMenu2) {
                      if(chickenMenu2.hasError){
                       return Container(
                         child: Text("data"),
                       );
                      }else if(chickenMenu2.hasData){
                        return ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: chickenMenu2.data!.length,
                          itemBuilder: (context, index) => MenuCard(
                            food: chickenMenu2.data![index],
                            selectedPage: widget.selectedPage,
                            sliding: widget.sliding,
                          ),
                        );
                      }else{
                        return CircularProgressIndicator();
                      }

                    },
                  ),*/
                  ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: chickenMenu.length,
                    itemBuilder: (context, index) => MenuCard(
                      food: chickenMenu[index],
                      selectedPage: widget.selectedPage,
                      sliding: widget.sliding,
                    ),
                  ),
                ),
              ),
              Center(
                child: Container(
                  height: MediaQuery.of(context).size.height*0.69 ,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: meatMenu.length,
                    itemBuilder: (context, index) => MenuCard(
                      food: meatMenu[index],
                      selectedPage: widget.selectedPage,
                      sliding: widget.sliding,
                    ),
                  ),
                ),
              ),
              Center(
                child: Container(
                  height: MediaQuery.of(context).size.height*0.69 ,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: drinksMenu.length,
                    itemBuilder: (context, index) => MenuCard(
                      food: drinksMenu[index],
                      selectedPage: widget.selectedPage,
                      sliding: widget.sliding,
                    ),
                  ),
                ),
              ),
              Center(
                child: Container(
                  height: MediaQuery.of(context).size.height*0.69 ,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: appetizersMenu.length,
                    itemBuilder: (context, index) => MenuCard(
                      food: appetizersMenu[index],
                      selectedPage: widget.selectedPage,
                      sliding: widget.sliding,
                    ),
                  ),
                ),
              ),
            ][widget.sliding],

          ],
        ),
      ),
    );
  }
}