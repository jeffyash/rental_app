import 'package:flutter/material.dart';
import 'package:circle_progress_bar/circle_progress_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rentalapp/screens/student/near_you.dart';
import 'package:rentalapp/ui_elements/dot_painter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0; // Track the current index of the BottomNavigationBar

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 5, // Number of tabs
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          title: Padding(
            padding: const EdgeInsets.all( 8.0),
            child: Text(
              "Home",
              style: GoogleFonts.poppins(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right:25.0),
              child: Stack(
                alignment: Alignment.center, // Center the CircleAvatar over the progress bar
                children: [
                  // Circular Progress Bar
                  SizedBox(
                    width: 50,
                    height: 50,
                    child: CircleProgressBar(
                      strokeWidth: 2,
                      backgroundColor: Colors.grey.shade300,
                      value: 0.25,
                      foregroundColor: Color(0xFF64E7E9),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: const CircleAvatar(
                      radius: 21, // Adjust the radius accordingly
                      backgroundImage: NetworkImage(
                        "https://media.istockphoto.com/id/1317804578/photo/one-businesswoman-headshot-smiling-at-the-camera.jpg?s=612x612&w=0&k=20&c=EqR2Lffp4tkIYzpqYh8aYIPRr-gmZliRHRxcQC5yylY=",
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        body: Container(
          width: screenWidth,
          height: screenHeight,
          child: Column(
            children: [

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 268,
                    height: 48,
                    child: TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xFFF5F5F5),
                        hintText: 'Search Place...',
                        hintStyle: GoogleFonts.openSans(
                          fontSize: 14,
                          color: const Color(0xFFD1D1D1),
                        ),
                        prefixIcon: Icon(
                          Icons.search,
                          size: 20,
                          color: const Color(0xFFD1D1D1),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  PopupMenuButton<String>(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    shadowColor: Colors.black,
                    color: Colors.white, // White background
                    elevation:0.5, // No elevation
                    offset: Offset(0, 70),
                    icon: Container(
                      width: 46,
                      height: 46,
                      decoration: BoxDecoration(
                        color: const Color(0xFF464646),
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image(
                          image: AssetImage("images/page_info.png"),
                          fit: BoxFit.contain,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    itemBuilder: (BuildContext context) {
                      return [
                        PopupMenuItem<String>(
                          value: 'Location',
                          child: Container(
                            width: 197,
                            height: 40,
                            child: Text('Location', style: GoogleFonts.poppins()),
                          ),
                        ),
                        PopupMenuItem<String>(
                          value: 'Choices',
                          child: Container(
                            width: 197,
                            height: 40,
                            child: Text('Choices', style: GoogleFonts.poppins()),
                          ),
                        ),
                        PopupMenuItem<String>(
                          value: 'Rent',
                          child: Container(
                            width: 197,
                            height: 40,
                            child: Text('Rent', style: GoogleFonts.poppins()),
                          ),
                        ),
                        PopupMenuItem<String>(
                          value: 'Duration',
                          child: Container(
                            width: 197,
                            height: 40,
                            child: Text('Duration', style: GoogleFonts.poppins()),
                          ),
                        ),
                        PopupMenuItem<String>(
                          value: 'Room sharing type',
                          child: Container(
                            width: 197,
                            height: 40,
                            child: Text('Room Sharing Type', style: GoogleFonts.poppins()),
                          ),
                        ),
                        PopupMenuItem<String>(
                          value: 'BHK',
                          child: Container(
                            width: 197,
                            height: 40,
                            child: Text('BHK', style: GoogleFonts.poppins()),
                          ),
                        ),
                        PopupMenuItem<String>(
                          value: 'Parking',
                          child: Container(
                            width: 197,
                            height: 40,
                            child: Text('Parking', style: GoogleFonts.poppins()),
                          ),
                        ),
                      ];
                    },
                    onSelected: (String value) {
                      print('Selected: $value');
                    },
                  )

                ],
              ),
              const SizedBox(height: 12),
              // Add TabBar
              Padding(
                padding: const EdgeInsets.only(left: 12),
                child: TabBar(
                  tabAlignment: TabAlignment.start,
                  dividerColor: Colors.transparent,
                  labelColor: Colors.black,
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                  unselectedLabelColor: Colors.grey,
                  unselectedLabelStyle: GoogleFonts.poppins(
                    fontWeight: FontWeight.normal,
                  ),
                  indicator: DotIndicator(), // Custom dot indicator
                  isScrollable: true,
                  labelStyle: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                  ),
                  tabs: [
                    Tab(text: "Popular"),
                    Tab(text: "Near You!"),
                    Tab(text: "Home"),
                    Tab(text: "Apartment"),
                    Tab(text: "Shop"),
                  ],
                ),
              ),


              Expanded(
                child: TabBarView(
                  children: [
                    Center(child: Text("Popular Content")),
                    Container(child: NearYouPage()),
                    Center(child: Text("Home Content")),
                    Center(child: Text("Apartment Content")),
                    Center(child: Text("Shop Content")),
                  ],
                ),
              ),

            ],
          ),
        ),
        bottomNavigationBar:  Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white, // Background color
                borderRadius: BorderRadius.all(
                 Radius.circular(20),
                ),
                border: Border.all(
                  color: Color(0xFFF6F5F5), // Border color
                  width: 1, // Border width
                ),
              ),
              child: BottomNavigationBar(
                currentIndex: _currentIndex,
                onTap: (index) {
                  setState(() {
                    _currentIndex = index; // Update the index on tap
                  });
                },
                iconSize: 22,
                backgroundColor: Colors.transparent, // Ensuring background is transparent so container is visible
                elevation:0, // Remove shadow for flat appearance
                type: BottomNavigationBarType.fixed,
                showSelectedLabels: false, // Hide labels for selected items
                showUnselectedLabels: false, // Hide labels for unselected items
                selectedItemColor: Colors.white, // Color for the selected icon
                unselectedItemColor: Colors.black, // Color for unselected icons
                selectedIconTheme: IconThemeData(color: Colors.white), // Customize the selected icon color
                unselectedIconTheme: IconThemeData(color: Colors.black),
                items:  <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(Icons.explore_outlined), // Default icon
                    activeIcon: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(20) ,// This ensures the shape is circular
                        color: Color(0xFF40A69F), // Circle background color when selected
                      ),
                      padding: EdgeInsets.all(8), // Adjust padding for the circle size
                      child: Icon(
                        Icons.explore_outlined,
                      ),
                    ),
                    label: 'Explore', // Label for accessibility
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.favorite_outline_outlined), // Default icon
                    activeIcon: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFF40A69F), // Circle background color when selected
                      ),
                      padding: EdgeInsets.all(8), // Adjust padding for the circle size
                      child: Icon(
                        Icons.favorite_outline_outlined,
                      ),
                    ),
                    label: 'Favorites', // Label for accessibility
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.notifications_outlined), // Default icon
                    activeIcon: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFF40A69F), // Circle background color when selected
                      ),
                      padding: EdgeInsets.all(8), // Adjust padding for the circle size
                      child: Icon(
                        Icons.notifications_outlined,
                      ),
                    ),
                    label: 'Notifications', // Label for accessibility
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.chat_bubble_outline_outlined), // Default icon
                    activeIcon: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFF40A69F), // Circle background color when selected
                      ),
                      padding: EdgeInsets.all(8), // Adjust padding for the circle size
                      child: Icon(
                        Icons.chat_bubble_outline_outlined,
                      ),
                    ),
                    label: 'Chat', // Label for accessibility
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person_outline_sharp), // Default icon
                    activeIcon: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFF40A69F), // Circle background color when selected
                      ),
                      padding: EdgeInsets.all(8), // Adjust padding for the circle size
                      child: Icon(
                        Icons.person_outline_sharp,
                      ),
                    ),
                    backgroundColor: Colors.grey[200], // Customize background color
                    label: 'Profile', // Label for accessibility
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}



