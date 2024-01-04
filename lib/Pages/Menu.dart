import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:provider/provider.dart';
import 'package:restaurant/Pages/Settings/Cart.dart';
import 'package:restaurant/components/menu_card.dart';
import 'package:restaurant/models/cart_list.dart';
import 'package:restaurant/models/food.dart';
import 'package:restaurant/theme/app_color.dart';

class Menu extends StatefulWidget {

  int sliding;
  final int selectedPage;
  Menu({super.key,required this.selectedPage,
    required this.sliding});

  @override
  State<Menu> createState() => _MenuState();

}

class _MenuState extends State<Menu> {

  void update(){
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {

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
      Food(name: "Spiro Apple",
          price: 10.50,
          imagePath: "Images/Drinks/SSApple.png",
          rating: 4.8,
          description: "Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption ",
          inStook: true
      ),

      Food(name: "Spiro Lime",
          price: 5.50,
          imagePath: "Images/Drinks/SSLime.png",
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

      Food(name: "Spiro Peach",
          price: 6.50,
          imagePath: "Images/Drinks/SSPeach.png",
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

      Food(name: "Spiro Pineapple",
          price: 8.50,
          imagePath: "Images/Drinks/SSPineapple.png",
          rating: 4.8,
          description: "Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption ",
          inStook: true
      ),

      Food(name: "Spiro Soda",
          price: 7.50,
          imagePath: "Images/Drinks/SSSoda.png",
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
    final List dessertsMenu = [
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
    final List allMenu = [];
    allMenu.addAll(chickenMenu);
    allMenu.addAll(meatMenu);
    allMenu.addAll(drinksMenu);
    allMenu.addAll(dessertsMenu);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title:
        Text(
            "Menu",
            style: GoogleFonts.aladin(
              color: AppColors.primaryColor,
              fontSize: 45,
            )
        ),
        actions: <Widget>[
          Consumer<Cart>(builder: (context, value, child) {
            return IconButton(onPressed: () {
              Navigator.of(context)
                  .push(
                  MaterialPageRoute(builder: (context) =>Cart(),)
              );
            },
              icon: Tooltip(
                message: 'Go To Cart',
                child: Icon((CartList.count==0)
                    ?Icons.shopping_cart_outlined
                    :Icons.shopping_cart,
                  color:AppColors.primaryColor,
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
        color: AppColors.appBarColor,
        backgroundColor: AppColors.primaryColor,
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
                        backgroundColor: MaterialStateProperty.all(AppColors.primaryColor.shade500),
                        hintText: "Search for your food..",
                        hintStyle: MaterialStateProperty.all(
                            TextStyle(color: AppColors.lightColor)),
                        padding: const MaterialStatePropertyAll<EdgeInsets>(
                            EdgeInsets.symmetric(horizontal: 15.0)),
                        onTap: () {
                          controller.openView();
                        },
                        onChanged: (_) {
                          controller.openView();
                        },
                        leading: const Icon(Icons.search,color: AppColors.lightColor),
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

            Padding(
              padding: const EdgeInsets.only(right: 18.0,left: 18.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  color: (AppColors.darkMode==false)
                      ?AppColors.primaryColor.shade300
                      :AppColors.primaryColor.shade400,
                ),
                child: CupertinoSlidingSegmentedControl(
                  backgroundColor: Colors.transparent,
                  thumbColor: (AppColors.darkMode==false)
                      ?AppColors.primaryColor.shade600
                      :AppColors.primaryColor.shade700,
                  children: {
                    0: Text("All",style: GoogleFonts.alata(
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                      color: AppColors.lightColor,
                    ),),
                    1: Text("Chicken",style: GoogleFonts.alata(
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                      color: AppColors.lightColor,
                    ),),
                    2: Text("Meat",style: GoogleFonts.alata(
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                      color: AppColors.lightColor,
                    ),),
                    3: Text("Drinks",style: GoogleFonts.alata(
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                      color: AppColors.lightColor,
                    ),),
                    4: Text("Desserts",style: GoogleFonts.alata(
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                      color: AppColors.lightColor,
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
                  child: //buildCategory(list)
                  ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: allMenu.length,
                    itemBuilder: (context, index) => MenuCard(
                      food: allMenu[index],
                    ),
                  ),
                ),
              ),
              Center(
                child: Container(
                  height: MediaQuery.of(context).size.height*0.69 ,
                  child: //buildCategory(list)
                  ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: chickenMenu.length,
                    itemBuilder: (context, index) => MenuCard(
                      food: chickenMenu[index],
                    ),
                  ),
                ),
              ),
              Center(
                child: Container(
                  height: MediaQuery.of(context).size.height*0.69,
                  child: // buildCategory(list)
                  ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: meatMenu.length,
                    itemBuilder: (context, index) => MenuCard(
                      food: meatMenu[index],
                    ),
                  ),
                ),
              ),
              Center(
                child:  // buildCategory(list)
                Container(
                  height: MediaQuery.of(context).size.height*0.69 ,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: drinksMenu.length,
                    itemBuilder: (context, index) => MenuCard(
                      food: drinksMenu[index],
                    ),
                  ),
                ),
              ),
              Center(
                child: Container(
                  height: MediaQuery.of(context).size.height*0.69 ,
                  child:  // buildCategory(list)
                  ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: dessertsMenu.length,
                    itemBuilder: (context, index) => MenuCard(
                      food: dessertsMenu[index],
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