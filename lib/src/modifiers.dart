import 'dart:convert';

import 'package:gurps_enhancers/src/modifier.dart';

import 'modifier_data.dart';

final modifiers = _Modifiers();

class _Modifiers {
  static Map _constructors = {
    'Simple': (x) => Modifier.fromJSON(x),
    'Leveled': (x) => LeveledModifier.fromJSON(x),
    'Variable': (x) => VariableModifier.fromJSON(x)
  };

  static Map<String, Modifier> _map = {};

  Modifier fetch(String name) => _map[name];

  _Modifiers() {
    if (_map.isEmpty) {
      var temp = json.decode(modifierDataString);
      var list = temp['modifiers'] as List;

      list.forEach((a) {
        var m = _constructors[a['type']].call(a);
        _map[m.name] = m;
      });
    }
  }

  String printSourceData() {
    var keys = _map.keys.toList();
    keys.sort((a, b) => a.toLowerCase().compareTo(b.toLowerCase()));
    var data = keys.map((f) => _map[f].toJSON()).toList();
    var line = data.reduce((x, y) => '$x,\n$y');

    return '''
{
  "modifiers":
    [
      $line
    ]
}''';
  }
}
