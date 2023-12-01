import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:restaurant/Pages/First.dart';
import 'package:restaurant/Pages/Main.dart';
import 'package:restaurant/core/theme/app_color/app_color.dart';
import 'package:restaurant/models/booking_table.dart';

class BookingConfirm extends StatefulWidget {
  final int selectedPage;
  const BookingConfirm({Key? key,required this.selectedPage}) : super(key: key);

  @override
  State<BookingConfirm> createState() => _BookingConfirmState();
}

class _BookingConfirmState extends State<BookingConfirm> {
  int _selected1 = 0;
  int _selected2 = 0;

  BoxDecoration dec1 = BoxDecoration(
    color: AppColorsLight.primaryColor,
    shape: BoxShape.circle,
  );

  BoxDecoration dec2 = BoxDecoration();

  @override
  Widget build(BuildContext context) {

    TimeOfDay? pickedHour;

    final TextEditingController _date = TextEditingController();
    _date.text = DateFormat.yMMMMEEEEd().format(BookingTable.dateTime!);

    return Scaffold(
      backgroundColor: AppColorsLight.lightColor,
      appBar: AppBar(
        elevation: 0,
        title:Text("Booking",
            style: GoogleFonts.aladin(
              color: AppColorsLight.primaryColor,
              fontSize: 40,
            )
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => Main(selectedPage: widget.selectedPage,sliding: 0),));
          },
          icon: const Icon(Icons.arrow_back_ios,color: AppColorsLight.primaryColor),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.transparent)
          ),
        ),
      ),
      body:
      ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Container(
                  height: 70,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15)
                  ),
                  child: TextField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Table Name',
                    ),
                    enabled: false,
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  height: 70,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15)
                  ),
                  child: TextField(
                    controller: _date,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    enabled: false,
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  height: 70,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15)
                  ),
                  child: TextFormField(
                    controller: TextEditingController(
                        text: (BookingTable.pickedHour!=null)?"${BookingTable.pickedHour!.hour}:${BookingTable.pickedHour!.minute}":""
                    ),
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.watch_later_outlined),
                      border: OutlineInputBorder(),
                      labelText: 'Selected Hour',
                    ),
                    onTap: () async{
                      TimeOfDay? hourTime = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                        initialEntryMode: TimePickerEntryMode.dial,
                      );
                      if(hourTime != null){
                        setState(() {
                          pickedHour = hourTime;
                          BookingTable.pickedHour = pickedHour;
                          BookingTable.dateTime = BookingTable.dateTime;
                        });
                      }
                    },
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Choose Your Table:",
                  style: GoogleFonts.aladin(
                    color: AppColorsLight.primaryColor,
                    fontSize: 30,
                  ),
                ),
                SizedBox(height: 20),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        buildSeatOption("Images/Seats/Four_Seats.png", 4, 1,MediaQuery.of(context).size.width * 0.3),
                        buildSeatOption("Images/Seats/Five_Seats.png", 5, 2,MediaQuery.of(context).size.width * 0.3),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        buildSeatOption("Images/Seats/Six_Seats.png", 6, 3,MediaQuery.of(context).size.width * 0.3),
                        buildSeatOption("Images/Seats/Eight_Seats.png", 8, 4,MediaQuery.of(context).size.width * 0.3),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20),

                /*Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Table Number:",style: TextStyle(
                        color: AppColorsLight.primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18
                    )),
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width*0.55,
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColorsLight.secondaryColor),
                        borderRadius: BorderRadius.circular(5)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: DropdownButton(
                          value: valueChoose,
                            dropdownColor: AppColorsLight.lightColor,
                            iconSize: 25,
                            icon: Icon(Icons.arrow_drop_down_circle_sharp),
                            iconDisabledColor: AppColorsLight.secondaryColor,
                            iconEnabledColor: AppColorsLight.primaryColor,
                            isExpanded: true,
                            underline: SizedBox(),
                            style: TextStyle(
                              color: AppColorsLight.primaryColor,
                              fontSize: 20,
                              fontWeight: FontWeight.w500

                            ),
                            items: List.generate(20,
                                    (index) => DropdownMenuItem(
                                      value: index,
                                        child: Text("${index+1}"),
                                    )
                            ) ,
                            onChanged: (value) {
                            setState(() {
                              valueChoose=value!;
                            });
                            },
                        ),
                      )
                    ),
                  ],
                ),*/

                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextButton(
                    style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.all(AppColorsLight.primaryColor),
                    ),
                    onPressed: () {
                      if(BookingTable.tableNumber!=null&&BookingTable.pickedHour!=null) {
                        BookingTable.isbook = true;
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                              builder: (context) => First(
                                  selectedPage: widget.selectedPage,
                                  sliding: 0)),
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
                              content: Text("Fill All Fields",
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
  Widget buildSeatOption(String imagePath, int seatCount,int index,double radius) {
    return InkWell(
      borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width * 0.2),
      onTap: () {
        setState(() {
          _selected1 = index;
          BookingTable.numOfSeats = seatCount;
          openAvailableTables(context,imagePath,seatCount);
        });
      },
      child: Ink(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius:
            BorderRadius.circular(MediaQuery.of(context).size.width * 0.2),
          ),
          child: Container(
            decoration: (_selected1 == index) ? dec1 : dec2,
            height: radius,
            width: radius,
            child: Stack(
              children: [
                Center(child: Image.asset(imagePath)),
                Center(
                  child: Text(
                    seatCount.toString(),
                    style: GoogleFonts.allerta(
                      color: AppColorsLight.secondaryColor.shade800,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTables(String imagePath,int index,double radius) {
    return InkWell(
      borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width * 0.2),
      onTap: () {
        setState(() {
          _selected2 = index;
          BookingTable.tableNumber=index;
          Navigator.of(context).pop();
        });
      },
      child: Ink(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius:
            BorderRadius.circular(MediaQuery.of(context).size.width * 0.2),
          ),
          child: Container(
            decoration: (_selected2 == index) ? dec1 : dec2,
            height: radius,
            width: radius,
            child: Stack(
              children: [
                Center(child: Image.asset(imagePath)),
                Center(
                  child: Text(
                    index.toString(),
                    style: GoogleFonts.allerta(
                      color: AppColorsLight.secondaryColor.shade800,
                      fontSize:(index>=10)?15:20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> openAvailableTables(BuildContext context,String imagePath,int seatCount) async {
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Row(
          children: [
            Icon(
              Icons.table_bar_rounded,
              color: AppColorsLight.primaryColor.shade400,
            ),
            SizedBox(width: 10),
            Text(
              "Available Tables",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 27,
                color: AppColorsLight.secondaryColor.shade800,
              ),
            ),
          ],
        ),
        content: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildTables(imagePath,1,MediaQuery.of(context).size.width * 0.2),
                buildTables(imagePath,2,MediaQuery.of(context).size.width * 0.2),
                buildTables(imagePath,3,MediaQuery.of(context).size.width * 0.2),
              ],
            ),
            Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 buildTables(imagePath,4,MediaQuery.of(context).size.width * 0.2),
                 buildTables(imagePath,5,MediaQuery.of(context).size.width * 0.2),
               ],
             ),
            Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 buildTables(imagePath,6,MediaQuery.of(context).size.width * 0.2),
                 buildTables(imagePath,7,MediaQuery.of(context).size.width * 0.2),
               ],
             ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildTables(imagePath,8,MediaQuery.of(context).size.width * 0.2),
                buildTables(imagePath,9,MediaQuery.of(context).size.width * 0.2),
                buildTables(imagePath,10,MediaQuery.of(context).size.width * 0.2),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildTables(imagePath,11,MediaQuery.of(context).size.width * 0.2),
                buildTables(imagePath,12,MediaQuery.of(context).size.width * 0.2),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildTables(imagePath,13,MediaQuery.of(context).size.width * 0.2),
                buildTables(imagePath,14,MediaQuery.of(context).size.width * 0.2),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildTables(imagePath,15,MediaQuery.of(context).size.width * 0.2),
                buildTables(imagePath,16,MediaQuery.of(context).size.width * 0.2),
                buildTables(imagePath,17,MediaQuery.of(context).size.width * 0.2),
              ],
            ),
          ],
        ),
       actions: [
         TextButton(
           onPressed: () {
             Navigator.of(context).pop();
           },
           child: Text(
             "Save",
             style: GoogleFonts.dmSerifDisplay(
               fontSize: 20,
               color: AppColorsLight.lightColor,
             ),
           ),
           style: ButtonStyle(
             backgroundColor: MaterialStateProperty.all(
               AppColorsLight.primaryColor.shade600,
             ),
           ),
         ),
       ],
        surfaceTintColor: AppColorsLight.lightColor,
        scrollable: true,
        ),
    );
  }

}