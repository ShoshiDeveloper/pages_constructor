import 'package:flutter/material.dart';
import 'package:pages_constructor/domain/enums/constructor_widget_types.dart';
import 'package:pages_constructor/domain/models/buttons_row_widget_meta.dart';
import 'package:pages_constructor/domain/models/constructor_widget_meta.dart';
import 'package:pages_constructor/domain/models/default_text_widget_meta.dart';
import 'package:pages_constructor/domain/models/icon_widget_meta.dart';
import 'package:pages_constructor/domain/models/styled_container_widget_meta.dart';
import 'package:pages_constructor/domain/models/temperature_widget_meta.dart';
import 'package:pages_constructor/domain/models/utils/button_commands.dart';
import 'package:pages_constructor/widgets/buttons_row_widget.dart';
import 'package:pages_constructor/widgets/default_text_widget.dart';
import 'package:pages_constructor/widgets/icon_widget.dart';
import 'package:pages_constructor/widgets/styled_container_widget.dart';
import 'package:pages_constructor/widgets/temperature_widget.dart';

const List<ConstructorWidgetMeta> constructor = [
  IconWidgetMeta(mqttKey: 'state', backgroundStateColors: StateColors({'default': 'secondaryColor'}), iconStateColors: StateColors({'default': 'invPrimaryColor'})),
  DefaultTextWidgetMeta(mqttKey: 'temperature', label: 'Температура'),
  TemperatureWidgetMeta(mqttKey: 'T', plusButton: ButtonMeta(command: 'plus'), minusButton: ButtonMeta(command: 'minus')),
  DefaultTextWidgetMeta(mqttKey: 'humidity', label: 'Влажность'),
  ButtonsRowWidgetMeta(buttons: [
    ButtonMeta(command: 'auto', label: 'Автоматический'),
    ButtonMeta(command: 'manual', label: 'Ручной'),
  ]),
  StyledContainerWidgetMeta(
    children: [
      DefaultTextWidgetMeta(mqttKey: 'Mr.Fish', label: 'no-no-no'),
      DefaultTextWidgetMeta(mqttKey: 'to your family', label: 'You don\'t want'),
      DefaultTextWidgetMeta(mqttKey: 'to this place', label: 'You want to go', description: 'Сегодня в 8:40'),
    ]
  ),
  StyledContainerWidgetMeta(
    children: [
      DefaultTextWidgetMeta(mqttKey: '23', label: 'Температура', suffix: '°C'),
      DefaultTextWidgetMeta(mqttKey: '27', label: 'Влажность', suffix: '%'),
      DefaultTextWidgetMeta(mqttKey: '67', label: 'Аккумулятор', description: 'Сегодня в 8:40', suffix: '%'),
    ]
  ),
  DefaultTextWidgetMeta(mqttKey: 'humidity', label: 'Влажность'),
];

Widget getWidgetByType(ConstructorWidgetMeta meta) => switch (meta.type) {
  ConstructorWidgetTypes.defaultTextWidget => DefaultTextWidget(meta: meta as DefaultTextWidgetMeta),
  ConstructorWidgetTypes.styledContainerWidget => StyledContainerWidget(meta: meta as StyledContainerWidgetMeta),
  ConstructorWidgetTypes.iconWidget => IconWidget(meta: meta as IconWidgetMeta),
  ConstructorWidgetTypes.temperatureWidget => TemperatureWidget(meta: meta as TemperatureWidgetMeta),
  ConstructorWidgetTypes.buttonsRowWidget => ButtonsRowWidget(meta: meta as ButtonsRowWidgetMeta),

  _ => const Text('Вы кто такие? Я вас не звал! Идите нахуй!')
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
          child: SingleChildScrollView(
            child: Column(
              children: constructor.map(
                (e) => getWidgetByType(e)
              ).toList()
            ),
          )
        ),
      ),
    );
  }
}