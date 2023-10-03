import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotel_app/models/hotel.dart';
import 'package:hotel_app/screens/HomePage.dart';
import 'package:hotel_app/screens/Test.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Color(0xff121212),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
      ),
      title: 'Flutter Demo',
      home: HomePage(HotelData: dummyData),
    );
  }
}
