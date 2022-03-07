import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../constants/constants.dart';
import '../model/spacing.dart';

part 'theme.g.dart';

@CopyWith()
class SpacingTheme {
  final Spacing spacing;

  SpacingTheme({required this.spacing});

  static final defaultTheme = SpacingTheme(spacing: Spacing(4, 6, 8, 16, 24));
}

@CopyWith()
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

  static final defaultTheme = ColorsTheme(
      backgroundColor: DefaultBackgroundColor,
      paneColor: DefaultPaneColor,
      primaryColor: DefaultPrimaryColor,
      blackTextColor: DefaultTextBlackColor,
      whiteTextColor: DefaultTextWhiteColor,
      hoverColor: DefaultHoverColor,
      shadowColor: DefaultShadowColor);
}

@CopyWith()
class TextTheme {
  final TextStyle button;

  TextTheme({required this.button});

  static final defaultTheme = TextTheme(
      button: TextStyle(
          fontFamily: ProximaNovaFont,
          fontSize: 24,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal));
}

@CopyWith()
class Theme {
  final SpacingTheme spacing;
  final ColorsTheme colors;
  final TextTheme text;

  Theme({required this.spacing, required this.colors, required this.text});

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
