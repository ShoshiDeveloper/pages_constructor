import 'package:flutter/material.dart';
import 'package:pages_constructor/domain/models/buttons_row_widget_meta.dart';
import 'package:pages_constructor/domain/models/utils/button_commands.dart';
import 'package:pages_constructor/style/colors.dart';
import 'package:pages_constructor/widgets/gapped_row.dart';

class ButtonsRowWidget extends StatelessWidget {
  const ButtonsRowWidget({super.key, required this.meta});
  final ButtonsRowWidgetMeta meta;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: GappedRow(
        children: meta.buttons.map((e) => _buildButton(context, e)).toList()
      )
    );
  }

  Widget _buildButton(BuildContext context, ButtonMeta meta) => Expanded(
    child: InkWell(
      onTap: () {
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Была отправлена команда ${meta.command}')));
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.instance.secondaryColor,
          borderRadius: BorderRadius.circular(16)
        ),
        child: Text(meta.label ?? 'No label', textAlign: TextAlign.center, style: const TextStyle(fontSize: 16, color: Colors.white),),
      ),
    ),
  );
}