import 'package:pages_constructor/domain/enums/constructor_widget_types.dart';
import 'package:pages_constructor/domain/models/constructor_widget_meta.dart';
import 'package:pages_constructor/domain/models/utils/button_commands.dart';

class TemperatureWidgetMeta extends ConstructorWidgetMeta {
  const TemperatureWidgetMeta({
    required this.mqttKey,
    required this.plusButton, required this.minusButton
  }) : super(type: ConstructorWidgetTypes.temperatureWidget);

  ///MqttKey for which the value will be taken
  final String mqttKey;
  final ButtonMeta plusButton;
  final ButtonMeta minusButton;
  
  @override
  Map<String, dynamic> toJson() => {
    'mqttKey': mqttKey,
    'plusButton': plusButton.toJson(),
    'minusButton': minusButton,
  };
}