import 'package:drift/drift.dart';
import 'package:rhythmic/backend/tables/display_tracker_providers.dart';
import 'package:rhythmic/backend/tables/tracker_tables.dart';
import 'package:rhythmic/backend/tracker/point_tracker.dart';
import 'package:rhythmic/backend/tracker/timer_tracker.dart';
import 'package:rhythmic/backend/tracker/tracker_union.dart';

Future loadDummyData(
    DisplayTrackerProvider provider,
    PointTimelineProvider pointProvider,
    DurationTimelineProvider durationProvider) async {
  Future addDurationValue(String name, DurationTrackerDisplay value) {
    return provider.addTracker(TrackersCompanion(
        name: Value(name), trackerData: Value(TrackerUnion.duration(value))));
  }

  Future addPointValue(String name, PointTrackerDisplay value,
      List<DateTime> timelinePoints) async {
    final id = await provider.addTracker(TrackersCompanion.insert(
        name: name, trackerData: TrackerUnion.point(value)));
    for (var v in timelinePoints) {
      await pointProvider.addPointTimeline(
          PointTimelinesCompanion.insert(trackerId: id, point: v));
    }
  }

  if (await provider.getTrackerCount() > 0) return;

  await addDurationValue(
      "Time1",
      DurationTrackerDisplay(
          null, DateTime.now().subtract(const Duration(days: 5))));
  await addDurationValue(
      "Time2",
      DurationTrackerDisplay(
          null,
          DateTime.now()
              .subtract(const Duration(seconds: 10, minutes: 50, hours: 1))));
  await addDurationValue("Time3",
      DurationTrackerDisplay(const Duration(days: 1, seconds: 4), null));
  await addDurationValue("Time4", DurationTrackerDisplay(null, null));
  await addDurationValue(
      "Time5",
      DurationTrackerDisplay(
          null, DateTime.now().subtract(const Duration(days: 35))));

  await addPointValue(
      "When happens",
      PointTrackerDisplay(DateTime(2022, 8, 4), DevalidationTimings.hours, 1),
      [
        nowMinus(const Duration(minutes: 30)),
        nowMinus(const Duration(minutes: 59)),
        nowMinus(const Duration(minutes: 100)),

      ]);
}

DateTime nowMinus(Duration duration) {
  return DateTime.now().subtract(duration);
}
