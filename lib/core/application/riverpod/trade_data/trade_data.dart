/*
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trade_stats_accumulation/class/trade_data/data_class/trade_data_class.dart';
import 'package:trade_stats_accumulation/class/trade_data/const/trade_data.dart';

part 'all_trade_data.g.dart';

//全てのトレードデータを管理するriverpod
@Riverpod(keepAlive: true)
class AllTradeDataNotifier extends _$AllTradeDataNotifier {

  @override
  Future<Map<int, TradeData>> build() async {
    return _fetchData();
  }

  //全てのトレードデータを取得
  Future<Map<int, TradeData>> _fetchData() async {
    final Map<int, TradeData> tradeDataMap = {};

    //全てのトレードデータを取得
    final tradeDataList = await TradeData().getAllTradeData();

    //取得したトレードデータをMapに変換
    for (final tradeData in tradeDataList) {
      tradeDataMap[tradeData.id] = tradeData;
    }

    return tradeDataMap;
  }


}


 */