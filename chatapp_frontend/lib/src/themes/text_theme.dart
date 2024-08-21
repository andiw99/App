import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTextTheme {
  static TextTheme lightTextTheme = const TextTheme(
    displayMedium: TextStyle(color: Colors.black87),// GoogleFonts.montserrat(color: Colors.black87),
    headlineMedium: TextStyle(color: Colors.blueGrey, fontSize: 24), //GoogleFonts.poppins(color: Colors.blueGrey, fontSize: 24),
  );
  static TextTheme darkTextTheme = const TextTheme(
    displayMedium: TextStyle(color: Colors.white70), // GoogleFonts.montserrat(color: Colors.white70),
    headlineMedium: TextStyle(color: Colors.white60, fontSize: 24) //GoogleFonts.poppins(color: Colors.white60, fontSize: 24),
  );
}