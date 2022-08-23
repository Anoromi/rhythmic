import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rhythmic/backend/tracker/point_tracker.dart';
import 'package:rhythmic/backend/tracker/timer_tracker.dart';

part 'tracker_union.freezed.dart';

part 'tracker_union.g.dart';

@Freezed(toJson: true, fromJson: true)
class TrackerUnion with _$TrackerUnion {
  factory TrackerUnion.duration(DurationTrackerDisplay entity) =
      TrackerUnionDuration;

  factory TrackerUnion.point(PointTrackerDisplay entity) = TrackerUnionPoint;

  factory TrackerUnion.fromJson(Map<String, dynamic> json) =>
      _$TrackerUnionFromJson(json);
}
