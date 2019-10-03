import 'package:dart_utils/dart_utils.dart';
import 'package:quiver/collection.dart';
import 'package:quiver/core.dart';

import 'level_text_formatter.dart';

///
/// A modifier is a feature that you can add to a trait – usually an advantage
/// – to change the way it works. You can apply any number of modifiers to a
/// trait.
///
/// A [ModifierTemplate] defines how a given modifier works.
///
abstract class ModifierTemplate {
  ///
  /// Name of the modifier.
  ///
  final String name;

  ///
  /// True if this is an attack modifier.
  ///
  final bool isAttackModifier;

  ///
  /// Any detailed description associated with this modifier.
  ///
  final String detail;

  ///
  /// Modifiers adjust the base cost of a trait in proportion to their effects.
  /// This is expressed as a percentage.
  ///
  final int percentage;

  ///
  /// Constructor
  ///
  const ModifierTemplate(
      {this.name, this.isAttackModifier, this.detail, this.percentage})
      : assert(name != null),
        assert(isAttackModifier != null);

  ///
  /// Export as JSON.
  ///
  String toJSON();

  @override
  String toString() => toJSON();

  @override
  int get hashCode => hash2(name, isAttackModifier);

  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    return other is ModifierTemplate &&
        this.name == other.name &&
        this.isAttackModifier == other.isAttackModifier;
  }
}

///
/// Simple modifiers have just a flat percentage.
///
class SimpleModifierTemplate extends ModifierTemplate {
  ///
  /// Create a Simple Modifier Template
  ///
  const SimpleModifierTemplate(
      {int percentage = 0, String name, bool isAttackModifier = false})
      : assert(percentage != null),
        super(
            name: name,
            isAttackModifier: isAttackModifier,
            percentage: percentage);

