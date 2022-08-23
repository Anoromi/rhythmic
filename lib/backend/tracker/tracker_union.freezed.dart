// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'tracker_union.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TrackerUnion _$TrackerUnionFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'duration':
      return TrackerUnionDuration.fromJson(json);
    case 'point':
      return TrackerUnionPoint.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'TrackerUnion',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$TrackerUnion {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DurationTrackerDisplay entity) duration,
    required TResult Function(PointTrackerDisplay entity) point,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(DurationTrackerDisplay entity)? duration,
    TResult Function(PointTrackerDisplay entity)? point,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DurationTrackerDisplay entity)? duration,
    TResult Function(PointTrackerDisplay entity)? point,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TrackerUnionDuration value) duration,
    required TResult Function(TrackerUnionPoint value) point,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(TrackerUnionDuration value)? duration,
    TResult Function(TrackerUnionPoint value)? point,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TrackerUnionDuration value)? duration,
    TResult Function(TrackerUnionPoint value)? point,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TrackerUnionCopyWith<$Res> {
  factory $TrackerUnionCopyWith(
          TrackerUnion value, $Res Function(TrackerUnion) then) =
      _$TrackerUnionCopyWithImpl<$Res>;
}

/// @nodoc
class _$TrackerUnionCopyWithImpl<$Res> implements $TrackerUnionCopyWith<$Res> {
  _$TrackerUnionCopyWithImpl(this._value, this._then);

  final TrackerUnion _value;
  // ignore: unused_field
  final $Res Function(TrackerUnion) _then;
}

/// @nodoc
abstract class _$$TrackerUnionDurationCopyWith<$Res> {
  factory _$$TrackerUnionDurationCopyWith(_$TrackerUnionDuration value,
          $Res Function(_$TrackerUnionDuration) then) =
      __$$TrackerUnionDurationCopyWithImpl<$Res>;
  $Res call({DurationTrackerDisplay entity});

  $DurationTrackerDisplayCopyWith<$Res> get entity;
}

