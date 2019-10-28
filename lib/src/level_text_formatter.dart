import 'dart:math';

import 'package:gurps_modifiers/src/modifier_template.dart';

class DescriptionFormatter {
  static const DescriptionFormatter defaultFormatter =
      const DescriptionFormatter();

  final String template;

  const DescriptionFormatter({this.template = '%name'})
      : assert(template != null);

  String describe({String name, ModifierData data}) => template
      .replaceFirst('%name', name)
      .replaceFirst('%detail', data.detail ?? '');

  static DescriptionFormatter fromJSON(Map<String, dynamic> json) {
    return DescriptionFormatter(template: json['template'] ?? '%name');
  }
}

///
/// Data driven object that creates printable description of a Leveled Modifier
/// of a set level.
///
/// The formatter that takes a string template with replaceable tokens $name
/// and $f. The values for these tokens are replaced with the values returned
/// from the similarly named methods.
///
class LevelTextFormatter extends DescriptionFormatter {
  ///
  /// Template used by the formatter.
  ///
  final String template;

  ///
  /// Create a constant LevelTextFormatter.
  ///
  const LevelTextFormatter({this.template = '%name %f'})
      : assert(template != null);

  ///
  /// Build a LevetTextFormatter from a JSON structure
  ///
  factory LevelTextFormatter.fromJSON(Map<String, dynamic> json) {
    String type = json['type'];
    if (type == 'Exponential') {
      return _ExponentialFormatter.fromJSON(json);
    } else if (type == 'Array') {
      return _ArrayFormatter.fromJSON(json);
    }
    return LevelTextFormatter(template: json['template']);
  }

  String describe({String name, ModifierData data}) => template
      .replaceFirst('%name', this._name(name))
      .replaceFirst('%f', _f_value(data.level));

  ///
  /// Given a level, return the value to use to replace the %f token.
  ///
  String _f_value(int level) {
    return level.toString();
  }

  ///
  /// Given a modifier name and current level, return the canonical string used
  /// to document the modifier.
  ///
  String _format(String name, int level) {
    return template
        .replaceFirst('%name', this._name(name))
        .replaceFirst('%f', _f_value(level));
  }

  ///
  /// Given a modifier name, return the value to replace the %name token.
  ///
  String _name(String name) {
    return name;
  }

  ///
  /// Return the formatter as a JSON object
  ///
  String toJSON() {
    return '{ "template": "$template" }';
  }

  @override
  bool operator ==(dynamic other) {
    return other is LevelTextFormatter && this.template == other.template;
  }

  @override
  int get hashCode => super.hashCode ^ template.hashCode;
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
class _ArrayFormatter extends LevelTextFormatter {
  ///
  /// The array of values to use.
  ///
  final List<String> array;

  ///
  /// Create an [_ArrayFormatter] with the given string list and template.
  /// The template defaults to '%name %f' if not provided.
  ///
  const _ArrayFormatter({this.array, String template = '%name %f'})
      : assert(array != null),
        super(template: template);

  ///
  /// Create an [_ArrayFormatter] from the JSON data.
  ///
  factory _ArrayFormatter.fromJSON(Map<String, dynamic> json) {
    var list =
        json['array'] != null ? List<String>.from(json['array'] as List) : null;
    return _ArrayFormatter(
      array: list,
      template: json['template'],
    );
  }

  @override
  String _f_value(int level) {
    return array[level - 1];
  }

  @override
  String toJSON() {
    String a = array.map((f) => '"$f"').reduce((a, b) => '$a, $b');
    return ''' {
    "type": "Array",
    "array": [$a],
    "template": "$template"
  }''';
  }

  // TODO add equals and hashcode
}

///
/// A formatter that calculates the %f value from the [level] by applying an
/// exponential function of the form [a * pow(b, level)].
///
/// Examples would include those modifiers whose effects are doubled with
/// each level, such as Area Effect (level 1 = 2 yards, level 2 = 4 yards,
/// level 3 = 8 yards, etc.).
///
class _ExponentialFormatter extends LevelTextFormatter {
  ///
  /// The constant multiplier.
  ///
  final int a;

  ///
  /// The number to raise to the "levelth" power.
  final int b;

  ///
  /// Create a [_ExponentialFormatter] with the given parameters.
  ///
  const _ExponentialFormatter({this.a, this.b, String template})
      : assert(a != null),
        assert(b != null),
        super(template: template);

  factory _ExponentialFormatter.fromJSON(Map<String, dynamic> json) {
    return _ExponentialFormatter(
        a: json['a'], b: json['b'], template: json['template']);
  }

  @override
  String _f_value(int level) {
    return (a * pow(b, level)).toString();
  }

  @override
  String toJSON() {
    return ''' {
    "type": "Exponential",
    "a": $a,
    "b": $b,
    "template": "$template"
  }''';
  }

  // TODO add equals and hashcode
}
