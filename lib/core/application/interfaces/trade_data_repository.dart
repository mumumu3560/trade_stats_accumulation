import 'package:trade_stats_accumulation/core/domain/class/data_class/trade_data/data_class/trade_data_class.dart';

abstract class TradeDataRepository {

  Future<int> insertTradeData(TradeData data);

  Future<int> deleteTradeData(int id);

  Future<bool> updateTradeData(TradeData data);

  Future<TradeData?> getTradeDataById(int id);

  Stream<List<TradeData>> watchAllTradeDatas();

  Future<List<TradeData>> getAllTradeDatas();

  Stream<List<TradeData>> watchTradeDatasByCurrencyPair(String currencyPair);

  Future<List<TradeData>> getTradeDatasByCurrencyPair(String currencyPair);

  Future<Map<String, dynamic>> getTradeStatsInDateRange(DateTime start, DateTime end);

  Future<List<TradeData>> getFilteredTradeDatas({
    String? currencyPair,
    List<String>? tags,
    bool useAndForTags,
    String? premise,
    bool? isBuy,
    DateTime? startDate,
    DateTime? endDate,
  });

  
}