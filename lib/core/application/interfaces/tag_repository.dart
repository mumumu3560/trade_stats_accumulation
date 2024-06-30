


import 'package:trade_stats_accumulation/core/domain/class/data_class/tag/data_class/tag_class.dart';

abstract class TagRepository {
  Future<int> insertTag(TagData tag);
  Future<bool> updateTag(TagData tag);
  Future<int> deleteTag(int id);
  Future<TagData?> getTagById(int id);
  Future<List<TagData>> getAllTags();
  Future<List<TagData>> getTagsByGenre(String genre);
  Future<List<TagData>> searchTagsByName(String query);
}
