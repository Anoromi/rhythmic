import 'package:drift/drift.dart';
import 'package:rhythmic/backend/tables/tracker_tables.dart';

void hasTo(bool condition, [String? message]) {
  if (!condition) {
    throw Exception("Condition hasn't been met $message");
  }
}

class TimeSegment {
  final DateTime start;
  final DateTime finish;
  TimeSegment(this.start, this.finish) {
    hasTo(start.isBefore(finish));
  }
}

class DurationTimelines extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get trackerId => integer().references(Trackers, #id)();
  DateTimeColumn get start => dateTime()();
  DateTimeColumn get end => dateTime()();
}

class PointTimelines extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get trackerId => integer().references(Trackers, #id)();
  DateTimeColumn get point => dateTime()();
}
