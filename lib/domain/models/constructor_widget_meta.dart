import 'package:pages_constructor/domain/enums/constructor_widget_types.dart';

abstract class ConstructorWidgetMeta {
  const ConstructorWidgetMeta({
    required this.type, 
    this.visionCondition
  });

  final ConstructorWidgetTypes type;
  ///The conditions under which the widget is displayed. The conditions represent the presence of a certain value for a particular key.
  ///If there is no condition, the widget will always be displayed.
  final Map<String, dynamic>? visionCondition;

  Map<String, dynamic> toJson();
}