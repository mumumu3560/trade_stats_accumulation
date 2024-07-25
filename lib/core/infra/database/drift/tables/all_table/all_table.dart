//テーブルの設定を保存しておく
//all_table.dart
import 'package:drift/drift.dart';

import 'package:trade_stats_accumulation/core/infra/database/drift/database_1/type_converter.dart';


//トレードデータを保存するテーブル
class DriftTradeDatas extends Table {
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
  
  TextColumn get urlText => text().nullable()();


  
  DateTimeColumn get createdAt => dateTime().clientDefault(() => DateTime.now())();
  DateTimeColumn get updatedAt => dateTime().clientDefault(() => DateTime.now())();

  DateTimeColumn get entriedAt => dateTime().nullable() ();
  DateTimeColumn get exitedAt => dateTime().nullable() ();

  // TagListConverterを使用してタグリストを保存する
  TextColumn get tags => text().map(const TagListConverter()).nullable()();

  // 画像のパス用のカラムを追加 
  TextColumn get imagePathBefore => text().nullable()();

  // 画像のパス用のカラムを追加
  TextColumn get imagePathAfter => text().nullable()();

  //エントリー時の価格
  RealColumn get entryPrice => real().nullable()();

  //決済後の価格
  RealColumn get exitPrice => real().nullable()();

  //予想の開始地点
  RealColumn get startPrice => real().nullable()();

  //予想の終了地点
  RealColumn get endPrice => real().nullable()();

  //結果の開始地点
  RealColumn get startPriceResult => real().nullable()();


  //結果の終了地点
  RealColumn get endPriceResult => real().nullable()();

}



//トレード商品のデータを保存するテーブル
class DriftTradingAssetDatas extends Table {
  IntColumn get id => integer().autoIncrement()();

  //トレード商品の名称、ユーザーが自分で登録できるようにする。あとは検索もできるようにする
  TextColumn get name => text().nullable().unique() ();

  //トレード商品の種類、例えば株式、仮想通貨、FXなど、ユーザーが探しやすくする。
  TextColumn get type => text().nullable()();

}



//設定保存テーブル
class DriftSettings extends Table {
  IntColumn get id => integer().unique().clientDefault(() => 0 ) ();
  //IntColumn get id => integer().autoIncrement()();
  IntColumn get themeMode => integer().nullable()();
  TextColumn get databaseName => text().clientDefault(() => "データベース1")();

}




//タグとタグの属性を紐づけるテーブル
class DriftTagAttributeValues extends Table {
  //IntColumn get id => integer().autoIncrement()();
  IntColumn get tagId => integer().customConstraint('REFERENCES tags(id) ON DELETE CASCADE')();
  IntColumn get attributeId => integer().customConstraint('REFERENCES tag_attributes(id) ON DELETE CASCADE')();
  TextColumn get value => text()(); // すべての値を文字列として保存し、必要に応じて変換

  @override
  Set<Column> get primaryKey => {tagId, attributeId};
}



//タグの属性のみを保存するテーブル
class DriftTagAttributes extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().unique()();
  TextColumn get dataType => text()(); // 'string', 'number', 'boolean'などを想定
}




//トレードデータとタグを紐づけるテーブル
class DriftTaggedTradeDatas extends Table {
  IntColumn get tradeDataId => integer().customConstraint('REFERENCES trade_datas(id) ON DELETE CASCADE')();
  IntColumn get tagId => integer().customConstraint('REFERENCES tags(id) ON DELETE CASCADE')();

  @override
  Set<Column> get primaryKey => {tradeDataId, tagId};
}



//タグを保存するテーブル
class DriftTradeTags extends Table {
  IntColumn get id => integer().autoIncrement()(); 
  //schema 15?
  TextColumn get tagName => text().unique()(); 
  DateTimeColumn get createdAt => dateTime().clientDefault(() => DateTime.now())();
  IntColumn get useCount => integer().withDefault(const Constant(0))();

  //schema 4
  TextColumn get genre => text().clientDefault(() => "分類なし")();
}


