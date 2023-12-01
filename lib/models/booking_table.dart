import 'package:flutter/material.dart';

class BookingTable{
  static bool? isbook;
  static int? tableNumber;
  static int? numOfSeats;
  static DateTime? dateTime;
  static TimeOfDay? pickedHour;

  static bool? get _isbook => isbook;
  static int? get _tableNumber => tableNumber;
  static int? get _numOfSeats => numOfSeats;
  static DateTime? get _dateTime => dateTime;
  static TimeOfDay? get _pickedHour => pickedHour;

  static void clear(){
    isbook = null;
    tableNumber = null;
    numOfSeats = null;
    dateTime = null;
    pickedHour = null;
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

