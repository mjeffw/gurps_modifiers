import 'package:dart_utils/dart_utils.dart';
import 'package:gurps_modifiers/src/modifier.dart';
import 'package:quiver/collection.dart';
import 'package:quiver/core.dart';

import '../modifier_data.dart';
import 'description_formatter.dart';
import 'modifier_template.dart';

String _combineJsonFragments(List<String> strings) => strings
    .where((it) => it != null && it.isNotEmpty)
    .map((s) => '  $s')
    .reduce((a, b) => '$a,\n$b');

///
/// Simple modifiers have just a flat percentage.
///
class SimpleModifierTemplate extends ModifierTemplate {
  ///
  /// Modifiers adjust the base cost of a trait in proportion to their effects.
  /// This is expressed as a percentage.
  ///
  final int _percentage;

  final String defaultDetail;

  @override
  String describe(ModifierData data) =>
      formatter.describe(name: name, data: data);

  int percentage(ModifierData data) => _percentage;

  ///
  /// Create a Simple Modifier Template
  ///
  const SimpleModifierTemplate(
      {int percentage = 0,
      String name,
      bool isAttackModifier = false,
      DescriptionFormatter formatter,
      this.defaultDetail})
      : assert(percentage != null),
        this._percentage = percentage,
        super(
            name: name,
            isAttackModifier: isAttackModifier,
            formatter: formatter);

  ///
  /// Create a SimpleModifier from a JSON map.
  ///
  factory SimpleModifierTemplate.fromJSON(Map<String, dynamic> json) {
    var type = json['type'];
    assert(type == 'Simple');
    return SimpleModifierTemplate(
        percentage: (json['percentage'] ?? 0) as int,
        name: json['name'],
        formatter: DescriptionFormatter.fromJSON(json['formatter']),
        defaultDetail: json['defaultDetail'],
        isAttackModifier: (json['isAttackModifier'] ?? false) as bool);
  }

  ///
  /// Return the JSON String representation.
  ///
  @override
  String toJSON() {
    List<String> strings = [
      '"name": "$name"',
      '"type": "Simple"',
      if (percentage != null) '"percentage": $_percentage',
      if (isAttackModifier) '"isAttackModifier": true',
      if (defaultDetail != null) '"defaultDetail": "$defaultDetail"',
      if (formatter != null && formatter != const DefaultFormatter())
        '${formatter.toJSON()}'
    ];
    return "{\n${_combineJsonFragments(strings)}\n}";
  }

  @override
  int get hashCode => Hashes.finish(
      Hashes.combine(super.hashCode, Hashes.combine(_percentage.hashCode, 0)));

  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    return other is SimpleModifierTemplate &&
        super == other &&
        this._percentage == other._percentage;
  }

  @override
  Modifier createModifier({ModifierData data}) =>
      Modifier(template: this, detail: data?.detail ?? defaultDetail);
}

String _mapToJson(Map<String, int> map) {
  var reduce = map.keys.map((key) {
    var entry = '\t\t\t"key": "$key",\n\t\t\t"value": ${map[key]}';
    return '\t\t{\n${entry}\n\t\t}';
  }).reduce((a, b) => '$a,\n$b');
  return reduce;
}

// {
//   "name": "Affects Substantial",
//   "type": "NamedVariant",
//   "percentage": 40,
//   "variations": [
//     {
//       "key": "Selective",
//       "value": 50
//     }
//   ]
// },

class NamedVariantTemplate extends ModifierTemplate {
  final Map<String, int> variations;

  final int _percentage;

  final String defaultVariation;

  List<String> get variationNames => variations.keys.toList();

  int percentage(ModifierData data) =>
      variations[data.detail ?? defaultVariation] ?? _percentage;

  bool containsVariation(String detail) =>
      detail == null || variations.containsKey(detail);

  NamedVariantTemplate(
      {String name,
      bool isAttackModifier = false,
      int percentage,
      this.variations,
      this.defaultVariation})
      : this._percentage = percentage,
        super(name: name, isAttackModifier: isAttackModifier ?? false);

  @override
  Modifier createModifier({ModifierData data}) {
    if (data?.detail != null) {
      if (!containsVariation(data.detail))
        throw AssertionError('invalid variation');
    }
    return Modifier(
        template: this,
        level: null,
        detail:
            data == null ? defaultVariation : data.detail ?? defaultVariation);
  }

  @override
  String toJSON() {
    List<String> attributes = [
      '"name": "$name"',
      '"type": "NamedVariant"',
      if (_percentage != null) '"percentage": $_percentage',
      if (defaultVariation != null) '"default": "$defaultVariation"',
      if (isAttackModifier) '"isAttackModifier": true',
      '"variations": [\n${_mapToJson(variations)}\n\t]'
    ];
    return '{\n${_combineJsonFragments(attributes)}\n}';
  }

