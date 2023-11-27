import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant/Pages/Main.dart';

class Profile extends StatefulWidget {
  final int selectedPage;
  const Profile({super.key,required this.selectedPage});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title:
        Text(
            "Profile",
            style: GoogleFonts.aladin(
              color: Colors.deepOrange,
              fontSize: 45,
            )
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => Main(selectedPage: widget.selectedPage),));
          },
          icon: const Icon(Icons.arrow_back_ios,color: Colors.deepOrange),),
      ),

      body: Center(
        child: Container(color: Colors.white,
          child: Text("Coming Soon....",style: TextStyle(color: Colors.deepOrange,fontSize: 50,fontWeight: FontWeight.w500)),
        ),
      ),
    );
  }
}

