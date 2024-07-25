import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trade_stats_accumulation/core/application/riverpod/theme/theme.dart';
import 'package:trade_stats_accumulation/features/pages/analysis_page/analysis_page.dart';

class HomePageDrawer extends ConsumerWidget {
  const HomePageDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeModeNotifierProvider);

    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Text("TradeEvaluator"),
          ),
          ListTile(
            title: Text("ホーム"),
            onTap: () {
              Navigator.pop(context);
            },
          ),

          ListTile(
            title: Text("トレード分析"),
            onTap: () {
              //AnalysisPageへ遷移
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => AnalysisPage()
                )
              );

            },
          ),

          theme.when(
            data: (themeId) => themeId == 0 
              ? ListTile(
                  title: Row(children: [
                    Icon(Icons.light_mode),
                    SizedBox(width: 10,),
                    Text("ライトモード"),
                  ]
                ),
                onTap: () => ref.read(themeModeNotifierProvider.notifier).updateState(1),
              )
              : ListTile(
                  title: Row(children: [
                    Icon(Icons.dark_mode),
                    SizedBox(width: 10,),
                    Text("ダークモード"),
                  ]
                ),
                onTap: () => ref.read(themeModeNotifierProvider.notifier).updateState(0),
              ),
            error: (error, stackTrace) => Text("エラーが発生しました"), 
            loading: () => CircularProgressIndicator(),
          ),
        ],
      ),
    );
  }
}