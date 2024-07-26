// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'asset_selector_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AssetSelectorState {
  List<DriftTradingAssetData> get allAssets =>
      throw _privateConstructorUsedError;
  List<DriftTradingAssetData> get filteredAssets =>
      throw _privateConstructorUsedError;
  List<DriftTradingAssetData> get similarAssets =>
      throw _privateConstructorUsedError;
  List<String> get assetTypes => throw _privateConstructorUsedError;
  String? get selectedType => throw _privateConstructorUsedError;
  DriftTradingAssetData? get selectedAsset =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AssetSelectorStateCopyWith<AssetSelectorState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AssetSelectorStateCopyWith<$Res> {
  factory $AssetSelectorStateCopyWith(
          AssetSelectorState value, $Res Function(AssetSelectorState) then) =
      _$AssetSelectorStateCopyWithImpl<$Res, AssetSelectorState>;
  @useResult
  $Res call(
      {List<DriftTradingAssetData> allAssets,
      List<DriftTradingAssetData> filteredAssets,
      List<DriftTradingAssetData> similarAssets,
      List<String> assetTypes,
      String? selectedType,
      DriftTradingAssetData? selectedAsset});
}

/// @nodoc
class _$AssetSelectorStateCopyWithImpl<$Res, $Val extends AssetSelectorState>
    implements $AssetSelectorStateCopyWith<$Res> {
  _$AssetSelectorStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? allAssets = null,
    Object? filteredAssets = null,
    Object? similarAssets = null,
    Object? assetTypes = null,
    Object? selectedType = freezed,
    Object? selectedAsset = freezed,
  }) {
    return _then(_value.copyWith(
      allAssets: null == allAssets
          ? _value.allAssets
          : allAssets // ignore: cast_nullable_to_non_nullable
              as List<DriftTradingAssetData>,
      filteredAssets: null == filteredAssets
          ? _value.filteredAssets
          : filteredAssets // ignore: cast_nullable_to_non_nullable
              as List<DriftTradingAssetData>,
      similarAssets: null == similarAssets
          ? _value.similarAssets
          : similarAssets // ignore: cast_nullable_to_non_nullable
              as List<DriftTradingAssetData>,
      assetTypes: null == assetTypes
          ? _value.assetTypes
          : assetTypes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      selectedType: freezed == selectedType
          ? _value.selectedType
          : selectedType // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedAsset: freezed == selectedAsset
          ? _value.selectedAsset
          : selectedAsset // ignore: cast_nullable_to_non_nullable
              as DriftTradingAssetData?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AssetSelectorStateImplCopyWith<$Res>
    implements $AssetSelectorStateCopyWith<$Res> {
  factory _$$AssetSelectorStateImplCopyWith(_$AssetSelectorStateImpl value,
          $Res Function(_$AssetSelectorStateImpl) then) =
      __$$AssetSelectorStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<DriftTradingAssetData> allAssets,
      List<DriftTradingAssetData> filteredAssets,
      List<DriftTradingAssetData> similarAssets,
      List<String> assetTypes,
      String? selectedType,
      DriftTradingAssetData? selectedAsset});
}

/// @nodoc
class __$$AssetSelectorStateImplCopyWithImpl<$Res>
    extends _$AssetSelectorStateCopyWithImpl<$Res, _$AssetSelectorStateImpl>
    implements _$$AssetSelectorStateImplCopyWith<$Res> {
  __$$AssetSelectorStateImplCopyWithImpl(_$AssetSelectorStateImpl _value,
      $Res Function(_$AssetSelectorStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? allAssets = null,
    Object? filteredAssets = null,
    Object? similarAssets = null,
    Object? assetTypes = null,
    Object? selectedType = freezed,
    Object? selectedAsset = freezed,
  }) {
    return _then(_$AssetSelectorStateImpl(
      allAssets: null == allAssets
          ? _value._allAssets
          : allAssets // ignore: cast_nullable_to_non_nullable
              as List<DriftTradingAssetData>,
      filteredAssets: null == filteredAssets
          ? _value._filteredAssets
          : filteredAssets // ignore: cast_nullable_to_non_nullable
              as List<DriftTradingAssetData>,
      similarAssets: null == similarAssets
          ? _value._similarAssets
          : similarAssets // ignore: cast_nullable_to_non_nullable
              as List<DriftTradingAssetData>,
      assetTypes: null == assetTypes
          ? _value._assetTypes
          : assetTypes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      selectedType: freezed == selectedType
          ? _value.selectedType
          : selectedType // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedAsset: freezed == selectedAsset
          ? _value.selectedAsset
          : selectedAsset // ignore: cast_nullable_to_non_nullable
              as DriftTradingAssetData?,
    ));
  }
}

/// @nodoc

class _$AssetSelectorStateImpl implements _AssetSelectorState {
  _$AssetSelectorStateImpl(
      {required final List<DriftTradingAssetData> allAssets,
      required final List<DriftTradingAssetData> filteredAssets,
      required final List<DriftTradingAssetData> similarAssets,
      required final List<String> assetTypes,
      this.selectedType,
      this.selectedAsset})
      : _allAssets = allAssets,
        _filteredAssets = filteredAssets,
        _similarAssets = similarAssets,
        _assetTypes = assetTypes;

  final List<DriftTradingAssetData> _allAssets;
  @override
  List<DriftTradingAssetData> get allAssets {
    if (_allAssets is EqualUnmodifiableListView) return _allAssets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allAssets);
  }

  final List<DriftTradingAssetData> _filteredAssets;
  @override
  List<DriftTradingAssetData> get filteredAssets {
    if (_filteredAssets is EqualUnmodifiableListView) return _filteredAssets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_filteredAssets);
  }

  final List<DriftTradingAssetData> _similarAssets;
  @override
  List<DriftTradingAssetData> get similarAssets {
    if (_similarAssets is EqualUnmodifiableListView) return _similarAssets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_similarAssets);
  }

  final List<String> _assetTypes;
  @override
  List<String> get assetTypes {
    if (_assetTypes is EqualUnmodifiableListView) return _assetTypes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_assetTypes);
  }

  @override
  final String? selectedType;
  @override
  final DriftTradingAssetData? selectedAsset;

  @override
  String toString() {
    return 'AssetSelectorState(allAssets: $allAssets, filteredAssets: $filteredAssets, similarAssets: $similarAssets, assetTypes: $assetTypes, selectedType: $selectedType, selectedAsset: $selectedAsset)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AssetSelectorStateImpl &&
            const DeepCollectionEquality()
                .equals(other._allAssets, _allAssets) &&
            const DeepCollectionEquality()
                .equals(other._filteredAssets, _filteredAssets) &&
            const DeepCollectionEquality()
                .equals(other._similarAssets, _similarAssets) &&
            const DeepCollectionEquality()
                .equals(other._assetTypes, _assetTypes) &&
            (identical(other.selectedType, selectedType) ||
                other.selectedType == selectedType) &&
            (identical(other.selectedAsset, selectedAsset) ||
                other.selectedAsset == selectedAsset));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_allAssets),
      const DeepCollectionEquality().hash(_filteredAssets),
      const DeepCollectionEquality().hash(_similarAssets),
      const DeepCollectionEquality().hash(_assetTypes),
      selectedType,
      selectedAsset);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AssetSelectorStateImplCopyWith<_$AssetSelectorStateImpl> get copyWith =>
      __$$AssetSelectorStateImplCopyWithImpl<_$AssetSelectorStateImpl>(
          this, _$identity);
}

abstract class _AssetSelectorState implements AssetSelectorState {
  factory _AssetSelectorState(
      {required final List<DriftTradingAssetData> allAssets,
      required final List<DriftTradingAssetData> filteredAssets,
      required final List<DriftTradingAssetData> similarAssets,
      required final List<String> assetTypes,
      final String? selectedType,
      final DriftTradingAssetData? selectedAsset}) = _$AssetSelectorStateImpl;

  @override
  List<DriftTradingAssetData> get allAssets;
  @override
  List<DriftTradingAssetData> get filteredAssets;
  @override
  List<DriftTradingAssetData> get similarAssets;
  @override
  List<String> get assetTypes;
  @override
  String? get selectedType;
  @override
  DriftTradingAssetData? get selectedAsset;
  @override
  @JsonKey(ignore: true)
  _$$AssetSelectorStateImplCopyWith<_$AssetSelectorStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
