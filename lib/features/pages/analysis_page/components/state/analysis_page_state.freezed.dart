// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'analysis_page_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AnalysisPageState {
  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AnalysisPageStateCopyWith<AnalysisPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnalysisPageStateCopyWith<$Res> {
  factory $AnalysisPageStateCopyWith(
          AnalysisPageState value, $Res Function(AnalysisPageState) then) =
      _$AnalysisPageStateCopyWithImpl<$Res, AnalysisPageState>;
  @useResult
  $Res call({bool isLoading});
}

/// @nodoc
class _$AnalysisPageStateCopyWithImpl<$Res, $Val extends AnalysisPageState>
    implements $AnalysisPageStateCopyWith<$Res> {
  _$AnalysisPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AnalysisPageStateImplCopyWith<$Res>
    implements $AnalysisPageStateCopyWith<$Res> {
  factory _$$AnalysisPageStateImplCopyWith(_$AnalysisPageStateImpl value,
          $Res Function(_$AnalysisPageStateImpl) then) =
      __$$AnalysisPageStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading});
}

/// @nodoc
class __$$AnalysisPageStateImplCopyWithImpl<$Res>
    extends _$AnalysisPageStateCopyWithImpl<$Res, _$AnalysisPageStateImpl>
    implements _$$AnalysisPageStateImplCopyWith<$Res> {
  __$$AnalysisPageStateImplCopyWithImpl(_$AnalysisPageStateImpl _value,
      $Res Function(_$AnalysisPageStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
  }) {
    return _then(_$AnalysisPageStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$AnalysisPageStateImpl implements _AnalysisPageState {
  _$AnalysisPageStateImpl({this.isLoading = false});

  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString() {
    return 'AnalysisPageState(isLoading: $isLoading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnalysisPageStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AnalysisPageStateImplCopyWith<_$AnalysisPageStateImpl> get copyWith =>
      __$$AnalysisPageStateImplCopyWithImpl<_$AnalysisPageStateImpl>(
          this, _$identity);
}

abstract class _AnalysisPageState implements AnalysisPageState {
  factory _AnalysisPageState({final bool isLoading}) = _$AnalysisPageStateImpl;

  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$AnalysisPageStateImplCopyWith<_$AnalysisPageStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
