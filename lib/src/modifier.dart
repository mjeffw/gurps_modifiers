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
  final int value;

  final String name;

  final bool isAttackModifier;

  Modifier({this.value = 0, this.name, this.isAttackModifier = false})
      : assert(name != null),
        assert(isAttackModifier != null),
        assert(value != null);

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
  int get hashCode =>
      name.hashCode ^ value.hashCode ^ isAttackModifier.hashCode;

  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    return other is Modifier &&
        this.value == other.value &&
        this.name == other.name &&
        this.isAttackModifier == other.isAttackModifier;
  }

  @override
  String toString() => toJSON();

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

  @override
  int get hashCode => super.hashCode ^ maxLevel.hashCode ^ _level;

  @override
  bool operator ==(dynamic other) {
    return other is _BaseLeveledModifier &&
        super == other &&
        this._level == other._level &&
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

  LeveledModifier(
      {String name,
      this.valuePerLevel,
      this.baseValue = 0,
      int maxLevel,
      int level = 1,
      bool isAttackModifier = false})
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
  int get hashCode => super.hashCode ^ valuePerLevel.hashCode ^ baseValue;

  @override
  bool operator ==(dynamic other) {
    return other is LeveledModifier &&
        super == other &&
        this.valuePerLevel == other.valuePerLevel &&
        this.baseValue == other.baseValue;
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
/// Variable Modifiers have 'levels' but do not have a consistent percentage
/// increment per level.
///
class VariableModifier extends _BaseLeveledModifier {
  final List<int> _levelValues;

  VariableModifier(
      {List<int> levelValues, String name, bool isAttackModifier = false})
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

  @override
  int get hashCode {
    return super.hashCode ^
        _levelValues.reduce((a, b) => a.hashCode ^ b.hashCode);
  }

  @override
  bool operator ==(dynamic other) {
    return other is VariableModifier &&
        super == other &&
        _listEquals(this._levelValues, other._levelValues);
  }
}

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
