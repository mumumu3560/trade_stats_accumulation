import 'package:drift/drift.dart';
import 'package:trade_stats_accumulation/core/infra/database/drift/type_converter.dart';

class TradeDatas extends Table {
  IntColumn get id => integer().autoIncrement()();

  //どの通貨ペアか
  TextColumn get currencyPair => text().nullable()();

  //概要
  TextColumn get title => text().nullable()();

  //前提
  TextColumn get premise => text().nullable()();

  //何pips勝ったかをintで保存する
  IntColumn get pips => integer().nullable()();

  //何円勝ったかをfloatで保存する
  RealColumn get money => real().nullable()();

  //取引数量
  RealColumn get lot => real().nullable()();

  //買いか売りか
  BoolColumn get isBuy => boolean()();
  

  // urlTextカラムに.unique()を追加して、この値がユニークであることを保証する
  //urlは例えばtradingviewのurlを保存するためのもの
  TextColumn get urlText => text().unique()();
  
  DateTimeColumn get createdAt => dateTime().clientDefault(() => DateTime.now())();
  DateTimeColumn get updatedAt => dateTime().clientDefault(() => DateTime.now())();

  // TagListConverterを使用してタグリストを保存する
  TextColumn get tags => text().map(const TagListConverter()).nullable()();

  // 画像のパス用のカラムを追加 
  TextColumn get imagePathBefore => text().nullable()();

  // 画像のパス用のカラムを追加
  TextColumn get imagePathAfter => text().nullable()();

  //予想の開始地点
  RealColumn get startPrice => real().nullable()();

  //予想の終了地点
  RealColumn get endPrice => real().nullable()();

  //結果の開始地点
  RealColumn get startPriceResult => real().nullable()();


  //結果の終了地点
  RealColumn get endPriceResult => real().nullable()();

}

