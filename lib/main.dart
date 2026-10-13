import 'package:flutter/material.dart';
import 'package:pawshome/theme.dart';
import 'signin/signin.dart'; 

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.light;

  void _toggleTheme() {
    setState(() {
      _themeMode =
          _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PawsHome',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: _themeMode,
      debugShowCheckedModeBanner: false,
      home: SignInPage(
        themeMode: _themeMode,
        onToggleTheme: _toggleTheme,
      ),
    );
  }
}
