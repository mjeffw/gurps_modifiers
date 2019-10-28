import 'package:dart_utils/dart_utils.dart';
import 'package:gurps_modifiers/src/modifier.dart';
import 'package:quiver/collection.dart';
import 'package:quiver/core.dart';

import 'modifier_template.dart';
import 'level_text_formatter.dart';

///
/// Simple modifiers have just a flat percentage.
///
class SimpleModifierTemplate extends ModifierTemplate {
  ///
  /// Modifiers adjust the base cost of a trait in proportion to their effects.
  /// This is expressed as a percentage.
  ///
  final int percentage;

  final String detail;

  @override
  String describe(ModifierData data) =>
      formatter.describe(name: name, data: data);

  ///
  /// Create a Simple Modifier Template
  ///
  const SimpleModifierTemplate(
      {this.percentage = 0,
      String name,
      bool isAttackModifier = false,
      DescriptionFormatter formatter,
      this.detail})
      : assert(percentage != null),
        super(
            name: name,
            isAttackModifier: isAttackModifier,
            formatter: formatter);

  ///
  /// Create a SimpleModifier from a JSON map.
  ///
  factory SimpleModifierTemplate.fromJSON(Map<String, dynamic> json) {
    DescriptionFormatter formatter = DescriptionFormatter.fromJSON(json);
    var type = json['type'];
    assert(type == 'Simple');
    return SimpleModifierTemplate(
        percentage: (json['percentage'] ?? 0) as int,
        name: json['name'],
        formatter: formatter ?? DescriptionFormatter.defaultFormatter,
        detail: json['defaultDetail'],
        isAttackModifier: (json['isAttackModifier'] ?? false) as bool);
  }

  ///
  /// Return the JSON String representation.
  ///
  @override
  String toJSON() {
    List<String> strings = [
      '"type": "Simple"',
      '"name": "$name"',
      '"percentage": $percentage',
      '"isAttackModifier": $isAttackModifier',
    ];
    return "{\n${strings.map((s) => '  $s').reduce((a, b) => '$a,\n$b')}\n}";
  }

  @override
  int get hashCode => Hashes.finish(
      Hashes.combine(super.hashCode, Hashes.combine(percentage.hashCode, 0)));

  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    return other is SimpleModifierTemplate &&
        super == other &&
        this.percentage == other.percentage;
  }

  @override
  Modifier createModifier() => Modifier(template: this, detail: detail);
}

class NamedVariantTemplate extends ModifierTemplate {
  final Map<String, int> variations;

  final int percentage;

  final String defaultVariation;

  List<String> get variationNames => variations.keys.toList();

  int percentageVariation(String name) =>
      variations[name ?? defaultVariation] ?? percentage;

  bool containsVariation(String detail) =>
      detail == null || variations.containsKey(detail);

  NamedVariantTemplate(
      {String name,
      bool isAttackModifier = false,
      this.percentage,
      this.variations,
      this.defaultVariation})
      : super(name: name, isAttackModifier: isAttackModifier ?? false);

  @override
  Modifier createModifier() =>
      NamedVariantModifier(template: this, detail: defaultVariation);

  @override
  String toJSON() {
    // TODO: implement toJSON
    return null;
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

  ///
  /// For leveled modifiers, the percentage is the baseValue.
  ///
  @override
  int get percentage => baseValue;

  @override
  int levelPercentage(int level) => level * valuePerLevel + baseValue;

  const LeveledTemplate(
      {String name,
      int baseValue = 0,
      this.valuePerLevel,
      int maxLevel,
      String levelPrompt,
      LevelTextFormatter formatter,
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
            ? null
            : LevelTextFormatter.fromJSON(json['formatter']));
  }

  ///
  /// Return the JSON String representation.
  ///
  @override
  String toJSON() {
    List<String> strings = [
      '"type": "Leveled"',
      '"name": "$name"',
      if (isAttackModifier) '"isAttackModifier": ${isAttackModifier}',
      '"baseValue": $baseValue',
      '"valuePerLevel": $valuePerLevel',
      if (maxLevel != null) '"maxLevel": $maxLevel',
      if (formatter != null) '"formatter":${formatter.toJSON()}'
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

  @override
  Modifier createModifier() {
    // TODO: implement createModifier
    return null;
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

  ///
  /// The percentage is null as it doesn't make sense for this type of modifier.
  ///
  @override
  int get percentage => null;

  @override
  int levelPercentage(int level) => _levelValues[level - 1];

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
            : LevelTextFormatter.fromJSON(json['formatter']));
  }

  @override
  String toJSON() {
    List<String> strings = [
      '"type": "Variable"',
      '"name": "$name"',
      if (isAttackModifier) '"isAttackModifier": $isAttackModifier',
      '"levelValues": $_levelValues',
      if (this.formatter != null) '"formatter":${formatter.toJSON()}'
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

  @override
  Modifier createModifier() {
    // TODO: implement createModifier
    return null;
  }
}
