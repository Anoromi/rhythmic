// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tracker_tables.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: type=lint
class Tracker extends DataClass implements Insertable<Tracker> {
  final int id;
  final String name;
  final TrackerUnion trackerData;
  Tracker({required this.id, required this.name, required this.trackerData});
  factory Tracker.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Tracker(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      trackerData: $TrackersTable.$converter0.mapToDart(const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}tracker_data']))!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    {
      final converter = $TrackersTable.$converter0;
      map['tracker_data'] = Variable<String>(converter.mapToSql(trackerData)!);
    }
    return map;
  }

  TrackersCompanion toCompanion(bool nullToAbsent) {
    return TrackersCompanion(
      id: Value(id),
      name: Value(name),
      trackerData: Value(trackerData),
    );
  }

  factory Tracker.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Tracker(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      trackerData: $TrackersTable.$converter0
          .fromJson(serializer.fromJson<String?>(json['trackerData']))!,
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'trackerData': serializer
          .toJson<String?>($TrackersTable.$converter0.toJson(trackerData)),
    };
  }

  Tracker copyWith({int? id, String? name, TrackerUnion? trackerData}) =>
      Tracker(
        id: id ?? this.id,
        name: name ?? this.name,
        trackerData: trackerData ?? this.trackerData,
      );
  @override
  String toString() {
    return (StringBuffer('Tracker(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('trackerData: $trackerData')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, trackerData);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Tracker &&
          other.id == this.id &&
          other.name == this.name &&
          other.trackerData == this.trackerData);
}

class TrackersCompanion extends UpdateCompanion<Tracker> {
  final Value<int> id;
  final Value<String> name;
  final Value<TrackerUnion> trackerData;
  const TrackersCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.trackerData = const Value.absent(),
  });
  TrackersCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required TrackerUnion trackerData,
  })  : name = Value(name),
        trackerData = Value(trackerData);
  static Insertable<Tracker> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<TrackerUnion>? trackerData,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (trackerData != null) 'tracker_data': trackerData,
    });
  }

  TrackersCompanion copyWith(
      {Value<int>? id, Value<String>? name, Value<TrackerUnion>? trackerData}) {
    return TrackersCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      trackerData: trackerData ?? this.trackerData,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (trackerData.present) {
      final converter = $TrackersTable.$converter0;
      map['tracker_data'] =
          Variable<String>(converter.mapToSql(trackerData.value)!);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TrackersCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('trackerData: $trackerData')
          ..write(')'))
        .toString();
  }
}

class $TrackersTable extends Trackers with TableInfo<$TrackersTable, Tracker> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TrackersTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _trackerDataMeta =
      const VerificationMeta('trackerData');
  @override
  late final GeneratedColumnWithTypeConverter<TrackerUnion, String?>
      trackerData = GeneratedColumn<String?>('tracker_data', aliasedName, false,
              type: const StringType(), requiredDuringInsert: true)
          .withConverter<TrackerUnion>($TrackersTable.$converter0);
  @override
  List<GeneratedColumn> get $columns => [id, name, trackerData];
  @override
  String get aliasedName => _alias ?? 'trackers';
  @override
  String get actualTableName => 'trackers';
  @override
  VerificationContext validateIntegrity(Insertable<Tracker> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    context.handle(_trackerDataMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Tracker map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Tracker.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $TrackersTable createAlias(String alias) {
    return $TrackersTable(attachedDatabase, alias);
  }

  static JsonTypeConverter<TrackerUnion, String> $converter0 =
      TrackerUnionConverter();
}

class DurationTimeline extends DataClass
    implements Insertable<DurationTimeline> {
  final int id;
  final int trackerId;
  final DateTime start;
  final DateTime end;
  DurationTimeline(
      {required this.id,
      required this.trackerId,
      required this.start,
      required this.end});
  factory DurationTimeline.fromData(Map<String, dynamic> data,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return DurationTimeline(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      trackerId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}tracker_id'])!,
      start: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}start'])!,
      end: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}end'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['tracker_id'] = Variable<int>(trackerId);
    map['start'] = Variable<DateTime>(start);
    map['end'] = Variable<DateTime>(end);
    return map;
  }

  DurationTimelinesCompanion toCompanion(bool nullToAbsent) {
    return DurationTimelinesCompanion(
      id: Value(id),
      trackerId: Value(trackerId),
      start: Value(start),
      end: Value(end),
    );
  }

  factory DurationTimeline.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DurationTimeline(
      id: serializer.fromJson<int>(json['id']),
      trackerId: serializer.fromJson<int>(json['trackerId']),
      start: serializer.fromJson<DateTime>(json['start']),
      end: serializer.fromJson<DateTime>(json['end']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'trackerId': serializer.toJson<int>(trackerId),
      'start': serializer.toJson<DateTime>(start),
      'end': serializer.toJson<DateTime>(end),
    };
  }

  DurationTimeline copyWith(
          {int? id, int? trackerId, DateTime? start, DateTime? end}) =>
      DurationTimeline(
        id: id ?? this.id,
        trackerId: trackerId ?? this.trackerId,
        start: start ?? this.start,
        end: end ?? this.end,
      );
  @override
  String toString() {
    return (StringBuffer('DurationTimeline(')
          ..write('id: $id, ')
          ..write('trackerId: $trackerId, ')
          ..write('start: $start, ')
          ..write('end: $end')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, trackerId, start, end);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DurationTimeline &&
          other.id == this.id &&
          other.trackerId == this.trackerId &&
          other.start == this.start &&
          other.end == this.end);
}

