import 'package:flutter/material.dart';

// Colors

// Light Mode
// Background color
const Color lightBackground = Color(0xFFF5EFEB);
// Primary text
const Color lightPrimaryText = Color(0xFF455763);
// Tabs
const Color lightSecondaryBackground = Color(0xFFFFFFFF);
const Color lightIcon = Color(0xFF455763);

// Dark Mode
// Background color
const Color darkBackground = Color(0xFF0D0D0F);
// Primary text
const Color darkPrimaryText = Color(0xFFFFFFFF);
// Tabs
const Color darkSecondary = Color(0xFFF5EFEB);
const Color darkIcon = Color(0xFFFFFFFF);

// Light Theme
final ThemeData lightTheme = ThemeData(
  fontFamily: 'CrimsonText',
  brightness: Brightness.light,
  scaffoldBackgroundColor: lightBackground,
  primaryColor: lightPrimaryText,
  iconTheme: const IconThemeData(color: lightPrimaryText),
  textTheme: const TextTheme(
    bodyMedium: TextStyle(color: lightPrimaryText),
    bodySmall: TextStyle(color: lightPrimaryText),
    bodyLarge: TextStyle(color: lightPrimaryText),
  ),

  appBarTheme: const AppBarTheme(
    iconTheme: IconThemeData(color: lightIcon),
    actionsIconTheme: IconThemeData(color: lightIcon),
    backgroundColor: lightBackground,
    foregroundColor: lightPrimaryText,
    shadowColor: lightBackground,  
    surfaceTintColor: lightBackground,
  ),

  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Color(0xFF455763),
    selectedItemColor: Color(0xFF0D0D0F),
    unselectedItemColor: Color(0xFFF5EFEB),
    showSelectedLabels: true,
    showUnselectedLabels: true,
  ),

  inputDecorationTheme: InputDecorationTheme(
    labelStyle: TextStyle(color: lightPrimaryText),
    prefixIconColor: lightPrimaryText,
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: lightPrimaryText),
    ),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: lightPrimaryText.withOpacity(0.7)),
    ),
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: lightPrimaryText, // button background
      foregroundColor: lightSecondaryBackground, // text color
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      elevation: 0,
    ),
  ),
);

// Dark Theme
final ThemeData darkTheme = ThemeData(
  fontFamily: 'CrimsonText',
  brightness: Brightness.dark,
  scaffoldBackgroundColor: darkBackground,
  primaryColor: darkPrimaryText,
  textTheme: const TextTheme(
    bodyMedium: TextStyle(color: darkPrimaryText),
    bodySmall: TextStyle(color: darkPrimaryText),
    bodyLarge: TextStyle(color: darkPrimaryText),
  ),
  

  iconTheme: const IconThemeData(color: darkPrimaryText),
  appBarTheme: const AppBarTheme(
    iconTheme: IconThemeData(color: darkIcon),
    actionsIconTheme: IconThemeData(color: darkIcon),
    backgroundColor: Color(0xFF0D0D0F),
    foregroundColor: darkPrimaryText,
    shadowColor: darkBackground,  
    surfaceTintColor: darkBackground,
  ),

  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Color(0xFF0D0D0F),
    selectedItemColor: Color(0xFF455763),
    unselectedItemColor: Color(0xFFFFFFFF),
    showSelectedLabels: true,
    showUnselectedLabels: true,
  ),

  inputDecorationTheme: InputDecorationTheme(
    labelStyle: TextStyle(color: darkPrimaryText),
    prefixIconColor: darkIcon,
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: darkPrimaryText),
    ),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: darkPrimaryText.withOpacity(0.7)),
    ),
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: lightPrimaryText, 
      foregroundColor: darkPrimaryText, 
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      elevation: 0,
    ),
  ),
);
