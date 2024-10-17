import 'package:flutter/material.dart';
import 'package:pages_constructor/domain/models/default_text_widget_meta.dart';

class DefaultTextWidget extends StatelessWidget {
  const DefaultTextWidget({super.key, required this.meta});
  final DefaultTextWidgetMeta meta;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(meta.label),
        Text(meta.mqttKey),
      ],
    );
  }
}