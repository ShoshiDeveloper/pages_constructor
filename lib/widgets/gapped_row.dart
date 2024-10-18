import 'package:flutter/material.dart';

class GappedRow extends StatelessWidget {
  const GappedRow({super.key, required this.children, this.gap = 8});

  final List<Widget> children;
  final double gap;

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];

    for (var i = 0; i < this.children.length; i++) {
      children.add(this.children[i]);
      if(i+1 != this.children.length) children.add(SizedBox(width: gap));
    }

    return Row(
      children: children,
    );
  }
}