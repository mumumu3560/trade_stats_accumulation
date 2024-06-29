import 'package:freezed_annotation/freezed_annotation.dart';

part 'tag_data_class.freezed.dart';


//ここはタスクの概要を示すクラス
@freezed
class TagData with _$TagData {


  const factory TagData({

    required int id,

    required String tagName,

    required DateTime createdAt,

    required int useCount,

    required String genre,


    
    
  }) = _TagData;


}




