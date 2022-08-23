import 'dart:developer';
import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:rhythmic/backend/tables/display_tracker_providers.dart';
import 'package:rhythmic/backend/tables/timeline.dart';
import 'package:rhythmic/backend/tracker/tracker_union.dart';
import 'package:rhythmic/backend/tracker/tracker_union_converter.dart';
part 'tracker_tables.g.dart';

class Trackers extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get trackerData => text().map(TrackerUnionConverter())();
}

@DriftDatabase(
    tables: [Trackers, DurationTimelines, PointTimelines],
    daos: [DurationTrackerDao, PointTrackerDao, DisplayTrackerDao])
class AppDatabase extends _$AppDatabase {
  @override
  int get schemaVersion => 1;

  AppDatabase() : super(_openConnection());
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationSupportDirectory();
    log("dbFolder ${dbFolder.absolute.path}");
    final file = File(p.join(dbFolder.path, 'db.sqlite'));

    return NativeDatabase(file);
  });
}
