import 'dart:math';

///
/// Defines the responsibilities of all LevelTextFormatter sintances.
///
abstract class LevelTextFormatter {
  ///
  /// Given a modifier name and current level, return the canonical string used
  /// to document the modifier.
  ///
  String format(String name, int level);

  ///
  /// Return the formatter as a JSON object
  ///
  String toJSON() {
    return '';
  }

  const LevelTextFormatter();

  factory LevelTextFormatter.fromJSON(Map<String, dynamic> json) {
    String type = json['type'];
    if (type == 'Exponential') {
      return _ExponentialLevelTextFormatter.fromJSON(json);
    } else if (type == 'Array') {
      return _ArrayLevelTextFormatter.fromJSON(json);
    }
    return null;
  }
}

class BasicLevelTextFormatter extends LevelTextFormatter {
  static const LevelTextFormatter instance = const BasicLevelTextFormatter();

  const BasicLevelTextFormatter();

  @override
  String format(String name, int level) {
    return '$name $level';
  }
}

class _ExponentialLevelTextFormatter extends LevelTextFormatter {
  final int a;
  final int b;
  final String template;

  const _ExponentialLevelTextFormatter({this.a, this.b, this.template})
      : assert(a != null),
        assert(b != null),
        assert(template != null);

  factory _ExponentialLevelTextFormatter.fromJSON(Map<String, dynamic> json) {
    return _ExponentialLevelTextFormatter(
        a: int.parse(json['a']),
        b: int.parse(json['b']),
        template: json['template']);
  }

  @override
  String format(String name, int level) {
    int f = a * pow(b, level);
    return template.replaceAll('%name', name).replaceAll('%f', f.toString());
  }

  @override
  String toJSON() {
    return ''' {
    "type": "Exponential",
    "a": "$a",
    "b": "$b",
    "template": "$template"
  }''';
  }
}

class _ArrayLevelTextFormatter extends LevelTextFormatter {
  final List<String> array;
  final String template;

  const _ArrayLevelTextFormatter({this.array, this.template})
      : assert(array != null),
        assert(template != null);

  factory _ArrayLevelTextFormatter.fromJSON(Map<String, dynamic> json) {
    return _ArrayLevelTextFormatter(
      array: List<String>.from(json['array'] as List),
      template: json['template'],
    );
  }

  @override
  String format(String name, int level) {
    return template
        .replaceAll('%name', name)
        .replaceAll('%f', array[level - 1]);
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
}
