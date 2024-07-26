import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trade_stats_accumulation/core/application/config/money/admob/inline_adaptive_banner.dart';
import 'package:trade_stats_accumulation/core/application/riverpod/db_admin/db_admin.dart';
import 'package:trade_stats_accumulation/core/application/riverpod/theme/theme.dart';
import 'package:trade_stats_accumulation/core/domain/class/data_class/trade_data/data_class/trade_data_class.dart';
import 'package:trade_stats_accumulation/core/infra/database/drift/database_1/database.dart';
import 'package:trade_stats_accumulation/core/infra/database/drift/database_1/extensions/extensions_importer.dart';
import 'package:trade_stats_accumulation/features/pages/add_page/add_page.dart';
import 'package:trade_stats_accumulation/features/pages/detail_page/detail_page.dart';
import 'package:trade_stats_accumulation/features/pages/home_page/components/drawers/drawer.dart';
import 'package:intl/intl.dart';
import 'package:trade_stats_accumulation/utils/custom_floating_button.dart';
import 'package:trade_stats_accumulation/utils/various.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeNotifierProvider);
    final dbAdmin = ref.watch(dbAdminNotifierProvider);
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text("トレード一覧", style: TextStyle(fontWeight: FontWeight.w600)),
        elevation: 0,
        backgroundColor: isDarkMode ? Color(0xFF1E1E1E) : Colors.white,
      ),
      drawer: HomePageDrawer(),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<List<DriftTradeData>>(
              stream: dbAdmin.watchAllTradeDatas(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text('データがありません', style: TextStyle(color: isDarkMode ? Colors.white70 : Colors.black54)));
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
          ),

          SizedBox(height: SizeConfig.blockSizeVertical!*2,),

          //TODO Admob
          Container(
            color: Colors.white,
            height: SizeConfig.blockSizeVertical! * 10,

            child: InlineAdaptiveAdBanner(
              requestId: "HOME", 
              adHeight: SizeConfig.blockSizeVertical!.toInt() * 10,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddPage()));
        },
        tooltip: '追加',
        child: const Icon(Icons.add),
        backgroundColor: isDarkMode ? Color(0xFF4A4A4A) : Colors.blue,
      ),

      floatingActionButtonLocation: CustomizeFloatingLocation(FloatingActionButtonLocation.endDocked, 0, -80),
      backgroundColor: isDarkMode ? Color(0xFF121212) : Color(0xFFF5F5F5),
    );
  }

  Widget _buildTradeCard(BuildContext context, DriftTradeData trade, bool isDarkMode) {
    final isProfit = trade.money != null && trade.money! > 0;
    final profitColors = isDarkMode 
    ? [Color(0xFF1B5E20), Color(0xFF2E7D32)]  // ダークモードの利益色（変更なし）
    : [Color(0xFFB9F6CA), Color(0xFF69F0AE)]; // ライトモードの利益色（より濃い緑に）
  final lossColors = isDarkMode
    ? [Color(0xFF8E0000), Color(0xFFB71C1C)]  // ダークモードの損失色（変更なし）
    : [Color(0xFFFFCCBC), Color(0xFFFF8A65)]; // ライトモードの損失色（より濃い赤に）


    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => DetailPage(tradeData: _convertToTradeData(trade)),
          ),
        );
      },
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        color: isDarkMode ? Color(0xFF2C2C2C) : Colors.white,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: LinearGradient(
              colors: isProfit ? profitColors : lossColors,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
  padding: EdgeInsets.all(16),
  child: Row(
    children: [
      _buildTradeTypeIndicator(trade.isBuy, isDarkMode),
      SizedBox(width: 12),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              trade.currencyPair ?? 'Unknown',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: isDarkMode ? Colors.white : Colors.black87),
            ),
            SizedBox(height: 4),
            Text(
              trade.premise ?? '',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: isDarkMode ? Colors.white70 : Colors.black54),
            ),
          ],
        ),
      ),
      SizedBox(width: 12),
      _buildProfitIndicator(trade.money, isDarkMode),
    ],
  ),
),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Expanded(
                      child: _buildImageColumn('Before', trade.imagePathBefore, isDarkMode),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: _buildImageColumn('After', trade.imagePathAfter, isDarkMode),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildInfoColumn('Pips', trade.pips?.toString() ?? '-', Icons.show_chart, isDarkMode),
                        _buildInfoColumn('Lot', trade.lot?.toString() ?? '-', Icons.scale, isDarkMode),
                      ],
                    ),
                    SizedBox(height: 12),
                    Wrap(
                      spacing: 6,
                      runSpacing: 6,
                      children: (trade.tags ?? []).map((tag) => Chip(
                        label: Text(tag, style: TextStyle(fontSize: 11, color: isDarkMode ? Colors.white : Colors.black87)),
                        backgroundColor: isDarkMode ? Color(0xFF3D3D3D) : Color(0xFFE0E0E0),
                        padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      )).toList(),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'エントリー: ${_formatDate(trade.entriedAt)}',
                      style: TextStyle(fontSize: 12, color: isDarkMode ? Colors.white60 : Colors.black45),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTradeTypeIndicator(bool isBuy, bool isDarkMode) {
    final buyColor = isDarkMode ? Color(0xFF4CAF50) : Color(0xFF1B5E20);
    final sellColor = isDarkMode ? Color(0xFFF44336) : Color(0xFFB71C1C);
    
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: isBuy ? buyColor : sellColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Text(
        isBuy ? 'BUY' : 'SELL',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }

  Widget _buildProfitIndicator(double? profit, bool isDarkMode) {
  if (profit == null) return SizedBox.shrink();

  final isProfit = profit > 0;
  final backgroundColor = isProfit
      ? (isDarkMode ? Color(0xFF1B5E20) : Color(0xFF4CAF50))
      : (isDarkMode ? Color(0xFF8E0000) : Color(0xFFF44336));
  final textColor = Colors.white;

  return Container(
    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
    decoration: BoxDecoration(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BoxShadow(
          color: Colors.black26,
          blurRadius: 4,
          offset: Offset(0, 2),
        ),
      ],
    ),
    child: Text(
      '${isProfit ? '+' : '-'}${profit.abs().toStringAsFixed(2)}円',
      style: TextStyle(
        color: textColor,
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
    ),
  );
}

  Widget _buildImageColumn(String label, String? imagePath, bool isDarkMode) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: isDarkMode ? Colors.white70 : Colors.black87,
          ),
        ),
        SizedBox(height: 4),
        Container(
          height: 100,
          width: double.infinity,
          child: _buildImageWidget(imagePath),
        ),
      ],
    );
  }

  Widget _buildImageWidget(String? path) {
    if (path == null || path.isEmpty) {
      return Image.asset('assets/images/no_image.png', fit: BoxFit.cover);
    }

    final file = File(path);
    final fileExists = file.existsSync();

    if (fileExists) {
      return Image.file(file, fit: BoxFit.cover);
    } else {
      return Image.asset('assets/images/no_image.png', fit: BoxFit.cover);
    }
  }

  Widget _buildInfoColumn(String label, String value, IconData icon, bool isDarkMode) {
    return Column(
      children: [
        Icon(icon, size: 20, color: isDarkMode ? Colors.white70 : Colors.black54),
        SizedBox(height: 4),
        Text(label, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: isDarkMode ? Colors.white70 : Colors.black54)),
        Text(value, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: isDarkMode ? Colors.white : Colors.black87)),
      ],
    );
  }

  String _formatDate(DateTime? date) {
    if (date == null) return '未設定';
    return DateFormat('yyyy/MM/dd HH:mm').format(date);
  }

  TradeData _convertToTradeData(DriftTradeData trade) {
    return TradeData(
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
      entryPrice: trade.entryPrice,
      exitPrice: trade.exitPrice,
      startPrice: trade.startPrice,
      endPrice: trade.endPrice,
      startPriceResult: trade.startPriceResult,
      endPriceResult: trade.endPriceResult,
      entriedAt: trade.entriedAt,
      exitedAt: trade.exitedAt,
    );
  }
}