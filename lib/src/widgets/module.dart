import 'package:flutter/cupertino.dart';

class Module extends StatelessWidget {
  final Widget child;

  const Module({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(textDirection: TextDirection.ltr, child: child);
  }
}
