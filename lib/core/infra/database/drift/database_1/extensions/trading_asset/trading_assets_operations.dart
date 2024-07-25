//ここではtradeの対象となる金融商品の名前とそのタイプを保存するテーブルに対する捜査を行う。

import 'package:drift/drift.dart';
import 'package:trade_stats_accumulation/core/infra/database/drift/database_1/database.dart';

extension DriftTradingAssetDatasOperations on MyDatabase{
  
  //TODO: ここに関数を追加していく

  //インサート
  Future<int> insertTradingAssetData(DriftTradingAssetData tradingAssetData) async{
    final insertId = await into(driftTradingAssetDatas).insert(
      DriftTradingAssetDatasCompanion(
        name: Value(tradingAssetData.name),
        type: Value(tradingAssetData.type),
      )
    );
    return insertId;
  }

  //アップデート
  Future<void> updateTradingAssetData(Insertable<DriftTradingAssetData> tradingAssetData) {
    return update(driftTradingAssetDatas).replace(tradingAssetData);
  }

  //すべてのトレード商品データを取得
  Future<List<DriftTradingAssetData>> getAllTradingAssetDatas() {
    return select(driftTradingAssetDatas).get();
  }

  //名前で一部一致するトレード商品データを取得
  Future<List<DriftTradingAssetData>> getTradingAssetDatasByName(String name) {
    return (select(driftTradingAssetDatas)..where((tbl) => tbl.name.like('%$name%'))).get();
  }

  //削除
  Future<void> deleteTradingAssetData(Insertable<DriftTradingAssetData> tradingAssetData) {
    return delete(driftTradingAssetDatas).delete(tradingAssetData);
  }

  //タイプが一致するトレード商品データを取得
  Future<List<DriftTradingAssetData>> getTradingAssetDatasByType(String type) {
    return (select(driftTradingAssetDatas)..where((tbl) => tbl.type.equals(type))).get();
  }

  //名前とタイプが一致するトレード商品データを取得
  Future<List<DriftTradingAssetData>> searchTradingAssetDatas({String? name, String? type}) {
    return (select(driftTradingAssetDatas)
      ..where((tbl) {
        var predicates = <Expression<bool>>[];
        if (name != null) predicates.add(tbl.name.like('%$name%'));
        if (type != null) predicates.add(tbl.type.equals(type));
        return predicates.fold<Expression<bool>>(
          const Constant(true),
          (a, b) => a & b,
        );
      }))
      .get();
  }

  //トレード商品の種類を取得
  Future<List<String>> getDistinctTradingAssetTypes() {
    return (selectOnly(driftTradingAssetDatas)
      ..addColumns([driftTradingAssetDatas.type])
      ..groupBy([driftTradingAssetDatas.type]))
      .map((row) => row.read(driftTradingAssetDatas.type)!)
      .get();
  }

  //トレード商品データをページネーションして取得
  Future<List<DriftTradingAssetData>> getPaginatedTradingAssetDatas(int offset, int limit) {
    return (select(driftTradingAssetDatas)
      ..limit(limit, offset: offset))
      .get();
  }






}