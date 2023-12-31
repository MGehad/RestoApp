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
  Function updateTheme;
  Booking({Key? key,required this.updateTheme}) : super(key: key);
  @override
  State<Booking> createState() => _BookingState();
}

class _BookingState extends State<Booking> {

  TextEditingController _date = TextEditingController();
  TextEditingController _name = TextEditingController();
  DateTime? pickedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Center(
          child: Text(
            "Booking",
            style: GoogleFonts.aladin(
              color: AppColors.primaryColor,
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
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
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
                              color: AppColors.primaryColor,
                              fontSize: 35,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              openQr(context);
                            },
                            icon: Icon(
                              Icons.qr_code,
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ],
                      ),
                      Card(
                        color: (AppColors.darkMode==false)
                            ?AppColors.lightColor
                            :AppColors.secondaryColor.shade900,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Table Name: ",
                                  style: GoogleFonts.aladin(
                                    color: AppColors.primaryColor,
                                    fontSize: 28,
                                  ),
                                ),
                                Text(BookingTable.name!,
                                  style: GoogleFonts.aladin(
                                    color: AppColors.primaryColor,
                                    fontSize: 25,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      Card(
                        color: (AppColors.darkMode==false)
                            ?AppColors.lightColor
                            :AppColors.secondaryColor.shade900,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Table: ",
                                  style: GoogleFonts.aladin(
                                    color: AppColors.primaryColor,
                                    fontSize: 28,
                                  ),
                                ),
                                Text("${BookingTable.tableNumber}",
                                  style: GoogleFonts.aladin(
                                    color: AppColors.primaryColor,
                                    fontSize: 25,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      Card(
                        color: (AppColors.darkMode==false)
                            ?AppColors.lightColor
                            :AppColors.secondaryColor.shade900,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Number Of Seats: ",
                                  style: GoogleFonts.aladin(
                                    color: AppColors.primaryColor,
                                    fontSize: 28,
                                  ),
                                ),
                                Text("${BookingTable.numOfSeats}",
                                  style: GoogleFonts.aladin(
                                    color: AppColors.primaryColor,
                                    fontSize: 25,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      Card(
                        color: (AppColors.darkMode==false)
                            ?AppColors.lightColor
                            :AppColors.secondaryColor.shade900,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Date:",
                                  style: GoogleFonts.aladin(
                                    color: AppColors.primaryColor,
                                    fontSize: 28,
                                  ),
                                ),
                                Text(BookingTable.date!,
                                  style: GoogleFonts.aladin(
                                    color: AppColors.primaryColor,
                                    fontSize: 25,
                                  ),
                                )
                              ],
                            ),
                          ),
                      ),
                      Card(
                        color: (AppColors.darkMode==false)
                            ?AppColors.lightColor
                            :AppColors.secondaryColor.shade900,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Start Time: ",
                                  style: GoogleFonts.aladin(
                                    color: AppColors.primaryColor,
                                    fontSize: 28,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text("${BookingTable.startTime}",
                                      style: GoogleFonts.aladin(
                                        color: AppColors.primaryColor,
                                        fontSize: 25,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                      ),
                      Card(
                        color: (AppColors.darkMode==false)
                            ?AppColors.lightColor
                            :AppColors.secondaryColor.shade900,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("End Time: ",
                                  style: GoogleFonts.aladin(
                                    color: AppColors.primaryColor,
                                    fontSize: 28,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text("${BookingTable.endTime}",
                                      style: GoogleFonts.aladin(
                                        color: AppColors.primaryColor,
                                        fontSize: 25,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
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
                                MaterialStateProperty.all(AppColors.primaryColor),
                              ),
                              onPressed: () {
                                PdfGenerator(context);
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.download,
                                    color: (AppColors.darkMode==false)
                                        ?AppColors.lightColor
                                        :AppColors.secondaryColor.shade900,
                                  ),
                                  SizedBox(width: 5,),
                                  Text(
                                    "Download",
                                    style: GoogleFonts.dmSerifDisplay(
                                      fontSize: 20,
                                      color: (AppColors.darkMode==false)
                                          ?AppColors.lightColor
                                          :AppColors.secondaryColor.shade900,
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
                                MaterialStateProperty.all(AppColors.primaryColor),
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
                                    color: (AppColors.darkMode==false)
                                        ?AppColors.lightColor
                                        :AppColors.secondaryColor.shade900,
                                  ),
                                  SizedBox(width: 5,),
                                  Text(
                                    "Cancel",
                                    style: GoogleFonts.dmSerifDisplay(
                                      fontSize: 20,
                                        color: (AppColors.darkMode==false)
                                            ?AppColors.lightColor
                                            :AppColors.secondaryColor.shade900,
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
                        color: AppColors.primaryColor,
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
                            controller: _name,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Table Name',
                            ),
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
                      MaterialStateProperty.all(AppColors.primaryColor),
                    ),
                    onPressed: () {
                      if(pickedDate!=null) {
                        BookingTable.dateTime = pickedDate;
                        BookingTable.tableName = _name;
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => BookingSPage(
                              selectedPage: 2,
                              updateTheme: widget.updateTheme,
                            ),
                          ),
                        );
                      }else{
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: AppColors.secondaryColor.shade800,
                              action: SnackBarAction(
                                label: "OK",
                                textColor: AppColors.lightColor,
                                onPressed: () {

                                },
                              ),
                              content: Text("AppColors",
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
                            color: AppColors.lightColor,
                          ),
                        ),
                        Icon(
                          Icons.arrow_right_outlined,
                          color: AppColors.lightColor,
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