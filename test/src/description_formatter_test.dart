import 'dart:convert';

import 'package:gurps_modifiers/modifier_data.dart';
import 'package:gurps_modifiers/src/description_formatter.dart';
import 'package:test/test.dart';

import 'data.dart';

class _Data with ModifierData {
  @override
  String detail;

  @override
  int level;
}

void main() {
  group('toJSON', () {
    test('DescriptionFormatter', () {
      var formatter = const DescriptionFormatter(template: 'Andf asdf er2');
      expect(formatter.toJSON(), '''{"template":"Andf asdf er2"}''');
    });

    test('LevelFormatter', () {
      var formatter = const LevelFormatter(template: 'Andf asdf er2');
      expect(formatter.toJSON(),
          '''{"type":"Level","template":"Andf asdf er2"}''');
    });

    test('LevelFormatter, default template', () {
      var formatter = const LevelFormatter();
      expect(formatter.toJSON(), '''{"type":"Level"}''');
    });

    test('ArrayFormatter, default template', () {
      var formatter = const ArrayFormatter(array: ['a', 'b', 'c']);
      expect(formatter.toJSON(), '{"type":"Array","array":["a","b","c"]}');
    });

    test('ArrayFormatter', () {
      var formatter = const ArrayFormatter(
          array: ['a', 'b', 'c'], template: '%name level %f');
      expect(formatter.toJSON(),
          '{"type":"Array","template":"%name level %f","array":["a","b","c"]}');
    });

    test('ExponentFormatter, default template ', () {
      var formatter = const ExponentFormatter(a: 2, b: 3);
      expect(formatter.toJSON(), '{"type":"Exponent","a":2,"b":3}');
    });

    test('ExponentFormatter', () {
      var formatter =
          const ExponentFormatter(a: 2, b: 3, template: '%name, %f yards');
      expect(formatter.toJSON(),
          '{"type":"Exponent","template":"%name, %f yards","a":2,"b":3}');
    });

    test('PatternFormatter', () {
      var formatter = PatternFormatter(
          numberOfSteps: 5,
          exponent: 2,
          constant: 1,
          template: '%name, %f steps');
      expect(formatter.toJSON(),
          '{"type":"Pattern","template":"%name, %f steps","numberOfSteps":5,"exponent":2,"constant":1}');
    });

    test('PatternFormatter, default template', () {
      var formatter =
          PatternFormatter(numberOfSteps: 3, exponent: 3, constant: 5);
      expect(formatter.toJSON(),
          '{"type":"Pattern","numberOfSteps":3,"exponent":3,"constant":5}');
    });

    test('AliasFormatter', () {
      var formatter = AliasFormatter(
          aliases: {'a': 'A', 'b': 'B', 'c': 'C'}, template: 'boo');
      expect(formatter.toJSON(),
          '{"type":"Alias","template":"boo","aliases":{"a":"A","b":"B","c":"C"}}');
    });

    test('AliasFormatter, default template', () {
      var formatter = AliasFormatter(aliases: {'a': 'A', 'b': 'B', 'c': 'C'});
      expect(formatter.toJSON(),
          '{"type":"Alias","aliases":{"a":"A","b":"B","c":"C"}}');
    });
  });

  group('formatters', () {
    group('LevelTextFormatter', () {
      test('constructor', () {
        var f = LevelFormatter();
        expect(f.describe(name: 'name', data: Data(level: 1)), 'name 1');
      });

      test('null template', () {
        expect(() => LevelFormatter(template: null),
            throwsA(isA<AssertionError>()));
      });

      test('template', () {
        var f = LevelFormatter(template: 'One %name is %f');
        expect(f.describe(name: 'name', data: Data(level: 7)), 'One name is 7');
      });

      test('null args', () {
        var f = LevelFormatter();
        expect(() => f.describe(), throwsA(isA<Error>()));
      });

      test('fromJSON', () {
        String text = '{ "type": "Level", "template": "%name %f" }';
        var f = DescriptionFormatter.fromJSON(json.decode(text));
        expect(f.describe(name: 'name', data: Data(level: 9)), 'name 9');
      });

      test('fromJSON 2', () {
        String text = '{ "type": "Simple", "template": "%name %detail" }';
        var f = DescriptionFormatter.fromJSON(json.decode(text));
        expect(f.describe(name: 'name', data: Data(detail: '9')), 'name 9');
      });

      test('const constructor', () {
        expect(const LevelFormatter(), same(const LevelFormatter()));
        expect(const LevelFormatter(template: '%name %f'),
            same(const LevelFormatter()));
      });

      test('toJSON', () {
        expect(LevelFormatter().toJSON(),
            ' {\n "type": "Level",\n "template": "%name %f"\n }');
        expect(LevelFormatter(template: 'One %name to %f').toJSON(),
            ' {\n "type": "Level",\n "template": "One %name to %f"\n }');
      });
    });

    group('_ArrayFormatter', () {
      var text = '''
      { "type": "Array", "template": "%name %f", "array": ["A", "B", "C"] }
      ''';
      var f1 = DescriptionFormatter.fromJSON(json.decode(text));
      var expected = ''' {
    "type": "Array",
    "array": %array,
    "template": "%template"
  }''';

      test('fromJSON', () {
        expect(f1.describe(name: 'name', data: Data(level: 1)), 'name A');
        expect(f1.describe(name: 'bob', data: Data(level: 2)), 'bob B');
      });

      test('fromJSON varying template', () {
        var text = '''
      { "type": "Array", "template": "AA %f --** %name!", "array": ["A", "B", "C"] }
      ''';
        var f = DescriptionFormatter.fromJSON(json.decode(text));
        expect(
            f.describe(name: 'name', data: Data(level: 1)), 'AA A --** name!');
        expect(f.describe(name: 'bob', data: Data(level: 2)), 'AA B --** bob!');
      });

      test('fromJSON missing template', () {
        var text = '''
      { "type": "Array", "array": ["A", "B", "C"] }
      ''';
        expect(() => DescriptionFormatter.fromJSON(json.decode(text)),
            throwsA(isA<AssertionError>()));
      });

      test('fromJSON missing array', () {
        var text = '''
      { "type": "Array", "template": "%name %f" }
      ''';
        expect(() => DescriptionFormatter.fromJSON(json.decode(text)),
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
        var f1 = DescriptionFormatter.fromJSON(json.decode(text));
        expect(
            f1.toJSON(),
            expected
                .replaceAll('%array', '["any", "old", "hole"]')
                .replaceAll('%template', 'AA %name some %f template'));
      });
    });

    group('_ExponentialFormatter', () {
      test('fromJSON -- missing a', () {
        var text = '''{ "type": "Exponent", "template": "%name %f", "b": 2 }''';

        expect(() => DescriptionFormatter.fromJSON(json.decode(text)),
            throwsA(isA<AssertionError>()));
      });

      test('fromJSON -- missing b', () {
        var text = '''{ "type": "Exponent", "template": "%name %f", "a": 5 }''';

        expect(() => DescriptionFormatter.fromJSON(json.decode(text)),
            throwsA(isA<AssertionError>()));
      });

      test('fromJSON -- missing template', () {
        var text = '''{ "type": "Exponent", "a": 5, "b": 2 }''';

        expect(() => DescriptionFormatter.fromJSON(json.decode(text)),
            throwsA(isA<AssertionError>()));
      });

      test('fromJSON', () {
        var text =
            '''{ "type": "Exponent", "template": "%name: %f", "a": 5, "b": 2 }''';

        var f = DescriptionFormatter.fromJSON(json.decode(text));
        expect(f.describe(name: 'name', data: Data(level: 2)), 'name: 20');
        expect(f.describe(name: 'foo', data: Data(level: 3)), 'foo: 40');
      });

      test('toJSON', () {
        var text = ''' {
    "type": "Exponent",
    "a": 5,
    "b": 2,
    "template": "%name: %f"
  }''';

        var f = DescriptionFormatter.fromJSON(json.decode(text));
        expect(f.toJSON(), text);
      });
    });
  }, skip: true);
}
