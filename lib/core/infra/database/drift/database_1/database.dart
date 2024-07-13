//database.dart

import 'dart:io';
import 'package:trade_stats_accumulation/core/infra/database/drift/tables/tables_importer.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';


part 'database.g.dart'; 



// 両方のテーブルを含める
@DriftDatabase(tables: [DriftTradeDatas, DriftTradeTags, DriftTaggedTradeDatas, DriftTagAttributes, DriftTagAttributeValues, DriftSettings, DriftTradingAssetDatas])
class MyDatabase extends _$MyDatabase {
  final String dbName;
  MyDatabase({required this.dbName}) : super(_openConnection(dbName));
  @override
  int get schemaVersion => 4;


  @override
 MigrationStrategy get migration {
   return MigrationStrategy(
     onCreate: (Migrator m) async {
       await m.createAll();
     },

     onUpgrade: (Migrator m, int from, int to) async {

        if (from < 3) {
          await m.addColumn(driftTradeDatas, driftTradeDatas.entriedAt);
          await m.addColumn(driftTradeDatas, driftTradeDatas.exitedAt);
        }

        if(from < 4){
          await m.createTable(driftTradingAssetDatas);
        }

        if(from < 5){
          //tradingAssetsTableのnameコラムをuniqueへ変更したのでそのマイグレーション
          await m.alterTable(TableMigration(driftTradingAssetDatas));
        }

        


       
     },


   );
 }

 //TODO 関数についてはextensionsにある。



}

LazyDatabase _openConnection(String dbName) {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final fileName = '$dbName.sqlite';
    final file = File(p.join(dbFolder.path, fileName));

    // Also work around limitations on old Android versions
    if (Platform.isAndroid) {
      await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
    }


    return NativeDatabase(file, logStatements: true);
  });
}
