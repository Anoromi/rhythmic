// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timer_tracker.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TimerTrackerDisplay _$$_TimerTrackerDisplayFromJson(
        Map<String, dynamic> json) =>
    _$_TimerTrackerDisplay(
      json['previousEntry'] == null
          ? null
          : Duration(microseconds: json['previousEntry'] as int),
      json['start'] == null ? null : DateTime.parse(json['start'] as String),
    );

Map<String, dynamic> _$$_TimerTrackerDisplayToJson(
        _$_TimerTrackerDisplay instance) =>
    <String, dynamic>{
      'previousEntry': instance.previousEntry?.inMicroseconds,
      'start': instance.start?.toIso8601String(),
    };
