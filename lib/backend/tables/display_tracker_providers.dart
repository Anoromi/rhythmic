import 'package:drift/drift.dart';
import 'package:quiver/time.dart';
import 'package:rhythmic/backend/tables/timeline.dart';
import 'package:rhythmic/frontend/general/time.dart';
import 'package:rhythmic/frontend/tracker/point_tracker_widget.dart';
import 'package:rhythmic/lib.dart';

part 'display_tracker_providers.g.dart';

mixin DisplayTrackerProvider {
  Future<int> addTracker(TrackersCompanion tracker);

  Stream<List<int>> watchTrackerIds();

  Stream<Tracker> watchTracker(int id);

  Future<int> getTrackerCount();
}

@DriftAccessor(tables: [Trackers])
class DisplayTrackerDao extends DatabaseAccessor<AppDatabase>
    with _$DisplayTrackerDaoMixin
    implements DisplayTrackerProvider {
  DisplayTrackerDao(AppDatabase db) : super(db);

  @override
  Future<int> addTracker(TrackersCompanion tracker) async {
    return await into(trackers).insert(tracker);
  }

  @override
  Stream<List<int>> watchTrackerIds() {
    return (selectOnly(trackers)..addColumns([trackers.id]))
        .map((p0) => p0.read(trackers.id)!)
        .watch();
  }

  @override
  Stream<Tracker> watchTracker(int id) {
    return (select(trackers)..where((tbl) => tbl.id.equals(id))).watchSingle();
  }

  @override
  Future<int> getTrackerCount() async {
    return (await select(trackers).get()).length;
  }
}

@DriftAccessor(tables: [Trackers, PointTimelines])
class PointTrackerDao extends DatabaseAccessor<AppDatabase>
    with _$PointTrackerDaoMixin
    implements PointTimelineProvider {
  PointTrackerDao(AppDatabase db) : super(db);
  @override
  Future updatePointTracker(
      Tracker tracker, PointTimelinesCompanion? pointDate) async {
    return transaction(() async {
      await (update(trackers)).replace(tracker);
      if (pointDate != null) {
        await (into(pointTimelines)).insert(pointDate);
      }
    });
  }

  @override
  Future addPointTimeline(PointTimelinesCompanion pointDate) async {
    await (into(pointTimelines)).insert(pointDate);
  }

  @override
  Future removePointTracker(Tracker tracker) async {
    await transaction(() async {
      await _deleteTracker(this, trackers, tracker);
      await (delete(pointTimelines)
            ..where((tbl) => tbl.trackerId.equals(tracker.id)))
          .go();
    });
  }

  @override
  Future<bool> updateDevalidation(
      Tracker tracker, PointTrackerDisplay display) async {
    if (display.devalidationPoint == null) return false;
    final updateTime = calculateUpdateTime(display);
    if (updateTime == display.devalidationPoint) return false;
    final updated = tracker.copyWith(
        trackerData: TrackerUnion.point(
      display.copyWith(devalidationPoint: updateTime),
    ));
    await (update(trackers).replace(updated));
    return true;
  }

  @override
  Stream<int> lookCountFor(
      Tracker t, PointTrackerDisplay display, PeriodOptions p) async* {
    DateTime? start;
    switch (p) {
      case PeriodOptions.day:
        start = DateTime.now();
        start = start.subtract(Duration(
            hours: start.hour,
            minutes: start.minute,
            seconds: start.second,
            milliseconds: start.millisecond,
            microseconds: start.microsecond));
        break;
      case PeriodOptions.week:
        start = DateTime.now();
        start = start.subtract(Duration(
            days: start.weekday - 1,
            hours: start.hour,
            minutes: start.minute,
            seconds: start.second,
            milliseconds: start.millisecond,
            microseconds: start.microsecond));
        break;
      case PeriodOptions.month:
        start = DateTime.now();
        start = start.subtract(Duration(
            days: start.day - 1,
            hours: start.hour,
            minutes: start.minute,
            seconds: start.second,
            milliseconds: start.millisecond,
            microseconds: start.microsecond));
        break;
      case PeriodOptions.normal:
        start =
            display.devalidationPoint?.subtract(display.periodToDuration()!);
        break;
    }
    var count = pointTimelines.id.count();
    Expression<bool?> whereExpr =
        pointTimelines.trackerId.equalsExp(Variable(t.id));
    if (start != null) {
      whereExpr &= pointTimelines.point.isBiggerOrEqualValue(start);
    }
    final query = (selectOnly(pointTimelines)
          ..addColumns([count, pointTimelines.id, pointTimelines.point])
          ..where(whereExpr))
        .watchSingle()
        .map((event) {
      return event.read(count);
    });

    yield* query;
  }
}

