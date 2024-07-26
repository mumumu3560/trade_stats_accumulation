// asset_selector_logic.dart

//riverpodのディレクトリってどこに置けばいいんだ？このriverpodはadd_page.dartファイルでしか使わないと思うので
//この中に入れておく
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trade_stats_accumulation/core/application/riverpod/db_admin/db_admin.dart';
import 'package:trade_stats_accumulation/core/infra/database/drift/database_1/database.dart';
import 'package:trade_stats_accumulation/core/infra/database/drift/database_1/extensions/all_extension.dart';
import 'package:trade_stats_accumulation/features/pages/add_page/components/asset_selector/state/asset_selector_state.dart';

part 'asset_selector_logic.g.dart';

@riverpod
class AssetSelectorNotifier extends _$AssetSelectorNotifier {
  @override
  AssetSelectorState build() {
    return AssetSelectorState(
      allAssets: [],
      filteredAssets: [],
      similarAssets: [],
      assetTypes: [],
    );
  }

  Future<void> initialize() async {
    final db = ref.read(dbAdminNotifierProvider);
    final assets = await db.getAllTradingAssetDatas();
    final types = await db.getDistinctTradingAssetTypes();
    state = state.copyWith(
      allAssets: assets,
      filteredAssets: assets,
      assetTypes: types,
    );
  }

  //商品名の検索の際に呼び出される関数
  void updateSearch(String search) {
    //大文字小文字を区別しないで検索
    final normalizedSearch = search.trim().toLowerCase();

    //現在DBに登録されているすべての商品のnameに対して検索クエリを書ける。
    final filtered = state.allAssets.where((asset) {
      return asset.name?.toLowerCase().contains(normalizedSearch) ?? false;
    }).toList();

    //filteredとsimilar同じだからいらなくない？
    final similar = state.allAssets.where((asset) {
      return asset.name?.toLowerCase().contains(normalizedSearch) ?? false;
    }).toList();
    state = state.copyWith(
      filteredAssets: filtered,
      similarAssets: similar,
    );
  }


  //すでにDBに登録された商品のtypeについてのクエリ
  void updateType(String? type) {
    
    final filtered = type == null
        ? state.allAssets
        : state.allAssets.where((asset) => asset.type == type).toList();


    state = state.copyWith(
      selectedType: type,
      filteredAssets: filtered,
    );
  }

  
  void selectAsset(DriftTradingAssetData? asset) {
    state = state.copyWith(selectedAsset: asset);
  }

  Future<bool> addNewAsset(String name, String type) async {
    final db = ref.read(dbAdminNotifierProvider);
    final normalizedName = name.trim().toLowerCase();
    final existingAsset = state.allAssets.any(
      (asset) => asset.name?.toLowerCase() == normalizedName
    );
    if (existingAsset) {
      return false;
    }

    final newAsset = DriftTradingAssetData(
      id: 0,
      name: name.trim(),
      type: type.trim(),
    );
    await db.insertTradingAssetData(newAsset);
    await initialize();
    return true;
  }
}
