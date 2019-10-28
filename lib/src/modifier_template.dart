import 'package:dart_utils/dart_utils.dart';
import 'package:quiver/core.dart';

import '../modifier_data.dart';
import 'description_formatter.dart';
import 'modifier.dart';

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
  /// Modifiers adjust the base cost of a trait in proportion to their effects.
  /// This is expressed as a percentage.
  ///
  int get percentage;

  final DescriptionFormatter formatter;

  ///
  /// Constructor
  ///
  const ModifierTemplate(
      {this.name,
      this.isAttackModifier,
      this.formatter = DescriptionFormatter.defaultFormatter})
      : assert(name != null),
        assert(isAttackModifier != null);

  ///
  /// Export as JSON.
  ///
  String toJSON();

  ///
  /// Create and return a [Modifier] based on this template.
  ///
  Modifier createModifier();

  ///
  /// Return a description of a [SimpleModifier] with the given [ModifierData].
  ///
  String describe(ModifierData data) =>
      formatter.describe(name: name, data: data);

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
/// Base class to represent all modifiers that have 'levels'.
///
abstract class BaseLeveledTemplate extends ModifierTemplate {
  ///
  /// The maximum level value.
  ///
  final int maxLevel;

  ///
  /// The formatter for this modifier.
  ///
  final LevelTextFormatter formatter;

  ///
  /// Calculate the percentage for a given level of the modifier.
  ///
  int levelPercentage(int level);

  ///
  /// String used to prompt for level values.
  ///
  final String levelPrompt;

  ///
  /// Create a [BaseLeveledTemplate] with the required fields.
  ///
  const BaseLeveledTemplate(
      {this.maxLevel,
      String name,
      LevelTextFormatter formatter,
      bool isAttackModifier = false,
      this.levelPrompt})
      : assert(1 <= (maxLevel ?? 1000000)),
        this.formatter = formatter ?? const LevelTextFormatter(),
        super(name: name, isAttackModifier: isAttackModifier);

  @override
  int get hashCode => Hashes.finish(Hashes.combine(
      super.hashCode, Hashes.combine(hash2(maxLevel, formatter), 0)));

  @override
  bool operator ==(dynamic other) {
    return other is BaseLeveledTemplate &&
        super == other &&
        this.maxLevel == other.maxLevel &&
        this.formatter == other.formatter;
  }
}

// class DetailValue {
//   final String name;
//   final int percentage;
//   DetailValue({this.name, this.percentage});
// }

// class AccessibilityTemplate {
//   Map<String, int> detailValue = {};

//   AccessibilityTemplate.fromJSON(Map<String, dynamic> json) {}
// }

enum CyclicInterval { PerSecond, Per10Seconds, PerMinute, PerHour, PerDay }
enum ContagionType { None, Mildly, Highly }

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

  CyclicData copyWith(
      {CyclicInterval interval,
      int cycles,
      bool resistible,
      ContagionType contagion}) {
    return CyclicData(
        contagion: contagion ?? this.contagion,
        cycles: cycles ?? this.cycles,
        interval: interval ?? this.interval,
        resistible: resistible ?? this.resistible);
  }
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
  /// Percentage doesn't apply.
  ///
  int get percentage => null;

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

  Modifier createModifier() {
    return CyclicModifier(template: this, data: CyclicData());
  }
}