  factory NamedVariantTemplate.fromJSON(Map<String, dynamic> json) {
    List<dynamic> x = json['variations'];
    Map<String, int> variations = {};
    x.forEach((f) {
      String name = f['key'];
      int value = f['value'] as int;
      variations[name] = value;
    });
    return NamedVariantTemplate(
        name: json['name'],
        percentage: json['percentage'],
        variations: variations,
        defaultVariation: json['default'],
        isAttackModifier: json['isAttackModifier']);
  }
}

///
/// A Modifier that has levels with a fixed percentage per level and
/// potentially a maximum level.
///
/// The percentage is calculated as:
///  base percentage + (value per level × level).
///
class LeveledTemplate extends BaseLeveledTemplate {
  ///
  /// The base percentage of the Modifier.
  ///
  final int baseValue;

  ///
  /// The multiplicative percentage per level.
  ///
  final int valuePerLevel;

  @override
  int percentage(ModifierData data) => data.level * valuePerLevel + baseValue;

  const LeveledTemplate(
      {String name,
      int baseValue = 0,
      this.valuePerLevel,
      int maxLevel,
      String levelPrompt,
      LevelTextFormatter formatter = const DefaultLevelTextFormatter(),
      bool isAttackModifier = false})
      : assert(valuePerLevel != null),
        baseValue = baseValue ?? 0,
        super(
            maxLevel: maxLevel,
            levelPrompt: levelPrompt ?? 'Level',
            name: name,
            isAttackModifier: isAttackModifier,
            formatter: formatter);

  ///
  /// Create a LeveledModifierTemplate from a JSON map.
  ///
  factory LeveledTemplate.fromJSON(Map<String, dynamic> json) {
    var type = json['type'];
    assert(type == 'Leveled');
    return LeveledTemplate(
        name: json['name'],
        isAttackModifier: (json['isAttackModifier'] ?? false) as bool,
        valuePerLevel: json['valuePerLevel'] as int,
        baseValue: (json['baseValue'] ?? 0) as int,
        maxLevel: json['maxLevel'] as int,
        levelPrompt: json['levelPrompt'],
        formatter: json['formatter'] == null
            ? const DefaultLevelTextFormatter()
            : DescriptionFormatter.fromJSON(json['formatter']));
  }

  ///
  /// Return the JSON String representation.
  ///
  @override
  String toJSON() {
    List<String> strings = [
      '"name": "$name"',
      '"type": "Leveled"',
      if (baseValue != null && baseValue != 0) '"baseValue": $baseValue',
      if (isAttackModifier) '"isAttackModifier": ${isAttackModifier}',
      if (maxLevel != null) '"maxLevel": $maxLevel',
      '"valuePerLevel": $valuePerLevel',
      if (levelPrompt != null && levelPrompt != 'Level')
        '"levelPrompt": "$levelPrompt"',
      if (formatter != null && formatter != DefaultLevelTextFormatter())
        '"formatter":${formatter.toJSON()}'
    ];
    return "{\n${strings.map((s) => '  $s').reduce((a, b) => '$a,\n$b')}\n}";
  }

  @override
  int get hashCode => Hashes.finish(Hashes.combine(super.hashCode,
      Hashes.combine(hash3(valuePerLevel, baseValue, levelPrompt), 0)));

  @override
  bool operator ==(dynamic other) {
    return (identical(this, other)) ||
        (other is LeveledTemplate &&
            super == other &&
            this.levelPrompt == other.levelPrompt &&
            this.valuePerLevel == other.valuePerLevel &&
            this.baseValue == other.baseValue);
  }
}

///
/// [VariableLeveledModifiers] have 'levels' but do not have a consistent
/// percentage increment per level.
///
class VariableLeveledTemplate extends BaseLeveledTemplate {
  ///
  /// The cost of each level.
  ///
  final List<int> _levelValues;

  @override
  int percentage(ModifierData data) => _levelValues[data.level - 1];

  const VariableLeveledTemplate(
      {List<int> levelValues,
      String name,
      bool isAttackModifier = false,
      LevelTextFormatter formatter})
      : _levelValues = levelValues,
        super(
            formatter: formatter,
            maxLevel: levelValues.length,
            name: name,
            isAttackModifier: isAttackModifier);

