
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trade_stats_accumulation/core/application/config/locale/language/i18n/strings.g.dart';

part 'language.g.dart';
//ここで言語を指定する。
@riverpod
class LanguageNotifier extends _$LanguageNotifier{

  static final languages = [
    "en",
    "ja",
    "pt",
    "es",
  ];

  @override
  AppLocale build() {
    if(!languages.contains(LocaleSettings.currentLocale.languageCode)){
      return AppLocale.en;
    }
    return LocaleSettings.currentLocale;

  }

  //ここでthemeModeを変更する。
  void updateLocale(AppLocale newLocale) {

    state = newLocale;
    LocaleSettings.setLocale(newLocale);
  }


}