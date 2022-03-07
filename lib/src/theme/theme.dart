import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../constants/constants.dart';
import '../model/spacing.dart';

class SpacingTheme {
  final Spacing verticalSpacing;
  final Spacing fullSpacing;

  SpacingTheme({required this.verticalSpacing, required this.fullSpacing});

  SpacingTheme copyWith({Spacing? verticalSpacing, Spacing? fullSpacing}) =>
      SpacingTheme(
          verticalSpacing: verticalSpacing ?? this.verticalSpacing,
          fullSpacing: fullSpacing ?? this.fullSpacing);

  static final defaultTheme = SpacingTheme(
      fullSpacing: Spacing(4, 6, 8, 16, 32),
      verticalSpacing: Spacing(4, 6, 8, 16, 24));
}

class ColorsTheme {
  final Color backgroundColor;
  final Color primaryColor;
  final Color blackTextColor;
  final Color whiteTextColor;
  final Color hoverColor;
  final Color shadowColor;
  final Color paneColor;

  ColorsTheme(
      {required this.backgroundColor,
      required this.primaryColor,
      required this.blackTextColor,
      required this.whiteTextColor,
      required this.shadowColor,
      required this.hoverColor,
      required this.paneColor});

  ColorsTheme copyWith(
          {Color? backgroundColor,
          Color? primaryColor,
          Color? paneColor,
          Color? blackTextColor,
          Color? whiteTextColor,
          Color? hoverColor,
          Color? shadowColor}) =>
      ColorsTheme(
          backgroundColor: backgroundColor ?? this.backgroundColor,
          paneColor: paneColor ?? this.paneColor,
          primaryColor: primaryColor ?? this.primaryColor,
          blackTextColor: blackTextColor ?? this.blackTextColor,
          whiteTextColor: whiteTextColor ?? this.whiteTextColor,
          hoverColor: hoverColor ?? this.hoverColor,
          shadowColor: shadowColor ?? this.shadowColor);

  static final defaultTheme = ColorsTheme(
      backgroundColor: DefaultBackgroundColor,
      paneColor: DefaultPaneColor,
      primaryColor: DefaultPrimaryColor,
      blackTextColor: DefaultTextBlackColor,
      whiteTextColor: DefaultTextWhitekColor,
      hoverColor: DefaultHoverColor,
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
