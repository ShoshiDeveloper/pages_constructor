import 'package:pages_constructor/domain/enums/constructor_widget_types.dart';
import 'package:pages_constructor/domain/models/constructor_widget_meta.dart';
import 'package:pages_constructor/domain/models/utils/button_commands.dart';

class ButtonsRowWidgetMeta extends ConstructorWidgetMeta {
  const ButtonsRowWidgetMeta({
    required this.buttons
  }) : super(type: ConstructorWidgetTypes.buttonsRowWidget);

  final List<ButtonMeta> buttons;
  
  @override
  Map<String, dynamic> toJson() => {
    'buttons': buttons.map((e) => e.toJson())
  };
}