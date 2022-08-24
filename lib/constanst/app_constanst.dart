import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Sabitler {
  static const SabitRenk = Colors.indigo;
  static get ikinciRenk => Colors.blue.shade600;
  static const baslikText = 'Ortalama Hesapla';
  static final baslikStyle = GoogleFonts.quicksand(
      fontSize: 24, fontWeight: FontWeight.w900, color: Sabitler.SabitRenk);
  static BorderRadius borderRadius = BorderRadius.circular(24);
  static final TextStyle dersSayisiStyle = GoogleFonts.quicksand(
      fontSize: 16, fontWeight: FontWeight.w600, color: Sabitler.SabitRenk);
  static final TextStyle OrtalamaStyle = GoogleFonts.quicksand(
      fontSize: 55, fontWeight: FontWeight.w600, color: Sabitler.SabitRenk);
  static final TextStyle Kopenhag =
      GoogleFonts.quicksand(fontSize: 61, color: Colors.red.shade600);
  static final dropDownPadding =
      EdgeInsets.symmetric(horizontal: 16, vertical: 8);
  static final yatay = EdgeInsets.symmetric(horizontal: 8);
}
