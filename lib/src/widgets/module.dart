import 'package:flutter/cupertino.dart';
import 'package:ui/src/theme/theme.dart';

class Module extends StatelessWidget {
  final Widget child;
  final String title;
  final Locale? locale;
  final bool enableMediaQuery;

  const Module(
      {Key? key,
      required this.child,
      required this.title,
      this.locale,
      this.enableMediaQuery = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WidgetsApp(
        builder: (context, child) => ThemeProvider(
              theme: Theme.defaultTheme,
              child: this.child,
            ),
        color: Theme.defaultTheme.colors.primaryColor,
        title: title,
        locale: locale,
        useInheritedMediaQuery: enableMediaQuery);
  }
}
