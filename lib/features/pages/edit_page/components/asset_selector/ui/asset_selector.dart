import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trade_stats_accumulation/core/application/riverpod/theme/theme.dart';
import 'package:trade_stats_accumulation/features/pages/add_page/components/asset_selector/riverpod/asset_selector_logic.dart';
import 'package:trade_stats_accumulation/core/infra/database/drift/database_1/database.dart';

class AssetSelector extends HookConsumerWidget {
  final void Function(DriftTradingAssetData?) onAssetSelected;
  final DriftTradingAssetData? initialAsset;

  const AssetSelector({
    Key? key,
    required this.onAssetSelected,
    this.initialAsset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(assetSelectorNotifierProvider);
    final notifier = ref.read(assetSelectorNotifierProvider.notifier);
    final themeMode = ref.watch(themeModeNotifierProvider);

    final searchController = useTextEditingController();
    final backgroundColor = themeMode.value == 0 ? Colors.grey[200] : Colors.grey[800];
    final isInitialized = useState(false);

    useEffect(() {
      if (!isInitialized.value) {
        notifier.initialize().then((_) {
          if (initialAsset != null) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              notifier.selectAsset(initialAsset);
            });
          }
          isInitialized.value = true;
        });
      }
      return null;
    }, []);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("取引商品*", style: TextStyle(fontWeight: FontWeight.bold)),

        if (state.selectedAsset != null)
          Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16, top: 8),
                  child: Text(
                    "選択中の商品",
                    style: TextStyle(
                      fontSize: 12,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ),
                ListTile(
                  title: Text(state.selectedAsset!.name ?? ''),
                  subtitle: Text(state.selectedAsset!.type ?? ''),
                  trailing: IconButton(
                    icon: Icon(Icons.clear),
                    onPressed: () {
                      notifier.selectAsset(null);
                      onAssetSelected(null);
                    },
                  ),
                ),
              ],
            ),
          ),

        SizedBox(height: 8),
        TextField(
          controller: searchController,
          decoration: InputDecoration(
            hintText: "商品名を検索 (大文字小文字は区別しません)",
            prefixIcon: Icon(Icons.search),
          ),
          onChanged: (value) => notifier.updateSearch(value),
        ),
        SizedBox(height: 8),
        DropdownButton<String>(
          isExpanded: true,
          value: state.selectedType,
          hint: Text("タイプを選択"),
          items: [
            DropdownMenuItem<String>(value: null, child: Text("すべて")),
            ...state.assetTypes.map((type) => DropdownMenuItem<String>(
              value: type,
              child: Text(type),
            )),
          ],
          onChanged: (value) => notifier.updateType(value),
        ),
        SizedBox(height: 16),
        Container(
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(8),
          ),
          height: 200,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(Icons.swap_vert, size: 16),
                    SizedBox(width: 4),
                    Text("スクロールして選択", style: TextStyle(fontSize: 12)),
                  ],
                ),
              ),
              Expanded(
                child: ListView.separated(
                  itemCount: state.filteredAssets.length,
                  separatorBuilder: (context, index) => Divider(height: 1),
                  itemBuilder: (context, index) {
                    final asset = state.filteredAssets[index];
                    return ListTile(
                      title: Text(asset.name ?? ''),
                      subtitle: Text(asset.type ?? ''),
                      onTap: () {
                        onAssetSelected(asset);
                        notifier.selectAsset(asset);
                      },
                      selected: state.selectedAsset?.id == asset.id,
                      tileColor: state.selectedAsset?.id == asset.id
                          ? Theme.of(context).colorScheme.secondary.withOpacity(0.1)
                          : null,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        if (state.similarAssets.isNotEmpty)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "類似の商品: ${state.similarAssets.map((a) => a.name).join(', ')}",
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
        SizedBox(height: 16),
        ElevatedButton(
          onPressed: () => _showAddAssetDialog(context, ref),
          child: Text("新しい取引商品を追加"),
        ),
      ],
    );
  }

  void _showAddAssetDialog(BuildContext context, WidgetRef ref) {
    final nameController = TextEditingController();
    final typeController = TextEditingController();
    final formKey = GlobalKey<FormState>();
    final notifier = ref.read(assetSelectorNotifierProvider.notifier);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("新しい取引商品を追加"),
          content: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(labelText: "商品名 (スペースは無視されます)"),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "商品名を入力してください";
                    }
                    if (value.trim().length > 10) {
                      return "商品名は10文字以内にしてください";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: typeController,
                  decoration: InputDecoration(labelText: "タイプ (新規作成可能)"),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "タイプを入力してください";
                    }
                    if (value.trim().length > 10) {
                      return "タイプは10文字以内にしてください";
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              child: Text("キャンセル"),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: Text("追加"),
              onPressed: () async {
                if (formKey.currentState!.validate()) {
                  final result = await notifier.addNewAsset(
                    nameController.text.trim(),
                    typeController.text.trim(),
                  );
                  if (result) {
                    Navigator.of(context).pop();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("新しい取引商品を追加しました")),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("この商品名は既に登録されています")),
                    );
                  }
                }
              },
            ),
          ],
        );
      },
    );
  }
}









