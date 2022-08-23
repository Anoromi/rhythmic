import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:rhythmic/lib.dart';

part 'buttons.g.dart';

ButtonStyle filledButtonStyle(BuildContext context,
    [Color? primary, Color? onPrimary]) {
  var primaryN = primary ?? context.color.primary,
      onPrimaryN = onPrimary ?? context.color.onPrimary;
  return ElevatedButton.styleFrom(
    primary: primaryN,
    onPrimary: onPrimaryN,
  ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0));
}

ButtonStyle tonalButtonStyle(BuildContext context,
    [Color? primary, Color? onPrimary]) {
  var primaryN = primary ?? context.color.primaryContainer,
      onPrimaryN = onPrimary ?? context.color.onPrimaryContainer;
  return ElevatedButton.styleFrom(
    primary: primaryN,
    onPrimary: onPrimaryN,
  ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0));
}

@swidget
Widget tonalButton(
  BuildContext context, {
  required VoidCallback onPressed,
  VoidCallback? onLongPress,
  ValueChanged<bool>? onHover,
  ValueChanged<bool>? onFocusChange,
  ButtonStyle? style,
  FocusNode? focusNode,
  bool autofocus = false,
  Clip clipBehavior = Clip.none,
  required Widget? child,
}) {
  var defaultStyle = tonalButtonStyle(context);
  var realStyle = style?.merge(defaultStyle) ?? defaultStyle;
  return ElevatedButton(
      onPressed: onPressed,
      onLongPress: onLongPress,
      onHover: onHover,
      onFocusChange: onFocusChange,
      style: realStyle,
      focusNode: focusNode,
      autofocus: autofocus,
      clipBehavior: clipBehavior,
      child: child);
}

@swidget
Widget filledButton(
  BuildContext context, {
  required VoidCallback onPressed,
  VoidCallback? onLongPress,
  ValueChanged<bool>? onHover,
  ValueChanged<bool>? onFocusChange,
  ButtonStyle? style,
  FocusNode? focusNode,
  bool autofocus = false,
  Clip clipBehavior = Clip.none,
  required Widget? child,
}) {
  var defaultStyle = filledButtonStyle(context);
  var realStyle = style?.merge(defaultStyle) ?? defaultStyle;
  return ElevatedButton(
      onPressed: onPressed,
      onLongPress: onLongPress,
      onHover: onHover,
      onFocusChange: onFocusChange,
      style: realStyle,
      focusNode: focusNode,
      autofocus: autofocus,
      clipBehavior: clipBehavior,
      child: child);
}
