import 'package:flutter/material.dart';

class BookingTable{
  static List<int> busyTables=[1,2,13,4];
  static bool? isbook;
  static int? tableNumber;
  static int? numOfSeats;
  static DateTime? dateTime;
  static TimeOfDay? pickedHour;
  static TextEditingController? tableName = TextEditingController(text: "Mohamed Gehad");

  static bool? get _isbook => isbook;
  static int? get _tableNumber => tableNumber;
  static int? get _numOfSeats => numOfSeats;
  static DateTime? get _dateTime => dateTime;
  static TimeOfDay? get _pickedHour => pickedHour;
  static TextEditingController? get _tableName => tableName;

  static void clear(){
    isbook = null;
    tableNumber = null;
    numOfSeats = null;
    dateTime = null;
    pickedHour = null;
    tableName = null;
  }

  static bool isAvailable(int table){
    for(int x in busyTables){
      if(table == x)
        return false;
    }
    return true;
  }


  /*static toList(List<dynamic> data) {
    List<BookingTable> card = [];
    for (int i = 0; i < data.length; i++) {
      try {
        card.add(
            BookingTable(
              numOfSeats: data[i]['numOfSeats'],
              dateTime: data[i]['dateTime'],
              isbook: data[i]['isbook'],
              pickedHour: data[i]['pickedHour'],
              tableNumber: data[i]['tableNumber'],
            )
        );
      } catch (err) {
        print(err);
      }
    }

    return card;
  }*/



}

