import 'package:flutter/material.dart';
import 'package:pages_constructor/domain/models/default_text_widget_meta.dart';
import 'package:pages_constructor/style/colors.dart';

class DefaultTextWidget extends StatelessWidget {
  const DefaultTextWidget({super.key, required this.meta});
  final DefaultTextWidgetMeta meta;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(meta.label, style: const TextStyle(fontSize: 16)),
              if(meta.description != null) Text(meta.description!, style: TextStyle(fontSize: 12, color: AppColors.instance.secondaryColor)),
            ],
          ),
          Text('${meta.mqttKey}${meta.suffix ?? ''}', style: TextStyle(fontSize: 16, color: AppColors.instance.secondaryColor)),
        ],
      ),
    );
  }
}