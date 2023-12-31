import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:restaurant/Pages/First_Page.dart';
import 'package:restaurant/main.dart';
import 'package:restaurant/models/booking_table.dart';
import 'package:restaurant/theme/app_color.dart';

class BookingConfirm extends StatefulWidget {
  final int selectedPage;
  Function updateTheme;
  BookingConfirm({Key? key,required this.selectedPage,required this.updateTheme}) : super(key: key);

  @override
  State<BookingConfirm> createState() => _BookingConfirmState();
}

class _BookingConfirmState extends State<BookingConfirm> {
  int _selected = 0;

  BoxDecoration dec1 = BoxDecoration(
    color: AppColors.primaryColor,
    shape: BoxShape.circle,
  );

  BoxDecoration dec2 = BoxDecoration();

  @override
  Widget build(BuildContext context) {
    TimeOfDay? pickedHour;

    final TextEditingController _date = TextEditingController();
    _date.text = DateFormat.yMMMMEEEEd().format(BookingTable.dateTime!);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title:Text("Available Tables",
            style: GoogleFonts.aladin(
              color: AppColors.primaryColor,
              fontSize: 35,
            )
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => HomePage(selectedPage: widget.selectedPage,sliding: 0),));
          },
          icon: const Icon(Icons.arrow_back_ios,color: AppColors.primaryColor),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.transparent)
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Stack(
          children: [
            ListView(
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buildSeatOption("Images/Seats/Eight_Seats.png",8,1),
                        buildSeatOption("Images/Seats/Six_Seats.png",6,2),
                        buildSeatOption("Images/Seats/Six_Seats.png",6,3),
                        buildSeatOption("Images/Seats/Five_Seats.png",5,4),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buildSeatOption("Images/Seats/Six_Seats.png",6,5),
                        buildSeatOption("Images/Seats/Five_Seats.png",5,6),
                        buildSeatOption("Images/Seats/Four_Seats.png",4,7),
                        buildSeatOption("Images/Seats/Five_Seats.png",5,8),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buildSeatOption("Images/Seats/Five_Seats.png",5,9),
                        buildSeatOption("Images/Seats/Four_Seats.png",4,10),
                        buildSeatOption("Images/Seats/Six_Seats.png",6,11),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buildSeatOption("Images/Seats/Eight_Seats.png",8,12),
                        buildSeatOption("Images/Seats/Four_Seats.png",4,13),
                        buildSeatOption("Images/Seats/Five_Seats.png",5,14),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buildSeatOption("Images/Seats/Eight_Seats.png",8,15),
                        buildSeatOption("Images/Seats/Four_Seats.png",4,16),
                        buildSeatOption("Images/Seats/Four_Seats.png",4,17),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buildSeatOption("Images/Seats/Six_Seats.png",6,18),
                        buildSeatOption("Images/Seats/Four_Seats.png",4,19),
                        buildSeatOption("Images/Seats/Eight_Seats.png",8,20),
                      ],
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height*0.08,)
                  ],
                ),
              ],
            ),
            Column(
              mainAxisAlignment:MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextButton(
                    style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.all(AppColors.primaryColor),
                    ),
                    onPressed: () {
                      if(BookingTable.tableNumber!=null&&BookingTable.numOfSeats!=null) {
                        BookingTable.isbook = true;
                        while(Navigator.of(context).canPop()) {
                          Navigator.of(context).pop();
                        }
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                              builder: (context) => FirstPage(
                                  selectedPage: widget.selectedPage,
                                  sliding: 0,updateTheme: widget.updateTheme,)),
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
                              content: Text("Select Available Table",
                                  style: TextStyle(fontWeight: FontWeight.bold)
                              ),
                            )
                        );
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Book",
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
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
  Widget buildSeatOption(String imagePath, int seatCount,int index) {
    return InkWell(
      borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width * 0.2),
      onTap: () {
        setState(() {
          if(!BookingTable.isAvailable(index)){
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: AppColors.secondaryColor.shade800,
                  action: SnackBarAction(
                    label: "OK",
                    textColor: AppColors.lightColor,
                    onPressed: () {

                    },
                  ),
                  content: Text("This Table Is Busy At This Time",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                )
            );
          }else{
            _selected = index;
            BookingTable.tableNumber = index;
            BookingTable.numOfSeats = seatCount;
          }
        });
      },
      child: Ink(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius:
            BorderRadius.circular(MediaQuery.of(context).size.width * 0.2),
          ),
          child: Container(
            decoration: (_selected == index) ? dec1 : dec2,
            height: MediaQuery.of(context).size.width*0.2,
            width: MediaQuery.of(context).size.width*0.2,
            child: Stack(
              children: [
                Center(child:Image.asset(imagePath)),
                Center(
                  child: Text(
                    seatCount.toString(),
                    style: GoogleFonts.allerta(
                      color: AppColors.secondaryColor.shade800,
                      fontSize: 20,
                    ),
                  ),
                ),
                if((!BookingTable.isAvailable(index)))
                Center(
                  child: Container(
                    height: MediaQuery.of(context).size.width*0.2,
                    width: MediaQuery.of(context).size.width*0.2,
                    decoration: BoxDecoration(
                        color: AppColors.primaryColor.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width*0.2)
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}