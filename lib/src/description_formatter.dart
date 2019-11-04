import 'dart:math';

import 'package:quiver/collection.dart';
import 'package:quiver/core.dart';

import '../modifier_data.dart';

///
/// [DescriptionFormatter] is responsible for creating the printable description of a Modifier.
///
/// By default (i.e., given no data) the description is only the name of the
/// Modifier, as passed into the describe method.
///
class DescriptionFormatter {
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
  /// Build a LevetTextFormatter from a JSON structure
  ///
  factory DescriptionFormatter.fromJSON(Map<String, dynamic> json) {
    if (json == null) return const DefaultFormatter();

    String type = json['type'];
    if (type == 'Exponential') {
      return _ExponentialFormatter.fromJSON(json);
    } else if (type == 'Array') {
      return _ArrayFormatter.fromJSON(json);
    } else if (type == 'Level') {
      return LevelTextFormatter(template: json['template']);
    } else {
      return DescriptionFormatter(template: json['template']);
    }
  }

  String toJSON() => '"formatter": { "template": "$template" }';

  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    return other is DescriptionFormatter && this.template == other.template;
  }

  @override
  int get hashCode => template.hashCode;
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
class LevelTextFormatter extends DescriptionFormatter {
  ///
  /// Create a constant [LevelTextFormatter]. By default, the description is <name> <level>.
  ///
  const LevelTextFormatter({String template = '%name %f'})
      : assert(template != null),
        super(template: template);

  String describe({String name, ModifierData data}) => super
      .describe(name: name, data: data)
      .replaceFirst('%f', _f_value(data.level))
      .replaceFirst('%s', (data.level > 1) ? 's' : '');

  ///
  /// Given a level, return the value to use to replace the %f token.
  ///
  String _f_value(int level) {
    return level.toString();
  }

  ///
  /// Return the formatter as a JSON object
  ///
  String toJSON() {
    return '{ "type": "Level", "template": "$template" }';
  }

  @override
  bool operator ==(dynamic other) {
    return other is LevelTextFormatter && this.template == other.template;
  }

  @override
  int get hashCode => template.hashCode;
}

class DefaultLevelTextFormatter extends LevelTextFormatter {
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

  ///
  /// Use (level - 1) as the index into array; return the value at that index.
  ///
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

  @override
  bool operator ==(dynamic other) {
    return other is _ArrayFormatter &&
        this.template == other.template &&
        listsEqual(this.array, other.array);
  }

  @override
  int get hashCode => hashObjects(array) ^ template.hashCode;
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

  ///
  /// Return the level value by calculating the exponential value.
  ///
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

  @override
  bool operator ==(dynamic other) {
    return other is _ExponentialFormatter &&
        this.template == other.template &&
        this.a == other.a &&
        this.b == other.b;
  }

  @override
  int get hashCode => hash3(a, b, template);
}