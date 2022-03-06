/*
 * ART
 *
 * Copyright 2019-2022 ART
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import 'package:flutter/widgets.dart';
import 'package:ui/src/theme/theme.dart';

class Button extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ButtonState();
}

class ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    final theme = context.theme();

    final defaultDecoration = BoxDecoration(
        shape: BoxShape.rectangle,
        color: theme.colors.backgroundColor,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: theme.colors.borderColor));

    final container = Container(
      decoration: defaultDecoration,
      width: 256,
      padding: EdgeInsets.all(16),
      child: Text("Button",
          style: theme.button.textStyle, textAlign: TextAlign.center),
    );

    return PhysicalModel(
      color: Transparent,
      shadowColor: theme.colors.primaryColor,
      elevation: 6,
      child: container,
    );
  }
}
