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
  final int _percentage;

  final String name;

  final bool isAttackModifier;

  int get percentage => _percentage;

  Modifier(
      {int percentage = 0, @required this.name, this.isAttackModifier = false})
      : assert(name != null),
        _percentage = percentage;

  factory Modifier.fromJSON(Map<String, dynamic> json) {
    var type = json['type'];
    assert(type == 'Modifier');

    var isAttack = json['isAttackModifier'];
    var percent = json['percentage'];

    return Modifier(
        percentage: (percent ?? 0) as int,
        name: json['name'],
        isAttackModifier: (isAttack ?? false) as bool);
  }

  bool get isEnhancement => !percentage.isNegative;

  bool get isLimitation => !isEnhancement;

  @override
  String toString() => '${isEnhancement ? "+" : ""}$percentage%';
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
        super(name: name, percentage: null, isAttackModifier: isAttackModifier);

  int get level => _level;

  set level(int level) {
    if (level < 1 || (maxLevel != null && level > maxLevel))
      throw RangeError('level is outside range');
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
  final int basePercentage;

  ///
  /// The multiplicative percentage per level.
  ///
  final int valuePerLevel;

  LeveledModifier(
      {@required String name,
      @required this.valuePerLevel,
      this.basePercentage = 0,
      int maxLevel,
      int level = 1,
      bool isAttackModifier})
      : assert(valuePerLevel > 0),
        super(
            maxLevel: maxLevel,
            level: level,
            name: name,
            isAttackModifier: isAttackModifier);

  factory LeveledModifier.fromJSON(Map<String, dynamic> json) {
    var type = json['type'];
    assert(type == 'Leveled');

    var isAttack = json['isAttackModifier'];
    var base = json['basePercentage'];

    return LeveledModifier(
        name: json['name'],
        isAttackModifier: (isAttack ?? false) as bool,
        valuePerLevel: json['valuePerLevel'] as int,
        basePercentage: (base ?? 0) as int,
        maxLevel: json['maxLevel'] as int);
  }

  ///
  /// Percentage is basePercentage + (valuePerLevel * _level).
  ///
  @override
  int get percentage => basePercentage + valuePerLevel * _level;

  @override
  bool get isEnhancement => !_level.isNegative;
}

///
/// Variable Modifiers have 'levels' but do not have a standard percentage
/// increment per level.
///
class VariableModifier extends _BaseLeveledModifier {
  final List<int> _levelPercentages;

  VariableModifier(
      {@required List<int> levelPercentages,
      @required String name,
      bool isAttackModifier = false})
      : _levelPercentages = List.unmodifiable(levelPercentages),
        super(
            maxLevel: levelPercentages.length,
            name: name,
            isAttackModifier: isAttackModifier);

  factory VariableModifier.fromJSON(Map<String, dynamic> json) {
    var type = json['type'];
    assert(type == 'Variable');

    var isAttack = json['isAttackModifier'];
    var array = List<int>.from(json['levelPercentages'] as List);
    return VariableModifier(
        levelPercentages: array,
        isAttackModifier: (isAttack ?? false) as bool,
        name: json['name']);
  }

  @override
  int get percentage => _levelPercentages[level - 1];

  @override
  bool get isEnhancement => !_levelPercentages.last.isNegative;
}
