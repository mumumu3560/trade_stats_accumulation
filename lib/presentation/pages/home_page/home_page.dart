

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trade_stats_accumulation/core/application/riverpod/db_admin/db_admin.dart';
import 'package:trade_stats_accumulation/core/application/riverpod/theme/theme.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeModeNotifierProvider);
    final dbAdmin = ref.watch(dbAdminNotifierProvider);


    return Scaffold(
      appBar: AppBar(
        title: Text("一覧"),
      ),

      
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
          ],
        ),
      ),


      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //ここで相場のあれこれを追加する。
        },
        tooltip: '追加',
        child: const Icon(Icons.add),
      ),
    );
  }
}