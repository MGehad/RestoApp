import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:restaurant/components/menu_card.dart';
import 'package:restaurant/models/food.dart';

class Favorite extends StatefulWidget with ChangeNotifier{
  int selectedPage;
  Favorite({super.key,required this.selectedPage});

  List<Food> _items = [];

  void add(Food item){
    _items.add(item);
    notifyListeners();
  }

  void delete(Food item){
    _items.remove(item);
    notifyListeners();
  }

  int get count{
    return _items.length;
  }

  List<Food> get items{
    return _items;
  }

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title:
        Center(
          child: Text(
              "Favroite",
              style: GoogleFonts.aladin(
                color: Colors.deepOrange,
                fontSize: 45,
              )
          ),
        ),
      ),

      body: Consumer<Favorite>(builder: (context, favorite, child) {
        return ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: favorite.items.length,
          itemBuilder: (context, index) => MenuCard(
            food: favorite.items[index],
            selectedPage: widget.selectedPage,
          ),
        );
      },),
    );
    }
  }






