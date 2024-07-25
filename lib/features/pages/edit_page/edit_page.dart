//edit_page.dart

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:trade_stats_accumulation/core/application/riverpod/db_admin/db_admin.dart';
import 'package:trade_stats_accumulation/core/application/riverpod/theme/theme.dart';
import 'package:trade_stats_accumulation/core/domain/class/data_class/trade_data/data_class/trade_data_class.dart';
import 'package:trade_stats_accumulation/features/pages/edit_page/components/trade_form.dart';
import 'package:url_launcher/url_launcher.dart';

class EditPage extends HookConsumerWidget {
  final TradeData tradeData;
  const EditPage({
    Key? key,
    required this.tradeData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeModeNotifierProvider);
    final dbAdmin = ref.watch(dbAdminNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text("編集"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: TradeForm(
          dbAdmin: dbAdmin,
          tradeData: tradeData,
        ),
      ),
    );
  }

}





