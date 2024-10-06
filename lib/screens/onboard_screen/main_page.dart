import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moon_design/moon_design.dart';
import 'package:rentalapp/screens/onboard_screen/user_role.dart';

class OnboardPage extends StatelessWidget {
  const OnboardPage({super.key});

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
            image: AssetImage("images/onboard_image.jpg"),
            width: screenWidth,
            height: screenHeight,
            fit: BoxFit.fitHeight,
          ),
          Positioned(
            top: 150,
            left: (screenWidth - 282) / 2,
            child: SizedBox(
              width: 282,
              height: 140,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Find your dream\n home easily",
                    style: GoogleFonts.inter(
                      textStyle: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Find budget-friendly, comfortable student\n housing with just one tap.",
                    style: GoogleFonts.inter(
                      textStyle: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 680,
            left: (screenWidth - 300) / 2,  // Center the button horizontally with equal left and right margins
            child: MoonFilledButton(
              backgroundColor: const Color(0xFF40A69F),
              height: 60,
              width: 300,  // Button width
              buttonSize: MoonButtonSize.lg,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SelectUserRole()));
              },
              label: Text(
                "Get Started",
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
