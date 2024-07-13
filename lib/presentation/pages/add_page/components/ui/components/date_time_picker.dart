//date_time_picker.dart

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class DateTimePicker extends HookWidget {
  final String label;
  final TextEditingController controller;

  const DateTimePicker({
    Key? key,
    required this.label,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: "YYYY-MM-DD HH:MM",
          ),
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
        ),
      ],
    );
  }
}