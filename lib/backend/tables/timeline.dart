import 'package:drift/drift.dart';
import 'package:rhythmic/backend/tables/tracker_tables.dart';

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
