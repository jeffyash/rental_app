import 'package:flutter/material.dart';
import 'package:rentalapp/screens/auth/registration_screen.dart';

void main() {
  runApp( const RentalApp());
}

class RentalApp extends StatelessWidget {
  const RentalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Rental App",
      debugShowCheckedModeBanner: false,
      home: CreateAccountPage(),
    );
  }
}

