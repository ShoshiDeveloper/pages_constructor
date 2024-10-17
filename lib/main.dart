import 'package:flutter/material.dart';
import 'package:pages_constructor/domain/enums/constructor_widget_types.dart';
import 'package:pages_constructor/domain/models/constructor_widget_meta.dart';
import 'package:pages_constructor/domain/models/default_text_widget_meta.dart';
import 'package:pages_constructor/domain/models/styled_container_widget_meta.dart';
import 'package:pages_constructor/widgets/default_text_widget.dart';
import 'package:pages_constructor/widgets/styled_container_widget.dart';

const List<ConstructorWidgetMeta> constructor = [
  DefaultTextWidgetMeta(mqttKey: 'temperature', label: 'Температура'),
  DefaultTextWidgetMeta(mqttKey: 'humidity', label: 'Влажность'),
  StyledContainerWidgetMeta(
    children: [
      DefaultTextWidgetMeta(mqttKey: 'Mr.Fish', label: 'no-no-no'),
      DefaultTextWidgetMeta(mqttKey: 'to your family', label: 'You don\'t want'),
      DefaultTextWidgetMeta(mqttKey: 'to this place', label: 'You want to go'),
    ]
  ),
    DefaultTextWidgetMeta(mqttKey: 'humidity', label: 'Влажность'),
];

Widget getWidgetByType(ConstructorWidgetMeta meta) => switch (meta.type) {
  ConstructorWidgetTypes.defaultTextWidget => DefaultTextWidget(meta: meta as DefaultTextWidgetMeta),
  ConstructorWidgetTypes.styledContainerWidget => StyledContainerWidget(meta: meta as StyledContainerWidgetMeta),
  _ => Text('Вы кто такие? Я вас не звал! Идите нахуй!')
};

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ConstructedPage(),
    );
  }
}

class ConstructedPage extends StatefulWidget {
  const ConstructedPage({super.key});

  @override
  State<ConstructedPage> createState() => _ConstructedPageState();
}

class _ConstructedPageState extends State<ConstructedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: constructor.map(
              (e) => getWidgetByType(e)
            ).toList()
          )
        ),
      ),
    );
  }
}