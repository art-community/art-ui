import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

const DefaultBackgroundColor = Color(0xFF18181C);
const DefaultPrimaryColor = Color(0xFF40A3FF);
const DefaultTextColor = White;
const DefaultBorderColor = DefaultPrimaryColor;
const DefaultShadowColor = Color.fromARGB(25, 64, 163, 255);
const Black = Color(0xFF000000);
const White = Color(0xFFFFFFFF);
const Transparent = Color(0x00000000);

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

  ColorsTheme copyWith(
          {Color? backgroundColor,
          Color? primaryColor,
          Color? textColor,
          Color? borderColor,
          Color? shadowColor}) =>
      ColorsTheme(
          backgroundColor: backgroundColor ?? this.backgroundColor,
          primaryColor: primaryColor ?? this.primaryColor,
          textColor: textColor ?? this.textColor,
          borderColor: borderColor ?? this.borderColor,
          shadowColor: shadowColor ?? this.shadowColor);

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

  ButtonTheme copyWith({TextStyle? textStyle}) =>
      ButtonTheme(textStyle: textStyle ?? this.textStyle);

  static final defaultTheme =
      ButtonTheme(textStyle: TextTheme.defaultTheme.button);
}

class Theme {
  final ColorsTheme colors;
  final TextTheme text;
  final ButtonTheme button;

  Theme({required this.colors, required this.text, required this.button});

  Theme copyWith({ColorsTheme? colors, TextTheme? text, ButtonTheme? button}) =>
      Theme(
          colors: colors ?? this.colors,
          text: text ?? this.text,
          button: button ?? this.button);

  static final defaultTheme = Theme(
    colors: ColorsTheme.defaultTheme,
    text: TextTheme.defaultTheme,
    button: ButtonTheme.defaultTheme,
  );
}

class _InheritedTheme extends InheritedTheme {
  const _InheritedTheme({
    Key? key,
    required this.provider,
    required Widget child,
  }) : super(key: key, child: child);

  final ThemeProvider provider;

  @override
  Widget wrap(BuildContext context, Widget child) {
    return ThemeProvider(theme: provider.theme, child: child);
  }

  @override
  bool updateShouldNotify(_InheritedTheme old) =>
      provider.theme != old.provider.theme;
}

class ThemeProvider extends StatelessWidget {
  final Theme theme;
  final Widget child;

  ThemeProvider({Key? key, required this.theme, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) =>
      _InheritedTheme(provider: this, child: child);
}

extension ThemeExtension on BuildContext {
  Theme theme() {
    var found = this
        .dependOnInheritedWidgetOfExactType<_InheritedTheme>()
        ?.provider
        .theme;
    return found ?? Theme.defaultTheme;
  }
}
