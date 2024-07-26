// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tag_selector_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TagSelectorState {
  List<DriftTradeTag> get allTags => throw _privateConstructorUsedError;
  List<DriftTradeTag> get filteredTags => throw _privateConstructorUsedError;
  List<String> get genres => throw _privateConstructorUsedError;
  String? get selectedGenre => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TagSelectorStateCopyWith<TagSelectorState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TagSelectorStateCopyWith<$Res> {
  factory $TagSelectorStateCopyWith(
          TagSelectorState value, $Res Function(TagSelectorState) then) =
      _$TagSelectorStateCopyWithImpl<$Res, TagSelectorState>;
  @useResult
  $Res call(
      {List<DriftTradeTag> allTags,
      List<DriftTradeTag> filteredTags,
      List<String> genres,
      String? selectedGenre});
}

/// @nodoc
class _$TagSelectorStateCopyWithImpl<$Res, $Val extends TagSelectorState>
    implements $TagSelectorStateCopyWith<$Res> {
  _$TagSelectorStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? allTags = null,
    Object? filteredTags = null,
    Object? genres = null,
    Object? selectedGenre = freezed,
  }) {
    return _then(_value.copyWith(
      allTags: null == allTags
          ? _value.allTags
          : allTags // ignore: cast_nullable_to_non_nullable
              as List<DriftTradeTag>,
      filteredTags: null == filteredTags
          ? _value.filteredTags
          : filteredTags // ignore: cast_nullable_to_non_nullable
              as List<DriftTradeTag>,
      genres: null == genres
          ? _value.genres
          : genres // ignore: cast_nullable_to_non_nullable
              as List<String>,
      selectedGenre: freezed == selectedGenre
          ? _value.selectedGenre
          : selectedGenre // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TagSelectorStateImplCopyWith<$Res>
    implements $TagSelectorStateCopyWith<$Res> {
  factory _$$TagSelectorStateImplCopyWith(_$TagSelectorStateImpl value,
          $Res Function(_$TagSelectorStateImpl) then) =
      __$$TagSelectorStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<DriftTradeTag> allTags,
      List<DriftTradeTag> filteredTags,
      List<String> genres,
      String? selectedGenre});
}

/// @nodoc
class __$$TagSelectorStateImplCopyWithImpl<$Res>
    extends _$TagSelectorStateCopyWithImpl<$Res, _$TagSelectorStateImpl>
    implements _$$TagSelectorStateImplCopyWith<$Res> {
  __$$TagSelectorStateImplCopyWithImpl(_$TagSelectorStateImpl _value,
      $Res Function(_$TagSelectorStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? allTags = null,
    Object? filteredTags = null,
    Object? genres = null,
    Object? selectedGenre = freezed,
  }) {
    return _then(_$TagSelectorStateImpl(
      allTags: null == allTags
          ? _value._allTags
          : allTags // ignore: cast_nullable_to_non_nullable
              as List<DriftTradeTag>,
      filteredTags: null == filteredTags
          ? _value._filteredTags
          : filteredTags // ignore: cast_nullable_to_non_nullable
              as List<DriftTradeTag>,
      genres: null == genres
          ? _value._genres
          : genres // ignore: cast_nullable_to_non_nullable
              as List<String>,
      selectedGenre: freezed == selectedGenre
          ? _value.selectedGenre
          : selectedGenre // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$TagSelectorStateImpl implements _TagSelectorState {
  _$TagSelectorStateImpl(
      {required final List<DriftTradeTag> allTags,
      required final List<DriftTradeTag> filteredTags,
      required final List<String> genres,
      this.selectedGenre})
      : _allTags = allTags,
        _filteredTags = filteredTags,
        _genres = genres;

  final List<DriftTradeTag> _allTags;
  @override
  List<DriftTradeTag> get allTags {
    if (_allTags is EqualUnmodifiableListView) return _allTags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allTags);
  }

  final List<DriftTradeTag> _filteredTags;
  @override
  List<DriftTradeTag> get filteredTags {
    if (_filteredTags is EqualUnmodifiableListView) return _filteredTags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_filteredTags);
  }

  final List<String> _genres;
  @override
  List<String> get genres {
    if (_genres is EqualUnmodifiableListView) return _genres;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_genres);
  }

  @override
  final String? selectedGenre;

  @override
  String toString() {
    return 'TagSelectorState(allTags: $allTags, filteredTags: $filteredTags, genres: $genres, selectedGenre: $selectedGenre)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TagSelectorStateImpl &&
            const DeepCollectionEquality().equals(other._allTags, _allTags) &&
            const DeepCollectionEquality()
                .equals(other._filteredTags, _filteredTags) &&
            const DeepCollectionEquality().equals(other._genres, _genres) &&
            (identical(other.selectedGenre, selectedGenre) ||
                other.selectedGenre == selectedGenre));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_allTags),
      const DeepCollectionEquality().hash(_filteredTags),
      const DeepCollectionEquality().hash(_genres),
      selectedGenre);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TagSelectorStateImplCopyWith<_$TagSelectorStateImpl> get copyWith =>
      __$$TagSelectorStateImplCopyWithImpl<_$TagSelectorStateImpl>(
          this, _$identity);
}

abstract class _TagSelectorState implements TagSelectorState {
  factory _TagSelectorState(
      {required final List<DriftTradeTag> allTags,
      required final List<DriftTradeTag> filteredTags,
      required final List<String> genres,
      final String? selectedGenre}) = _$TagSelectorStateImpl;

  @override
  List<DriftTradeTag> get allTags;
  @override
  List<DriftTradeTag> get filteredTags;
  @override
  List<String> get genres;
  @override
  String? get selectedGenre;
  @override
  @JsonKey(ignore: true)
  _$$TagSelectorStateImplCopyWith<_$TagSelectorStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
