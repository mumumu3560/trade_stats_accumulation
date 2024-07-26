//price_range_input.dart

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class PriceRangeInput extends HookWidget {
  final String label;
  final TextEditingController? entryOrExitController;
  final TextEditingController startController;
  final TextEditingController endController;
  final bool isEntry;
 

  const PriceRangeInput({
    Key? key,
    required this.label,
    required this.entryOrExitController,
    required this.startController,
    required this.endController,
    required this.isEntry,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontWeight: FontWeight.bold)),

        SizedBox(height: 8),

        isEntry
          ?TextField(
            controller: entryOrExitController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: "エントリー価格"),
          )

          :TextField(
            controller: entryOrExitController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: "決済価格"),
          ),

        Row(
          children: [
            Expanded(
              child: TextField(
                controller: startController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: "SL価格"),
              ),
            ),
            SizedBox(width: 8),
            Expanded(
              child: TextField(
                controller: endController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: "TP価格"),
              ),
            ),
          ],
        ),
      ],
    );
  }
}