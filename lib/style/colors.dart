import 'package:flutter/material.dart';

class AppColors {
  static AppColors instance = AppColors();


  final Color primaryColor = Colors.black;
  final Color invPrimaryColor = Colors.white;
  final Color secondaryColor = const Color.fromRGBO(144, 148, 153, 1);
  final Color border = const Color.fromRGBO(225, 227, 230, 1);

  Color fromName(String name) => switch (name) {
    'primaryColor' => primaryColor,
    'invPrimaryColor' => invPrimaryColor,
    'secondaryColor' => secondaryColor,
    'border' => border,
    _ => throw Exception()
  };

}