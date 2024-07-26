
import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'package:trade_stats_accumulation/features/theme/dark_theme.dart';
import 'package:trade_stats_accumulation/features/theme/theme.dart';
import 'package:trade_stats_accumulation/core/application/config/locale/language/i18n/strings.g.dart';
import 'package:trade_stats_accumulation/features/pages/home_page/home_page.dart';
import 'package:trade_stats_accumulation/core/application/riverpod/language/language.dart';
import 'package:trade_stats_accumulation/core/application/riverpod/theme/theme.dart';
import 'package:trade_stats_accumulation/utils/various.dart';


Future<void> main() async {


  
  WidgetsFlutterBinding.ensureInitialized();


  LocaleSettings.useDeviceLocale();


  //TODO Admob 
  MobileAds.instance.initialize();




  runApp(
    ProviderScope(
      child: TranslationProvider(
        child: MyApp()
      )
    )
  );
}






class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    SizeConfig().init(context);

    final themeMode = ref.watch(themeModeNotifierProvider);
    final locale = ref.watch(languageNotifierProvider);


    return MaterialApp(

      locale: locale.flutterLocale,

      supportedLocales: AppLocaleUtils.supportedLocales,
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      
      debugShowCheckedModeBanner: false,


      theme: getLightTheme(context),
      
      darkTheme: getDarkTheme(context),
      
      themeMode: themeMode.when(
        data: (themeId) => themeId == 0 ? ThemeMode.light : ThemeMode.dark, 
        error: (error, stackTrace) {
          return ThemeMode.light; 
        }, 
        loading: () => ThemeMode.light,
      ),



      home: HomePage(),
    );
  }
}



