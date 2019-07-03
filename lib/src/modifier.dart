///
/// A modifier is a feature that you can add to a trait – usually an advantage
/// – to change the way it works. You can apply any number of modifiers to a
/// trait.
///
abstract class Modifier {
  /// Name of the modifier.
  final String name;

  /// True if this is an attack modifier.
  final bool isAttackModifier;

  ///
  /// Modifiers adjust the base cost of a trait in proportion to their effects.
  /// This is expressed as a percentage.
  ///
  int get percentage;

  /// Canonical name of the modifier.
  String get canonicalName => name;

  const Modifier({this.name, this.isAttackModifier})
      : assert(name != null),
        assert(isAttackModifier != null);

  ///
  /// Export as JSON.
  ///
  String toJSON({bool template = false});

  @override
  String toString() => toJSON();

  @override
  int get hashCode => name.hashCode ^ isAttackModifier.hashCode;

  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    return other is Modifier &&
        this.name == other.name &&
        this.isAttackModifier == other.isAttackModifier;
  }
}

///
/// Simple modifiers have just a flat percentage.
///
class SimpleModifier extends Modifier {
  final int percentage;

  const SimpleModifier(
      {this.percentage = 0, String name, bool isAttackModifier = false})
      : assert(name != null),
        assert(isAttackModifier != null),
        assert(percentage != null),
        super(name: name, isAttackModifier: isAttackModifier);

  ///
  /// Create a SimpleModifier from a JSON map.
  ///
  factory SimpleModifier.fromJSON(Map<String, dynamic> json) {
    var type = json['type'];
    assert(type == 'Simple');
    return SimpleModifier(
        percentage: (json['percentage'] ?? 0) as int,
        name: json['name'],
        isAttackModifier: (json['isAttackModifier'] ?? false) as bool);
  }

  ///
  /// Create a copy of the given modifier with one or more fields overridden.
  ///
  factory SimpleModifier.copyOf(SimpleModifier modifier,
      {int value, String name, bool isAttackModifier}) {
    return SimpleModifier(
        percentage: value ?? modifier.percentage,
        name: name ?? modifier.name,
        isAttackModifier: isAttackModifier ?? modifier.isAttackModifier);
  }

  ///
  /// Return the JSON String representation.
  ///
  @override
  String toJSON({bool template = false}) {
    List<String> strings = [
      '"type": "Simple"',
      '"name": "$name"',
      '"percentage": $percentage',
      '"isAttackModifier": $isAttackModifier',
    ];
    return "{\n${strings.map((s) => '  $s').reduce((a, b) => '$a,\n$b')}\n}";
  }

  @override
  int get hashCode => super.hashCode ^ percentage.hashCode;

  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    return other is SimpleModifier &&
        super == other &&
        this.percentage == other.percentage;
  }
}

///
/// Base class to represent all modifiers that have 'levels'.
///
abstract class _BaseLeveledModifier extends Modifier {
  ///
  /// The maximum level value.
  ///
  final int maxLevel;

  ///
  /// Current level value.
  ///
  final int level;

  const _BaseLeveledModifier(
      {this.maxLevel,
      int level = 1,
      String name,
      bool isAttackModifier = false})
      : assert((level ?? 1) > 0),
        assert((level ?? 1) <= (maxLevel ?? 1000000)),
        this.level = level,
        super(name: name, isAttackModifier: isAttackModifier);

  @override
  int get hashCode => super.hashCode ^ maxLevel.hashCode ^ level;

