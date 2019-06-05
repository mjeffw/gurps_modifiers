import 'package:meta/meta.dart';

///
/// A modifier is a feature that you can add to a trait – usually an advantage
/// – to change the way it works. You can apply any number of modifiers to a
/// trait.
///
class Modifier {
  ///
  /// Modifiers adjust the base cost of a trait in proportion to their effects.
  /// This is expressed as a percentage.
  ///
  final int _value;

  final String name;

  final bool isAttackModifier;

  int get value => _value;

  Modifier({int value = 0, @required this.name, this.isAttackModifier = false})
      : assert(name != null),
        _value = value;

  factory Modifier.fromJSON(Map<String, dynamic> json) {
    var type = json['type'];
    assert(type == 'Simple');

    var isAttack = json['isAttackModifier'];
    var percent = json['value'];

    return Modifier(
        value: (percent ?? 0) as int,
        name: json['name'],
        isAttackModifier: (isAttack ?? false) as bool);
  }

  @override
  String toString() => '${!value.isNegative ? "+" : ""}$value%';

  String toJSON() {
    return '''      {
        "name": "$name",
        "type": "Simple",
        "value": $value${isAttackModifier ? ',\n        "isAttackModifier": true' : ''}
      }''';
  }
}

///
/// Base class to represent all modifiers that have 'levels'.
///
class _BaseLeveledModifier extends Modifier {
  ///
  /// The maximum level value.
  ///
  final int maxLevel;

  ///
  /// Current level value.
  ///
  int _level;

  _BaseLeveledModifier(
      {this.maxLevel,
      int level = 1,
      String name,
      bool isAttackModifier = false})
      : assert(level > 0),
        _level = level,
        super(name: name, value: null, isAttackModifier: isAttackModifier);

  int get level => _level;

  set level(int level) {
    if (level < 1 || (maxLevel != null && level > maxLevel)) {
      throw RangeError('level is outside range');
    }
    _level = level;
  }
}

///
/// A Modifier that has levels with a fixed percentage per level and
/// potentially a maximum level.
///
/// The percentage is calculated as:
///  base percentage + (value per level × level).
///
class LeveledModifier extends _BaseLeveledModifier {
  ///
  /// The base percentage of the Modifier.
  ///
  final int baseValue;

  ///
  /// The multiplicative percentage per level.
  ///
  final int valuePerLevel;

  LeveledModifier(
      {@required String name,
      @required this.valuePerLevel,
      this.baseValue = 0,
      int maxLevel,
      int level = 1,
      bool isAttackModifier})
      : assert(valuePerLevel != null),
        super(
            maxLevel: maxLevel,
            level: level,
            name: name,
            isAttackModifier: isAttackModifier);

  factory LeveledModifier.fromJSON(Map<String, dynamic> json) {
    var type = json['type'];
    assert(type == 'Leveled');

    var isAttack = json['isAttackModifier'];
    var base = json['baseValue'];

    return LeveledModifier(
        name: json['name'],
        isAttackModifier: (isAttack ?? false) as bool,
        valuePerLevel: json['valuePerLevel'] as int,
        baseValue: (base ?? 0) as int,
        maxLevel: json['maxLevel'] as int);
  }

  @override
  String toJSON() {
    var lead = '        ';
    var baseText = baseValue != 0 ? '\n$lead"baseValue": ${baseValue},' : '';
    var attkText = isAttackModifier
        ? '\n$lead"isAttackModifier": ${isAttackModifier},'
        : '';
    var maxText = maxLevel == null ? '' : '\n$lead"maxLevel": $maxLevel,';
    return '''      {
        "name": "$name",
        "type": "Leveled",$baseText$attkText$maxText
        "valuePerLevel": $valuePerLevel
      }''';
  }

  ///
  /// Percentage is basePercentage + (valuePerLevel * _level).
  ///
  @override
  int get value => baseValue + valuePerLevel * _level;
}

///
/// Variable Modifiers have 'levels' but do not have a standard percentage
/// increment per level.
///
class VariableModifier extends _BaseLeveledModifier {
  final List<int> _levelValues;

  VariableModifier(
      {@required List<int> levelValues,
      @required String name,
      bool isAttackModifier = false})
      : _levelValues = List.unmodifiable(levelValues),
        super(
            maxLevel: levelValues.length,
            name: name,
            isAttackModifier: isAttackModifier);

  factory VariableModifier.fromJSON(Map<String, dynamic> json) {
    var type = json['type'];
    assert(type == 'Variable');

    var isAttack = json['isAttackModifier'];
    var array = List<int>.from(json['levelValues'] as List);
    return VariableModifier(
        levelValues: array,
        isAttackModifier: (isAttack ?? false) as bool,
        name: json['name']);
  }

  @override
  String toJSON() {
    return '''      {
        "name": "$name",
        "type": "Variable",
        "levelValues": $_levelValues${isAttackModifier ? ',\n        "isAttackModifier": true' : ''}
      }''';
  }

  @override
  int get value => _levelValues[level - 1];
}
