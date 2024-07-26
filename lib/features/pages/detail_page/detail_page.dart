//detail_page.dartファイルは、トレードの詳細情報を表示する画面を作成します。

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:trade_stats_accumulation/core/application/config/money/admob/inline_adaptive_banner.dart';
import 'package:trade_stats_accumulation/core/application/riverpod/theme/theme.dart';
import 'package:trade_stats_accumulation/core/domain/class/data_class/trade_data/data_class/trade_data_class.dart';
import 'package:trade_stats_accumulation/features/pages/edit_page/edit_page.dart';
import 'package:trade_stats_accumulation/utils/custom_floating_button.dart';
import 'package:trade_stats_accumulation/utils/various.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends HookConsumerWidget {
  final TradeData tradeData;
  const DetailPage({
    Key? key,
    required this.tradeData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeNotifierProvider);
    double profit = 0;

    if(tradeData.entryPrice != null && tradeData.exitPrice != null){
      
      profit = (tradeData.exitPrice! - tradeData.entryPrice!) * tradeData.lot;
    }
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: CustomScrollView(
              slivers: [
                _buildSliverAppBar(context, tradeData, profit, ref),
                SliverToBoxAdapter(
                  child: _buildBody(context, ref),
                ),
              ],
            ),
          ),

          SizedBox(height: SizeConfig.blockSizeVertical! * 2),

          SizedBox(height: 16),

          Container(
            color: Colors.white,
            height: SizeConfig.blockSizeVertical! * 10,

            child: InlineAdaptiveAdBanner(
              requestId: "DETAIL", 
              adHeight: SizeConfig.blockSizeVertical!.toInt() * 10,
            ),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //編集画面に遷移
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => EditPage(tradeData: tradeData),
            ),
            
          );
        },
        //編集ボタン
        child: Icon(Icons.edit),
      ),
      floatingActionButtonLocation: CustomizeFloatingLocation(FloatingActionButtonLocation.endDocked, 0, -80),
    );
  }

  Widget _buildSliverAppBar(BuildContext context, TradeData tradeData, double profit, WidgetRef ref) {
    final themeMode = ref.watch(themeModeNotifierProvider);
    final theme = Theme.of(context);
    //final isProfit = profit >= 0;
    final profit = tradeData.money ?? 0;
    final isProfit = profit >= 0;
    return SliverAppBar(
      expandedHeight: 200.0,
      floating: false,
      pinned: true,
      
      flexibleSpace: FlexibleSpaceBar(
        title: Text(tradeData.currencyPair),
        background: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                //色合いはネイビーブルーorのいい感じのやつ
                isProfit ? const Color.fromARGB(255, 31, 164, 38)! : Color.fromARGB(255, 203, 63, 63)!,
                isProfit ? Color.fromARGB(255, 138, 188, 69)! : Color.fromARGB(255, 217, 80, 80)!,
              ],
            ),
          ),
          child: Center(
            child: _buildProfitLossIndicator(context),
          ),
        ),
      ),
    );
  }

  Widget _buildProfitLossIndicator(BuildContext context) {
    final profitLoss = tradeData.money ?? 0;
    final isProfit = profitLoss >= 0;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        /*
        Icon(
          isProfit ? Icons.arrow_upward : Icons.arrow_downward,
          size: 48,
        ),
         */
        SizedBox(height: 8),
        Text(
          "${profitLoss.abs().toStringAsFixed(2)}",
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          
          ),
        ),
        Text(
          isProfit ? "利益" : "損失",
          style: TextStyle(
            fontSize: 18,
          ),
        ),
      ],
    );
  }

  Widget _buildBody(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTradeOverview(context, ref),
          SizedBox(height: 24),
          _buildTradeDetails(context),
          SizedBox(height: 24),
          _buildPriceInfoSection(context),
          SizedBox(height: 24),
          if (tradeData.tags != null && tradeData.tags!.isNotEmpty) ...[
            _buildTagsSection(context),
            SizedBox(height: 24),
          ],
          if (tradeData.urlText != null && tradeData.urlText!.isNotEmpty) ...[
            _buildUrlSection(context),
            SizedBox(height: 24),
          ],
          if (tradeData.imagePathBefore != null || tradeData.imagePathAfter != null)
            Text("トレード画像", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            _buildImagesSection(context),
        ],
      ),
    );
  }

  Widget _buildTradeOverview(BuildContext context, WidgetRef ref) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildEntryTypeItem(context, tradeData.isBuy),
            _buildOverviewItem(context, "Lot", tradeData.lot.toString(), Icons.account_balance),
            _buildOverviewItem(context, "Pips", "${tradeData.pips} pips", Icons.show_chart),
          ],
        ),
      ),
    );
  }

  Widget _buildEntryTypeItem(BuildContext context, bool isBuy) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    final MaterialColor baseColor = isBuy ? Colors.green : Colors.red;
    final Color iconColor = isDarkMode ? baseColor.shade300 : baseColor.shade600;
    final Color textColor = isDarkMode ? baseColor.shade300 : baseColor.shade800;
    final Color cardColor = isDarkMode 
        ? baseColor.withOpacity(0.2) 
        : baseColor.shade50.withOpacity(0.5);
    final Color cardBorderColor = isDarkMode ? baseColor.shade700 : baseColor.shade300;

    final icon = isBuy ? Icons.arrow_upward : Icons.arrow_downward;
    final label = isBuy ? "買い" : "売り";

    return Column(
      children: [
        CustomPaint(
          size: Size(60, 60),
          painter: CirclePainter(iconColor),
          child: Center(
            child: Icon(icon, color: Colors.white, size: 28),
          ),
        ),
        SizedBox(height: 8),
        Text(
          "エントリー",
          style: TextStyle(fontSize: 12, color: theme.textTheme.bodySmall?.color),
        ),
        SizedBox(height: 4),
        Card(
          color: cardColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(color: cardBorderColor, width: 1.5),
          ),
          elevation: isDarkMode ? 0 : 2,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
          ),
        ),
      ],
    );
  }




  Widget _buildOverviewItem(BuildContext context, String label, String value, IconData icon) {
    return Column(
      children: [
        Icon(icon, ),
        SizedBox(height: 8),
        Text(label, style: TextStyle(fontSize: 12, color: Colors.grey)),
        SizedBox(height: 4),
        Text(value, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _buildTradeDetails(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("取引詳細", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),
            //_buildInfoRow(context, "タイトル", tradeData.title ?? "N/A"),
            _buildInfoRow(context, "メモ", tradeData.premise ?? "N/A", multiLine: true),
            _buildInfoRow(context, "エントリー日時", _formatDateTime(tradeData.entriedAt)),
            _buildInfoRow(context, "決済日時", _formatDateTime(tradeData.exitedAt)),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(BuildContext context, String label, String value, {bool multiLine = false}) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: multiLine ? CrossAxisAlignment.start : CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey[600]),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPriceInfoSection(BuildContext context) {
    final ColorScheme colorScheme = _getColorScheme(Theme.of(context).brightness == Brightness.dark);
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("価格情報", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 16,),
            _entryPriceInfo(context, "エントリー価格", tradeData.entryPrice),
            SizedBox(height: 16),
            _buildPriceInfoRow(context, "予想SL/TP価格", tradeData.startPrice, tradeData.endPrice),
            SizedBox(height: 16),
            _exitPriceInfo(context, "決済価格", tradeData.exitPrice),
            SizedBox(height: 16),
            _buildPriceInfoRow(context, "実際のSL/TP価格", tradeData.startPriceResult, tradeData.endPriceResult),
            SizedBox(height: 16),
            _buildRiskRewardRatio(context, colorScheme),
          ],
        ),
      ),
    );
  }

  Widget _buildRiskRewardRatio(BuildContext context, ColorScheme colorScheme) {
    String plannedRatio = _calculateRiskRewardRatio(tradeData.entryPrice, tradeData.startPrice, tradeData.endPrice);
    String actualRatio = _calculateRiskRewardRatio(tradeData.entryPrice, tradeData.startPriceResult, tradeData.endPriceResult);

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("リスクリワード比", 
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: colorScheme.textPrimary)),
            SizedBox(height: 16),
            _buildRatioCard(context, "予想", plannedRatio, colorScheme),
            SizedBox(height: 16),
            _buildRatioCard(context, "実際", actualRatio, colorScheme),
          ],
        ),
      ),
    );
  }

  Widget _buildRatioCard(BuildContext context, String label, String ratio, ColorScheme colorScheme) {
    final List<String> parts = ratio.split(':');
    final double risk = double.parse(parts[0].trim());
    final double reward = double.parse(parts[1].trim());
    final double total = risk + reward;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, 
          style: TextStyle(fontWeight: FontWeight.bold, color: colorScheme.textSecondary)),
        SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              flex: 7,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Row(
                  children: [
                    Expanded(
                      flex: (risk / total * 100).round(),
                      child: Container(
                        height: 24,
                        color: colorScheme.negative.withOpacity(0.7),
                      ),
                    ),
                    Expanded(
                      flex: (reward / total * 100).round(),
                      child: Container(
                        height: 24,
                        color: colorScheme.positive,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: 16),
            /*
            Expanded(
              flex: 3,
              child: Text(
                ratio,
                style: TextStyle(
                  fontSize: 16, 
                  fontWeight: FontWeight.bold, 
                  color: colorScheme.textPrimary
                ),
              ),
            ),
             */
          ],
        ),
        Text(
          ratio,
          style: TextStyle(
            fontSize: 16, 
            fontWeight: FontWeight.bold, 
            color: colorScheme.textPrimary
          ),
        ),
      ],
    );
  }

  ColorScheme _getColorScheme(bool isDarkMode) {
    if (isDarkMode) {
      return ColorScheme(
        background: Color(0xFF1C1C1E),
        surface: Color(0xFF2C2C2E),
        primary: Color(0xFF0A84FF),
        secondary: Color(0xFF5E5CE6),
        accent: Color(0xFFFFD60A),
        textPrimary: Colors.white,
        textSecondary: Colors.white70,
        positive: Color(0xFF30D158),
        negative: Color(0xFFFF453A),
      );
    } else {
      return ColorScheme(
        background: Colors.white,
        surface: Color(0xFFF2F2F7),
        primary: Color(0xFF007AFF),
        secondary: Color(0xFF5856D6),
        accent: Color(0xFFFFCC00),
        textPrimary: Colors.black,
        textSecondary: Colors.black54,
        positive: Color(0xFF34C759),
        negative: Color(0xFFFF3B30),
      );
    }
  }

  String _calculateRiskRewardRatio(double? entry, double? sl, double? tp) {
    if (entry == null || sl == null || tp == null) {
      return 'N/A';
    }

    double risk = (entry - sl).abs();
    double reward = (tp - entry).abs();

    if (risk == 0) {
      return 'N/A (リスクなし)';
    }

    double ratio = reward / risk;
    return '1 : ${ratio.toStringAsFixed(2)}';
  }

  Widget _entryPriceInfo(BuildContext context, String label, double? entryPrice){
    print(entryPrice);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontWeight: FontWeight.bold, )),
        SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: _buildPriceCard(context, "エントリー価格", entryPrice),
            ),
          ],
        ),
      ],
    );
  }

  Widget _exitPriceInfo(BuildContext context, String label, double? exitPrice){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontWeight: FontWeight.bold, )),
        SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: _buildPriceCard(context, "決済価格", exitPrice),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPriceInfoRow(BuildContext context, String label, double? start, double? end) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontWeight: FontWeight.bold, )),
        SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: _buildPriceCard(context, "SL価格", start),
            ),
            SizedBox(width: 16),
            Expanded(
              child: _buildPriceCard(context, "TP価格", end),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPriceCard(BuildContext context, String label, double? price,) {
    return Card(
      color: Theme.of(context).primaryColor.withOpacity(0.1),

      child: ListTile(
        tileColor: Theme.of(context).primaryColor.withOpacity(0.1),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 4),
            Text(
              price?.toStringAsFixed(5) ?? 'N/A',
              style: TextStyle(fontSize: 18, ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTagsSection(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("タグ", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: tradeData.tags!.map((tag) => Chip(
                label: Text(tag),
                backgroundColor: Theme.of(context).primaryColor.withOpacity(0.1),
              )).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUrlSection(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: ListTile(
          title: Text("参考URL", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          subtitle: Text(
            tradeData.urlText!,
            style: TextStyle( decoration: TextDecoration.underline),
          ),

          onTap: () async{
            final url = Uri.parse(tradeData.urlText!);
            if (await canLaunchUrl(url)) {
              launchUrl(url);
            }
          },
        ),
      ),
    );
  }

  Widget _buildImagesSection(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 16),
            if (tradeData.imagePathBefore != null)...[
              Text("トレード前", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: 16),
              //_buildImageWidget(context, "エントリー時", tradeData.imagePathBefore!),
              _buildImageWidget(tradeData.imagePathBefore!),
            ],
              
            SizedBox(height: 16),
            if (tradeData.imagePathAfter != null)...[
              SizedBox(height: 24),
              Text("トレード後", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),

              SizedBox(height: 16),
              //_buildImageWidget(context, "決済時", tradeData.imagePathAfter!),
              _buildImageWidget(tradeData.imagePathAfter!),

            ],
              
          ],
        ),
      ),
    );
  }

  Widget _buildImageWidget(String path) {
    final file = File(path);
    final fileExists = file.existsSync();

    if (fileExists) {
      return Image.file(file, fit: BoxFit.cover);
    } else {
      return Image.asset('assets/images/no_image.png', fit: BoxFit.cover);
    }
  }

  Widget _buildImage(BuildContext context, String label, String imagePath) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey[600])),
        SizedBox(height: 8),
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            imagePath,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }

  String _formatDateTime(DateTime? dateTime) {
    if (dateTime == null) return 'N/A';
    return DateFormat('yyyy-MM-dd HH:mm').format(dateTime);
  }
}





/*
components/
        header_section.dart
        trade_overview_section.dart
        trade_details_section.dart
        price_info_section.dart
        tags_section.dart
        url_section.dart
        images_section.dart
 */

class CirclePainter extends CustomPainter {
  final Color color;

  CirclePainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;
    canvas.drawCircle(size.center(Offset.zero), size.width / 2, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}



class ColorScheme {
  final Color background;
  final Color surface;
  final Color primary;
  final Color secondary;
  final Color accent;
  final Color textPrimary;
  final Color textSecondary;
  final Color positive;
  final Color negative;

  ColorScheme({
    required this.background,
    required this.surface,
    required this.primary,
    required this.secondary,
    required this.accent,
    required this.textPrimary,
    required this.textSecondary,
    required this.positive,
    required this.negative,
  });
}