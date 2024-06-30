import 'package:trade_stats_accumulation/core/domain/class/data_class/tag/data_class/tag_class.dart';
import 'package:trade_stats_accumulation/core/domain/class/data_class/trade_data/data_class/trade_data_class.dart';

abstract class TaggedTradeDataRepository {
  Future<void> addTagToTradeData(int tradeDataId, int tagId);
  Future<int> removeTagFromTradeData(int tradeDataId, int tagId);
  Future<List<TagData>> getTagsForTradeData(int tradeDataId);
  Future<List<TradeData>> getTradeDatasByTag(int tagId);
}

