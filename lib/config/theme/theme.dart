import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ライトモード用のテーマ設定
ThemeData getLightTheme(BuildContext context){
  return ThemeData(
    textTheme: GoogleFonts.sawarabiMinchoTextTheme(
      Theme.of(context).textTheme,
    ).apply(
      bodyColor: Colors.black,
      displayColor: Colors.black,
    ),
    // ライトモード用のテーマ設定
    primarySwatch: Colors.blue,
    fontFamily: 'CustomFont', // カスタムフォントを適用
    brightness: Brightness.light,

    iconTheme: IconThemeData(
      color: Colors.black,
    ),

    cardColor: Colors.black,
  );
}