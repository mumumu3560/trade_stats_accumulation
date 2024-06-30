import 'package:freezed_annotation/freezed_annotation.dart';

part 'trade_data_class.freezed.dart';


//ここはタスクの概要を示すクラス
@freezed


class TradeData with _$TradeData {


  const factory TradeData({

    required int id,

    //どの通貨ペアか
    required String currencyPair,

    //概要
    required String? title,

    //前提
    required String? premise,


    //値幅
    required int pips,

    //結果得られた金額
    required double money,

    //取引数量
    required double lot,

    //買いか売りか
    required bool isBuy,

    //urlは例えばtradingviewのurlを保存するためのもの
    required String? urlText,

    required DateTime createdAt,

    required DateTime updatedAt,

    //ここにトレードの条件を入れる
    required List<String>? tags,

    //トレードデータのサムネなど、画像のパスを入れる。ここはトレードをした際のもの
    required String? imagePathBefore,

    //トレードデータのサムネなど、画像のパスを入れる。ここはトレードをした後のもの
    required String? imagePathAfter,

    //さらに予想と結果を入れておきたい。
    //元々どこまで予想していたか、どこまで結果が出たかを入れておく

    //予想の開始地点
    required double? startPrice,  

    //予想の終了地点
    required double? endPrice,




    //結果の開始地点
    required double? startPriceResult,

    //結果の終了地点
    required double? endPriceResult,







    
    
  }) = _TradeData;


}



