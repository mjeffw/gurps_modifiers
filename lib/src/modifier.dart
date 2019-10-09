import 'package:gurps_modifiers/gurps_modifiers.dart';

import 'modifier_template.dart';

class Modifier {
  get isAttackModifier => template.isAttackModifier;

  int get percentage => template.percentage;

  get description => template.name;

  final ModifierTemplate template;

  Modifier({this.template});
}

class CyclicModifier extends Modifier {
  final CyclicData data;

  CyclicInterval get interval => data.interval;

  int get percentage => _template.levelPercentage(data);

  String get description => _template.levelName(data);

  CyclicModifierTemplate get _template => super.template;

  CyclicModifier({ModifierTemplate template, this.data})
      : assert(template is CyclicModifierTemplate),
        super(template: template);

  CyclicModifier copyWith(
      {CyclicInterval interval,
      int cycles,
      bool resistible,
      ContagionType contagion}) {
    return CyclicModifier(
        template: this._template,
        data: this.data.copyWith(
            cycles: cycles,
            interval: interval,
            resistible: resistible,
            contagion: contagion));
  }
}
