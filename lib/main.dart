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

library ui;

import 'package:flutter/widgets.dart';
import 'package:ui/src/widgets/button.dart';
import 'package:ui/src/widgets/plane.dart';
import 'package:ui/src/widgets/vertical.dart';

import 'main.dart';
import 'src/core/module.dart';

export 'src/widgets/button.dart';

void main() {
  var first = Button(label: "Это кнопка", mode: ButtonMode.Contained);
  runApp(Module(
      title: "ART",
      child: Plane(
          child: VerticalBox(
        children: [
          first,
          Button(
              label: "Два",
              clicked: () => first.disabled ? first.enable() : first.disable())
        ],
      ))));
}
