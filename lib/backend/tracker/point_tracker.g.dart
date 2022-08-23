// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'point_tracker.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PointTrackerDisplay _$$_PointTrackerDisplayFromJson(
        Map<String, dynamic> json) =>
    _$_PointTrackerDisplay(
      json['devalidationPoint'] == null
          ? null
          : DateTime.parse(json['devalidationPoint'] as String),
      $enumDecodeNullable(
          _$DevalidationTimingsEnumMap, json['devalidationTimings']),
      json['devalidationPeriod'] as int,
    );

Map<String, dynamic> _$$_PointTrackerDisplayToJson(
        _$_PointTrackerDisplay instance) =>
    <String, dynamic>{
      'devalidationPoint': instance.devalidationPoint?.toIso8601String(),
      'devalidationTimings':
          _$DevalidationTimingsEnumMap[instance.devalidationTimings],
      'devalidationPeriod': instance.devalidationPeriod,
    };

const _$DevalidationTimingsEnumMap = {
  DevalidationTimings.hours: 0,
  DevalidationTimings.days: 1,
  DevalidationTimings.weeks: 2,
  DevalidationTimings.months: 3,
  DevalidationTimings.years: 4,
};
