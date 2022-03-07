import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

final DefaultBackgroundColor = Color(0xFF18181C);
final DefaultTextBlackColor = Color(0xFF1A1B21);
final DefaultPaneColor = Color(0xFF272834);
final DefaultWhiteColor = Color(0xFFFAFBFC);
final DefaultPrimaryColor = Color(0xFF40A3FF);
final DefaultShadowColor = Color.fromARGB(25, 64, 163, 255);
final DefaultHoverColor = Color(0xFF0063BF);
final Black = Color(0xFF000000);
final White = Color(0xFFFFFFFF);
final Transparent = Color(0x00000000);

final ProximaNovaFont = "Proxima Nova";

class Spacing {
  final double extraSmall;
  final double small;
  final double medium;
  final double large;
  final double extraLarge;

  Spacing(
      this.extraSmall, this.small, this.medium, this.large, this.extraLarge);
}

class SpacingTheme {
  final Spacing verticalSpacing;
  final Spacing fullSpacing;

  SpacingTheme({required this.verticalSpacing, required this.fullSpacing});

  SpacingTheme copyWith({Spacing? verticalSpacing, Spacing? fullSpacing}) =>
      SpacingTheme(
          verticalSpacing: verticalSpacing ?? this.verticalSpacing,
          fullSpacing: fullSpacing ?? this.fullSpacing);

  static final defaultTheme = SpacingTheme(
      fullSpacing: Spacing(4, 8, 16, 24, 32),
      verticalSpacing: Spacing(4, 6, 8, 16, 24));
}

class ColorsTheme {
  final Color backgroundColor;
  final Color primaryColor;
  final Color blackTextColor;
  final Color hoverColor;
  final Color whiteColor;
  final Color shadowColor;
  final Color paneColor;

  ColorsTheme(
      {required this.backgroundColor,
      required this.primaryColor,
      required this.blackTextColor,
      required this.whiteColor,
      required this.shadowColor,
      required this.hoverColor,
      required this.paneColor});

  ColorsTheme copyWith(
          {Color? backgroundColor,
          Color? primaryColor,
          Color? paneColor,
          Color? blackTextColor,
          Color? whiteColor,
          Color? hoverColor,
          Color? shadowColor}) =>
      ColorsTheme(
          backgroundColor: backgroundColor ?? this.backgroundColor,
          paneColor: paneColor ?? this.paneColor,
          primaryColor: primaryColor ?? this.primaryColor,
          blackTextColor: blackTextColor ?? this.blackTextColor,
          whiteColor: whiteColor ?? this.whiteColor,
          hoverColor: hoverColor ?? this.hoverColor,
          shadowColor: shadowColor ?? this.shadowColor);

  static final defaultTheme = ColorsTheme(
      backgroundColor: DefaultBackgroundColor,
      paneColor: DefaultPaneColor,
      primaryColor: DefaultPrimaryColor,
      blackTextColor: DefaultTextBlackColor,
      hoverColor: DefaultHoverColor,
      whiteColor: DefaultWhiteColor,
      shadowColor: DefaultShadowColor);
}

class TextTheme {
  final TextStyle button;

  TextTheme({required this.button});

  static final defaultTheme = TextTheme(
      button: TextStyle(
          fontFamily: ProximaNovaFont,
          fontSize: 24,
          fontWeight: FontWeight.w600,
          fontStyle: FontStyle.normal));
}

class Theme {
  final SpacingTheme spacing;
  final ColorsTheme colors;
  final TextTheme text;

  Theme({required this.spacing, required this.colors, required this.text});

  Theme copyWith(
          {SpacingTheme? spacing, ColorsTheme? colors, TextTheme? text}) =>
      Theme(
          spacing: spacing ?? this.spacing,
          colors: colors ?? this.colors,
          text: text ?? this.text);

  static final defaultTheme = Theme(
    spacing: SpacingTheme.defaultTheme,
    colors: ColorsTheme.defaultTheme,
    text: TextTheme.defaultTheme,
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
