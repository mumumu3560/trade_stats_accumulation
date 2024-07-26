import 'package:drift/drift.dart';

class DriftTradingAssetDatas extends Table {
  IntColumn get id => integer().autoIncrement()();

  //トレード商品の名称、ユーザーが自分で登録できるようにする。あとは検索もできるようにする
  TextColumn get name => text().nullable().unique() ();

  //トレード商品の種類、例えば株式、仮想通貨、FXなど、ユーザーが探しやすくする。
  TextColumn get type => text().nullable()();

}

