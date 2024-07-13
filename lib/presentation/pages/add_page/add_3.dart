/*
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trade_stats_accumulation/core/application/riverpod/db_admin/db_admin.dart';
import 'package:trade_stats_accumulation/core/application/riverpod/theme/theme.dart';
import 'package:trade_stats_accumulation/core/infra/database/drift/database_1/database.dart';
import 'package:trade_stats_accumulation/presentation/pages/add_page/components/ui/trade_form.dart';


class AddPage extends HookConsumerWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeModeNotifierProvider);
    final dbAdmin = ref.watch(dbAdminNotifierProvider);

    final selectedAsset = useState<DriftTradingAssetData?>(null);
    final isBuy = useState(true);
    final selectedTags = useState<List<DriftTradeTag>>([]);

    return Scaffold(
      appBar: AppBar(
        title: Text("トレード結果追加"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: TradeForm(
          selectedAsset: selectedAsset,
          isBuy: isBuy,
          selectedTags: selectedTags,
          dbAdmin: dbAdmin,
        ),
      ),
    );
  }
}
 */