次にあなたにやってもらいたいのは別のページ作成です。

//analysis_page.dart

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AnalysisPage extends HookConsumerWidget{
  const AnalysisPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text("トレード分析"),
      ),
      body: Center(
        child: Text("トレード分析ページ"),
      ),
    );
  }
}

このファイルをトレード分析にあてたいと考えています。

具体的には、
今までのトレードデータから勝率やリスクリワード平均pips数を計算することです。

またユーザーは
買いか売りか、tag(複数選択)などを選択することができ、その条件を満たすトレードデータに基づいた、勝率やリスクリワードなどを知ることができるようにしたいのです。

実装をお願いします。

またディレクトリ構成などもお願いします。