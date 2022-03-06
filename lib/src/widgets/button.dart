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

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

const BackgroundColor = Color(0xFF18181C);
const PrimaryColor = Color(0xFF40A3FF);
const TextColor = Color(0xFF1A1B21);
const BorderColor = Color(0xFFFAFBFC);
const ShadowColor = Color.fromARGB(25, 64, 163, 255);
const Black = Color(0xFF000000);
const White = Color(0xFFFFFFFF);

class Button extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ButtonState();
}

class ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: BackgroundColor,
        child: Center(
            child: Container(
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: PrimaryColor,
              boxShadow: [
                BoxShadow(
                    color: ShadowColor, offset: Offset(0, 4), blurRadius: 10)
              ],
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: BorderColor)),
          padding: EdgeInsets.all(16),
          child: Text(
            "Button",
            style: TextStyle(
                fontFamily: "Proxima Nova",
                fontSize: 24,
                fontWeight: FontWeight.w600,
                fontStyle: FontStyle.normal,
                color: TextColor),
          ),
        )));
  }
}
