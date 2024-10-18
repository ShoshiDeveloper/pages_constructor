import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pages_constructor/domain/enums/constructor_widget_types.dart';
import 'package:pages_constructor/domain/models/constructor_widget_meta.dart';
import 'package:pages_constructor/style/colors.dart';

class StateColors {
  const StateColors(Map<String, dynamic> stateColors) : _stateColors = stateColors;
  final Map<String, dynamic> _stateColors;

  Color getByValue(String value) {
    String stringColor = _stateColors[value];
    
    if(stringColor.contains('rgb')) {
      final segments = stringColor.substring(stringColor.indexOf('('), stringColor.indexOf(')')).split(',');
      return Color.fromRGBO(segments[0] as int, segments[1] as int, segments[2] as int, 1);
    }

    return AppColors.instance.fromName(stringColor);
  }
}

class IconWidgetMeta extends ConstructorWidgetMeta {
  const IconWidgetMeta({
    required this.mqttKey,
    required this.backgroundStateColors, required this.iconStateColors
  }) : super(type: ConstructorWidgetTypes.iconWidget);

  ///MqttKey for which the value will be taken
  final String mqttKey;
  final StateColors backgroundStateColors;
  final StateColors iconStateColors;
  
  @override
  Map<String, dynamic> toJson() => {
    'mqttKey': mqttKey,
    'backgroundStateColors': backgroundStateColors,
    'iconStateColors': iconStateColors,
  };
}