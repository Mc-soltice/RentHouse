// import 'dart:ui';
import 'package:flutter/material.dart';

var kBlueColor = const Color(0xFF1DA1F2);
var kBackgroundColor = const Color(0xFFf9f9fa);
const kFontColor = Color(0xFF657786);
const kBlueTextColor = Color(0xFF1e98d0);
const  buttonColor =  Color(0xff002140);

class TColors {
  TColors._(); // constructeur privé pour empêcher l'instanciation

  // App Basic Colors
  static const Color white = Colors.white;
  static const Color primary = Color(0xFF4b68ff);
  static const Color secondary = Color(0xFFFFE24B);
  static const Color accent = Color(0xFFb0c7ff);

  // Text Colors
  static const Color textPrimary = Color(0xFF333333);
  static const Color textSecondary = Color(0xFF6C757D);
  static const Color textwhite = Colors.white;

  // Backgrround Colors
  static const Color light = Color(0xFFF6F6F6);
  static const Color dark = Color(0xFF272727);
  static const Color primaryBackground = Color(0xFFF3F5FF);

  // Background Container Colors
  static const Color lightContainer = Color(0xFFF6F6F6);
  static final Color darkContainer = TColors.white.withAlpha(25);

  // Button Colors
  static const Color buttonPrimary = Color(0xFF4b68ff);
  static const Color buttonSecondary = Color(0xFF6C757D);
  static const Color buttonDisabled = Color(0xFFC4C4C4);

  // Border Colors
  static const Color borderPrimary = Color(0xFFD9D9D9);
  static const Color borderSecondary = Color(0xFFE6E6E6);

  // Error and validation Colors
  static const Color error = Color(0xFFD32F2F);
  static const Color success = Color(0xFF388E3C);
  static const Color warning = Color(0xFFFFC700);
  static const Color info = Color(0xFF1976D2);
}