/// @nodoc
class __$$TrackerUnionDurationCopyWithImpl<$Res>
    extends _$TrackerUnionCopyWithImpl<$Res>
    implements _$$TrackerUnionDurationCopyWith<$Res> {
  __$$TrackerUnionDurationCopyWithImpl(_$TrackerUnionDuration _value,
      $Res Function(_$TrackerUnionDuration) _then)
      : super(_value, (v) => _then(v as _$TrackerUnionDuration));

  @override
  _$TrackerUnionDuration get _value => super._value as _$TrackerUnionDuration;

  @override
  $Res call({
    Object? entity = freezed,
  }) {
    return _then(_$TrackerUnionDuration(
      entity == freezed
          ? _value.entity
          : entity // ignore: cast_nullable_to_non_nullable
              as DurationTrackerDisplay,
    ));
  }

  @override
  $DurationTrackerDisplayCopyWith<$Res> get entity {
    return $DurationTrackerDisplayCopyWith<$Res>(_value.entity, (value) {
      return _then(_value.copyWith(entity: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$TrackerUnionDuration implements TrackerUnionDuration {
  _$TrackerUnionDuration(this.entity, {final String? $type})
      : $type = $type ?? 'duration';

  factory _$TrackerUnionDuration.fromJson(Map<String, dynamic> json) =>
      _$$TrackerUnionDurationFromJson(json);

  @override
  final DurationTrackerDisplay entity;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'TrackerUnion.duration(entity: $entity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TrackerUnionDuration &&
            const DeepCollectionEquality().equals(other.entity, entity));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(entity));

  @JsonKey(ignore: true)
  @override
  _$$TrackerUnionDurationCopyWith<_$TrackerUnionDuration> get copyWith =>
      __$$TrackerUnionDurationCopyWithImpl<_$TrackerUnionDuration>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DurationTrackerDisplay entity) duration,
    required TResult Function(PointTrackerDisplay entity) point,
  }) {
    return duration(entity);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(DurationTrackerDisplay entity)? duration,
    TResult Function(PointTrackerDisplay entity)? point,
  }) {
    return duration?.call(entity);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DurationTrackerDisplay entity)? duration,
    TResult Function(PointTrackerDisplay entity)? point,
    required TResult orElse(),
  }) {
    if (duration != null) {
      return duration(entity);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TrackerUnionDuration value) duration,
    required TResult Function(TrackerUnionPoint value) point,
  }) {
    return duration(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(TrackerUnionDuration value)? duration,
    TResult Function(TrackerUnionPoint value)? point,
  }) {
    return duration?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TrackerUnionDuration value)? duration,
    TResult Function(TrackerUnionPoint value)? point,
    required TResult orElse(),
  }) {
    if (duration != null) {
      return duration(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$TrackerUnionDurationToJson(
      this,
    );
  }
}

abstract class TrackerUnionDuration implements TrackerUnion {
  factory TrackerUnionDuration(final DurationTrackerDisplay entity) =
      _$TrackerUnionDuration;

  factory TrackerUnionDuration.fromJson(Map<String, dynamic> json) =
      _$TrackerUnionDuration.fromJson;

  DurationTrackerDisplay get entity;
  @JsonKey(ignore: true)
  _$$TrackerUnionDurationCopyWith<_$TrackerUnionDuration> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TrackerUnionPointCopyWith<$Res> {
  factory _$$TrackerUnionPointCopyWith(
          _$TrackerUnionPoint value, $Res Function(_$TrackerUnionPoint) then) =
      __$$TrackerUnionPointCopyWithImpl<$Res>;
  $Res call({PointTrackerDisplay entity});

  $PointTrackerDisplayCopyWith<$Res> get entity;
}

/// @nodoc
class __$$TrackerUnionPointCopyWithImpl<$Res>
    extends _$TrackerUnionCopyWithImpl<$Res>
    implements _$$TrackerUnionPointCopyWith<$Res> {
  __$$TrackerUnionPointCopyWithImpl(
      _$TrackerUnionPoint _value, $Res Function(_$TrackerUnionPoint) _then)
      : super(_value, (v) => _then(v as _$TrackerUnionPoint));

  @override
  _$TrackerUnionPoint get _value => super._value as _$TrackerUnionPoint;

  @override
  $Res call({
    Object? entity = freezed,
  }) {
    return _then(_$TrackerUnionPoint(
      entity == freezed
          ? _value.entity
          : entity // ignore: cast_nullable_to_non_nullable
              as PointTrackerDisplay,
    ));
  }

  @override
  $PointTrackerDisplayCopyWith<$Res> get entity {
    return $PointTrackerDisplayCopyWith<$Res>(_value.entity, (value) {
      return _then(_value.copyWith(entity: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$TrackerUnionPoint implements TrackerUnionPoint {
  _$TrackerUnionPoint(this.entity, {final String? $type})
      : $type = $type ?? 'point';

  factory _$TrackerUnionPoint.fromJson(Map<String, dynamic> json) =>
      _$$TrackerUnionPointFromJson(json);

  @override
  final PointTrackerDisplay entity;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'TrackerUnion.point(entity: $entity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TrackerUnionPoint &&
            const DeepCollectionEquality().equals(other.entity, entity));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(entity));

  @JsonKey(ignore: true)
  @override
  _$$TrackerUnionPointCopyWith<_$TrackerUnionPoint> get copyWith =>
      __$$TrackerUnionPointCopyWithImpl<_$TrackerUnionPoint>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DurationTrackerDisplay entity) duration,
    required TResult Function(PointTrackerDisplay entity) point,
  }) {
    return point(entity);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(DurationTrackerDisplay entity)? duration,
    TResult Function(PointTrackerDisplay entity)? point,
  }) {
    return point?.call(entity);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DurationTrackerDisplay entity)? duration,
    TResult Function(PointTrackerDisplay entity)? point,
    required TResult orElse(),
  }) {
    if (point != null) {
      return point(entity);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TrackerUnionDuration value) duration,
    required TResult Function(TrackerUnionPoint value) point,
  }) {
    return point(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(TrackerUnionDuration value)? duration,
    TResult Function(TrackerUnionPoint value)? point,
  }) {
    return point?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TrackerUnionDuration value)? duration,
    TResult Function(TrackerUnionPoint value)? point,
    required TResult orElse(),
  }) {
    if (point != null) {
      return point(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$TrackerUnionPointToJson(
      this,
    );
  }
}

abstract class TrackerUnionPoint implements TrackerUnion {
  factory TrackerUnionPoint(final PointTrackerDisplay entity) =
      _$TrackerUnionPoint;

  factory TrackerUnionPoint.fromJson(Map<String, dynamic> json) =
      _$TrackerUnionPoint.fromJson;

  PointTrackerDisplay get entity;
  @JsonKey(ignore: true)
  _$$TrackerUnionPointCopyWith<_$TrackerUnionPoint> get copyWith =>
      throw _privateConstructorUsedError;
}
