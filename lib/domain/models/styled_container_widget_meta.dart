import 'package:pages_constructor/domain/enums/constructor_widget_types.dart';
import 'package:pages_constructor/domain/models/constructor_widget_meta.dart';

class StyledContainerWidgetMeta extends ConstructorWidgetMeta {
  const StyledContainerWidgetMeta({
    required this.children,
    this.label
  }) : super(type: ConstructorWidgetTypes.styledContainerWidget);

  final List<ConstructorWidgetMeta> children;
  final String? label;

  @override
  Map<String, dynamic> toJson() => {
    'children': children.map((e) => e.toJson()),
    if(label != null) 'label': label
  };
}