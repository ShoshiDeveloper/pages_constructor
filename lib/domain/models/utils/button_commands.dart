class ButtonMeta {
  const ButtonMeta({this.label, required this.command});
  final String? label;
  final String command;

  Map<String, dynamic> toJson() => {
    if(label != null) 'label': label,
    'command': command
  };
}

class ButtonsMeta {
  const ButtonsMeta({required this.buttons});
  final List<ButtonMeta> buttons;

  Map<String, dynamic> toJson() => {
    'buttons': buttons.map((e) => e.toJson())
  };
}