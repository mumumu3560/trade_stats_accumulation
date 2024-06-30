// 新しいタグ属性を追加
import 'package:drift/drift.dart';
import 'package:trade_stats_accumulation/core/infra/database/drift/database_1/database.dart';


extension SettingsOperations on MyDatabase{

  Future<int> insertTheme() async{
    return into(settings).insert(
      const SettingsCompanion(
        themeMode: Value(1),
      )
    );
  }

Future<int?> getTheme() async {
  try {
    // settingsテーブルからIDが0のレコードを取得
    final themeMode = await (select(settings)..where((s) => s.id.equals(0))).getSingleOrNull();
    // themeModeがnullの場合、デフォルト値として1を返す
    if (themeMode == null) {

      
      return null;
    }
    // themeModeがnullではない場合、その値を返す
    return themeMode.themeMode ?? 1; // themeModeがnullでなければその値、そうでなければ1を返す
  } catch (e) {
    return 0;
  }
}



  Future<int> updateTheme(int themeMode) async{
    return (update(settings)..where((s) => s.id.equals(0))).write(
      SettingsCompanion(
        themeMode: Value(themeMode),
      ),
    );
  }


}