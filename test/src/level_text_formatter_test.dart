import 'dart:convert';

import 'package:gurps_modifiers/src/level_text_formatter.dart';
import 'package:test/test.dart';

void main() {
  group('formatters', () {
    group('LevelTextFormatter', () {
      test('constructor', () {
        var f = LevelTextFormatter();
        expect(f.format('name', 1), 'name 1');
      });

      test('null template', () {
        expect(() => LevelTextFormatter(template: null),
            throwsA(isA<AssertionError>()));
      });

      test('template', () {
        var f = LevelTextFormatter(template: 'One %name is %f');
        expect(f.format('name', 7), 'One name is 7');
      });

      test('null args', () {
        var f = LevelTextFormatter();
        expect(() => f.format(null, null), throwsA(isA<Error>()));
      });

      test('fromJSON', () {
        String text = '{ "template": "%name %f" }';
        var f = LevelTextFormatter.fromJSON(json.decode(text));
        expect(f.format('name', 9), 'name 9');
      });

      test('fromJSON 2', () {
        String text = '{ "type": "Simple", "template": "%name %f" }';
        var f = LevelTextFormatter.fromJSON(json.decode(text));
        expect(f.format('name', 9), 'name 9');
      });

      test('const constructor', () {
        expect(const LevelTextFormatter(), same(const LevelTextFormatter()));
        expect(const LevelTextFormatter(template: '%name %f'),
            same(const LevelTextFormatter()));
        expect(const LevelTextFormatter(), same(LevelTextFormatter.instance));
      });

      test('toJSON', () {
        expect(LevelTextFormatter().toJSON(), '{ "template": "%name %f" }');
        expect(LevelTextFormatter(template: 'One %name to %f').toJSON(),
            '{ "template": "One %name to %f" }');
      });
    });

    group('_ArrayFormatter', () {
      var text = '''
      { "type": "Array", "template": "%name %f", "array": ["A", "B", "C"] }
      ''';
      var f1 = LevelTextFormatter.fromJSON(json.decode(text));
      var expected = ''' {
    "type": "Array",
    "array": %array,
    "template": "%template"
  }''';

      test('fromJSON', () {
        expect(f1.format('name', 1), 'name A');
        expect(f1.format('bob', 2), 'bob B');
      });

      test('fromJSON varying template', () {
        var text = '''
      { "type": "Array", "template": "AA %f --** %name!", "array": ["A", "B", "C"] }
      ''';
        var f = LevelTextFormatter.fromJSON(json.decode(text));
        expect(f.format('name', 1), 'AA A --** name!');
        expect(f.format('bob', 2), 'AA B --** bob!');
      });

      test('fromJSON missing template', () {
        var text = '''
      { "type": "Array", "array": ["A", "B", "C"] }
      ''';
        expect(() => LevelTextFormatter.fromJSON(json.decode(text)),
            throwsA(isA<AssertionError>()));
      });

      test('fromJSON missing array', () {
        var text = '''
      { "type": "Array", "template": "%name %f" }
      ''';
        expect(() => LevelTextFormatter.fromJSON(json.decode(text)),
            throwsA(isA<AssertionError>()));
      });

      test('toJSON', () {
        expect(
            f1.toJSON(),
            expected
                .replaceAll('%array', '["A", "B", "C"]')
                .replaceAll('%template', '%name %f'));
      });

      test('toJSON -- variation', () {
        var text = '''
      { "type": "Array", "template": "AA %name some %f template", "array": ["any", "old", "hole"] }
      ''';
        var f1 = LevelTextFormatter.fromJSON(json.decode(text));
        expect(
            f1.toJSON(),
            expected
                .replaceAll('%array', '["any", "old", "hole"]')
                .replaceAll('%template', 'AA %name some %f template'));
      });
    });

    group('_ExponentialFormatter', () {
      test('fromJSON -- missing a', () {
        var text =
            '''{ "type": "Exponential", "template": "%name %f", "b": 2 }''';

        expect(() => LevelTextFormatter.fromJSON(json.decode(text)),
            throwsA(isA<AssertionError>()));
      });

      test('fromJSON -- missing b', () {
        var text =
            '''{ "type": "Exponential", "template": "%name %f", "a": 5 }''';

        expect(() => LevelTextFormatter.fromJSON(json.decode(text)),
            throwsA(isA<AssertionError>()));
      });

      test('fromJSON -- missing template', () {
        var text = '''{ "type": "Exponential", "a": 5, "b": 2 }''';

        expect(() => LevelTextFormatter.fromJSON(json.decode(text)),
            throwsA(isA<AssertionError>()));
      });

      test('fromJSON', () {
        var text =
            '''{ "type": "Exponential", "template": "%name: %f", "a": 5, "b": 2 }''';

        var f = LevelTextFormatter.fromJSON(json.decode(text));
        expect(f.format('name', 2), 'name: 20');
        expect(f.format('foo', 3), 'foo: 40');
      });

      test('toJSON', () {
        var text = ''' {
    "type": "Exponential",
    "a": 5,
    "b": 2,
    "template": "%name: %f"
  }''';

        var f = LevelTextFormatter.fromJSON(json.decode(text));
        expect(f.toJSON(), text);
      });
    });
  }, skip: false);
}
