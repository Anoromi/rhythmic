import 'package:rhythmic/lib.dart';

extension TypographyExtensions on TextStyle? {
  TextStyle? onSurface(ColorScheme colorScheme) =>
      this?.copyWith(color: colorScheme.onSurface);
  TextStyle? primary(ColorScheme colorScheme) =>
      this?.copyWith(color: colorScheme.primary);
  TextStyle? bold() => this?.copyWith(fontWeight: FontWeight.bold);
}
