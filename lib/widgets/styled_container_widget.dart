import 'package:flutter/material.dart';
import 'package:pages_constructor/domain/models/styled_container_widget_meta.dart';
import 'package:pages_constructor/main.dart';
import 'package:pages_constructor/style/colors.dart';

class StyledContainerWidget extends StatelessWidget {
  const StyledContainerWidget({super.key, required this.meta});
  final StyledContainerWidgetMeta meta;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.instance.border,
          width: 0.5
        )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if(meta.label != null) ... [
            Text(meta.label!),
            const SizedBox(height: 8)
          ],
          ...meta.children.map((e) => getWidgetByType(e))
        ]
      ),
    );
  }
}