DateTime? calculateUpdateTime(PointTrackerDisplay display) {
  if (display.devalidationPoint == null) return null;
  DateTime nextD;
  var now = DateTime.now();
  switch (display.devalidationTimings!) {
    case DevalidationTimings.hours:
      var point = display.devalidationPoint!;
      while (point.isBefore(now)) {
        point = point.add(Duration(hours: display.devalidationPeriod));
      }
      nextD = point;
      break;
    case DevalidationTimings.days:
      var point = display.devalidationPoint!;
      while (point.isBefore(now)) {
        point = point.add(Duration(days: display.devalidationPeriod));
      }
      nextD = point;
      break;
    case DevalidationTimings.weeks:
      var point = display.devalidationPoint!;
      while (point.isBefore(now)) {
        point = point.add(Duration(days: display.devalidationPeriod * 7));
      }
      nextD = point;
      break;
    case DevalidationTimings.months:
      var point = display.devalidationPoint!;
      while (point.isBefore(now)) {
        point = point.add(Duration(
            days: display.devalidationPeriod *
                daysInMonth(point.year, point.month)));
      }
      nextD = point;
      break;
    case DevalidationTimings.years:
      var point = display.devalidationPoint!;
      while (true) {
        var next = point.add(Duration(
            days: display.devalidationPeriod * daysInYear(point.year)));
        if (next.isAfter(now)) {
          break;
        }
        point = next;
      }
      nextD = point;
      break;
  }
  return nextD;
}

@DriftAccessor(tables: [Trackers, DurationTimelines])
class DurationTrackerDao extends DatabaseAccessor<AppDatabase>
    with _$DurationTrackerDaoMixin
    implements DurationTimelineProvider {
  DurationTrackerDao(super.attachedDatabase);

  @override
  Future removeSegmentTracker(Tracker tracker) async {
    await transaction(() async {
      await _deleteTracker(this, trackers, tracker);
      await (delete(durationTimelines)
            ..where((tbl) => tbl.trackerId.equals(tracker.id)))
          .go();
    });
  }

  @override
  Future updateSegmentTracker(
      Tracker tracker, DurationTimelinesCompanion? durationDate) async {
    return transaction(() async {
      await (update(trackers)).replace(tracker);
      if (durationDate != null) {
        await (into(durationTimelines)).insert(durationDate);
      }
    });
  }
}

mixin TimelineQueryProvider<T> {
  Future<List<T>> getTimeline(DateTime from, DateTime to);
}

mixin PointTimelineProvider {
  Future updatePointTracker(Tracker tracker, PointTimelinesCompanion pointDate);
  Future addPointTimeline(PointTimelinesCompanion pointDate);
  Future removePointTracker(Tracker tracker);
  Future updateDevalidation(Tracker tracker, PointTrackerDisplay display);

  Stream<int> lookCountFor(
      Tracker t, PointTrackerDisplay display, PeriodOptions p);
}

mixin DurationTimelineProvider {
  Future updateSegmentTracker(
      Tracker tracker, DurationTimelinesCompanion? durationDate);
  Future removeSegmentTracker(Tracker tracker);
}

Future _updateTracker(DatabaseAccessor<AppDatabase> accessor,
    $TrackersTable table, Tracker tracker) async {
  await (accessor.update(table)..whereSamePrimaryKey(tracker)).replace(tracker);
}

Future _deleteTracker(DatabaseAccessor<AppDatabase> accessor,
    $TrackersTable table, Tracker tracker) async {
  await (accessor.delete(table)..whereSamePrimaryKey(tracker)).go();
}
