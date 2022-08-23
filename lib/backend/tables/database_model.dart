import 'package:rhythmic/backend/tables/display_tracker_providers.dart';
import 'package:rhythmic/backend/tables/tracker_tables.dart';

class DatabaseTrackerModel implements TrackerProviderModel {
  final AppDatabase _database = AppDatabase();
  @override
  DurationTimelineProvider get durationProvider => _database.durationTrackerDao;
  @override
  PointTimelineProvider get pointProvider => _database.pointTrackerDao;
  @override
  DisplayTrackerProvider get trackerProvider => _database.displayTrackerDao;

  @override
  Future deleteTracker(int id) async {
    await _database.transaction(() async {
      final tracker = await trackerProvider.watchTracker(id).first;
      await tracker.trackerData.map(
          duration: ((_) => durationProvider.removeSegmentTracker(tracker)),
          point: (entity) => pointProvider.removePointTracker(tracker));
    });
  }
}

mixin TrackerProviderModel {
  DurationTimelineProvider get durationProvider;
  PointTimelineProvider get pointProvider;
  DisplayTrackerProvider get trackerProvider;

  Future deleteTracker(int id);
}
