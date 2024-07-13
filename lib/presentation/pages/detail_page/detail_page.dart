import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trade_stats_accumulation/core/domain/class/data_class/trade_data/data_class/trade_data_class.dart';

class DetailPage extends HookConsumerWidget {
  final TradeData tradeData;
  const DetailPage({
    Key? key,
    required this.tradeData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text("トレード詳細"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSection("基本情報", [
              _buildInfoRow("通貨ペア", tradeData.currencyPair),
              _buildInfoRow("エントリー", tradeData.isBuy ? "買い" : "売り"),
              _buildInfoRow("Lot", tradeData.lot.toString()),
              _buildInfoRow("Pips", "${tradeData.pips} pips"),
              //_buildInfoRow("損益", "${tradeData.money.toStringAsFixed(2)}"),
              tradeData.money != null ? _buildInfoRow("損益", "${tradeData.money!.toStringAsFixed(2)}") : _buildInfoRow("損益", "N/A"),
            ]),
            SizedBox(height: 16),
            _buildSection("取引詳細", [
              if (tradeData.title != null) _buildInfoRow("タイトル", tradeData.title!),
              if (tradeData.premise != null) _buildInfoRow("前提", tradeData.premise!, multiLine: true),
              //_buildInfoRow("作成日時", DateFormat('yyyy-MM-dd HH:mm').format(tradeData.createdAt)),
              //_buildInfoRow("更新日時", DateFormat('yyyy-MM-dd HH:mm').format(tradeData.updatedAt)),

              //_buildInfoRow("エントリー日時", DateFormat('yyyy-MM-dd HH:mm').format(tradeData.entriedAt)),
              //_buildInfoRow("決済日時", DateFormat('yyyy-MM-dd HH:mm').format(tradeData.exitedAt)),

              _buildInfoRow("作成日時", tradeData.createdAt.toString()),
              _buildInfoRow("更新日時", tradeData.updatedAt.toString()),
              _buildInfoRow("エントリー日時", tradeData.entriedAt?.toString() ?? "N/A"),
              _buildInfoRow("決済日時", tradeData.exitedAt?.toString() ?? "N/A"),
            ]),
            SizedBox(height: 16),
            _buildSection("価格情報", [
              _buildPriceInfo("予想価格", tradeData.startPrice, tradeData.endPrice),
              _buildPriceInfo("実際の価格", tradeData.startPriceResult, tradeData.endPriceResult),
            ]),
            SizedBox(height: 16),
            if (tradeData.tags != null && tradeData.tags!.isNotEmpty)
              _buildSection("タグ", [
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: tradeData.tags!.map((tag) => Chip(label: Text(tag))).toList(),
                ),
              ]),
            SizedBox(height: 16),
            if (tradeData.urlText != null && tradeData.urlText!.isNotEmpty)
              _buildSection("参考URL", [
                InkWell(
                  child: Text(
                    tradeData.urlText!,
                    style: TextStyle(color: Colors.blue, decoration: TextDecoration.underline),
                  ),
                  onTap: () {
                    // URLを開く処理を追加
                  },
                ),
              ]),
            SizedBox(height: 16),
            if (tradeData.imagePathBefore != null || tradeData.imagePathAfter != null)
              _buildSection("トレード画像", [
                if (tradeData.imagePathBefore != null)
                  _buildImage("エントリー時", tradeData.imagePathBefore!),
                SizedBox(height: 8),
                if (tradeData.imagePathAfter != null)
                  _buildImage("決済時", tradeData.imagePathAfter!),
              ]),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        ...children,
      ],
    );
  }

  Widget _buildInfoRow(String label, String value, {bool multiLine = false}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: multiLine ? CrossAxisAlignment.start : CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              label,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Text(value),
          ),
        ],
      ),
    );
  }

  Widget _buildPriceInfo(String label, double? start, double? end) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 4),
        Row(
          children: [
            Expanded(
              child: Text("開始: ${start?.toStringAsFixed(5) ?? 'N/A'}"),
            ),
            Expanded(
              child: Text("終了: ${end?.toStringAsFixed(5) ?? 'N/A'}"),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildImage(String label, String imagePath) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 4),
        Image.asset(
          imagePath,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
      ],
    );
  }
}