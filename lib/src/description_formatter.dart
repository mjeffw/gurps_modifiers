import 'dart:convert';
import 'dart:math';

import 'package:gurps_modifiers/src/util/generic.dart';
import 'package:quiver/collection.dart';
import 'package:quiver/core.dart';

import '../modifier_data.dart';

Map<String, Function> _factoryDictionary = {
  AliasFormatter.TYPE: (json) => AliasFormatter.fromJSON(json),
  PatternFormatter.TYPE: (json) => PatternFormatter.fromJSON(json),
  LevelFormatter.TYPE: (json) => LevelFormatter.fromJSON(json),
  ArrayFormatter.TYPE: (json) => ArrayFormatter.fromJSON(json),
  ExponentFormatter.TYPE: (json) => ExponentFormatter.fromJSON(json)
};

///
/// [DescriptionFormatter] is responsible for creating the printable description of a Modifier.
///
/// By default (i.e., given no data) the description is only the name of the
/// Modifier, as passed into the describe method.
///
class DescriptionFormatter {
  static const TEMPLATE = '%name %detail';

  String get _type => null;

  String get _defaultTemplate => TEMPLATE;

  ///
  /// The template to use when formatting a description.
  ///
  /// Templates may contain the following symbols: %name, %detail. Symbols are
  /// replaced at runtime with values from the name parameter of the describe
  /// method and the [ModifierData] object.
  final String template;

  ///
  /// Create a [DescriptionFormatter] with the given template.
  ///
  const DescriptionFormatter({this.template}) : assert(template != null);

  ///
  /// Given a Modifier template name and instance data, return the description.
  ///
  String describe({String name, ModifierData data}) {
    var text = template
        .replaceFirst('%name', _name(name))
        .replaceFirst('%detail', _detail(data))
        .trim();
    if (text.endsWith(',')) {
      text = text.substring(0, text.length - 1);
    }
    return text;
  }

  String _name(String name) => name;

  String _detail(ModifierData data) => data.detail ?? '';

  ///
  /// Build a DescriptionFormatter from a JSON structure
  ///
  factory DescriptionFormatter.fromJSON(Map<String, dynamic> json) {
    if (json == null) return const DefaultFormatter();

    var factoryMethod = _factoryDictionary[json['type']] ??
        (json) => DescriptionFormatter(template: json['template']);

    return factoryMethod.call(json);
  }

  String toJSON() => json.encode(toAttributeMap());

  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    return other is DescriptionFormatter && this.template == other.template;
  }

  @override
  int get hashCode => template.hashCode;

  Map<String, dynamic> toAttributeMap() => {
        if (_type != null) 'type': _type,
        if (template != _defaultTemplate) 'template': template,
      };
}

class DefaultFormatter extends DescriptionFormatter {
  const DefaultFormatter() : super(template: '%name, %detail');

  @override
  String toJSON() => null;
}

///
/// A [DescriptionFormatter] that properly describes a Leveled Modifier of a
/// set level.
///
/// This formatter adds the %f symbol to the list of possible replacement
/// symbols. The %f value is typically the level of the modifier.
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
  const LevelFormatter({String template = TEMPLATE})
      : assert(template != null),
        super(template: template);

  factory LevelFormatter.fromJSON(Map<String, dynamic> json) =>
      LevelFormatter(template: json['template']);

  String describe({String name, ModifierData data}) => super
      .describe(name: name, data: data)
      .replaceFirst('%f', _f_value(data.level))
      .replaceFirst('%s', (data.level > 1) ? 's' : '');

  ///
  /// Given a level, return the value to use to replace the %f token.
  ///
  String _f_value(int level) => level.toString();

  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is LevelFormatter && this.template == other.template);

  @override
  int get hashCode => template.hashCode;
}

class DefaultLevelTextFormatter extends LevelFormatter {
  const DefaultLevelTextFormatter() : super(template: "%name %f");
}

///
/// Formatter that sets the value of %f to an element of an array of strings,
/// indexed by level.
///
/// Use this for when the levels are 'named' or for which a formula cannot be
/// easily derived.
///
/// Example: Armor Divisor could be thought of as having levels, each costing
/// +50%. Instead of showing "Armor Divisor 1", "Armor Divisor 2", etc, the
/// canonical way to list this enhancer would be "Armor Divisor (2)", "Armor
/// Divisor (3)"", etc.
///
/// This could be accomplished by creating the following _ArrayFormatter:
///
///     var formatter = _ArrayFormatter(array: ['(2)', '(3)', '(5)', '(10)']);
///
class ArrayFormatter extends LevelFormatter {
  static const String TYPE = 'Array';

  @override
  String get _type => TYPE;

  ///
  /// The array of values to use.
  ///
  final List<String> array;

  ///
  /// Create an [ArrayFormatter] with the given string list and template.
  /// The template defaults to '%name %f' if not provided.
  ///
  const ArrayFormatter({this.array, String template = LevelFormatter.TEMPLATE})
      : assert(array != null),
        super(template: template);

