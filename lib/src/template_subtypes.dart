import 'package:dart_utils/dart_utils.dart';
import 'package:gurps_modifiers/src/modifier.dart';
import 'package:quiver/core.dart';

import 'description_formatter.dart';
import 'detail_alias.dart';
import 'modifier_data.dart';
import 'modifier_template.dart';
import 'util/generic.dart';

///
/// Simple modifiers have just a flat percentage.
///
class SimpleModifierTemplate extends ModifierTemplate {
  static final String KEY = 'Simple';

  ///
  /// Modifiers adjust the base cost of a trait in proportion to their effects.
  /// This is expressed as a percentage.
  ///
  final int _percentage;

  ///
  /// Provide a default value for the detail if one is not provided.
  ///
  final String defaultDetail;

  @override
  String describe(ModifierData data) =>
      formatter.describe(name: name, data: data);

  @override
  int percentage(ModifierData data) => _percentage;

  ///
  /// Create a Simple Modifier Template
  ///
  SimpleModifierTemplate(
      {int percentage = 0,
      String name,
      bool isAttackModifier = false,
      DescriptionFormatter formatter,
      DetailAlias detailAlias,
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
        detailAlias: json['detailAlias'],
        defaultDetail: json['default'],
        isAttackModifier: (json['isAttackModifier'] ?? false) as bool);
  }

  @override
  Modifier createModifier({ModifierData data}) =>
      Modifier(template: this, detail: data?.detail ?? defaultDetail);

  @override
  Map<String, dynamic> get attributeMap => {
        ...super.attributeMap,
        "type": KEY,
        "percentage": _percentage,
        if (defaultDetail != null) "default": defaultDetail,
        if (formatter != null && formatter != DescriptionFormatter())
          "formatter": formatter,
      };
}

class NamedVariantTemplate extends ModifierTemplate {
  static final String KEY = 'NamedVariant';

  final Map<String, int> variations;

  // final int _percentage;
  final Optional<int> _percentage;

  final String defaultVariation;

  List<String> get variationNames => variations.keys.toList();

  int percentage(ModifierData data) =>
      variations[data.detail ?? defaultVariation] ?? _percentage.value;

  bool containsVariation(String detail) => variations.containsKey(detail);

  NamedVariantTemplate(
      {String name,
      bool isAttackModifier = false,
      int percentage,
      this.variations,
      DescriptionFormatter formatter,
      this.defaultVariation})
      : _percentage = Optional.fromNullable(percentage),
        super(
            name: name,
            isAttackModifier: isAttackModifier ?? false,
            formatter: formatter ?? DescriptionFormatter());

  @override
  Modifier createModifier({ModifierData data}) {
    if (data?.detail != null) {
      if (!containsVariation(data.detail)) {
        throw AssertionError('invalid variation');
      }
    }
    return Modifier(
        template: this,
        level: null,
        detail:
            data == null ? defaultVariation : data.detail ?? defaultVariation);
  }

  factory NamedVariantTemplate.fromJSON(Map<String, dynamic> json) {
    Map<String, dynamic> variations = json['variations'];
    return NamedVariantTemplate(
        name: json['name'],
        percentage: json['percentage'],
        variations: variations.map((k, v) => MapEntry(k, v as int)),
        defaultVariation: json['default'],
        formatter: json['formatter'] == null
            ? DescriptionFormatter()
            : DescriptionFormatter.fromJSON(json['formatter']),
        isAttackModifier: json['isAttackModifier']);
  }

  @override
  Map<String, dynamic> get attributeMap => {
        ...super.attributeMap,
        "type": KEY,
        if (_percentage.isPresent) "percentage": _percentage.value,
        if (defaultVariation != null) "default": defaultVariation,
        "variations": variations,
        if (formatter != null && formatter != DescriptionFormatter())
          "formatter": formatter,
      };
}

///
/// A Modifier that has levels with a fixed percentage per level and
/// potentially a maximum level.
///
/// The percentage is calculated as:
///  base percentage + (value per level × level).
///
class LeveledTemplate extends BaseLeveledTemplate {
  static final String KEY = 'Leveled';

  @override
  int percentage(ModifierData data) => data.level * valuePerLevel + baseValue;

  LeveledTemplate(
      {String name,
      int baseValue = 0,
      int valuePerLevel,
      int maxLevel,
      String levelPrompt,
      LevelFormatter formatter,
      bool isAttackModifier = false})
      : assert(valuePerLevel != null),
        super(
            maxLevel: maxLevel,
            valuePerLevel: valuePerLevel,
            baseValue: baseValue ?? 0,
            levelPrompt: levelPrompt ?? 'Level',
            name: name,
            isAttackModifier: isAttackModifier,
            formatter: formatter ?? LevelFormatter());

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
            ? LevelFormatter()
            : DescriptionFormatter.fromJSON(json['formatter']));
  }

  @override
  Map<String, dynamic> get attributeMap => {
        ...super.attributeMap,
        "type": KEY,
        if (formatter != null && formatter != LevelFormatter())
          "formatter": formatter,
      };
}

///
/// [VariableLeveledModifiers] have 'levels' but do not have a consistent
/// percentage increment per level.
///
class VariableLeveledTemplate extends BaseLeveledTemplate {
  static final String KEY = 'Variable';

  ///
  /// The cost of each level.
  ///
  final MyList<int> _levelValues;

  @override
  int percentage(ModifierData data) => _levelValues[data.level - 1];

