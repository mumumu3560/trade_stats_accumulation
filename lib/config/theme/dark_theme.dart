import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ダークモード用のテーマ設定
ThemeData getDarkTheme(BuildContext context){
  return ThemeData(
    textTheme: GoogleFonts.sawarabiMinchoTextTheme(
      Theme.of(context).textTheme,
    ).apply(
      bodyColor: Colors.white,
      displayColor: Colors.white,
    
    ),
    // ダークモード用のテーマ設定
    primarySwatch: Colors.blueGrey,
    fontFamily: 'CustomFont', // カスタムフォントを適用
    brightness: Brightness.dark,

    iconTheme: IconThemeData(
      color: Colors.white,
    ),

    cardColor: Colors.white,



  );
}