import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant/Pages/Settings/Favorite.dart';
import 'package:restaurant/Pages/Settings/Profile.dart';
import 'package:restaurant/Pages/Settings/about_us.dart';
import 'package:restaurant/Pages/Settings/Cart.dart';
import 'package:restaurant/Pages/Settings/privacy_policy.dart';
import 'package:restaurant/Pages/Settings/terms_conditions.dart';
import 'package:restaurant/theme/app_color.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Settings extends StatefulWidget {
  final Function updateTheme;
  final int selectedPage;
  const Settings({super.key,required this.selectedPage,required this.updateTheme});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title:
        Center(
          child: Text(
              "Settings",
              style: GoogleFonts.aladin(
                color: AppColors.primaryColor,
                fontSize: 45,
              )
          ),
        ),
      ),

      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15.0,right: 10.0,left: 10.0),
            child: Column(
              children: [
                Tooltip(
                  message: 'Edit Profile',
                  child: InkWell(
                    borderRadius: BorderRadius.circular(15),
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Profile(),)
                      );
                    },
                    child: Ink(
                        child: BuildContainer("Profile", Icons.person)
                    ),
                  ),
                ),

                SizedBox(height: 15,),

                InkWell(
                  borderRadius: BorderRadius.circular(15),
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) =>Cart(),
                        )
                    );
                  },
                  child: Ink(
                    child: Tooltip(
                        message: 'Go To Cart',
                        child: BuildContainer("My Cart", Icons.shopping_cart)
                    ),
                  ),
                ),

                SizedBox(height: 15,),

                InkWell(
                  borderRadius: BorderRadius.circular(15),
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) =>
                            Favorite(),
                        )
                    );
                  },
                  child: Ink(
                    child: Tooltip(
                        message: 'Go To My Favorites',
                        child: BuildContainer("My Favorites", Icons.favorite)
                    ),
                  ),
                ),

                SizedBox(height: 15,),

                Container(
                  decoration: BoxDecoration(
                      color: (AppColors.darkMode==false)
                          ?AppColors.secondaryColor.shade200
                          :AppColors.secondaryColor.shade900,
                      borderRadius: BorderRadius.circular(15)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0,right: 15,bottom: 10,top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.sunny,color: AppColors.primaryColor,size: 25),
                            SizedBox(width: 10,),
                            Text("Dark Mode",
                                style: TextStyle(color: AppColors.primaryColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500)
                            ),
                          ],
                        ),
                        Container(
                          height: 30,
                          child: Switch(
                            activeColor: AppColors.primaryColor,
                            value: AppColors.darkMode,
                            onChanged: (value) async {
                              AppColors.darkMode = value;
                              final prefs = await SharedPreferences.getInstance();
                              await prefs.setBool('darkMode', value);
                              widget.updateTheme();
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 50,),

                InkWell(
                  borderRadius: BorderRadius.circular(15),
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => PrivacyPolicy(),)
                    );
                  },
                  child: Ink(
                    child: Tooltip(
                        message: 'Read Privacy Policy',
                        child: BuildContainer("Privacy Policy", Icons.contact_page_outlined)
                    ),
                  ),
                ),

                SizedBox(height: 15,),

                InkWell(
                  borderRadius: BorderRadius.circular(15),
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => TermsConditions(),)
                    );
                  },
                  child: Ink(
                    child: Tooltip(
                        message: 'Read Terms & Conditions',
                        child: BuildContainer("Terms & Conditions", Icons.contact_page)
                    ),
                  ),
                ),

                SizedBox(height: 15,),

                InkWell(
                  borderRadius: BorderRadius.circular(15),
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => AboutUs(),)
                    );
                  },
                  child: Ink(
                    child: Tooltip(
                        message: 'About Us',
                        child: BuildContainer("About Us", Icons.question_mark_outlined)
                    ),
                  ),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
  Widget BuildContainer(String name,IconData icon){
    return Container(
      decoration: BoxDecoration(
        color: (AppColors.darkMode==false)
            ?AppColors.secondaryColor.shade200
          :AppColors.secondaryColor.shade900,
        borderRadius: BorderRadius.circular(15)
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 15.0,right: 15,bottom: 10,top: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(icon,color: AppColors.primaryColor,size: 25),
                SizedBox(width: 10,),
                Text("$name",
                    style: TextStyle(color: AppColors.primaryColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w500)),
              ],
            ),
            Icon(Icons.chevron_right,
              color: AppColors.primaryColor,
              size:22 ,
            ),
          ],
        ),
      ),
    );
  }
}