  @override
  bool operator ==(dynamic other) {
    return other is _BaseLeveledModifier &&
        super == other &&
        this.level == other.level &&
        this.maxLevel == other.maxLevel;
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

  @override
  String get canonicalName => '${this.name} ${this.level}';

  const LeveledModifier(
      {String name,
      this.baseValue = 0,
      this.valuePerLevel,
      int maxLevel,
      int level = 1,
      bool isAttackModifier = false})
      : assert(valuePerLevel != null),
        assert(baseValue != null),
        super(
            maxLevel: maxLevel,
            level: level,
            name: name,
            isAttackModifier: isAttackModifier);

  ///
  /// Create a SimpleModifier from a JSON map.
  ///
  factory LeveledModifier.fromJSON(Map<String, dynamic> json) {
    var type = json['type'];
    assert(type == 'Leveled');
    return LeveledModifier(
        name: json['name'],
        isAttackModifier: (json['isAttackModifier'] ?? false) as bool,
        valuePerLevel: json['valuePerLevel'] as int,
        baseValue: (json['baseValue'] ?? 0) as int,
        maxLevel: json['maxLevel'] as int);
  }

  ///
  /// Create a copy of the given modifier with one or more fields overridden.
  ///
  factory LeveledModifier.copyOf(LeveledModifier modifier,
      {String name,
      int valuePerLevel,
      int baseValue,
      int maxLevel,
      int level,
      bool isAttackModifier}) {
    return LeveledModifier(
        name: name ?? modifier.name,
        valuePerLevel: valuePerLevel ?? modifier.valuePerLevel,
        baseValue: baseValue ?? modifier.baseValue,
        maxLevel: maxLevel ?? modifier.maxLevel,
        level: level ?? modifier.level,
        isAttackModifier: isAttackModifier ?? modifier.isAttackModifier);
  }

  ///
  /// Return the JSON String representation.
  ///
  @override
  String toJSON({bool template = false}) {
    List<String> strings = [
      '"type": "Leveled"',
      '"name": "$name"',
      if (isAttackModifier) '"isAttackModifier": ${isAttackModifier}',
      '"baseValue": $baseValue',
      '"valuePerLevel": $valuePerLevel',
      if (maxLevel != null) '"maxLevel": $maxLevel',
      if (!template) '"level": $level',
    ];
    return "{\n${strings.map((s) => '  $s').reduce((a, b) => '$a,\n$b')}\n}";
  }

  ///
  /// Percentage is basePercentage + (valuePerLevel * _level).
  ///
  @override
  int get percentage => baseValue + valuePerLevel * level;

  @override
  int get hashCode => super.hashCode ^ valuePerLevel.hashCode ^ baseValue;

  @override
  bool operator ==(dynamic other) {
    return other is LeveledModifier &&
        super == other &&
        this.valuePerLevel == other.valuePerLevel &&
        this.baseValue == other.baseValue;
  }
}

///
/// Variable Modifiers have 'levels' but do not have a consistent percentage
/// increment per level.
///
class VariableModifier extends _BaseLeveledModifier {
  ///
  /// The cost of each level.
  ///
  final List<int> _levelValues;

  const VariableModifier(
      {List<int> levelValues,
      String name,
      bool isAttackModifier = false,
      int level = 1})
      : _levelValues = levelValues,
        super(
            level: level,
            maxLevel: levelValues.length,
            name: name,
            isAttackModifier: isAttackModifier);

  factory VariableModifier.fromJSON(Map<String, dynamic> json) {
    var type = json['type'];
    assert(type == 'Variable');
    return VariableModifier(
        levelValues: List<int>.from(json['levelValues'] as List),
        isAttackModifier: (json['isAttackModifier'] ?? false) as bool,
        name: json['name']);
  }

  factory VariableModifier.copyOf(VariableModifier modifier,
      {List<int> levelValues, String name, bool isAttackModifier, int level}) {
    return VariableModifier(
        name: name ?? modifier.name,
        levelValues: levelValues ?? modifier._levelValues,
        level: level ?? modifier.level,
        isAttackModifier: isAttackModifier ?? modifier.isAttackModifier);
  }

  @override
  String toJSON({bool template = false}) {
    List<String> strings = [
      '"type": "Variable"',
      '"name": "$name"',
      if (isAttackModifier) '"isAttackModifier": $isAttackModifier',
      '"levelValues": $_levelValues',
      if (!template) '"level": $level',
    ];
    return "{\n${strings.map((s) => '  $s').reduce((a, b) => '$a,\n$b')}\n}";
  }

  @override
  int get percentage => _levelValues[level - 1];

  @override
  int get hashCode =>
      super.hashCode ^ _levelValues.reduce((a, b) => a.hashCode ^ b.hashCode);

  @override
  bool operator ==(dynamic other) {
    return other is VariableModifier &&
        super == other &&
        _listEquals(this._levelValues, other._levelValues);
  }
}

///
/// Regrettable that we have to do this because this project is pure Dart.
/// Flutter has a collection utility package with this method.
///
bool _listEquals(List<dynamic> one, List<dynamic> other) {
  if (identical(one, other)) return true;
  if (one.runtimeType != other.runtimeType || one.length != other.length) {
    return false;
  }
  for (var i = 0; i < one.length; i++) {
    if (one[i] != other[i]) return false;
  }
  return true;
}
