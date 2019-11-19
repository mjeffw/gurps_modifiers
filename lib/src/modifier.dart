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

  final String detail;

  final int level;

  int get percentage => template.percentage(this);

  bool get isAttackModifier => template.isAttackModifier;

  String get description => template.describe(this);

  final ModifierTemplate template;

  Modifier({this.template, this.detail, int level = 1})
      : this.level = (template.hasLevels) ? level : null;

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
  final CyclicInterval interval;
  final int cycles;
  final bool resistible;
  final ContagionType contagion;

  CyclicModifierTemplate get _template => template;

  int get percentage => _template.percentage(this);

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
