import 'dart:convert';
import 'package:gurps_modifiers/src/modifier.dart';
import 'modifier_data.dart';

final modifiers = _Modifiers();

class ModifierFactory {
  Function builder;
  Map<String, dynamic> data;

  ModifierFactory({this.data, this.builder});
}

class _Modifiers {
  static Map<String, Function> _constructors = {
    'Simple': (x) => SimpleModifier.fromJSON(x),
    'Leveled': (x) => LeveledModifier.fromJSON(x),
    'Variable': (x) => VariableModifier.fromJSON(x)
  };

  static Map<String, ModifierFactory> _map = {};

  Modifier fetch(String name) {
    var myFactory = _map[name];
    return myFactory.builder.call(myFactory.data);
  }

  Iterable<String> fetchEntries() => _Modifiers._map.keys;

  _Modifiers() {
    if (_map.isEmpty) {
      var temp = json.decode(modifierDataString);
      var list = temp['modifiers'] as List;

      list.forEach((a) {
        var name = a['name'];
        var m = _constructors[a['type']];
        _map[name] = ModifierFactory(builder: m, data: a);
      });
    }
  }

  String printSourceData() {
    var keys = _map.keys.toList();
    keys.sort((a, b) => a.toLowerCase().compareTo(b.toLowerCase()));
    var data = keys.map((f) => fetch(f).toJSON(template: true)).toList();
    var line = data.reduce((x, y) => '$x,\n$y');

    return '{ "modifiers": [\n'
        '$line\n'
        ']\n'
        '}';
  }
}
