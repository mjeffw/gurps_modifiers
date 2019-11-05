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
  /// A formatter object to use to generate descriptions.
  ///
  final DescriptionFormatter formatter;

  bool get hasLevels => false;

  ///
  /// Constructor
  ///
  const ModifierTemplate(
      {this.name,
      this.isAttackModifier,
      this.formatter = const DefaultFormatter()})
      : assert(name != null),
        assert(isAttackModifier != null);

  ///
  /// Export as JSON.
  ///
  String toJSON();

  ///
  /// Create and return a [Modifier] based on this template.
  ///
  Modifier createModifier({ModifierData data}) {
    return Modifier(template: this, level: data?.level, detail: data?.detail);
  }

  ///
  /// Return a description of a [SimpleModifier] with the given [ModifierData].
  ///
  String describe(ModifierData data) =>
      formatter.describe(name: name, data: data);

  ///
  /// Modifiers adjust the base cost of a trait in proportion to their effects.
  /// This is expressed as a percentage.
  ///
  int percentage(ModifierData data);

  @override
  String toString() => toJSON();

  @override
  int get hashCode => hash3(name, isAttackModifier, formatter);

  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    return other is ModifierTemplate &&
        this.name == other.name &&
        this.formatter == other.formatter &&
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

  bool get hasLevels => true;

  ///
  /// String used to prompt for level values.
  ///
  final String levelPrompt;

  ///
  /// The base percentage of the Modifier.
  ///
  final int baseValue;

  ///
  /// The multiplicative percentage per level.
  ///
  final int valuePerLevel;

  ///
  /// Create a [BaseLeveledTemplate] with the required fields.
  ///
  const BaseLeveledTemplate(
      {this.maxLevel,
      String name,
      LevelTextFormatter formatter,
      bool isAttackModifier = false,
      this.levelPrompt,
      this.valuePerLevel,
      this.baseValue})
      : assert(1 <= (maxLevel ?? 1000000)),
        super(
            name: name,
            isAttackModifier: isAttackModifier,
            formatter: formatter ?? const LevelTextFormatter());

  @override
  Modifier createModifier({ModifierData data}) {
    if (data?.level != null && maxLevel != null) {
      if (data.level > maxLevel) {
        throw RangeError('Level ${data.level} > $maxLevel');
      }
    }
    return Modifier(
        template: this, level: data?.level ?? 1, detail: data?.detail);
  }

  @override
  int get hashCode => Hashes.finish(Hashes.combine(
      super.hashCode, Hashes.combine(hash2(maxLevel, levelPrompt), 0)));

  @override
  bool operator ==(dynamic other) {
    return other is BaseLeveledTemplate &&
        super == other &&
        this.maxLevel == other.maxLevel &&
        this.levelPrompt == other.levelPrompt;
  }
}

///
/// Cyclic is a variable modifier with several more factors: resistible,
/// contagious, number of cycles.
///
class CyclicModifierTemplate extends ModifierTemplate {
  static final String KEY = 'Cyclic';

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
      'Cyclic, ${intervalText[data.interval.index]}, ${data.cycles} cycles${_resistibleText(data)}${_contagionText(data)}';

  String _resistibleText(CyclicData data) =>
      data.resistible ? ", Resistible" : "";

  String _contagionText(CyclicData data) => data.contagion == ContagionType.None
      ? ""
      : data.contagion == ContagionType.Mildly
          ? ", Mildly Contagious"
          : ", Highly Contagious";

  @override
  int percentage(ModifierData data) => _calculateCyclicCost(data as CyclicData);

  int _calculateCyclicCost(CyclicData data) {
    return ((levelValues[data.interval.index] * (data.cycles - 1)) ~/
            (data.resistible ? 2 : 1)) +
        (_contagionCost(data));
  }

  int _contagionCost(CyclicData data) {
    return data.contagion == ContagionType.None
        ? 0
        : data.contagion == ContagionType.Mildly ? 20 : 50;
  }

  const CyclicModifierTemplate()
      : super(name: 'Cyclic', isAttackModifier: true);

  factory CyclicModifierTemplate.fromJSON(Map<String, dynamic> json) =>
      CyclicModifierTemplate();

  @override
  String toJSON() {
    return '''{
      "name": "Cyclic",
      "type": "Cyclic"
    }''';
  }

  @override
  Modifier createModifier({ModifierData data}) {
    CyclicData d2 = data as CyclicData;
    return CyclicModifier(
        template: this,
        contagion: d2?.contagion ?? ContagionType.None,
        cycles: d2?.cycles ?? 2,
        interval: d2?.interval ?? CyclicInterval.PerDay,
        resistible: d2?.resistible ?? false);
  }

  @override
  int get hashCode => Hashes.finish(
      Hashes.combine(super.hashCode, Hashes.combine("Cyclic".hashCode, 0)));

  @override
  bool operator ==(dynamic other) {
    return (identical(this, other)) ||
        (other is CyclicModifierTemplate && super == other);
  }
}
