extension StringManipulation on String {
  String toCapitalized() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}
