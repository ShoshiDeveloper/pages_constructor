import 'package:pages_constructor/domain/enums/constructor_widget_types.dart';
import 'package:pages_constructor/domain/models/constructor_widget_meta.dart';

class DefaultTextWidgetMeta extends ConstructorWidgetMeta {
  const DefaultTextWidgetMeta({
    required this.mqttKey,
    this.suffix
  }) : super(type: ConstructorWidgetTypes.defaultTextWidget);

  ///MqttKey for which the value will be taken
  final String mqttKey;
  final String? suffix;
  
  @override
  Map<String, dynamic> toJson() => {
    'mqttKey': mqttKey,
    if(suffix != null) 'suffix': suffix
  };
}