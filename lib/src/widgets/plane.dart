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

class Plane extends StatefulWidget {
  final Widget child;

  const Plane({Key? key, required this.child}) : super(key: key);

  @override
  State<StatefulWidget> createState() => PlaneState(child);
}

class PlaneState extends State<Plane> {
  PlaneState(this.child);

  final Widget child;

  @override
  Widget build(BuildContext context) => Container(
      color: context.theme().colors.backgroundColor,
      child: Center(child: child));
}
