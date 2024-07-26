import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class DateTimePicker extends HookWidget {
  final String label;
  final TextEditingController controller;

  const DateTimePicker({Key? key, required this.label, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        InkWell(
          onTap: () async {
            final date = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2000),
              lastDate: DateTime(2100),
            );
            if (date != null) {
              final time = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
              );
              if (time != null) {
                final dateTime = DateTime(
                  date.year, date.month, date.day, time.hour, time.minute,
                );
                controller.text = dateTime.toIso8601String();
              }
            }
          },
          child: ValueListenableBuilder<TextEditingValue>(
            valueListenable: controller,
            builder: (context, value, child) {
              return InputDecorator(
                decoration: InputDecoration(
                  hintText: "YYYY-MM-DD HH:MM",
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: isDarkMode ? Colors.grey[700] : Colors.grey[200],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(value.text.isEmpty ? "日時を選択" : value.text),
                    Icon(Icons.calendar_today, color: isDarkMode ? Colors.white70 : Colors.black54),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}