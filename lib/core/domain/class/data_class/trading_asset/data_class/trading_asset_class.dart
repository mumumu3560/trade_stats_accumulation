import 'package:freezed_annotation/freezed_annotation.dart';

part 'trading_asset_class.freezed.dart';


//トレード商品のデータクラス
@freezed

class TradingAssetData with _$TradingAssetData {


  const factory TradingAssetData({
      
      required int id,

      //トレード商品の名称
      required String name,

      //トレード商品の種類、例えば株式、仮想通貨、FXなど
      required String type,
    
    
  }) = _TradingAssetData;


}



