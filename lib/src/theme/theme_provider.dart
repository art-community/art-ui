import 'package:flutter/material.dart';

ThemeData provideTheme() {
  var base = ThemeData.dark();
  return base.copyWith(
      useMaterial3: true,
      scaffoldBackgroundColor: Color(0x18181C),
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
        textStyle: TextStyle(
          fontFamily: "Proxima Nova",
        ),
      )));
}