class DurationTimelinesCompanion extends UpdateCompanion<DurationTimeline> {
  final Value<int> id;
  final Value<int> trackerId;
  final Value<DateTime> start;
  final Value<DateTime> end;
  const DurationTimelinesCompanion({
    this.id = const Value.absent(),
    this.trackerId = const Value.absent(),
    this.start = const Value.absent(),
    this.end = const Value.absent(),
  });
  DurationTimelinesCompanion.insert({
    this.id = const Value.absent(),
    required int trackerId,
    required DateTime start,
    required DateTime end,
  })  : trackerId = Value(trackerId),
        start = Value(start),
        end = Value(end);
  static Insertable<DurationTimeline> custom({
    Expression<int>? id,
    Expression<int>? trackerId,
    Expression<DateTime>? start,
    Expression<DateTime>? end,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (trackerId != null) 'tracker_id': trackerId,
      if (start != null) 'start': start,
      if (end != null) 'end': end,
    });
  }

  DurationTimelinesCompanion copyWith(
      {Value<int>? id,
      Value<int>? trackerId,
      Value<DateTime>? start,
      Value<DateTime>? end}) {
    return DurationTimelinesCompanion(
      id: id ?? this.id,
      trackerId: trackerId ?? this.trackerId,
      start: start ?? this.start,
      end: end ?? this.end,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (trackerId.present) {
      map['tracker_id'] = Variable<int>(trackerId.value);
    }
    if (start.present) {
      map['start'] = Variable<DateTime>(start.value);
    }
    if (end.present) {
      map['end'] = Variable<DateTime>(end.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DurationTimelinesCompanion(')
          ..write('id: $id, ')
          ..write('trackerId: $trackerId, ')
          ..write('start: $start, ')
          ..write('end: $end')
          ..write(')'))
        .toString();
  }
}

class $DurationTimelinesTable extends DurationTimelines
    with TableInfo<$DurationTimelinesTable, DurationTimeline> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DurationTimelinesTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _trackerIdMeta = const VerificationMeta('trackerId');
  @override
  late final GeneratedColumn<int?> trackerId = GeneratedColumn<int?>(
      'tracker_id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: true,
      defaultConstraints: 'REFERENCES trackers (id)');
  final VerificationMeta _startMeta = const VerificationMeta('start');
  @override
  late final GeneratedColumn<DateTime?> start = GeneratedColumn<DateTime?>(
      'start', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _endMeta = const VerificationMeta('end');
  @override
  late final GeneratedColumn<DateTime?> end = GeneratedColumn<DateTime?>(
      'end', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, trackerId, start, end];
  @override
  String get aliasedName => _alias ?? 'duration_timelines';
  @override
  String get actualTableName => 'duration_timelines';
  @override
  VerificationContext validateIntegrity(Insertable<DurationTimeline> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('tracker_id')) {
      context.handle(_trackerIdMeta,
          trackerId.isAcceptableOrUnknown(data['tracker_id']!, _trackerIdMeta));
    } else if (isInserting) {
      context.missing(_trackerIdMeta);
    }
    if (data.containsKey('start')) {
      context.handle(
          _startMeta, start.isAcceptableOrUnknown(data['start']!, _startMeta));
    } else if (isInserting) {
      context.missing(_startMeta);
    }
    if (data.containsKey('end')) {
      context.handle(
          _endMeta, end.isAcceptableOrUnknown(data['end']!, _endMeta));
    } else if (isInserting) {
      context.missing(_endMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DurationTimeline map(Map<String, dynamic> data, {String? tablePrefix}) {
    return DurationTimeline.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $DurationTimelinesTable createAlias(String alias) {
    return $DurationTimelinesTable(attachedDatabase, alias);
  }
}

class PointTimeline extends DataClass implements Insertable<PointTimeline> {
  final int id;
  final int trackerId;
  final DateTime point;
  PointTimeline(
      {required this.id, required this.trackerId, required this.point});
  factory PointTimeline.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return PointTimeline(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      trackerId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}tracker_id'])!,
      point: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}point'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['tracker_id'] = Variable<int>(trackerId);
    map['point'] = Variable<DateTime>(point);
    return map;
  }

  PointTimelinesCompanion toCompanion(bool nullToAbsent) {
    return PointTimelinesCompanion(
      id: Value(id),
      trackerId: Value(trackerId),
      point: Value(point),
    );
  }

  factory PointTimeline.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PointTimeline(
      id: serializer.fromJson<int>(json['id']),
      trackerId: serializer.fromJson<int>(json['trackerId']),
      point: serializer.fromJson<DateTime>(json['point']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'trackerId': serializer.toJson<int>(trackerId),
      'point': serializer.toJson<DateTime>(point),
    };
  }

  PointTimeline copyWith({int? id, int? trackerId, DateTime? point}) =>
      PointTimeline(
        id: id ?? this.id,
        trackerId: trackerId ?? this.trackerId,
        point: point ?? this.point,
      );
  @override
  String toString() {
    return (StringBuffer('PointTimeline(')
          ..write('id: $id, ')
          ..write('trackerId: $trackerId, ')
          ..write('point: $point')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, trackerId, point);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PointTimeline &&
          other.id == this.id &&
          other.trackerId == this.trackerId &&
          other.point == this.point);
}

class PointTimelinesCompanion extends UpdateCompanion<PointTimeline> {
  final Value<int> id;
  final Value<int> trackerId;
  final Value<DateTime> point;
  const PointTimelinesCompanion({
    this.id = const Value.absent(),
    this.trackerId = const Value.absent(),
    this.point = const Value.absent(),
  });
  PointTimelinesCompanion.insert({
    this.id = const Value.absent(),
    required int trackerId,
    required DateTime point,
  })  : trackerId = Value(trackerId),
        point = Value(point);
  static Insertable<PointTimeline> custom({
    Expression<int>? id,
    Expression<int>? trackerId,
    Expression<DateTime>? point,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (trackerId != null) 'tracker_id': trackerId,
      if (point != null) 'point': point,
    });
  }

  PointTimelinesCompanion copyWith(
      {Value<int>? id, Value<int>? trackerId, Value<DateTime>? point}) {
    return PointTimelinesCompanion(
      id: id ?? this.id,
      trackerId: trackerId ?? this.trackerId,
      point: point ?? this.point,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (trackerId.present) {
      map['tracker_id'] = Variable<int>(trackerId.value);
    }
    if (point.present) {
      map['point'] = Variable<DateTime>(point.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PointTimelinesCompanion(')
          ..write('id: $id, ')
          ..write('trackerId: $trackerId, ')
          ..write('point: $point')
          ..write(')'))
        .toString();
  }
}

class $PointTimelinesTable extends PointTimelines
    with TableInfo<$PointTimelinesTable, PointTimeline> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PointTimelinesTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _trackerIdMeta = const VerificationMeta('trackerId');
  @override
  late final GeneratedColumn<int?> trackerId = GeneratedColumn<int?>(
      'tracker_id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: true,
      defaultConstraints: 'REFERENCES trackers (id)');
  final VerificationMeta _pointMeta = const VerificationMeta('point');
  @override
  late final GeneratedColumn<DateTime?> point = GeneratedColumn<DateTime?>(
      'point', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, trackerId, point];
  @override
  String get aliasedName => _alias ?? 'point_timelines';
  @override
  String get actualTableName => 'point_timelines';
  @override
  VerificationContext validateIntegrity(Insertable<PointTimeline> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('tracker_id')) {
      context.handle(_trackerIdMeta,
          trackerId.isAcceptableOrUnknown(data['tracker_id']!, _trackerIdMeta));
    } else if (isInserting) {
      context.missing(_trackerIdMeta);
    }
    if (data.containsKey('point')) {
      context.handle(
          _pointMeta, point.isAcceptableOrUnknown(data['point']!, _pointMeta));
    } else if (isInserting) {
      context.missing(_pointMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PointTimeline map(Map<String, dynamic> data, {String? tablePrefix}) {
    return PointTimeline.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $PointTimelinesTable createAlias(String alias) {
    return $PointTimelinesTable(attachedDatabase, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $TrackersTable trackers = $TrackersTable(this);
  late final $DurationTimelinesTable durationTimelines =
      $DurationTimelinesTable(this);
  late final $PointTimelinesTable pointTimelines = $PointTimelinesTable(this);
  late final DurationTrackerDao durationTrackerDao =
      DurationTrackerDao(this as AppDatabase);
  late final PointTrackerDao pointTrackerDao =
      PointTrackerDao(this as AppDatabase);
  late final DisplayTrackerDao displayTrackerDao =
      DisplayTrackerDao(this as AppDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [trackers, durationTimelines, pointTimelines];
}