/*

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trade_stats_accumulation/core/application/riverpod/theme/theme.dart';
import 'package:trade_stats_accumulation/features/pages/add_page/components/asset_selector/riverpod/asset_selector_logic.dart';
import 'package:trade_stats_accumulation/core/infra/database/drift/database_1/database.dart';

class AssetSelector extends HookConsumerWidget {
  final void Function(DriftTradingAssetData?) onAssetSelected;
  final DriftTradingAssetData? initialAsset;

  const AssetSelector({
    Key? key,
    required this.onAssetSelected,
    this.initialAsset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(assetSelectorNotifierProvider);
    final notifier = ref.read(assetSelectorNotifierProvider.notifier);
    final themeMode = ref.watch(themeModeNotifierProvider);

    final searchController = useTextEditingController();

    final backgroundColor = themeMode.value == 0 ? Colors.grey[200] : Colors.grey[800];
    final scrollController = useScrollController();

    useEffect(() {
      notifier.initialize();
      if (initialAsset != null) {
        notifier.selectAsset(initialAsset);
      }
      return null;
    }, []);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("取引商品*", style: TextStyle(fontWeight: FontWeight.bold)),

        if (state.selectedAsset != null)
          Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16, top: 8),
                  child: Text(
                    "選択中の商品",
                    style: TextStyle(
                      fontSize: 12,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ),
                ListTile(
                  title: Text(state.selectedAsset!.name ?? ''),
                  subtitle: Text(state.selectedAsset!.type ?? ''),
                  trailing: IconButton(
                    icon: Icon(Icons.clear),
                    onPressed: () {
                      notifier.selectAsset(null);
                      onAssetSelected(null);
                    },
                  ),
                ),
              ],
            ),
          ),

        SizedBox(height: 8),
        TextField(
          controller: searchController,
          decoration: InputDecoration(
            hintText: "商品名を検索 (大文字小文字は区別しません)",
            prefixIcon: Icon(Icons.search),
          ),
          onChanged: (value) => notifier.updateSearch(value),
        ),
        SizedBox(height: 8),
        DropdownButton<String>(
          isExpanded: true,
          value: state.selectedType,
          hint: Text("タイプを選択"),
          items: [
            DropdownMenuItem<String>(value: null, child: Text("すべて")),
            ...state.assetTypes.map((type) => DropdownMenuItem<String>(
              value: type,
              child: Text(type),
            )),
          ],
          onChanged: (value) => notifier.updateType(value),
        ),
        SizedBox(height: 16),
        Container(
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(8),
          ),
          height: 200,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(Icons.swap_vert, size: 16),
                    SizedBox(width: 4),
                    Text("スクロールして選択", style: TextStyle(fontSize: 12)),
                  ],
                ),
              ),
              Expanded(
                child: ListView.separated(
                  itemCount: state.filteredAssets.length,
                  separatorBuilder: (context, index) => Divider(height: 1),
                  itemBuilder: (context, index) {
                    final asset = state.filteredAssets[index];
                    return ListTile(
                      title: Text(asset.name ?? ''),
                      subtitle: Text(asset.type ?? ''),
                      onTap: () {
                        onAssetSelected(asset);
                        notifier.selectAsset(asset);
                      },
                      selected: state.selectedAsset?.id == asset.id,
                      tileColor: state.selectedAsset?.id == asset.id
                          ? Theme.of(context).colorScheme.secondary.withOpacity(0.1)
                          : null,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        if (state.similarAssets.isNotEmpty)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "類似の商品: ${state.similarAssets.map((a) => a.name).join(', ')}",
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
        SizedBox(height: 16),
        ElevatedButton(
          onPressed: () => _showAddAssetDialog(context, ref),
          child: Text("新しい取引商品を追加"),
        ),
      ],
    );
  }

  void _showAddAssetDialog(BuildContext context, WidgetRef ref) {
    // ダイアログの実装は変更なし
  }
}
 */

















