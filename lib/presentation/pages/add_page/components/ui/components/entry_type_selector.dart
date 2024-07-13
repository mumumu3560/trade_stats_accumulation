//entry_type_selector.dart

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class EntryTypeSelector extends HookWidget {
  final ValueNotifier<bool> isBuy;

  const EntryTypeSelector({Key? key, required this.isBuy}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("エントリー*", style: TextStyle(fontWeight: FontWeight.bold)),
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () => isBuy.value = true,
                style: ElevatedButton.styleFrom(
                  backgroundColor: isBuy.value ? Colors.green : Colors.grey,
                ),
                child: Text("買い"),
              ),
            ),
            SizedBox(width: 8),
            Expanded(
              child: ElevatedButton(
                onPressed: () => isBuy.value = false,
                style: ElevatedButton.styleFrom(
                  backgroundColor: !isBuy.value ? Colors.red : Colors.grey,
                ),
                child: Text("売り"),
              ),
            ),
          ],
        ),
      ],
    );
  }
}