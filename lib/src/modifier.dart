import 'package:gurps_modifiers/gurps_modifiers.dart';

import 'modifier_data.dart';
import 'modifier_template.dart';

class ModifierDTO with ModifierData {
  @override
  String detail;

  @override
  int level;

  ModifierDTO({this.detail, this.level});
}

class Modifier with ModifierData {
  String get name => template.name;

  @override
  final String detail;

  @override
  final int level;

  int get percentage => template.percentage(this);

  bool get isAttackModifier => template.isAttackModifier;

  String get description => template.describe(this);

  final ModifierTemplate template;

  Modifier({this.template, this.detail, int level = 1})
      : level = (template.hasLevels) ? level : null;

  factory Modifier.copyWith(Modifier source, {String detail, int level}) {
    if (level != null && !source.template.hasLevels) {
      throw Exception("modifier doesn't have levels");
    }

    return source.template.createModifier(
        data: ModifierDTO(
            detail: detail ?? source.detail, level: level ?? source.level));
  }
}

class CyclicModifier extends Modifier with CyclicData {
  @override
  final CyclicInterval interval;
  @override
  final int cycles;
  @override
  final bool resistible;
  @override
  final ContagionType contagion;

  CyclicModifierTemplate get _template => template;

  @override
  int get percentage => _template.percentage(this);

  @override
  String get description => _template.levelName(this);

  CyclicModifier(
      {CyclicModifierTemplate template,
      this.interval,
      this.cycles,
      this.resistible,
      this.contagion})
      : super(template: template);

  factory CyclicModifier.copyWith(CyclicModifier source,
      {CyclicInterval interval,
      int cycles,
      bool resistible,
      ContagionType contagion}) {
    return CyclicModifier(
        template: source.template,
        cycles: cycles ?? source.cycles,
        interval: interval ?? source.interval,
        resistible: resistible ?? source.resistible,
        contagion: contagion ?? source.contagion);
  }
}
