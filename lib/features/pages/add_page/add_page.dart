import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trade_stats_accumulation/core/application/config/money/admob/inline_adaptive_banner.dart';
import 'package:trade_stats_accumulation/core/application/riverpod/db_admin/db_admin.dart';
import 'package:trade_stats_accumulation/core/application/riverpod/theme/theme.dart';
import 'package:trade_stats_accumulation/features/pages/add_page/components/trade_form.dart';
import 'package:trade_stats_accumulation/utils/various.dart';

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
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16),
              child: TradeForm(
                dbAdmin: dbAdmin,
              ),
            ),
          ),

          SizedBox(height: 16),

          Container(
            color: Colors.white,
            height: SizeConfig.blockSizeVertical! * 10,

            child: InlineAdaptiveAdBanner(
              requestId: "ADD", 
              adHeight: SizeConfig.blockSizeVertical!.toInt() * 10,
            ),
          ),
        ],
      ),
    );
  }
}