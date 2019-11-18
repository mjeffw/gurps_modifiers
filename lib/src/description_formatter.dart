import 'dart:convert';
import 'dart:math';

import 'package:quiver/core.dart';

import '../modifier_data.dart';
import 'util/generic.dart';

class FormatterFactory {
  static Map<String, Function> _factoryDictionary = {
    AliasFormatter.TYPE: (json) => AliasFormatter.fromJSON(json),
    PatternFormatter.TYPE: (json) => PatternFormatter.fromJSON(json),
    LevelFormatter.TYPE: (json) => LevelFormatter.fromJSON(json),
    ArrayFormatter.TYPE: (json) => ArrayFormatter.fromJSON(json),
    ExponentFormatter.TYPE: (json) => ExponentFormatter.fromJSON(json)
  };

  static Function get(Map<String, dynamic> json) {
    return Optional.fromNullable(_factoryDictionary[json['type']])
        .or((json) => DescriptionFormatter(template: json['template']));
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
class DescriptionFormatter {
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

  ///
  /// Create a [DescriptionFormatter] with the given template.
  ///
  const DescriptionFormatter({String template = TEMPLATE})
      : template = template ?? TEMPLATE;

  ///
  /// Given a Modifier template name and instance data, return the description.
  ///
  String describe({String name, ModifierData data}) {
    var text = template
        .replaceFirst('%name', _name(name))
        .replaceFirst('%detail', _detail(data))
        .trim();
    return deleteTrailing(text, ',');
  }

  ///
  /// The Modifier name. This getter exists to allow subclasses to respond with
  /// something other than the default name, if needed.
  ///
  String _name(String name) => name;

  ///
  /// The Modifier detail. This method exists to allow subtypes to respond with
  /// something other than the default detail, if needed.
  ///
  String _detail(ModifierData data) => data.detail ?? '';

  ///
  /// Build a DescriptionFormatter from a JSON structure
  ///
  factory DescriptionFormatter.fromJSON(Map<String, dynamic> json) =>
      (json == null)
          ? const DescriptionFormatter()
          : FormatterFactory.get(json).call(json);

  ///
  /// Encode JSON from the object's attributes
  ///
  String toJSON() => json.encode(_attributeMap);

  ///
  /// The object's attributes returned as a map
  ///
  Map<String, dynamic> get _attributeMap => {
        if (_type != null) 'type': _type,
        if (template != _defaultTemplate) 'template': template,
      };

  ///
  /// Inheritable equals operator using the object's attributeMap.
  ///
  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    return other is DescriptionFormatter &&
        identical(this.runtimeType, other.runtimeType) &&
        attributeMapsEqual(this._attributeMap, other._attributeMap);
  }

  ///
  /// Inheritable hashCode implementation using the object's attributeMap.
  ///
  @override
  int get hashCode => hashObjects(_attributeMap.values);
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
      : super(template: template ?? TEMPLATE);

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
  final MyList<String> array;

  ///
  /// Create an [ArrayFormatter] with the given string list and template.
  /// The template defaults to '%name %f' if not provided.
  ///
  ArrayFormatter(
      {List<String> array, String template = LevelFormatter.TEMPLATE})
      : assert(array != null),
        array = MyList(delegate: array),
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
  Map<String, dynamic> get _attributeMap =>
      {...super._attributeMap, "array": array};
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

  @override
  Map<String, dynamic> get _attributeMap =>
      {...super._attributeMap, "a": a, "b": b};
}

// TODO change to accept the pattern (like [2,3,5,10]) instead of doing the exponential calculation
class PatternFormatter extends LevelFormatter {
  static const TYPE = 'Pattern';

  @override
  String get _type => TYPE;

  final MyList<int> pattern; // e.g., 2, 3, 5, 10

  PatternFormatter(
      {List<int> pattern, String template = LevelFormatter.TEMPLATE})
      : assert(pattern != null),
        pattern = MyList<int>(delegate: pattern),
        super(template: template);

  factory PatternFormatter.fromJSON(Map<String, dynamic> json) {
    var json2 = json['pattern'];
    var pattern = json2 == null ? null : List<int>.from(json2);
    return PatternFormatter(pattern: pattern, template: json['template']);
  }

  int _mult(int level) => pattern[(level - 1) % pattern.length];

  int _powerOfTen(int level) => pow(10, (level - 1) ~/ pattern.length);

  int _equation(int level) => _mult(level) * _powerOfTen(level);

  @override
  String _f_value(int level) => (_equation(level)).toString();

  @override
  Map<String, dynamic> get _attributeMap => {
        ...super._attributeMap,
        'pattern': pattern,
      };
}

// TODO change to a Detail Alias class with no template
class AliasFormatter extends DescriptionFormatter {
  static const String TYPE = 'Alias';

  @override
  String get _type => TYPE;

  final MyMap<String, String> aliases;

  AliasFormatter(
      {String template = DescriptionFormatter.TEMPLATE,
      Map<String, String> aliases})
      : assert(aliases != null),
        aliases = MyMap(delegate: aliases),
        super(template: template);

  factory AliasFormatter.fromJSON(Map<String, dynamic> json) {
    return AliasFormatter(
      template: json['template'],
      aliases: json['aliases'].map<String, String>(
          (key, value) => MapEntry(key.toString(), value.toString())),
    );
  }

  @override
  String _detail(ModifierData data) =>
      aliases[data.detail] ?? data.detail ?? '';

  Map<String, dynamic> get _attributeMap => {
        ...super._attributeMap,
        'aliases': aliases,
      };
}
