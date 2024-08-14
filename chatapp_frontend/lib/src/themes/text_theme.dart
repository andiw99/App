import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTextTheme {
  static TextTheme lightTextTheme = TextTheme(
    displayMedium: GoogleFonts.montserrat(color: Colors.black87),
    headlineMedium: GoogleFonts.poppins(color: Colors.blueGrey, fontSize: 24),
  );
  static TextTheme darkTextTheme = TextTheme(
    displayMedium: GoogleFonts.montserrat(color: Colors.white70),
    headlineMedium: GoogleFonts.poppins(color: Colors.white60, fontSize: 24),
  );
}