import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant/Pages/item.dart';
import 'package:restaurant/models/food.dart';

class ItemMain extends StatefulWidget {
  final int selectedPage;
  final Food food;

  const ItemMain({super.key,
    required this.food,
  required this.selectedPage
  });

  @override
  State<ItemMain> createState() => _ItemMain();

}

class _ItemMain extends State<ItemMain> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Item(food: widget.food,selectedPage:widget.selectedPage ),
      theme: ThemeData(
        useMaterial3: true,
      ),
    );
  }

}
