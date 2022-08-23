// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'timer_tracker.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DurationTrackerDisplay _$DurationTrackerDisplayFromJson(
    Map<String, dynamic> json) {
  return _TimerTrackerDisplay.fromJson(json);
}

/// @nodoc
mixin _$DurationTrackerDisplay {
  Duration? get previousEntry => throw _privateConstructorUsedError;
  set previousEntry(Duration? value) => throw _privateConstructorUsedError;
  DateTime? get start => throw _privateConstructorUsedError;
  set start(DateTime? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DurationTrackerDisplayCopyWith<DurationTrackerDisplay> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DurationTrackerDisplayCopyWith<$Res> {
  factory $DurationTrackerDisplayCopyWith(DurationTrackerDisplay value,
          $Res Function(DurationTrackerDisplay) then) =
      _$DurationTrackerDisplayCopyWithImpl<$Res>;
  $Res call({Duration? previousEntry, DateTime? start});
}

/// @nodoc
class _$DurationTrackerDisplayCopyWithImpl<$Res>
    implements $DurationTrackerDisplayCopyWith<$Res> {
  _$DurationTrackerDisplayCopyWithImpl(this._value, this._then);

  final DurationTrackerDisplay _value;
  // ignore: unused_field
  final $Res Function(DurationTrackerDisplay) _then;

  @override
  $Res call({
    Object? previousEntry = freezed,
    Object? start = freezed,
  }) {
    return _then(_value.copyWith(
      previousEntry: previousEntry == freezed
          ? _value.previousEntry
          : previousEntry // ignore: cast_nullable_to_non_nullable
              as Duration?,
      start: start == freezed
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
abstract class _$$_TimerTrackerDisplayCopyWith<$Res>
    implements $DurationTrackerDisplayCopyWith<$Res> {
  factory _$$_TimerTrackerDisplayCopyWith(_$_TimerTrackerDisplay value,
          $Res Function(_$_TimerTrackerDisplay) then) =
      __$$_TimerTrackerDisplayCopyWithImpl<$Res>;
  @override
  $Res call({Duration? previousEntry, DateTime? start});
}

/// @nodoc
class __$$_TimerTrackerDisplayCopyWithImpl<$Res>
    extends _$DurationTrackerDisplayCopyWithImpl<$Res>
    implements _$$_TimerTrackerDisplayCopyWith<$Res> {
  __$$_TimerTrackerDisplayCopyWithImpl(_$_TimerTrackerDisplay _value,
      $Res Function(_$_TimerTrackerDisplay) _then)
      : super(_value, (v) => _then(v as _$_TimerTrackerDisplay));

  @override
  _$_TimerTrackerDisplay get _value => super._value as _$_TimerTrackerDisplay;

  @override
  $Res call({
    Object? previousEntry = freezed,
    Object? start = freezed,
  }) {
    return _then(_$_TimerTrackerDisplay(
      previousEntry == freezed
          ? _value.previousEntry
          : previousEntry // ignore: cast_nullable_to_non_nullable
              as Duration?,
      start == freezed
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TimerTrackerDisplay extends _TimerTrackerDisplay {
  _$_TimerTrackerDisplay(this.previousEntry, this.start) : super._();

  factory _$_TimerTrackerDisplay.fromJson(Map<String, dynamic> json) =>
      _$$_TimerTrackerDisplayFromJson(json);

  @override
  Duration? previousEntry;
  @override
  DateTime? start;

  @override
  String toString() {
    return 'DurationTrackerDisplay(previousEntry: $previousEntry, start: $start)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TimerTrackerDisplay &&
            const DeepCollectionEquality()
                .equals(other.previousEntry, previousEntry) &&
            const DeepCollectionEquality().equals(other.start, start));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(previousEntry),
      const DeepCollectionEquality().hash(start));

  @JsonKey(ignore: true)
  @override
  _$$_TimerTrackerDisplayCopyWith<_$_TimerTrackerDisplay> get copyWith =>
      __$$_TimerTrackerDisplayCopyWithImpl<_$_TimerTrackerDisplay>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TimerTrackerDisplayToJson(
      this,
    );
  }
}

abstract class _TimerTrackerDisplay extends DurationTrackerDisplay {
  factory _TimerTrackerDisplay(Duration? previousEntry, DateTime? start) =
      _$_TimerTrackerDisplay;
  _TimerTrackerDisplay._() : super._();

  factory _TimerTrackerDisplay.fromJson(Map<String, dynamic> json) =
      _$_TimerTrackerDisplay.fromJson;

  @override
  Duration? get previousEntry;
  set previousEntry(Duration? value);
  @override
  DateTime? get start;
  set start(DateTime? value);
  @override
  @JsonKey(ignore: true)
  _$$_TimerTrackerDisplayCopyWith<_$_TimerTrackerDisplay> get copyWith =>
      throw _privateConstructorUsedError;
}
