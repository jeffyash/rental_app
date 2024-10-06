import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moon_design/moon_design.dart';
import 'package:rentalapp/screens/auth/registration_screen.dart';
class SelectUserRole extends StatelessWidget {
  const SelectUserRole({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Image(
            color: Colors.black.withOpacity(0.5),  // Adjust opacity for fade effect
            colorBlendMode: BlendMode.darken,      // Blend mode to darken the image
            image: AssetImage("images/userrole_bg.jpg"),
            width: screenWidth,
            height: screenHeight,
            fit: BoxFit.cover,
          ),
          Positioned(
            top: 150,
            left: (screenWidth - 282) / 2,
            child: SizedBox(
              width: 282,
              height: 140,
              child: Text(
                "Which one you\n choose",
                style: GoogleFonts.inter(
                  textStyle: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),

          Positioned(
            top: 330,
            left: (screenWidth - 300) / 2,  // Center the button horizontally with equal left and right margins
            child: Column(
              children: [
                MoonFilledButton(
                  backgroundColor: const Color(0xFF40A69F),
                  height: 60,
                  width: 300,  // Button width
                  buttonSize: MoonButtonSize.lg,
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => CreateAccountPage()));
                  },
                  label: Text(
                    "Student",
                    style: GoogleFonts.roboto(
                      textStyle: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text("Or",style: GoogleFonts.roboto(
                  textStyle:TextStyle(
                      fontSize:20,
                      fontWeight:FontWeight.w600,
                      color:Colors.white
                  ),

                ),
                ),
                SizedBox(
                  height: 10,
                ),
                MoonFilledButton(
                  backgroundColor: const Color(0xFF40A69F),
                  height: 60,
                  width: 300,  // Button width
                  buttonSize: MoonButtonSize.lg,
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => CreateAccountPage()));
                  },
                  label: Text(
                    "Owner",
                    style: GoogleFonts.roboto(
                      textStyle: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
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
}
