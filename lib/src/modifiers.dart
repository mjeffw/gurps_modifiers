import 'dart:convert';

import 'package:gurps_enhancers/src/modifier.dart';

import 'modifier_data.dart';

final modifiers = _Modifiers();

class _ConstructorData {
  Function factory;
  Map<String, dynamic> data;

  _ConstructorData({this.data, this.factory});
}

class _Modifiers {
  static Map _constructors = {
    'Simple': (x) => Modifier.fromJSON(x),
    'Leveled': (x) => LeveledModifier.fromJSON(x),
    'Variable': (x) => VariableModifier.fromJSON(x)
  };

  static Map<String, _ConstructorData> _map = {};

  Modifier fetch(String name) {
    var ctor = _map[name];
    return ctor.factory.call(ctor.data);
  }

  _Modifiers() {
    if (_map.isEmpty) {
      var temp = json.decode(modifierDataString);
      var list = temp['modifiers'] as List;

      list.forEach((a) {
        var name = a['name'];
        var m = _constructors[a['type']];
        _map[name] = _ConstructorData(factory: m, data: a);
      });
    }
  }

  String printSourceData() {
    var keys = _map.keys.toList();
    keys.sort((a, b) => a.toLowerCase().compareTo(b.toLowerCase()));
    var data = keys.map((f) => fetch(f).toJSON()).toList();
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
