import 'package:freezed_annotation/freezed_annotation.dart';

part 'tagged_trade_data_class.freezed.dart';


//ここはタスクの概要を示すクラス
@freezed
class TaggedTradeData with _$TaggedTradeData {


  const factory TaggedTradeData({

    required int tradeDataId,

    required int tagId,
     
    
  }) = _TaggedTradeData;


}




