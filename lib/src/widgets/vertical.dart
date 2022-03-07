import 'package:flutter/widgets.dart';
import 'package:ui/src/theme/theme.dart';

class VerticalBox extends StatelessWidget {
  final List<Widget> children;

  VerticalBox({required this.children});

  @override
  Widget build(BuildContext context) => Column(
        children: children
            .map((widget) => Padding(
                  padding: EdgeInsets.all(
                      context.theme().spacing.spacing.medium),
                  child: widget,
                ))
            .toList(),
      );
}