  factory VariableLeveledTemplate.fromJSON(Map<String, dynamic> json) {
    var type = json['type'];
    assert(type == 'Variable');
    return VariableLeveledTemplate(
        levelValues: List<int>.from(json['levelValues'] as List),
        isAttackModifier: (json['isAttackModifier'] ?? false) as bool,
        name: json['name'],
        formatter: json['formatter'] == null
            ? null
            : DescriptionFormatter.fromJSON(json['formatter'])
                as LevelTextFormatter);
  }

  @override
  String toJSON() {
    List<String> strings = [
      '"name": "$name"',
      '"type": "Variable"',
      '"levelValues": $_levelValues',
      if (isAttackModifier) '"isAttackModifier": $isAttackModifier',
      if (formatter != null && formatter != const DefaultLevelTextFormatter())
        '"formatter":${formatter.toJSON()}'
    ];
    return "{\n${strings.map((s) => '  $s').reduce((a, b) => '$a,\n$b')}\n}";
  }

  @override
  int get hashCode => Hashes.finish(Hashes.combine(
      super.hashCode, Hashes.combine(hashObjects(_levelValues), 0)));

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is VariableLeveledTemplate &&
            super == other &&
            listsEqual(this._levelValues, other._levelValues));
  }
}

///
/// [Category] represents a named group of options or specialties. Each also
/// determines the cost of the Modifier.
///
class Category {
  ///
  /// Name of the [Category].
  ///
  final String name;

  ///
  /// Cost of the [Modifier] if its specialties match one of the items in this
  /// category.
  ///
  final int cost;

  ///
  /// The list of items that match this category.
  ///
  final List<String> items;

  const Category({this.name, this.cost, this.items});

  ///
  /// Create a [Category] from JSON data
  ///
  factory Category.fromJSON(Map<String, dynamic> json) {
    var cat = Category(
        name: json['name'],
        cost: json['cost'],
        items: JsonEx.toListOfStrings(json['items']));
    cat.items.add(cat.name);
    return cat;
  }

  String toJSON() {
    return '''
    {
      "name": "$name",
      "cost": ${cost},
      "items": [
${items.where((it) => it != name).map((it) => '      "$it"').join(',\n')}
      ]
    }''';
  }

  ///
  /// Create a list of [Category] from a JSON list.
  ///
  static List<Category> listFromJSON(List<dynamic> list) =>
      list.map((it) => Category.fromJSON(it)).toList();

  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    return other is Category &&
        this.name == other.name &&
        this.cost == other.cost &&
        listsEqual(this.items, other.items);
  }

  @override
  int get hashCode => hash3(name, cost, items);

  static listToJSON(List<Category> categories) {
    return '''
[
${categories.map((it) => it.toJSON()).join(',\n')}
  ]''';
  }
}

const Category NullCategory =
    const Category(name: 'NULL', cost: null, items: []);

class CategorizedTemplate extends ModifierTemplate {
  ///
  /// The list of [Category].
  ///
  final List<Category> categories;

  final String defaultDetail;

  CategorizedTemplate(
      {String name,
      bool isAttackModifier = false,
      this.defaultDetail,
      DescriptionFormatter formatter = const DefaultFormatter(),
      this.categories})
      : super(
            name: name,
            isAttackModifier: isAttackModifier,
            formatter: formatter);

  factory CategorizedTemplate.fromJSON(Map<String, dynamic> json) {
    var fmtjson =
        json['formatter'] ?? <String, dynamic>{'template': '%name, %detail'};

    return CategorizedTemplate(
        isAttackModifier: json['isAttackModifier'] ?? false,
        name: json['name'],
        defaultDetail: json['defaultDetail'],
        categories: Category.listFromJSON(json['categories']),
        formatter: DescriptionFormatter.fromJSON(fmtjson));
  }

  @override
  Modifier createModifier({ModifierData data}) {
    return Modifier(
        template: this,
        level: null,
        detail: data == null ? defaultDetail : data.detail);
  }

  int percentage(ModifierData data) => _findCategory(data.detail).cost;

  String describe(ModifierData data) =>
      formatter.describe(name: name, data: data);

  Category _findCategory(String detail) =>
      categories.firstWhere((it) => it.items.contains(detail),
          orElse: () => NullCategory);

  @override
  String toJSON() {
    // TODO: implement toJSON
    // return null;
    List<String> strings = [
      '"name": "$name"',
      '"type": "Categorized"',
      if (isAttackModifier) '"isAttackModifier": $isAttackModifier',
      if (defaultDetail != null) '"defaultDetail": "$defaultDetail"',
      if (formatter != null && formatter != const DefaultFormatter())
        '"formatter":${formatter.toJSON()}',
      '"categories": ${Category.listToJSON(categories)}'
    ];
    return "{\n${strings.map((s) => '  $s').reduce((a, b) => '$a,\n$b')}\n}";
  }
}