  ///
  /// Create an [ArrayFormatter] from the JSON data.
  ///
  factory ArrayFormatter.fromJSON(Map<String, dynamic> json) {
    var list =
        json['array'] != null ? List<String>.from(json['array'] as List) : null;
    return ArrayFormatter(
      array: list,
      template: json['template'],
    );
  }

  ///
  /// Use (level - 1) as the index into array; return the value at that index.
  ///
  @override
  String _f_value(int level) => array[level - 1];

  @override
  bool operator ==(dynamic other) {
    return other is ArrayFormatter &&
        this.template == other.template &&
        listsEqual(this.array, other.array);
  }

  @override
  int get hashCode => hashObjects(array) ^ template.hashCode;

  @override
  Map<String, dynamic> toAttributeMap() =>
      {...super.toAttributeMap(), "array": array};
}

///
/// A formatter that calculates the %f value from the [level] by applying an
/// exponential function of the form [a * pow(b, level)].
///
/// Examples would include those modifiers whose effects are doubled with
/// each level, such as Area Effect (level 1 = 2 yards, level 2 = 4 yards,
/// level 3 = 8 yards, etc.).
///
class ExponentFormatter extends LevelFormatter {
  static const String TYPE = 'Exponent';

  @override
  String get _type => TYPE;

  ///
  /// The constant multiplier.
  ///
  final int a;

  ///
  /// The number to raise to the "levelth" power.
  final int b;

  ///
  /// Create a [ExponentFormatter] with the given parameters.
  ///
  const ExponentFormatter(
      {this.a, this.b, String template = LevelFormatter.TEMPLATE})
      : assert(a != null),
        assert(b != null),
        super(template: template);

  factory ExponentFormatter.fromJSON(Map<String, dynamic> json) {
    return ExponentFormatter(
        a: json['a'], b: json['b'], template: json['template']);
  }

  ///
  /// Return the level value by calculating the exponential value.
  ///
  @override
  String _f_value(int level) => (a * pow(b, level)).toString();

  // @override
  // String toJSON() {
  //   return '''{"type":"$TYPE","a":$a,"b":$b,"template":"$template"}''';
  // }

  @override
  bool operator ==(dynamic other) {
    return other is ExponentFormatter &&
        this.template == other.template &&
        this.a == other.a &&
        this.b == other.b;
  }

  @override
  int get hashCode => hash3(a, b, template);

  @override
  Map<String, dynamic> toAttributeMap() =>
      {...super.toAttributeMap(), "a": a, "b": b};
}

class PatternFormatter extends LevelFormatter {
  static const TYPE = 'Pattern';

  @override
  String get _type => TYPE;

  final int numberOfSteps; // 3
  final int exponent; // 2
  final int constant; // 1

  PatternFormatter(
      {this.numberOfSteps,
      this.exponent,
      this.constant,
      String template = LevelFormatter.TEMPLATE})
      : super(template: template);

  factory PatternFormatter.fromJSON(Map<String, dynamic> json) {
    return PatternFormatter(
        numberOfSteps: json['numberOfSteps'],
        exponent: json['exponent'],
        constant: json['constant'],
        template: json['template']);
  }

  int _mult(int level) => pow((level % numberOfSteps), exponent) + constant;

  int _powerOfTen(int level) => pow(10, level ~/ numberOfSteps);

  int _equation(int level) => _mult(level) * _powerOfTen(level);

  @override
  String _f_value(int level) => (_equation(level)).toString();

  @override
  bool operator ==(dynamic other) {
    return other is PatternFormatter &&
        this.template == other.template &&
        this.numberOfSteps == other.numberOfSteps &&
        this.exponent == other.exponent &&
        this.constant == other.constant;
  }

  @override
  int get hashCode => hash4(numberOfSteps, exponent, constant, template);

  @override
  Map<String, dynamic> toAttributeMap() => {
        ...super.toAttributeMap(),
        'numberOfSteps': numberOfSteps,
        'exponent': exponent,
        'constant': constant
      };
}

class AliasFormatter extends DescriptionFormatter {
  static const String TYPE = 'Alias';

  @override
  String get _type => TYPE;

  final Map<String, String> aliases;

  AliasFormatter(
      {String template = DescriptionFormatter.TEMPLATE, this.aliases})
      : super(template: template);

  factory AliasFormatter.fromJSON(Map<String, dynamic> json) {
    return AliasFormatter(
        template: json['template'], aliases: jsonToMap(json, 'aliases'));
  }

  @override
  String _detail(ModifierData data) =>
      aliases[data.detail] ?? data.detail ?? '';

  @override
  bool operator ==(dynamic other) {
    return other is AliasFormatter &&
        this.template == other.template &&
        mapsEqual(this.aliases, other.aliases);
  }

  @override
  int get hashCode =>
      hashObjects([template, ...aliases.keys, ...aliases.values]);

  Map<String, dynamic> toAttributeMap() => {
        ...super.toAttributeMap(),
        'aliases': aliases,
      };
}
