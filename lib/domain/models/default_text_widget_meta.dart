import 'package:pages_constructor/domain/enums/constructor_widget_types.dart';
import 'package:pages_constructor/domain/models/constructor_widget_meta.dart';

class DefaultTextWidgetMeta extends ConstructorWidgetMeta {
  const DefaultTextWidgetMeta({
    required this.mqttKey, required this.label,
    this.suffix
  }) : super(type: ConstructorWidgetTypes.defaultTextWidget);

  ///MqttKey for which the value will be taken
  final String mqttKey;
  final String label;
  final String? suffix;
  
  @override
  Map<String, dynamic> toJson() => {
    'mqttKey': mqttKey,
    'label': label,
    if(suffix != null) 'suffix': suffix
  };
}