import 'package:gurps_modifiers/gurps_modifiers.dart';
import 'package:gurps_modifiers/src/template_subtypes.dart';

import '../modifier_data.dart';
import 'modifier_template.dart';

class Modifier with ModifierData {
  String get name => template.name;

  final String detail;

  int get percentage => template.percentage;

  int get level => null;

  bool get isAttackModifier => template.isAttackModifier;

  String get description => template.describe(this);

  final ModifierTemplate template;

  Modifier({this.template, this.detail});

  factory Modifier.copyWith(Modifier source, {String detail}) {
    return Modifier(template: source.template, detail: detail ?? source.detail);
  }
}

class CyclicModifier extends Modifier {
  final CyclicData data;

  CyclicModifierTemplate get _template => template;

  @override
  String get name => template.name;

  @override
  String get detail => null;

  int get percentage => _template.levelPercentage(data);

  @override
  int get level => null;

  String get description => _template.levelName(data);

  CyclicModifier({CyclicModifierTemplate template, this.data})
      : super(template: template);

  factory CyclicModifier.copyWith(CyclicModifier source,
      {CyclicInterval interval,
      int cycles,
      bool resistible,
      ContagionType contagion}) {
    return CyclicModifier(
        template: source.template,
        data: source.data.copyWith(
            cycles: cycles,
            interval: interval,
            resistible: resistible,
            contagion: contagion));
  }
}

class NamedVariantModifier extends Modifier {
  NamedVariantTemplate get _template => template;

  @override
  String get name => template.name;

  @override
  final String detail;

  @override
  int get percentage => _template.percentageVariation(detail);

  @override
  int get level => null;

  @override
  String get description =>
      '${template.describe(this)}${detail == null ? "" : ", " + detail}';

  NamedVariantModifier({NamedVariantTemplate template, this.detail})
      : assert(template.containsVariation(detail)),
        super(template: template);

  factory NamedVariantModifier.copyWith(NamedVariantModifier source,
      {String detail}) {
    return NamedVariantModifier(
        template: source.template, detail: detail ?? source.detail);
  }
}
