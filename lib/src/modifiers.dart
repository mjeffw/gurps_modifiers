import 'dart:convert';

import 'modifier.dart';
import 'modifier_data.dart';
import 'modifier_template.dart';
import 'template_subtypes.dart';

abstract class ModifierTemplates {
  ModifierTemplate templateByName(String name);
  Iterable<String> fetchKeys();
  String printSourceData();

  factory ModifierTemplates.instance() {
    if (_Modifiers._instance == null) {
      _Modifiers._instance = _Modifiers();
    }
    return _Modifiers._instance;
  }
}

abstract class Modifiers {
  Modifier byName(String name);

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

class _Modifiers implements ModifierTemplates, Modifiers {
  static _Modifiers _instance;

  static Map<String, Function> _constructors = {
    'Simple': (x) => SimpleModifierTemplate.fromJSON(x),
    'Leveled': (x) => LeveledTemplate.fromJSON(x),
    'Variable': (x) => VariableLeveledTemplate.fromJSON(x),
    'Cyclic': (x) => CyclicModifierTemplate.fromJSON(x),
    'NamedVariant': (x) => NamedVariantTemplate.fromJSON(x),
  };

  static Map<String, _ModifierFactory> _map = {};

  ModifierTemplate templateByName(String name) {
    var myFactory = _map[name];
    return myFactory.builder.call(myFactory.data);
  }

  @override
  Modifier byName(String name) {
    ModifierTemplate t = templateByName(name);
    return t.createModifier();
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
    var data = keys.map((f) => templateByName(f).toJSON()).toList();
    var line = data.reduce((x, y) => '$x,\n$y');

    return '{ "modifiers": [\n'
        '$line\n'
        ']\n'
        '}';
  }
}
