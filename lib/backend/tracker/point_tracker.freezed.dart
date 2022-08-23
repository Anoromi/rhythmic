// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'point_tracker.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PointTrackerDisplay _$PointTrackerDisplayFromJson(Map<String, dynamic> json) {
  return _PointTrackerDisplay.fromJson(json);
}

/// @nodoc
mixin _$PointTrackerDisplay {
  DateTime? get devalidationPoint => throw _privateConstructorUsedError;
  set devalidationPoint(DateTime? value) => throw _privateConstructorUsedError;
  DevalidationTimings? get devalidationTimings =>
      throw _privateConstructorUsedError;
  set devalidationTimings(DevalidationTimings? value) =>
      throw _privateConstructorUsedError;
  int get devalidationPeriod => throw _privateConstructorUsedError;
  set devalidationPeriod(int value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PointTrackerDisplayCopyWith<PointTrackerDisplay> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PointTrackerDisplayCopyWith<$Res> {
  factory $PointTrackerDisplayCopyWith(
          PointTrackerDisplay value, $Res Function(PointTrackerDisplay) then) =
      _$PointTrackerDisplayCopyWithImpl<$Res>;
  $Res call(
      {DateTime? devalidationPoint,
      DevalidationTimings? devalidationTimings,
      int devalidationPeriod});
}

/// @nodoc
class _$PointTrackerDisplayCopyWithImpl<$Res>
    implements $PointTrackerDisplayCopyWith<$Res> {
  _$PointTrackerDisplayCopyWithImpl(this._value, this._then);

  final PointTrackerDisplay _value;
  // ignore: unused_field
  final $Res Function(PointTrackerDisplay) _then;

  @override
  $Res call({
    Object? devalidationPoint = freezed,
    Object? devalidationTimings = freezed,
    Object? devalidationPeriod = freezed,
  }) {
    return _then(_value.copyWith(
      devalidationPoint: devalidationPoint == freezed
          ? _value.devalidationPoint
          : devalidationPoint // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      devalidationTimings: devalidationTimings == freezed
          ? _value.devalidationTimings
          : devalidationTimings // ignore: cast_nullable_to_non_nullable
              as DevalidationTimings?,
      devalidationPeriod: devalidationPeriod == freezed
          ? _value.devalidationPeriod
          : devalidationPeriod // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_PointTrackerDisplayCopyWith<$Res>
    implements $PointTrackerDisplayCopyWith<$Res> {
  factory _$$_PointTrackerDisplayCopyWith(_$_PointTrackerDisplay value,
          $Res Function(_$_PointTrackerDisplay) then) =
      __$$_PointTrackerDisplayCopyWithImpl<$Res>;
  @override
  $Res call(
      {DateTime? devalidationPoint,
      DevalidationTimings? devalidationTimings,
      int devalidationPeriod});
}

/// @nodoc
class __$$_PointTrackerDisplayCopyWithImpl<$Res>
    extends _$PointTrackerDisplayCopyWithImpl<$Res>
    implements _$$_PointTrackerDisplayCopyWith<$Res> {
  __$$_PointTrackerDisplayCopyWithImpl(_$_PointTrackerDisplay _value,
      $Res Function(_$_PointTrackerDisplay) _then)
      : super(_value, (v) => _then(v as _$_PointTrackerDisplay));

  @override
  _$_PointTrackerDisplay get _value => super._value as _$_PointTrackerDisplay;

  @override
  $Res call({
    Object? devalidationPoint = freezed,
    Object? devalidationTimings = freezed,
    Object? devalidationPeriod = freezed,
  }) {
    return _then(_$_PointTrackerDisplay(
      devalidationPoint == freezed
          ? _value.devalidationPoint
          : devalidationPoint // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      devalidationTimings == freezed
          ? _value.devalidationTimings
          : devalidationTimings // ignore: cast_nullable_to_non_nullable
              as DevalidationTimings?,
      devalidationPeriod == freezed
          ? _value.devalidationPeriod
          : devalidationPeriod // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PointTrackerDisplay extends _PointTrackerDisplay {
  _$_PointTrackerDisplay(
      this.devalidationPoint, this.devalidationTimings, this.devalidationPeriod)
      : super._();

  factory _$_PointTrackerDisplay.fromJson(Map<String, dynamic> json) =>
      _$$_PointTrackerDisplayFromJson(json);

  @override
  DateTime? devalidationPoint;
  @override
  DevalidationTimings? devalidationTimings;
  @override
  int devalidationPeriod;

  @override
  String toString() {
    return 'PointTrackerDisplay(devalidationPoint: $devalidationPoint, devalidationTimings: $devalidationTimings, devalidationPeriod: $devalidationPeriod)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PointTrackerDisplay &&
            const DeepCollectionEquality()
                .equals(other.devalidationPoint, devalidationPoint) &&
            const DeepCollectionEquality()
                .equals(other.devalidationTimings, devalidationTimings) &&
            const DeepCollectionEquality()
                .equals(other.devalidationPeriod, devalidationPeriod));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(devalidationPoint),
      const DeepCollectionEquality().hash(devalidationTimings),
      const DeepCollectionEquality().hash(devalidationPeriod));

  @JsonKey(ignore: true)
  @override
  _$$_PointTrackerDisplayCopyWith<_$_PointTrackerDisplay> get copyWith =>
      __$$_PointTrackerDisplayCopyWithImpl<_$_PointTrackerDisplay>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PointTrackerDisplayToJson(
      this,
    );
  }
}

abstract class _PointTrackerDisplay extends PointTrackerDisplay {
  factory _PointTrackerDisplay(
      DateTime? devalidationPoint,
      DevalidationTimings? devalidationTimings,
      int devalidationPeriod) = _$_PointTrackerDisplay;
  _PointTrackerDisplay._() : super._();

  factory _PointTrackerDisplay.fromJson(Map<String, dynamic> json) =
      _$_PointTrackerDisplay.fromJson;

  @override
  DateTime? get devalidationPoint;
  set devalidationPoint(DateTime? value);
  @override
  DevalidationTimings? get devalidationTimings;
  set devalidationTimings(DevalidationTimings? value);
  @override
  int get devalidationPeriod;
  set devalidationPeriod(int value);
  @override
  @JsonKey(ignore: true)
  _$$_PointTrackerDisplayCopyWith<_$_PointTrackerDisplay> get copyWith =>
      throw _privateConstructorUsedError;
}