  VariableLeveledTemplate(
      {List<int> levelValues,
      String name,
      bool isAttackModifier = false,
      LevelFormatter formatter})
      : _levelValues = MyList(delegate: levelValues),
        super(
            formatter: formatter,
            maxLevel: levelValues.length,
            name: name,
            isAttackModifier: isAttackModifier);

  factory VariableLeveledTemplate.fromJSON(Map<String, dynamic> json) {
    var type = json['type'];
    assert(type == KEY);
    return VariableLeveledTemplate(
        levelValues: List<int>.from(json['levelValues'] as List),
        isAttackModifier: (json['isAttackModifier'] ?? false) as bool,
        name: json['name'],
        formatter: json['formatter'] == null
            ? null
            : DescriptionFormatter.fromJSON(json['formatter'])
                as LevelFormatter);
  }

  @override
  Map<String, dynamic> get attributeMap {
    var map = {
      ...super.attributeMap,
      "type": KEY,
      "levelValues": _levelValues,
      if (formatter != null && formatter != LevelFormatter())
        "formatter": formatter,
    };
    map.remove('maxLevel');
    map.remove('valuePerLevel');
    return map;
  }
}

class LeveledNamedVariantTemplate extends BaseLeveledTemplate {
  static final String KEY = 'Leveled_Named_Variant';

  final Map<String, int> variations;

  final String defaultVariation;

  LeveledNamedVariantTemplate(
      {String name,
      this.variations,
      this.defaultVariation,
      int baseValue = 0,
      int maxLevel,
      String levelPrompt,
      DescriptionFormatter formatter,
      bool isAttackModifier = false})
      : super(
            name: name,
            isAttackModifier: isAttackModifier,
            baseValue: baseValue,
            maxLevel: maxLevel,
            levelPrompt: levelPrompt ?? 'Level',
            formatter: formatter ?? LevelFormatter());

  factory LeveledNamedVariantTemplate.fromJSON(Map<String, dynamic> json) {
    var type = json['type'];
    assert(type == KEY);
    Map<String, dynamic> vars = json['variations'];
    return LeveledNamedVariantTemplate(
        name: json['name'],
        baseValue: (json['baseValue'] as int) ?? 0,
        maxLevel: (json['maxLevel'] as int),
        levelPrompt: json['levelPrompt'],
        isAttackModifier: json['isAttackModifier'] as bool,
        defaultVariation: json['default'],
        variations: vars.map<String, int>((k, v) => MapEntry(k, v as int)),
        formatter: json['formatter'] == null
            ? LevelFormatter()
            : DescriptionFormatter.fromJSON(json['formatter']));
  }

  @override
  int percentage(ModifierData data) =>
      data.level * _valuePerLevel(data.detail) + baseValue;

  int _valuePerLevel(String variation) => variations[variation];

  @override
  Modifier createModifier({ModifierData data}) {
    if (data?.detail != null) {
      if (!containsVariation(data.detail)) {
        throw AssertionError('invalid variation');
      }
    }
    return Modifier(
        template: this,
        level: data?.level ?? 1,
        detail: data?.detail ?? defaultVariation);
  }

  bool containsVariation(String detail) =>
      detail == null || variations.containsKey(detail);

  @override
  Map<String, dynamic> get attributeMap {
    var map = {
      ...super.attributeMap,
      "type": KEY,
      if (defaultVariation != null) "default": defaultVariation,
      "variations": variations,
      if (formatter != null && formatter != LevelFormatter())
        "formatter": formatter,
    };
    return map..remove('valuePerLevel');
  }
}

///
/// [Category] represents a named group of options or specialties. Each also
/// determines the cost of the Modifier.
///
class Category with HasAttributes {
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
  final List<String> _items;

  List<String> get items => _items..add(name);

  Category({this.name, this.cost, List<String> items}) : _items = items..sort();

  ///
  /// Create a [Category] from JSON data
  ///
  factory Category.fromJSON(Map<String, dynamic> json) {
    var cat = Category(
        name: json['name'],
        cost: json['cost'],
        items: JsonEx.toListOfStrings(json['items']));
    return cat;
  }

  Map<String, dynamic> get attributeMap =>
      {"name": name, "cost": cost, "items": _items};
}

Category NullCategory = Category(name: 'NULL', cost: null, items: []);

class CategorizedTemplate extends ModifierTemplate {
  static final String KEY = 'Categorized';

  ///
  /// The list of [Category].
  ///
  final MyList<Category> categories;

  final String defaultDetail;

  CategorizedTemplate(
      {String name,
      bool isAttackModifier = false,
      this.defaultDetail,
      DescriptionFormatter formatter,
      List<Category> categories})
      : categories = MyList(delegate: categories),
        super(
            name: name,
            isAttackModifier: isAttackModifier,
            formatter: formatter ?? DescriptionFormatter());

  factory CategorizedTemplate.fromJSON(Map<String, dynamic> json) {
    var fmtjson =
        json['formatter'] ?? <String, dynamic>{'template': '%name, %detail'};

    List<dynamic> cats = json['categories'];

    return CategorizedTemplate(
        isAttackModifier: json['isAttackModifier'] ?? false,
        name: json['name'],
        defaultDetail: json['default'],
        categories: cats.map((f) => Category.fromJSON(f)).toList(),
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
  Map<String, dynamic> get attributeMap => {
        ...super.attributeMap,
        "type": KEY,
        if (defaultDetail != null) "default": defaultDetail,
        "categories": categories,
        if (formatter != null && formatter != DescriptionFormatter())
          "formatter": formatter,
      };
}
