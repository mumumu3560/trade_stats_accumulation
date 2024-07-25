import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trade_stats_accumulation/core/infra/database/drift/database_1/database.dart';

part 'asset_selector_state.freezed.dart';

@freezed
class AssetSelectorState with _$AssetSelectorState {
  factory AssetSelectorState({
    required List<DriftTradingAssetData> allAssets,
    required List<DriftTradingAssetData> filteredAssets,
    required List<DriftTradingAssetData> similarAssets,
    required List<String> assetTypes,
    String? selectedType,
    DriftTradingAssetData? selectedAsset,
  }) = _AssetSelectorState;

  factory AssetSelectorState.initial() => AssetSelectorState(
    allAssets: [],
    filteredAssets: [],
    similarAssets: [],
    assetTypes: [],
  );
}