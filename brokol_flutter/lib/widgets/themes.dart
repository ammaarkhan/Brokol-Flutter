import 'package:flutter/material.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
      primarySwatch: Colors.green,
      appBarTheme: AppBarTheme(
        color: Colors.greenAccent[700],
        // elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
        titleTextStyle: TextStyle(color: Colors.black, fontSize: 25),
      ));

  // static ThemeData darkTheme(BuildContext context) => ThemeData(
  //       brightness: Brightness.dark,
  //     );
}
