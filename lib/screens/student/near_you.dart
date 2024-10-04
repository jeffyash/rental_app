import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:moon_design/moon_design.dart';

class NearYouPage extends StatefulWidget {
  const NearYouPage({super.key});

  @override
  State<NearYouPage> createState() => _NearYouPageState();
}

class _NearYouPageState extends State<NearYouPage> {
  final List<Map<String, dynamic>> _items = [
    {
      'image': 'images/villa.jpg',
      'title': 'Santa Area, 285',
      'name': 'ST Colin Louis 803',
    },
    {
      'image': 'images/villa.jpg',
      'title': 'Santa Area, 286',
      'name': 'ST Colin Louis 803',
    },
    {
      'image': 'images/villa.jpg',
      'title': 'Santa Area, 287',
      'name': 'ST Colin Louis 803',
    },
    {
      'image': 'images/villa.jpg',
      'title': 'Santa Area, 288',
      'name': 'ST Colin Louis 803',
    },
  ];

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              children: [
                Text(
                  "Best for you",
                  style: GoogleFonts.poppins(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          CarouselSlider.builder(
            itemCount: _items.length,
            options: CarouselOptions(
              height: 392, // Height of the carousel
              enlargeCenterPage: true, // Enlarge center item
              enableInfiniteScroll: true,
              autoPlay: true, // Auto slide
              autoPlayInterval: const Duration(seconds: 3),
              viewportFraction: 0.85, // Slightly smaller non-centered items to prevent overflow
            ),
            itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
              final item = _items[itemIndex];
              return Container(
                margin: const EdgeInsets.all(2), // Space between cards
                width: 284,
                height: 392,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10), // Image border radius
                      child: Image.asset(
                        item['image'] ?? 'images/default_image.jpg', // Fallback image in case of null
                        width: 251,
                        height: 210,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 12), // Spacing between image and text

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.location_on_outlined, color: Color(0xFF818181)),
                        Text(
                          item['title'] ?? 'Unknown location', // Handle null values
                          style: GoogleFonts.openSans(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8), // Space between rows
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          item['name'] ?? 'Unknown name', // Display the name
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 29,
                          height: 29,
                          decoration: BoxDecoration(
                            color: Color(0xFFF3F3F3), // Background color
                            shape: BoxShape.circle, // Circular shape
                          ),
                          child: Icon(
                            MoonIcons.travel_bed_24_light,
                            size: 20, // Icon size inside the circle
                            color: Colors.black, // Set the icon color
                          ),
                        ),
                        const SizedBox(width: 8), // Space between the circle and text
                        Text(
                          "2 Bedroom",
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                              fontSize: 10, // Text size
                              fontWeight: FontWeight.w500, // Text weight
                            ),
                          ),
                        ),
                        const SizedBox(width: 16), // Space between the two icons

                        // Second icon wrapped in a circle
                        Container(
                          width: 31,
                          height: 31,
                          decoration: BoxDecoration(
                            color: Color(0xFFF3F3F3), // Background color
                            shape: BoxShape.circle, // Circular shape
                          ),
                          child: Center(
                            child: FaIcon(
                              FontAwesomeIcons.bath,
                              size: 16, // Icon size
                              color: Colors.black, // Set the icon color
                            ),
                          ),
                        ),
                        const SizedBox(width: 8), // Space between the circle and text
                        Text(
                          "2 Bathroom",
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                              fontSize: 10, // Text size
                              fontWeight: FontWeight.w500, // Text weight
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          )

        ],
      ),
    );
  }
}