  ///
  /// Create a SimpleModifier from a JSON map.
  ///
  factory SimpleModifierTemplate.fromJSON(Map<String, dynamic> json) {
    var type = json['type'];
    assert(type == 'Simple');
    return SimpleModifierTemplate(
        percentage: (json['percentage'] ?? 0) as int,
        name: json['name'],
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
}

///
/// Base class to represent all modifiers that have 'levels'.
///
abstract class _BaseLeveledModifierTemplate extends ModifierTemplate {
  ///
  /// The maximum level value.
  ///
  final int maxLevel;

  ///
  /// The formatter for this modifier.
  ///
  final LevelTextFormatter formatter;

  ///
  /// Return the name + level text
  ///
  String levelName(int level) => formatter.format(name, level);

  int levelPercentage(int level);

  const _BaseLeveledModifierTemplate(
      {this.maxLevel,
      String name,
      LevelTextFormatter formatter,
      bool isAttackModifier = false})
      : assert(1 <= (maxLevel ?? 1000000)),
        this.formatter = formatter ?? LevelTextFormatter.instance,
        super(name: name, isAttackModifier: isAttackModifier);

  @override
  int get hashCode => Hashes.finish(Hashes.combine(
      super.hashCode, Hashes.combine(hash2(maxLevel, formatter), 0)));

  @override
  bool operator ==(dynamic other) {
    return other is _BaseLeveledModifierTemplate &&
        super == other &&
        this.maxLevel == other.maxLevel &&
        this.formatter == other.formatter;
  }
}

///
/// A Modifier that has levels with a fixed percentage per level and
/// potentially a maximum level.
///
/// The percentage is calculated as:
///  base percentage + (value per level × level).
///
class LeveledModifierTemplate extends _BaseLeveledModifierTemplate {
  ///
  /// The base percentage of the Modifier.
  ///
  final int baseValue;

  ///
  /// The multiplicative percentage per level.
  ///
  final int valuePerLevel;

  final String levelPrompt;

  @override
  int levelPercentage(int level) => level * valuePerLevel + baseValue;

  const LeveledModifierTemplate(
      {String name,
      int baseValue = 0,
      this.valuePerLevel,
      int maxLevel,
      String levelPrompt,
      LevelTextFormatter formatter,
      bool isAttackModifier = false})
      : assert(valuePerLevel != null),
        baseValue = baseValue ?? 0,
        this.levelPrompt = levelPrompt ?? 'Level',
        super(
            maxLevel: maxLevel,
            name: name,
            isAttackModifier: isAttackModifier,
            formatter: formatter);

  ///
  /// Create a LeveledModifierTemplate from a JSON map.
  ///
  factory LeveledModifierTemplate.fromJSON(Map<String, dynamic> json) {
    var type = json['type'];
    assert(type == 'Leveled');
    return LeveledModifierTemplate(
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
        (other is LeveledModifierTemplate &&
            super == other &&
            this.levelPrompt == other.levelPrompt &&
            this.valuePerLevel == other.valuePerLevel &&
            this.baseValue == other.baseValue);
  }
}

class DetailValue {
  final String name;
  final int percentage;
  DetailValue({this.name, this.percentage});
}

class AccessibilityTemplate {
  Map<String, int> detailValue = {};

  AccessibilityTemplate.fromJSON(Map<String, dynamic> json) {}
}

///
/// [VariableLeveledModifiers] have 'levels' but do not have a consistent
/// percentage increment per level.
///
class VariableLeveledModifierTemplate extends _BaseLeveledModifierTemplate {
  ///
  /// The cost of each level.
  ///
  final List<int> _levelValues;

  @override
  int levelPercentage(int level) => _levelValues[level - 1];

  const VariableLeveledModifierTemplate(
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

  factory VariableLeveledModifierTemplate.fromJSON(Map<String, dynamic> json) {
    var type = json['type'];
    assert(type == 'Variable');
    return VariableLeveledModifierTemplate(
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
        (other is VariableLeveledModifierTemplate &&
            super == other &&
            listsEqual(this._levelValues, other._levelValues));
  }
}

enum CyclicInterval { PerSecond, Per10Seconds, PerMinute, PerHour, PerDay }
enum ContagionType { None, Mildly, Highly }

String unqualifiedStringValue(ContagionType contagion) =>
    contagion.toString().split(r'.')[1];

class CyclicData {
  final CyclicInterval interval;
  final int cycles;
  final bool resistible;
  final ContagionType contagion;

  CyclicData(
      {this.interval = CyclicInterval.PerDay,
      this.contagion = ContagionType.None,
      this.cycles = 2,
      this.resistible = false});
}

///
/// Cyclic is a variable modifier with several more factors: resistible,
/// contagious, number of cycles.
///
class CyclicModifierTemplate extends ModifierTemplate {
  static const levelValues = <int>[100, 50, 40, 20, 10];
  static const intervalText = <String>[
    '1 second',
    '10 seconds',
    '1 minute',
    '1 hour',
    '1 day'
  ];

  ///
  /// Return the name + level text
  ///
  String levelName(CyclicData data) =>
      'Cyclic, ${intervalText[data.interval.index]}, ${data.cycles} cycles${data.resistible ? ", Resistible" : ""}${data.contagion == ContagionType.None ? "" : data.contagion == ContagionType.Mildly ? ", Mildly Contagious" : ", Highly Contagious"}';

  int levelPercentage(CyclicData data) =>
      ((levelValues[data.interval.index] * (data.cycles - 1)) ~/
          (data.resistible ? 2 : 1)) +
      (data.contagion == ContagionType.None
          ? 0
          : data.contagion == ContagionType.Mildly ? 20 : 50);

  const CyclicModifierTemplate()
      : super(name: 'Cyclic', isAttackModifier: true);

  factory CyclicModifierTemplate.fromJSON(Map<String, dynamic> json) =>
      CyclicModifierTemplate();

  @override
  int get hashCode => Hashes.finish(
      Hashes.combine(super.hashCode, Hashes.combine("Cyclic".hashCode, 0)));

  @override
  bool operator ==(dynamic other) {
    return (identical(this, other)) ||
        (other is CyclicModifierTemplate && super == other);
  }

  @override
  String toJSON() {
    return '''{
      "name": "Cyclic",
      "type": "Cyclic"
    }''';
  }
}
