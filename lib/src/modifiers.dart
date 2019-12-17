import 'dart:convert';

import 'modifier.dart';
import 'modifier_json.dart';
import 'modifier_template.dart';
import 'template_subtypes.dart';

abstract class ModifierTemplates {
  ModifierTemplate templateByName(String name);
  Iterable<String> fetchKeys();
  String printSourceData();

  factory ModifierTemplates.instance() => _Modifiers._instance ??= _Modifiers();
}

abstract class Modifiers {
  Modifier byName(String name);

  factory Modifiers.instance() => _Modifiers._instance ??= _Modifiers();
}

class _ModifierFactory {
  Function builder;
  Map<String, dynamic> data;

  _ModifierFactory({this.data, this.builder});
}

class _Modifiers implements ModifierTemplates, Modifiers {
  static _Modifiers _instance;

  static final Map<String, Function> _constructors = {
    SimpleModifierTemplate.KEY: (x) => SimpleModifierTemplate.fromJSON(x),
    LeveledTemplate.KEY: (x) => LeveledTemplate.fromJSON(x),
    VariableLeveledTemplate.KEY: (x) => VariableLeveledTemplate.fromJSON(x),
    CyclicModifierTemplate.KEY: (x) => CyclicModifierTemplate.fromJSON(x),
    NamedVariantTemplate.KEY: (x) => NamedVariantTemplate.fromJSON(x),
    CategorizedTemplate.KEY: (x) => CategorizedTemplate.fromJSON(x),
    LeveledNamedVariantTemplate.KEY: (x) =>
        LeveledNamedVariantTemplate.fromJSON(x),
  };

  static final Map<String, _ModifierFactory> _map = {};

  @override
  ModifierTemplate templateByName(String name) {
    var myFactory = _map[name];
    return myFactory.builder.call(myFactory.data);
  }

  @override
  Modifier byName(String name) => templateByName(name).createModifier();

  @override
  Iterable<String> fetchKeys() => _Modifiers._map.keys;

  _Modifiers() {
    print('create');
    if (_map.isEmpty) {
      var service = ModifierData();
      var temp = json.decode(service.contents);
      var list = temp['modifiers'] as List;

      list.forEach((a) {
        _map[a['name']] = _ModifierFactory(
            builder: _constructors[a['type'] ?? 'Simple'], data: a);
      });
    }
  }

  @override
  String printSourceData() {
    var keys = _map.keys.toList();
    keys.sort((a, b) => a.toLowerCase().compareTo(b.toLowerCase()));
    var data = keys.map((f) => templateByName(f)).toList();

    return JsonEncoder.withIndent('  ').convert({'modifiers': data});
  }
}
