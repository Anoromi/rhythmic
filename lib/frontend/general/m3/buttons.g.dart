// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'buttons.dart';

// **************************************************************************
// FunctionalWidgetGenerator
// **************************************************************************

class TonalButton extends StatelessWidget {
  const TonalButton(
      {Key? key,
      required this.onPressed,
      this.onLongPress,
      this.onHover,
      this.onFocusChange,
      this.style,
      this.focusNode,
      this.autofocus = false,
      this.clipBehavior = Clip.none,
      required this.child})
      : super(key: key);

  final void Function() onPressed;

  final void Function()? onLongPress;

  final void Function(bool)? onHover;

  final void Function(bool)? onFocusChange;

  final ButtonStyle? style;

  final FocusNode? focusNode;

  final bool autofocus;

  final Clip clipBehavior;

  final Widget? child;

  @override
  Widget build(BuildContext _context) => tonalButton(_context,
      onPressed: onPressed,
      onLongPress: onLongPress,
      onHover: onHover,
      onFocusChange: onFocusChange,
      style: style,
      focusNode: focusNode,
      autofocus: autofocus,
      clipBehavior: clipBehavior,
      child: child);
}

class FilledButton extends StatelessWidget {
  const FilledButton(
      {Key? key,
      required this.onPressed,
      this.onLongPress,
      this.onHover,
      this.onFocusChange,
      this.style,
      this.focusNode,
      this.autofocus = false,
      this.clipBehavior = Clip.none,
      required this.child})
      : super(key: key);

  final void Function() onPressed;

  final void Function()? onLongPress;

  final void Function(bool)? onHover;

  final void Function(bool)? onFocusChange;

  final ButtonStyle? style;

  final FocusNode? focusNode;

  final bool autofocus;

  final Clip clipBehavior;

  final Widget? child;

  @override
  Widget build(BuildContext _context) => filledButton(_context,
      onPressed: onPressed,
      onLongPress: onLongPress,
      onHover: onHover,
      onFocusChange: onFocusChange,
      style: style,
      focusNode: focusNode,
      autofocus: autofocus,
      clipBehavior: clipBehavior,
      child: child);
}
