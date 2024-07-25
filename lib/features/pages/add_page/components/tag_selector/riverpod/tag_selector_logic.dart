/*

// tag_selector_logic.dart
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trade_stats_accumulation/core/application/riverpod/db_admin/db_admin.dart';
import 'package:trade_stats_accumulation/core/infra/database/drift/database_1/database.dart';
import 'package:trade_stats_accumulation/core/infra/database/drift/database_1/extensions/all_extension.dart';
import 'package:trade_stats_accumulation/features/pages/add_page/components/tag_selector/state/tag_selector_state.dart';

part 'tag_selector_logic.g.dart';

@riverpod
class TagSelectorNotifier extends _$TagSelectorNotifier {
  @override
  TagSelectorState build() {
    return TagSelectorState(
      allTags: [],
      filteredTags: [],
      genres: [],
      selectedGenre: null,
    );
  }

  Future<void> initialize() async {
    final db = ref.read(dbAdminNotifierProvider);
    final tags = await db.getAllTags();
    final genres = await db.getDistinctGenres();
    state = state.copyWith(
      allTags: tags,
      filteredTags: tags,
      genres: genres,
    );
  }

  void selectGenre(String? genre) {
    final filteredTags = genre == null
        ? state.allTags
        : state.allTags.where((tag) => tag.genre == genre).toList();
    state = state.copyWith(
      selectedGenre: genre,
      filteredTags: filteredTags,
    );
  }

  Future<bool> addNewTag(String tagName, String genre) async {
  final db = ref.read(dbAdminNotifierProvider);
  
  // タグ名を正規化（小文字に変換し、前後の空白を削除）
  final normalizedTagName = tagName.trim().toLowerCase();
  
  // 既存のタグをチェック
  final existingTag = await db.getTagByNormalizedName(normalizedTagName);
  
  if (existingTag != null) {
    // タグが既に存在する場合は、falseを返して追加しないことを示す
    return false;
  }
  
  // 新しいタグを追加
  final newTag = DriftTradeTag(
    id: 0,
    tagName: tagName.trim(), // 元のタグ名を保持（大文字小文字を維持）
    genre: genre,
    createdAt: DateTime.now(),
    useCount: 0,
  );
  await db.insertTag(newTag);
  await initialize();
  return true;
}


}
 */










// tag_selector_logic.dart
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trade_stats_accumulation/core/application/riverpod/db_admin/db_admin.dart';
import 'package:trade_stats_accumulation/core/infra/database/drift/database_1/database.dart';
import 'package:trade_stats_accumulation/core/infra/database/drift/database_1/extensions/all_extension.dart';
import 'package:trade_stats_accumulation/features/pages/add_page/components/tag_selector/state/tag_selector_state.dart';

part 'tag_selector_logic.g.dart';

@riverpod
class TagSelectorNotifier extends _$TagSelectorNotifier {
  @override
  TagSelectorState build() {
    return TagSelectorState(
      allTags: [],
      filteredTags: [],
      genres: [],
      selectedGenre: null,
    );
  }

  Future<void> initialize() async {
    final db = ref.read(dbAdminNotifierProvider);
    final tags = await db.getAllTags();
    final genres = await db.getDistinctGenres();
    state = state.copyWith(
      allTags: tags,
      filteredTags: tags,
      genres: genres,
    );
  }

  void selectGenre(String? genre) {
    final filteredTags = genre == null
        ? state.allTags
        : state.allTags.where((tag) => tag.genre == genre).toList();
    state = state.copyWith(
      selectedGenre: genre,
      filteredTags: filteredTags,
    );
  }

  Future<bool> addNewTag(String tagName, String genre, String dataType) async {
  final db = ref.read(dbAdminNotifierProvider);
  
  // タグ名を正規化（小文字に変換し、前後の空白を削除）
  final normalizedTagName = tagName.trim().toLowerCase();
  
  // 既存のタグをチェック
  final existingTag = await db.getTagByNormalizedName(normalizedTagName);
  
  if (existingTag != null) {
    // タグが既に存在する場合は、falseを返して追加しないことを示す
    return false;
  }
  
  // 新しいタグを追加
  final newTag = DriftTradeTag(
    id: 0,
    tagName: tagName.trim(), // 元のタグ名を保持（大文字小文字を維持）
    genre: genre,
    createdAt: DateTime.now(),
    useCount: 0,
  );
  int tagId = await db.insertTag(newTag);

  int attributeId = await db.addOrUpdateTagAttribute(tagName, genre, dataType);
  await db.setDriftTagAttributeValue(tagId, attributeId, "");
  await initialize();
  return true;
}



}

