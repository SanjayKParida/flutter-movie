import 'package:flutter/material.dart';

class AppTheme {
  // Netflix Color Palette
  static const Color primaryColor = Color(0xFFe50914); // Netflix Red
  static const Color backgroundColor = Color(0xFF141414); // Dark Background
  static const Color darkGreyColor =
      Color(0xFF333333); // Dark Grey for Card Background
  static const Color secondaryColor = Color(0xFFb81d24); // Lighter Red
  static const Color textColor = Colors.white;
  static const Color greyColor = Color(0xFF757575); // Grey for secondary text

  // ThemeData for the app
  static ThemeData get theme {
    return ThemeData(
      brightness: Brightness.dark, // Dark Mode
      primaryColor: primaryColor,
      scaffoldBackgroundColor: backgroundColor,
      appBarTheme: const AppBarTheme(
        backgroundColor: backgroundColor,
        elevation: 0,
        titleTextStyle: TextStyle(
          color: textColor,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        iconTheme: IconThemeData(color: textColor),
      ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          color: primaryColor,
          fontSize: 32,
          fontWeight: FontWeight.bold,
        ),
        titleLarge: TextStyle(
          color: textColor,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        bodyLarge: TextStyle(
          color: textColor,
          fontSize: 16,
        ),
        bodyMedium: TextStyle(
          color: greyColor,
          fontSize: 14,
        ),
      ),
      cardTheme: CardTheme(
        color: darkGreyColor,
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(12), // Rounded corners for the card
        ),
      ),
      buttonTheme: const ButtonThemeData(
        buttonColor: primaryColor,
        textTheme: ButtonTextTheme.primary,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: primaryColor,
        foregroundColor: textColor,
      ),
      iconTheme: const IconThemeData(
        color: textColor,
      ),
      colorScheme: const ColorScheme.dark(
        primary: primaryColor,
        secondary: secondaryColor,
        background: backgroundColor,
        surface: darkGreyColor,
        onPrimary: textColor,
        onSecondary: textColor,
        onBackground: textColor,
        onSurface: textColor,
        brightness: Brightness.dark, // Set brightness to dark
      ),
    );
  }
}
