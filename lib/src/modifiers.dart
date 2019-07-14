import 'dart:convert';
import 'package:gurps_modifiers/src/modifier.dart';
import 'modifier_data.dart';

abstract class Modifiers {
  Modifier fetch(String name);
  Iterable<String> fetchKeys();
  String printSourceData();

  factory Modifiers.instance() {
    if (_Modifiers._instance == null) {
      _Modifiers._instance = _Modifiers();
    }
    return _Modifiers._instance;
  }
}

class _ModifierFactory {
  Function builder;
  Map<String, dynamic> data;

  _ModifierFactory({this.data, this.builder});
}

class _Modifiers implements Modifiers {
  static _Modifiers _instance;

  static Map<String, Function> _constructors = {
    'Simple': (x) => SimpleModifier.fromJSON(x),
    'Leveled': (x) => LeveledModifier.fromJSON(x),
    'Variable': (x) => VariableModifier.fromJSON(x),
    'Cyclic': (x) => CyclicModifier.fromJSON(x)
  };

  static Map<String, _ModifierFactory> _map = {};

  Modifier fetch(String name) {
    print("fetch");
    var myFactory = _map[name];
    return myFactory.builder.call(myFactory.data);
  }

  Iterable<String> fetchKeys() => _Modifiers._map.keys;

  _Modifiers() {
    print("create");
    if (_map.isEmpty) {
      var temp = json.decode(modifierDataString);
      var list = temp['modifiers'] as List;

      list.forEach((a) {
        var name = a['name'];
        var m = _constructors[a['type']];
        _map[name] = _ModifierFactory(builder: m, data: a);
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
