import 'package:flutter/material.dart';

final ThemeData appTheme = ThemeData(
  primarySwatch: Colors.blue,
  fontFamily: 'Lato',
  textTheme: TextTheme(
    headline1: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue),
    bodyText1: TextStyle(fontSize: 16, color: Colors.black),
    bodyText2: TextStyle(fontSize: 14, color: Colors.grey),
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: Colors.orange,
    textTheme: ButtonTextTheme.primary,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.orange,
      textStyle: TextStyle(fontSize: 18),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(),
    labelStyle: TextStyle(color: Colors.blue),
  ),
);
