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
import 'package:ui/src/widgets/module.dart';

class ButtonService extends ModuleService<ButtonState> {
  void disable() {
    state.disable();
  }

  void enable() {
    state.enable();
  }

  get disabled => state._disabled;
}

class Button extends StatefulWidget {
  final ButtonService service = ButtonService();

  final String label;
  final bool? defaultDisabled;
  final VoidCallback? clicked;

  Button({Key? key, required this.label, this.defaultDisabled, this.clicked})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => ButtonState(service);

  void disable() => service.disable();

  void enable() => service.enable();

  get disabled => service.disabled;
}

class ButtonState extends ModuleState<Button> {
  bool _hovered = false;
  bool _focused = false;
  bool _disabled = false;
  final ButtonService _service;

  ButtonState(this._service);

  _updateHovered(bool hovered) {
    if (_disabled) return;
    _hovered = hovered;
    setState(() {});
  }

  _updateFocused(bool focused) {
    if (_disabled) return;
    if (_focused) widget.clicked?.call();
    _focused = focused;
    refresh();
  }

  void disable() {
    _disabled = true;
    refresh();
  }

  void enable() {
    _disabled = false;
    refresh();
  }

  @override
  void initState() {
    super.initState();
    _service.initialize(this);
    _disabled = widget.defaultDisabled == true;
    refresh();
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme();

    final defaultDecoration = BoxDecoration(
        shape: BoxShape.rectangle,
        color: (_hovered && !_focused)
            ? theme.button.hoveredBackgroundColor
            : theme.button.normalBackgroundColor,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
            color: _focused
                ? theme.button.focusedBorderColor
                : theme.button.normalBorderColor));

    final container = Container(
      decoration: defaultDecoration,
      width: 256,
      padding: EdgeInsets.all(8),
      child: Text(widget.label,
          style: theme.button.textStyle, textAlign: TextAlign.center),
    );

    var physical = PhysicalModel(
      color: Transparent,
      shadowColor: theme.colors.primaryColor,
      elevation: 8,
      child: container,
    );

    return GestureDetector(
      onTapDown: (_) => _updateFocused(true),
      onTapUp: (_) => _updateFocused(false),
      onTapCancel: () => _updateFocused(false),
      child: FocusableActionDetector(
        onShowHoverHighlight: _updateHovered,
        child: physical,
      ),
    );
  }
}
