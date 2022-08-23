import 'package:flutter/material.dart';

extension Is on Set<MaterialState> {
  bool get isDisabled => contains(MaterialState.disabled);
  bool get isHovered => contains(MaterialState.hovered);
  bool get isFocused => contains(MaterialState.focused);
  bool get isPressed => contains(MaterialState.pressed);
  bool get isDragged => contains(MaterialState.dragged);
  bool get isSelected => contains(MaterialState.selected);
}

extension BuildContextColorScheme on BuildContext {
  ThemeData get theme => Theme.of(this);
  ColorScheme get color => Theme.of(this).colorScheme;
}
