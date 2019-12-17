import 'dart:math';
import 'package:meta/meta.dart';
import 'package:quiver/core.dart';
import 'package:dart_utils/dart_utils.dart';

import 'modifier_data.dart';
import 'detail_alias.dart';
import 'util/generic.dart';

class FormatterFactory {
  static final Map<String, Function> _factoryDictionary = {
    PatternFormatter.TYPE: (json) => PatternFormatter.fromJSON(json),
    LevelFormatter.TYPE: (json) => LevelFormatter.fromJSON(json),
    GeometricFormatter.TYPE: (json) => GeometricFormatter.fromJSON(json),
    ArithmeticFormatter.TYPE: (json) => ArithmeticFormatter.fromJSON(json),
  };

  static Function get(Map<String, dynamic> json) {
    return Optional.fromNullable(_factoryDictionary[json['type']])
        .or((json) => DescriptionFormatter._fromJSON(json));
  }
}

///
/// [DescriptionFormatter] is responsible for creating the printable description of a Modifier.
///
/// By default (i.e., given no data) the description is only the name of the
/// Modifier, and optionally, the detail text separated from each other with a comma.
///
/// If detail is blank or null, the default description is simply the name.
///
class DescriptionFormatter with HasAttributes {
  ///
  /// Build a DescriptionFormatter from a JSON structure
  ///
  factory DescriptionFormatter.fromJSON(Map<String, dynamic> json) =>
      (json == null || json.isEmpty)
          ? DescriptionFormatter()
          : FormatterFactory.get(json).call(json);

  static const TEMPLATE = '%name, %detail';

  ///
  /// Return the String that identifies this formatter in JSON.
  ///
  String get _type => null;

  ///
  /// The default template to use, if none are provided.
  ///
  String get _defaultTemplate => TEMPLATE;

  ///
  /// The template to use when formatting a description.
  ///
  /// Templates may contain the following symbols: %name, %detail. Symbols are
  /// replaced at runtime with values from the name parameter of the describe
  /// method and the [ModifierData] object.
  final String template;

  final DetailAlias alias;

  ///
  /// Create a [DescriptionFormatter] with the given template.
  ///
  DescriptionFormatter({String template, DetailAlias alias})
      : template = template ?? TEMPLATE,
        alias = alias ?? DetailAlias.NULL;

  DescriptionFormatter._fromJSON(Map<String, dynamic> json,
      {String defaultTemplate})
      : template = json['template'] ?? defaultTemplate ?? TEMPLATE,
        alias = json['detailAlias'] == null
            ? DetailAlias.NULL
            : DetailAlias.fromJSON(json['detailAlias']);

  ///
  /// Given a Modifier template name and instance data, return the description.
  ///
  String describe({String name, ModifierData data}) => template
      .replaceFirst('%name', _name(name))
      .replaceFirst('%detail', _detail(data))
      .trim()
      .deleteTrailing(',');

  ///
  /// The Modifier name. This getter exists to allow subclasses to respond with
  /// something other than the default name, if needed.
  ///
  String _name(String name) => name;

  ///
  /// The Modifier detail. This method exists to allow subtypes to respond with
  /// something other than the default detail, if needed.
  ///
  String _detail(ModifierData data) => alias.replace(data.detail) ?? '';

  ///
  /// The object's attributes returned as a map
  ///
  @override
  Map<String, dynamic> get attributeMap => {
        if (_type != null) 'type': _type,
        if (template != _defaultTemplate) 'template': template,
        if (alias != null && alias != DetailAlias.NULL) 'detailAlias': alias,
      };
}

///
/// A [DescriptionFormatter] that properly describes a Leveled Modifier of a
/// set level.
///
/// This formatter adds the %f symbol to the list of possible replacement
/// symbols. The %f value is a numeric value; typically the level of the mod.
///
class LevelFormatter extends DescriptionFormatter {
  static const TYPE = 'Level';
  static const String TEMPLATE = '%name %f';

  @override
  String get _type => TYPE;

  @override
  String get _defaultTemplate => TEMPLATE;

  ///
  /// Create a constant [LevelFormatter]. By default, the description is <name> <level>.
  ///
  LevelFormatter({String template, DetailAlias alias})
      : super(template: template ?? TEMPLATE, alias: alias);

  LevelFormatter.fromJSON(Map<String, dynamic> json, {String defaultTemplate})
      : super._fromJSON(json, defaultTemplate: defaultTemplate ?? TEMPLATE);

  @override
  String describe({String name, ModifierData data}) => super
      .describe(name: name, data: data)
      .replaceFirst('%f', _f_value(data.level))
      .replaceFirst('%s', (data.level > 1) ? 's' : '');

