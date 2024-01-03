import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:restaurant/Pages/First_Page.dart';
import 'package:restaurant/Pages/Settings/Profile.dart';
import 'package:restaurant/components/ads.dart';
import 'package:restaurant/components/most_popular_card.dart';
import 'package:restaurant/models/food.dart';
import 'package:restaurant/theme/app_color.dart';

class MainPage extends StatefulWidget {
  final int selectedPage;
  const MainPage({super.key,required this.selectedPage});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  Future<void> _refresh() async{
    return await Future.delayed(Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {

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
          inStook: true
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
    final List<Widget> ads =[
      MyADS(
          food: Food(name: "Apple Pie",
              price: 10.50,
              imagePath: "Images/Appetizers/ApplePie.png",
              rating: 4.8,
              description: "Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption ",
              inStook: true
          ),
      ),

      MyADS(
        food:Food(name: "Meat",
            price: 5.00,
            imagePath: "Images/Meat/Meat.png",
            rating: 3.5,
            description: "Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption ",
            inStook: true
        ),
      ),

      MyADS(
        food:  Food(name: "Spiro Apple",
            price: 6.50,
            imagePath: "Images/Drinks/SSApple.png",
            rating: 4.9,
            description: "Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption ",
            inStook: true
        ),
      ),

      MyADS(
        food: Food(name: "Spiro Lime",
            price: 8.50,
            imagePath: "Images/Drinks/SSLime.png",
            rating: 4.8,
            description: "Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption ",
            inStook: true
        ),
      ),

      MyADS(
        food: Food(name: "Burger",
            price: 15.00,
            imagePath: "Images/Meat/Burger2.png",
            rating: 4.3,
            description: "Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption Desciption ",
            inStook: true
        ),
      ),
    ];

    return Scaffold(
      backgroundColor: AppColorsLight.lightColor,
      appBar: AppBar(
        elevation: 0,
        title:
        Text(
            "Resto",
            style: GoogleFonts.aladin(
              color: AppColorsLight.primaryColor,
              fontSize: 45,
            )
        ),
        actions: <Widget>[
          IconButton(onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => Profile(),
            )
            );
          }, icon: Icon(Icons.person,color: AppColorsLight.lightColor,))
        ],
      ),

      body:LiquidPullToRefresh(
        onRefresh: _refresh,
        color: AppColorsLight.appBarColor,
        backgroundColor: AppColorsLight.primaryColor,
        height: 150,
        animSpeedFactor:5,
        showChildOpacityTransition: false,
        child: ListView(
          children: [
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left:15.0,right: 15.0),
                    child: SizedBox(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
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

                  Container(
                    height: MediaQuery.of(context).size.height*0.3,
                    width: MediaQuery.of(context).size.width,
                    child: CarouselSlider(
                        items: ads.map((item) => Container(
                          child: item,
                        )).toList(),
                        options: CarouselOptions(
                          autoPlay: true,
                          aspectRatio: 2.0,
                          enlargeCenterPage: false,
                        ),
                      carouselController: CarouselController(

                      ),
                     ),
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: Text("Most Popular Food",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                  ),

                  Container(
                      height: 230,
                      child:
                      ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: chickenMenu.length,
                        itemBuilder: (context, index) => MostPopularCard(
                          food: chickenMenu[index],
                          selectedPage: widget.selectedPage,
                        ),
                      ),
                  ),

                  /* Container(
                     decoration:BoxDecoration(
                       color: Colors.grey[100],
                       borderRadius: BorderRadius.circular(20)

                     ) ,
                     margin: EdgeInsets.only(left: 25,right: 25,bottom: 25),
                     padding: EdgeInsets.all(20),
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Row(
                           children: [
                             Image.asset("lib/images/Strips.png",
                                 height: 60,fit: BoxFit.fill),
                             SizedBox(width: 20,),

                             Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 Text("Strips",style: GoogleFonts.dmSerifDisplay(fontSize: 20)),

                                 const SizedBox(height: 10,),

                                 Text("\$25",
                                   style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey[700]
                                   ),
                                 )
                               ],
                             ),
                           ],
                         ),

                         Icon(Icons.favorite_outline,
                         color: Colors.grey,
                         size: 25),

                       ],
                     )
                   ),
                   */

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: Text("Categories",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                  ),

                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          buildCategries(0, Icon(Icons.set_meal), "Chicken"),
                          buildCategries(1, Icon(Icons.set_meal), "Meat"),
                        ],
                      ),
                      SizedBox(height: 15,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          buildCategries(2, Icon(Icons.set_meal), "Drinks"),
                          buildCategries(3, Icon(Icons.set_meal), "Appetizesrs"),
                        ],
                      )
                    ],
                  )
                ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCategries(int menuIndex,Icon icon,String catName) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () {
        setState(() {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => FirstPage(selectedPage: 1, sliding: menuIndex)
            ),
          );
        });
      },
      child: Ink(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius:
            BorderRadius.circular(20),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: AppColorsLight.primaryColor.shade500,
              borderRadius: BorderRadiusDirectional.circular(20)
            ),
            height: 100,
            width: 150,
            child: Column(
              mainAxisAlignment:MainAxisAlignment.center ,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                icon,
                SizedBox(height: 5,),
                Text(
                  catName,
                  style: GoogleFonts.dmSerifDisplay(
                    color: AppColorsLight.lightColor,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}




