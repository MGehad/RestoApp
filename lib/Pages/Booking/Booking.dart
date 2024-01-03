import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:restaurant/External/Booking_Pdf.dart';
import 'package:restaurant/Pages/Booking/Booking_SPage.dart';
import 'package:restaurant/models/booking_table.dart';
import 'package:restaurant/theme/app_color.dart';

class Booking extends StatefulWidget {
  const Booking({Key? key}) : super(key: key);

  @override
  State<Booking> createState() => _BookingState();
}

class _BookingState extends State<Booking> {

  TextEditingController _date = TextEditingController();
  DateTime? pickedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorsLight.lightColor,
      appBar: AppBar(
        elevation: 0,
        title: Center(
          child: Text(
            "Booking",
            style: GoogleFonts.aladin(
              color: AppColorsLight.primaryColor,
              fontSize: 45,
            ),
          ),
        ),
      ),
      body:
      (BookingTable.isbook==true)
          ? ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20.0,right: 10.0,left: 10.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
              ),
              width: MediaQuery.of(context).size.width,
              child: Container(
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  color: AppColorsLight.secondaryColor.shade100,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Your Table is Booked",
                              style: GoogleFonts.aladin(
                                color: AppColorsLight.primaryColor,
                                fontSize: 35,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                openQr(context);
                              },
                              icon: Icon(
                                Icons.qr_code,
                                color: AppColorsLight.primaryColor,
                              ),
                            ),
                          ],
                        ),
                        Card(
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: AppColorsLight.lightColor
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 5.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Table Name: ",
                                    style: GoogleFonts.aladin(
                                      color: AppColorsLight.primaryColor,
                                      fontSize: 28,
                                    ),
                                  ),
                                  Text(BookingTable.name!,
                                    style: GoogleFonts.aladin(
                                      color: AppColorsLight.primaryColor,
                                      fontSize: 25,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Card(
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: AppColorsLight.lightColor
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 5.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Table: ",
                                    style: GoogleFonts.aladin(
                                      color: AppColorsLight.primaryColor,
                                      fontSize: 28,
                                    ),
                                  ),
                                  Text("${BookingTable.tableNumber}",
                                    style: GoogleFonts.aladin(
                                      color: AppColorsLight.primaryColor,
                                      fontSize: 25,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Card(
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: AppColorsLight.lightColor
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 5.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Number Of Seats: ",
                                    style: GoogleFonts.aladin(
                                      color: AppColorsLight.primaryColor,
                                      fontSize: 28,
                                    ),
                                  ),
                                  Text("${BookingTable.numOfSeats}",
                                    style: GoogleFonts.aladin(
                                      color: AppColorsLight.primaryColor,
                                      fontSize: 25,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Card(
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: AppColorsLight.lightColor
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 5.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Date:",
                                    style: GoogleFonts.aladin(
                                      color: AppColorsLight.primaryColor,
                                      fontSize: 28,
                                    ),
                                  ),
                                  Text(BookingTable.date!,
                                    style: GoogleFonts.aladin(
                                      color: AppColorsLight.primaryColor,
                                      fontSize: 25,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Card(
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: AppColorsLight.lightColor
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 5.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Start Time: ",
                                    style: GoogleFonts.aladin(
                                      color: AppColorsLight.primaryColor,
                                      fontSize: 28,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text("${BookingTable.startTime}",
                                        style: GoogleFonts.aladin(
                                          color: AppColorsLight.primaryColor,
                                          fontSize: 25,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Card(
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: AppColorsLight.lightColor
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 5.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("End Time: ",
                                    style: GoogleFonts.aladin(
                                      color: AppColorsLight.primaryColor,
                                      fontSize: 28,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text("${BookingTable.endTime}",
                                        style: GoogleFonts.aladin(
                                          color: AppColorsLight.primaryColor,
                                          fontSize: 25,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: TextButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                  MaterialStateProperty.all(AppColorsLight.primaryColor),
                                ),
                                onPressed: () {
                                  PdfGenerator(context);
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.download,
                                      color: AppColorsLight.lightColor,
                                    ),
                                    SizedBox(width: 5,),
                                    Text(
                                      "Download",
                                      style: GoogleFonts.dmSerifDisplay(
                                        fontSize: 20,
                                        color: AppColorsLight.lightColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: TextButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                  MaterialStateProperty.all(AppColorsLight.primaryColor),
                                ),
                                onPressed: () {
                                  setState(() {
                                    BookingTable.clear();
                                  });
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.delete,
                                      color: AppColorsLight.lightColor,
                                    ),
                                    SizedBox(width: 5,),
                                    Text(
                                      "Cancel",
                                      style: GoogleFonts.dmSerifDisplay(
                                        fontSize: 20,
                                        color: AppColorsLight.lightColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),

              ),
            ),
          ),
        ],
      )
          : ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 20.0,
                      bottom: 50
                  ),
                  child: Center(
                    child: Text(
                      "Choose Your Time",
                      style: GoogleFonts.aladin(
                        color: AppColorsLight.primaryColor,
                        fontSize: 30,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          height: 70,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20)
                          ),
                          child: TextField(
                            controller: TextEditingController(text: BookingTable.name),
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Table Name',
                            ),
                            enabled: true,
                          ),
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*0.06,),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          height: 70,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20)
                          ),
                          child: TextField(
                            keyboardType: TextInputType.datetime,
                            controller: _date,
                            decoration: InputDecoration(
                              suffixIcon: Icon(Icons.calendar_today_rounded),
                              border: OutlineInputBorder(),
                              labelText: 'Select Day',
                            ),
                            onTap: () async{
                              pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate:DateTime.now(),
                                lastDate: DateTime(2026),
                              );
                              if(pickedDate != null){
                                setState(() {
                                  _date.text = DateFormat.MEd().format(pickedDate!);
                                });
                              }
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height*0.1,),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextButton(
                    style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.all(AppColorsLight.primaryColor),
                    ),
                    onPressed: () {
                      if(pickedDate!=null) {
                        BookingTable.dateTime = pickedDate;
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => BookingSPage(
                              selectedPage: 2,
                            ),
                          ),
                        );
                      }else{
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: AppColorsLight.secondaryColor.shade800,
                              action: SnackBarAction(
                                label: "OK",
                                textColor: AppColorsLight.lightColor,
                                onPressed: () {

                                },
                              ),
                              content: Text("Select The Date Of Booking",
                                  style: TextStyle(fontWeight: FontWeight.bold)
                              ),
                            )
                        );
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Book A Table",
                          style: GoogleFonts.dmSerifDisplay(
                            fontSize: 20,
                            color: AppColorsLight.lightColor,
                          ),
                        ),
                        Icon(
                          Icons.arrow_right_outlined,
                          color: AppColorsLight.lightColor,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> openQr(BuildContext context) async {
    final qrData = "${BookingTable.name}#"
        "${BookingTable.tableNumber}#"
        "${BookingTable.numOfSeats}#"
        "${BookingTable.date}#"
        "${BookingTable.startTime}#"
        "${BookingTable.endTime}#";
    showDialog(
      context: context,
      builder: (context) =>
          AlertDialog(
            content: Container(
              width: 300.0,
              height: 300.0,
              child: QrImageView(
                data: qrData,
                version: QrVersions.auto,
                size: 300.0,
              ),
            )
          ),
    );
  }
}