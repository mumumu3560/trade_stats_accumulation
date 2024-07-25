import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trade_stats_accumulation/core/application/riverpod/db_admin/db_admin.dart';
import 'package:trade_stats_accumulation/core/application/riverpod/theme/theme.dart';
import 'package:trade_stats_accumulation/features/pages/add_page/components/trade_form.dart';

class AddPage extends HookConsumerWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeModeNotifierProvider);
    final dbAdmin = ref.watch(dbAdminNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text("トレード結果追加"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: TradeForm(
          dbAdmin: dbAdmin,
        ),
      ),
    );
  }
}