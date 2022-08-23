import 'package:quiver/time.dart';

const _daysInMonth = [0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];

int daysInYear(int year) {
  var nonChanged = _daysInMonth.fold<int>(
      0, (previousValue, element) => previousValue + element);
  return nonChanged + (isLeapYear(year) ? 29 : 28);
}