  ///
  /// Given a level, return the value to use to replace the %f token.
  ///
  String _f_value(int level) => level.toString();
}

///
/// A formatter that calculates the %f value from the [level] by applying an
/// exponential function of the form [a * pow(b, level) + c].
///
/// Examples would include those modifiers whose effects are doubled with
/// each level, such as Area Effect (level 1 = 2 yards, level 2 = 4 yards,
/// level 3 = 8 yards, etc.).
///
class GeometricFormatter extends LevelFormatter {
  static const String TYPE = 'Geometric';

  @override
  String get _type => TYPE;

  ///
  /// The constant multiplier.
  ///
  final int a;

  ///
  /// The number to raise to the "levelth" power.
  ///
  final int b;

  ///
  /// The constant addend.
  ///
  final int c;

  ///
  /// Create a [GeometricFormatter] with the given parameters.
  ///
  GeometricFormatter(
      {@required this.a,
      @required this.b,
      int c,
      String template = LevelFormatter.TEMPLATE})
      : assert(a != null),
        assert(b != null),
        c = c ?? 0,
        super(template: template);

  GeometricFormatter.fromJSON(Map<String, dynamic> json)
      : assert(json['type'] == TYPE),
        assert(json['a'] != null),
        assert(json['b'] != null),
        a = json['a'],
        b = json['b'],
        c = json['c'] ?? 0,
        super.fromJSON(json);

  ///
  /// Return the level value by calculating the exponential value.
  ///
  @override
  String _f_value(int level) => (a * pow(b, level)).toString();

  @override
  Map<String, dynamic> get attributeMap =>
      {...super.attributeMap, 'a': a, 'b': b, 'c': c};
}

///
/// A formatter that calculates the %f value from the [level] by applying an
/// algebraic function of the form [a * level + b].
///
class ArithmeticFormatter extends LevelFormatter {
  static const String TYPE = 'Arithmetic';

  @override
  String get _type => TYPE;

  ///
  /// The constant multiplier.
  ///
  final num a;

  ///
  /// The number to raise to the "levelth" power.
  final num b;

  ///
  /// If true, always display the sign of _f_value.
  final bool signed;

  ///
  /// Create an [ArithmeticFormatter] with the given parameters.
  ///
  ArithmeticFormatter(
      {@required this.a,
      @required this.b,
      String template = LevelFormatter.TEMPLATE,
      bool signed = false})
      : assert(a != null),
        assert(b != null),
        signed = signed,
        super(template: template);

  ArithmeticFormatter.fromJSON(Map<String, dynamic> json)
      : assert(json['type'] == TYPE),
        assert(json['a'] != null),
        assert(json['b'] != null),
        a = json['a'],
        b = json['b'],
        signed = json['signed'] ?? false,
        super.fromJSON(json, defaultTemplate: LevelFormatter.TEMPLATE);

  ///
  /// Return the level value by calculating the artithmetic value.
  ///
  @override
  String _f_value(int level) => _numToString((a * level) + b);

  String _numToString(num value) =>
      '${signed && value >= 0 ? "+" : ""}' + _flattenToString(value);

  String _flattenToString(num value) => (value.toDouble() == value.toInt())
      ? value.toInt().toString()
      : value.toString();

  @override
  Map<String, dynamic> get attributeMap =>
      {...super.attributeMap, 'a': a, 'b': b, if (signed) 'signed': signed};
}

class PatternFormatter extends LevelFormatter {
  static const TYPE = 'Pattern';

  @override
  String get _type => TYPE;

  final MyList<int> pattern; // e.g., 2, 3, 5, 10

  PatternFormatter({@required List<int> pattern, String template})
      : assert(pattern != null),
        pattern = MyList<int>(delegate: pattern),
        super(template: template ?? LevelFormatter.TEMPLATE);

  PatternFormatter.fromJSON(Map<String, dynamic> json)
      : assert(json['pattern'] != null),
        pattern = MyList<int>(delegate: List<int>.from(json['pattern'])),
        super.fromJSON(json, defaultTemplate: LevelFormatter.TEMPLATE);

  int _mult(int level) => pattern[(level - 1) % pattern.length];

  int _powerOfTen(int level) => pow(10, (level - 1) ~/ pattern.length);

  int _equation(int level) => _mult(level) * _powerOfTen(level);

  @override
  String _f_value(int level) => (_equation(level)).toString();

  @override
  Map<String, dynamic> get attributeMap => {
        ...super.attributeMap,
        'pattern': pattern,
      };
}