/*
//asset_selector.dart

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trade_stats_accumulation/core/application/riverpod/theme/theme.dart';
import 'package:trade_stats_accumulation/features/pages/add_page/components/asset_selector/riverpod/asset_selector_logic.dart';
import 'package:trade_stats_accumulation/core/infra/database/drift/database_1/database.dart';

class AssetSelector extends HookConsumerWidget {
  //ここでtrade_form.dartファイルに変更を伝える。
  final void Function(DriftTradingAssetData?) onAssetSelected;

  const AssetSelector({super.key, required this.onAssetSelected});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(assetSelectorNotifierProvider);
    final notifier = ref.read(assetSelectorNotifierProvider.notifier);
    final themeMode = ref.watch(themeModeNotifierProvider);

    final searchController = useTextEditingController();

    final backgroundColor = themeMode.value == 0 ? Colors.grey[200] : Colors.grey[800];
    final scrollController = useScrollController();



    useEffect(() {
      notifier.initialize();
      return null;
    }, []);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("取引商品*", style: TextStyle(fontWeight: FontWeight.bold)),

        if (state.selectedAsset != null)
          Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16, top: 8),
                  child: Text(
                    "選択中の商品",
                    style: TextStyle(
                      fontSize: 12,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ),
                ListTile(
                  title: Text(state.selectedAsset!.name ?? ''),
                  subtitle: Text(state.selectedAsset!.type ?? ''),
                  trailing: IconButton(
                    icon: Icon(Icons.clear),
                    onPressed: () {
                      notifier.selectAsset(null);
                      onAssetSelected(null);
                    },
                  ),
                ),
              ],
            ),
          ),

          
        SizedBox(height: 8),
        TextField(
          controller: searchController,
          decoration: InputDecoration(
            hintText: "商品名を検索 (大文字小文字は区別しません)",
            prefixIcon: Icon(Icons.search),
          ),
          onChanged: (value) => notifier.updateSearch(value),
        ),
        SizedBox(height: 8),
        DropdownButton<String>(
          isExpanded: true,
          value: state.selectedType,
          hint: Text("タイプを選択"),
          items: [

            //TODO ここよくわからんかも？
            //全てに関してはフィルターなしということ
            DropdownMenuItem<String>(value: null, child: Text("すべて")),

            //ここの書き方慣れない。
            //typeをメニューで出す形
            ...state.assetTypes.map((type) => DropdownMenuItem<String>(
              value: type,
              child: Text(type),
            )),
          ],
          onChanged: (value) => notifier.updateType(value),
        ),
        SizedBox(height: 16),
        Container(
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(8),
          ),
          height: 200,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(Icons.swap_vert, size: 16),
                    SizedBox(width: 4),
                    Text("スクロールして選択", style: TextStyle(fontSize: 12)),
                  ],
                ),
              ),

              //ここでは上のクエリで条件に合うものだけをリストで表示する。
              Expanded(
                child: ListView.separated(
                  itemCount: state.filteredAssets.length,
                  separatorBuilder: (context, index) => Divider(height: 1),
                  itemBuilder: (context, index) {
                    final asset = state.filteredAssets[index];
                    return ListTile(
                      title: Text(asset.name ?? ''),
                      subtitle: Text(asset.type ?? ''),
                      //タップしたものを選択し上で表示する
                      onTap: () {
                        onAssetSelected(asset);
                        notifier.selectAsset(asset);
                      },
                      selected: state.selectedAsset?.id == asset.id,
                      tileColor: state.selectedAsset?.id == asset.id
                          ? Theme.of(context).colorScheme.secondary.withOpacity(0.1)
                          : null,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        if (state.similarAssets.isNotEmpty)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "類似の商品: ${state.similarAssets.map((a) => a.name).join(', ')}",
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
        SizedBox(height: 16),
        ElevatedButton(
          onPressed: () => _showAddAssetDialog(context, ref),
          child: Text("新しい取引商品を追加"),
        ),
      ],
    );
  }

  void _showAddAssetDialog(BuildContext context, WidgetRef ref) {
    final nameController = TextEditingController();
    final typeController = TextEditingController();
    final formKey = GlobalKey<FormState>();
    final notifier = ref.read(assetSelectorNotifierProvider.notifier);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("新しい取引商品を追加"),
          content: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(labelText: "商品名 (スペースは無視されます)"),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "商品名を入力してください";
                    }
                    if (value.trim().length > 10) {
                      return "商品名は10文字以内にしてください";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: typeController,
                  decoration: InputDecoration(labelText: "タイプ (新規作成可能)"),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "タイプを入力してください";
                    }
                    if (value.trim().length > 10) {
                      return "タイプは10文字以内にしてください";
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              child: Text("キャンセル"),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: Text("追加"),
              onPressed: () async {
                if (formKey.currentState!.validate()) {
                  final result = await notifier.addNewAsset(
                    nameController.text.trim(),
                    typeController.text.trim(),
                  );
                  if (result) {
                    Navigator.of(context).pop();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("新しい取引商品を追加しました")),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("この商品名は既に登録されています")),
                    );
                  }
                }
              },
            ),
          ],
        );
      },
    );
  }
}

 */