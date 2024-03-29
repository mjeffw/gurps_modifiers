import 'package:gurps_modifiers/src/template_subtypes.dart';
import 'package:meta/meta.dart';

import 'description_formatter.dart';
import 'modifier.dart';
import 'modifier_data.dart';
import 'util/generic.dart';

///
/// A modifier is a feature that you can add to a trait – usually an advantage
/// – to change the way it works. You can apply any number of modifiers to a
/// trait.
///
/// A [ModifierTemplate] defines how a given modifier works.
///
abstract class ModifierTemplate with HasAttributes {
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
  ModifierTemplate(
      {@required this.name,
      @required this.isAttackModifier,
      DescriptionFormatter formatter})
      : assert(name != null),
        assert(isAttackModifier != null),
        formatter = formatter ?? DescriptionFormatter();

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
  String toString() => '$attributeMap';

  @override
  Map<String, dynamic> get attributeMap => {
        'name': name,
        if (isAttackModifier) 'isAttackModifier': true,
      };
}

///
/// Base class to represent all modifiers that have 'levels'.
///
abstract class BaseLeveledTemplate extends ModifierTemplate {
  ///
  /// The maximum level value.
  ///
  final int maxLevel;

  @override
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
  BaseLeveledTemplate(
      {this.maxLevel,
      String name,
      DescriptionFormatter formatter,
      bool isAttackModifier = false,
      this.levelPrompt,
      this.valuePerLevel,
      this.baseValue})
      : assert(1 <= (maxLevel ?? 1000000)),
        super(
            name: name,
            isAttackModifier: isAttackModifier,
            formatter: formatter ?? LevelFormatter());

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
  Map<String, dynamic> get attributeMap => {
        ...super.attributeMap,
        if (maxLevel != null && !(this is VariableLeveledTemplate))
          'maxLevel': maxLevel,
        if (baseValue != null && baseValue != 0) 'baseValue': baseValue,
        if (!(this is VariableLeveledTemplate)) 'valuePerLevel': valuePerLevel,
        if (levelPrompt != null && levelPrompt != 'Level')
          'levelPrompt': levelPrompt,
      };
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
      data.resistible ? ', Resistible' : '';

  String _contagionText(CyclicData data) => data.contagion == ContagionType.None
      ? ''
      : data.contagion == ContagionType.Mildly
          ? ', Mildly Contagious'
          : ', Highly Contagious';

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

  CyclicModifierTemplate() : super(name: 'Cyclic', isAttackModifier: true);

  factory CyclicModifierTemplate.fromJSON(Map<String, dynamic> json) =>
      CyclicModifierTemplate();

  @override
  Modifier createModifier({ModifierData data}) {
    var d2 = data as CyclicData;
    return CyclicModifier(
        template: this,
        contagion: d2?.contagion ?? ContagionType.None,
        cycles: d2?.cycles ?? 2,
        interval: d2?.interval ?? CyclicInterval.PerDay,
        resistible: d2?.resistible ?? false);
  }

  @override
  Map<String, dynamic> get attributeMap => {
        ...super.attributeMap,
        'type': 'Cyclic',
      };
}
