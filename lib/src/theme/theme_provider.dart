import 'package:flutter/painting.dart';

const DefaultBackgroundColor = Color(0xFF18181C);
const DefaultPrimaryColor = Color(0xFF40A3FF);
const DefaultTextColor = Color(0xFF1A1B21);
const DefaultBorderColor = Color.fromARGB(25, 0, 0, 0);
const DefaultShadowColor = Color.fromARGB(25, 64, 163, 255);
const Black = Color(0xFF000000);
const White = Color(0xFFFFFFFF);

class ColorsTheme {
  final Color backgroundColor;
  final Color primaryColor;
  final Color textColor;
  final Color borderColor;
  final Color shadowColor;

  ColorsTheme(
      {required this.backgroundColor,
      required this.primaryColor,
      required this.textColor,
      required this.borderColor,
      required this.shadowColor});

  static final defaultTheme = ColorsTheme(
      backgroundColor: DefaultBackgroundColor,
      primaryColor: DefaultPrimaryColor,
      textColor: DefaultTextColor,
      borderColor: DefaultBorderColor,
      shadowColor: DefaultShadowColor);
}

class TextTheme {
  final TextStyle button;

  TextTheme({required this.button});

  static final defaultTheme = TextTheme(
      button: TextStyle(
          fontFamily: "Proxima Nova",
          fontSize: 24,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
          color: ColorsTheme.defaultTheme.textColor));
}

class ButtonTheme {
  final TextStyle textStyle;

  ButtonTheme({required this.textStyle});

  static final defaultTheme =
      ButtonTheme(textStyle: TextTheme.defaultTheme.button);
}

class Theme {
  final ColorsTheme colors;
  final TextTheme text;
  final ButtonTheme button;

  Theme({required this.colors, required this.text, required this.button});

  static final defaultTheme = Theme(
    colors: ColorsTheme.defaultTheme,
    text: TextTheme.defaultTheme,
    button: ButtonTheme.defaultTheme,
  );
}
