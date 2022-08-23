import 'package:freezed_annotation/freezed_annotation.dart';

part 'timer_tracker.freezed.dart';
part 'timer_tracker.g.dart';

@Freezed(addImplicitFinal: false, toJson: true, fromJson: true)
class DurationTrackerDisplay with _$DurationTrackerDisplay {
  const DurationTrackerDisplay._();

  factory DurationTrackerDisplay(Duration? previousEntry, DateTime? start) =
      _TimerTrackerDisplay;
  factory DurationTrackerDisplay.fromJson(Map<String, dynamic> json) =>
      _$DurationTrackerDisplayFromJson(json);

  bool hasStarted() => start != null;
}