

import 'package:drift/drift.dart';
import 'package:trade_stats_accumulation/core/infra/database/drift/database_1/database.dart';

extension TradeDatasOperations on MyDatabase{
  
  Future<int> insertTradeData(TradeData data) {
    return into(tradeDatas).insert(data);
  }

  Future<int> deleteTradeData(int id) {
    return (delete(tradeDatas)..where((tbl) => tbl.id.equals(id))).go();
  }

  Future<bool> updateTradeData(TradeData data) {
    return update(tradeDatas).replace(data);
  }


  Future<TradeData?> getTradeDataById(int id) {
    return (select(tradeDatas)..where((tbl) => tbl.id.equals(id))).getSingleOrNull();
  }

  Stream<List<TradeData>> watchAllTradeDatas() {
    return select(tradeDatas).watch();
  }

  Future<List<TradeData>> getAllTradeDatas() {
    return select(tradeDatas).get();
  }

  Stream<List<TradeData>> watchTradeDatasByCurrencyPair(String currencyPair) {
    return (select(tradeDatas)..where((tbl) => tbl.currencyPair.equals(currencyPair))).watch();
  }

  Future<List<TradeData>> getTradeDatasByCurrencyPair(String currencyPair) {
    return (select(tradeDatas)..where((tbl) => tbl.currencyPair.equals(currencyPair))).get();
  }


  Future<List<TradeData>> getFilteredTradeDatas({
  String? currencyPair,
  List<String>? tags,
  bool useAndForTags = false,
  String? premise,
  bool? isBuy,
  DateTime? startDate,
  DateTime? endDate,
}) {
  return (select(tradeDatas)
    ..where((tbl) {
      var predicates = <Expression<bool>>[];
      
      if (currencyPair != null) {
        predicates.add(tbl.currencyPair.equals(currencyPair));
      }
      
      if (premise != null) {
        predicates.add(tbl.premise.equals(premise));
      }
      
      if (isBuy != null) {
        predicates.add(tbl.isBuy.equals(isBuy));
      }
      
      if (tags != null && tags.isNotEmpty) {
        final tagConditions = tags.map((tag) => 
          tbl.tags.like('%"$tag"%')
        ).toList();
        
        if (useAndForTags) {
          predicates.add(tagConditions.reduce((value, element) => value & element));
        } else {
          predicates.add(tagConditions.reduce((value, element) => value | element));
        }
      }
      
      if (startDate != null) {
        predicates.add(tbl.createdAt.isBiggerOrEqualValue(startDate));
      }
      
      if (endDate != null) {
        predicates.add(tbl.createdAt.isSmallerOrEqualValue(endDate));
      }
      
      return predicates.isEmpty 
        ? const Constant(true) 
        : predicates.reduce((value, element) => value & element);
    }))
    .get();
}




Future<Map<String, dynamic>> getTradeStatsInDateRange(DateTime start, DateTime end) async {
  final query = select(tradeDatas)
    ..where((tbl) => tbl.createdAt.isBetween(Variable(start), Variable(end)));

  final results = await query.get();

  int totalTrades = results.length;
  int winningTrades = results.where((trade) => trade.pips != null && trade.pips! > 0).length;
  int losingTrades = results.where((trade) => trade.pips != null && trade.pips! < 0).length;
  double totalPips = results.fold(0, (sum, trade) => sum + (trade.pips ?? 0));
  double totalMoney = results.fold(0, (sum, trade) => sum + (trade.money ?? 0));

  return {
    'totalTrades': totalTrades,
    'winningTrades': winningTrades,
    'losingTrades': losingTrades,
    'winRate': totalTrades > 0 ? winningTrades / totalTrades : 0,
    'totalPips': totalPips,
    'totalMoney': totalMoney,
    'averagePipsPerTrade': totalTrades > 0 ? totalPips / totalTrades : 0,
    'averageMoneyPerTrade': totalTrades > 0 ? totalMoney / totalTrades : 0,
  };
}
}