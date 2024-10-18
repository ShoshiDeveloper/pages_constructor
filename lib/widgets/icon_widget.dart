import 'package:flutter/material.dart';
import 'package:pages_constructor/domain/models/icon_widget_meta.dart';

class IconWidget extends StatelessWidget {
  const IconWidget({super.key, required this.meta});
  final IconWidgetMeta meta;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 32),
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(64),
        color: meta.backgroundStateColors.getByValue('default'),
      ),
      child: Icon(
        Icons.door_front_door_rounded,
        color: meta.iconStateColors.getByValue('default'),
        size: 64,
      )
    );
  }
}