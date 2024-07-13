import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trade_stats_accumulation/core/application/riverpod/db_admin/db_admin.dart';
import 'package:trade_stats_accumulation/core/application/riverpod/theme/theme.dart';
import 'package:trade_stats_accumulation/core/domain/class/data_class/trade_data/data_class/trade_data_class.dart';
import 'package:trade_stats_accumulation/core/infra/database/drift/database_1/database.dart';
import 'package:trade_stats_accumulation/core/infra/database/drift/database_1/extensions/extensions_importer.dart';
import 'package:trade_stats_accumulation/presentation/pages/add_page/add_page.dart';
import 'package:trade_stats_accumulation/presentation/pages/detail_page/detail_page.dart';
import 'package:trade_stats_accumulation/presentation/pages/home_page/components/drawers/drawer.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeNotifierProvider);
    final dbAdmin = ref.watch(dbAdminNotifierProvider);
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text("トレード一覧"),
      ),
      drawer: HomePageDrawer(),
      body: StreamBuilder<List<DriftTradeData>>(
        stream: dbAdmin.watchAllTradeDatas(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('データがありません'));
          }
          final tradeDatas = snapshot.data!;
          return ListView.builder(
            itemCount: tradeDatas.length,
            itemBuilder: (context, index) {
              final trade = tradeDatas[index];
              return _buildTradeCard(context, trade, isDarkMode);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => AddPage()),
          );
        },
        tooltip: '追加',
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildTradeCard(BuildContext context, DriftTradeData trade, bool isDarkMode) {
    final buyColors = isDarkMode 
      ? [Colors.green.shade900, Colors.green.shade800]
      : [Colors.green.shade50, Colors.green.shade100];
    final sellColors = isDarkMode
      ? [Colors.red.shade900, Colors.red.shade800]
      : [Colors.red.shade50, Colors.red.shade100];

    return Card(
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: isDarkMode ? Colors.grey[850] : null,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
            colors: trade.isBuy ? buyColors : sellColors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ListTile(
          contentPadding: EdgeInsets.all(16),
          title: Row(
            children: [
              Icon(
                trade.isBuy ? Icons.arrow_upward : Icons.arrow_downward,
                color: trade.isBuy ? Colors.green : Colors.red,
              ),
              SizedBox(width: 8),
              Text(
                trade.currencyPair ?? 'Unknown',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ],
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 8),
              Text(
                trade.premise ?? '',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildInfoColumn('Pips', trade.pips?.toString() ?? '-', Icons.analytics, isDarkMode),
                  _buildInfoColumn('利益', '${trade.money?.toStringAsFixed(2) ?? '-'}円', Icons.attach_money, isDarkMode),
                  _buildInfoColumn('Lot', trade.lot?.toString() ?? '-', Icons.scale, isDarkMode),
                ],
              ),
              SizedBox(height: 8),
              Wrap(
                spacing: 4,
                runSpacing: 4,
                children: (trade.tags ?? []).map((tag) => Chip(
                  label: Text(tag, style: TextStyle(fontSize: 10, color: isDarkMode ? Colors.white : Colors.black87)),
                  backgroundColor: isDarkMode ? Colors.grey[700] : Colors.grey[300],
                  padding: EdgeInsets.all(4),
                )).toList(),
              ),
            ],
          ),
          onTap: () {
            //TradeData trade2  = trade.toTradeData();
            TradeData tradeData = TradeData(
              id: trade.id,
              currencyPair: trade.currencyPair ?? '',
              title: trade.title,
              premise: trade.premise,
              pips: trade.pips ?? 0,
              money: trade.money ?? 0,
              lot: trade.lot ?? 0,
              isBuy: trade.isBuy,
              urlText: trade.urlText,
              createdAt: trade.createdAt,
              updatedAt: trade.updatedAt,
              tags: trade.tags,
              imagePathBefore: trade.imagePathBefore,
              imagePathAfter: trade.imagePathAfter,
              startPrice: trade.startPrice,
              endPrice: trade.endPrice,
              startPriceResult: trade.startPriceResult,
              endPriceResult: trade.endPriceResult,
              entriedAt: trade.entriedAt,
              exitedAt: trade.exitedAt,
            );

            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => DetailPage(tradeData: tradeData),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildInfoColumn(String label, String value, IconData icon, bool isDarkMode) {
    return Column(
      children: [
        Icon(icon, size: 20, color: isDarkMode ? Colors.white70 : Colors.black87),
        SizedBox(height: 4),
        Text(label, style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: isDarkMode ? Colors.white70 : Colors.black87)),
        Text(value, style: TextStyle(fontSize: 14, color: isDarkMode ? Colors.white : Colors.black)),
      ],
    );
  }
}