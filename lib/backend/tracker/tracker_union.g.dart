// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tracker_union.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TrackerUnionDuration _$$TrackerUnionDurationFromJson(
        Map<String, dynamic> json) =>
    _$TrackerUnionDuration(
      DurationTrackerDisplay.fromJson(json['entity'] as Map<String, dynamic>),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$TrackerUnionDurationToJson(
        _$TrackerUnionDuration instance) =>
    <String, dynamic>{
      'entity': instance.entity,
      'runtimeType': instance.$type,
    };

_$TrackerUnionPoint _$$TrackerUnionPointFromJson(Map<String, dynamic> json) =>
    _$TrackerUnionPoint(
      PointTrackerDisplay.fromJson(json['entity'] as Map<String, dynamic>),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$TrackerUnionPointToJson(_$TrackerUnionPoint instance) =>
    <String, dynamic>{
      'entity': instance.entity,
      'runtimeType': instance.$type,
    };
