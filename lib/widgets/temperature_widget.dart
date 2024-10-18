import 'package:flutter/material.dart';
import 'package:pages_constructor/domain/models/temperature_widget_meta.dart';
import 'package:pages_constructor/style/colors.dart';

class TemperatureWidget extends StatelessWidget {
  const TemperatureWidget({super.key, required this.meta});
  final TemperatureWidgetMeta meta;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildButton(context, meta.plusButton.command),
          Text(meta.mqttKey),
          _buildButton(context, meta.minusButton.command)
        ],
      )
    );
  }

  Widget _buildButton(BuildContext context, String command) => InkWell(
    onTap: () {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Была отправлена команда $command')));
    },
    child: Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: AppColors.instance.secondaryColor,
        borderRadius: BorderRadius.circular(64)
      ),
      child: Icon(command == 'plus' ? Icons.add_rounded : Icons.remove_rounded, color: Colors.white),
    ),
  );
}