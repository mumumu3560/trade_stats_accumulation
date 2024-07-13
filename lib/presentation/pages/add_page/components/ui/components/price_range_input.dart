//price_range_input.dart

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class PriceRangeInput extends HookWidget {
  final String label;
  final TextEditingController startController;
  final TextEditingController endController;

  const PriceRangeInput({
    Key? key,
    required this.label,
    required this.startController,
    required this.endController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: startController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: "開始価格"),
              ),
            ),
            SizedBox(width: 8),
            Expanded(
              child: TextField(
                controller: endController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: "終了価格"),
              ),
            ),
          ],
        ),
      ],
    );
  }
}