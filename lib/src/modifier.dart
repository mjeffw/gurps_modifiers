import 'package:gurps_modifiers/gurps_modifiers.dart';
import 'package:gurps_modifiers/src/template_subtypes.dart';

import 'modifier_template.dart';


class Modifier with ModifierData {
  bool get isAttackModifier => template.isAttackModifier;

  int get percentage => template.percentage;

  String get description => template.describe(this);

  String get name => template.name;

  int get level => null;

  final ModifierTemplate template;

  final String detail;

  Modifier({this.template, this.detail});
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

class NamedVariantModifier extends Modifier {
  NamedVariantTemplate get _template => template as NamedVariantTemplate;

  int get percentage => _template.percentageVariation(detail);

  String get description =>
      '${super.description}${detail == null ? "" : ", " + detail}';

  NamedVariantModifier({NamedVariantTemplate template, String detail})
      : assert(template.containsVariation(detail)),
        super(template: template, detail: detail);

  NamedVariantModifier copyWith({String detail}) {
    return NamedVariantModifier(template: this._template, detail: detail);
  }
}
