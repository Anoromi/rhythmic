// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'display_tracker_providers.dart';

// **************************************************************************
// DaoGenerator
// **************************************************************************

mixin _$DisplayTrackerDaoMixin on DatabaseAccessor<AppDatabase> {
  $TrackersTable get trackers => attachedDatabase.trackers;
}
mixin _$PointTrackerDaoMixin on DatabaseAccessor<AppDatabase> {
  $TrackersTable get trackers => attachedDatabase.trackers;
  $PointTimelinesTable get pointTimelines => attachedDatabase.pointTimelines;
}
mixin _$DurationTrackerDaoMixin on DatabaseAccessor<AppDatabase> {
  $TrackersTable get trackers => attachedDatabase.trackers;
  $DurationTimelinesTable get durationTimelines =>
      attachedDatabase.durationTimelines;
}
