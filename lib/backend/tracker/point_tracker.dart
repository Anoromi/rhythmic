import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quiver/time.dart';
import 'package:rhythmic/frontend/general/time.dart';
part 'point_tracker.freezed.dart';
part 'point_tracker.g.dart';

enum DevalidationTimings {
  @JsonValue(0)
  hours,
  @JsonValue(1)
  days,
  @JsonValue(2)
  weeks,
  @JsonValue(3)
  months,
  @JsonValue(4)
  years
}

@Freezed(addImplicitFinal: false, toJson: true, fromJson: true)
class PointTrackerDisplay with _$PointTrackerDisplay {
  const PointTrackerDisplay._();
  factory PointTrackerDisplay(DateTime? devalidationPoint,
      DevalidationTimings? devalidationTimings, int devalidationPeriod
      ) = _PointTrackerDisplay;
  factory PointTrackerDisplay.fromJson(Map<String, dynamic> json) =>
      _$PointTrackerDisplayFromJson(json);

  Duration? periodToDuration() {
    final timing = devalidationTimings;
    if (timing == null) return null;
    final now = DateTime.now().toUtc();
    switch (timing) {
      case DevalidationTimings.hours:
        return Duration(hours: devalidationPeriod);
      case DevalidationTimings.days:
        return Duration(days: devalidationPeriod);
      case DevalidationTimings.weeks:
        return Duration(days: devalidationPeriod * 7);
      case DevalidationTimings.months:
        return Duration(
            days: devalidationPeriod * daysInMonth(now.year, now.month));
      case DevalidationTimings.years:
        return Duration(days: devalidationPeriod * daysInYear(now.year));
    }
  }
}
