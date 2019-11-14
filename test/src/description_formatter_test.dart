import 'dart:convert';

import 'package:gurps_modifiers/src/description_formatter.dart';
import 'package:test/test.dart';

import 'data.dart';

void main() {
  group('toJSON', () {
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
    group('DescriptionFormatter', () {
      test('no-args constructor', () {
        expect(DescriptionFormatter().template, DescriptionFormatter.TEMPLATE);
      });

      test('null template constructor', () {
        expect(DescriptionFormatter(template: null).template,
            DescriptionFormatter.TEMPLATE);
      });

      test('template constructor', () {
        expect(DescriptionFormatter(template: 'One %name is %f').template,
            'One %name is %f');
      });

      test('describe', () {
        var f = DescriptionFormatter();
        expect(
            f.describe(data: Data(detail: 'test'), name: 'foo'), 'foo, test');
        expect(f.describe(data: Data(), name: 'foo'), 'foo');

        var f2 = DescriptionFormatter(template: '%detail :: %name');
        expect(f2.describe(data: Data(detail: 'test'), name: 'foo'),
            'test :: foo');
        expect(f2.describe(data: Data(), name: 'foo'), ':: foo');
      });

      test('null args describe', () {
        expect(() => DescriptionFormatter().describe(), throwsA(isA<Error>()));
        expect(() => DescriptionFormatter().describe(data: null),
            throwsA(isA<Error>()));
        expect(() => DescriptionFormatter().describe(data: null, name: null),
            throwsA(isA<Error>()));
        expect(() => DescriptionFormatter().describe(name: null),
            throwsA(isA<Error>()));
      });

      test('fromJSON without template', () {
        var f = DescriptionFormatter.fromJSON(json.decode('{}'));
        expect(f, isA<DescriptionFormatter>());
        expect(f.template, DescriptionFormatter.TEMPLATE);
        expect(
            f.describe(name: 'name', data: Data(detail: 'boo')), 'name, boo');
      });

      test('fromJSON with template', () {
        String text = '{ "type": "Simple", "template": "%name %detail" }';
        var f = DescriptionFormatter.fromJSON(json.decode(text));
        expect(f, isA<DescriptionFormatter>());
        expect(f.template, '%name %detail');
        expect(f.describe(name: 'name', data: Data(detail: '9', level: 1)),
            'name 9');
      });

      test('const constructor', () {
        expect(
            const DescriptionFormatter(), same(const DescriptionFormatter()));
        expect(const DescriptionFormatter(template: '%name, %detail'),
            same(const DescriptionFormatter()));
      });

      test('object methods', () {
        var f1 = DescriptionFormatter();
        var f2 = DescriptionFormatter(template: '%name, %detail');
        var f3 = DescriptionFormatter(template: '%name %f, %detail');
        var f4 = LevelFormatter(template: '%name, %detail');

        expect(f1, equals(f1));
        expect(f1, equals(f2));
        expect(f1, isNot(equals(f3)));
        expect(f1 == f4, isFalse);
        expect(f4 == f1, isFalse);

        expect(f1.hashCode, equals(f2.hashCode));
        expect(f1.hashCode, isNot(equals(f3.hashCode)));
      });

      test('DescriptionFormatter', () {
        var formatter = const DescriptionFormatter(template: 'Andf asdf er2');
        expect(formatter.toJSON(), '{"template":"Andf asdf er2"}');
      });

      test('DescriptionFormatter, null template', () {
        var formatter = const DescriptionFormatter(template: null);
        expect(formatter.toJSON(), '{}');
      });
    }, skip: false);

    group('LevelTextFormatter', () {
      test('no-args constructor', () {
        var f = LevelFormatter();
        expect(f.template, LevelFormatter.TEMPLATE);
      });

      test('null template constructor', () {
        var f = LevelFormatter(template: null);
        expect(f.template, LevelFormatter.TEMPLATE);
      });

      test('template constructor', () {
        var f = LevelFormatter(template: 'One %name is %f');
        expect(f.template, 'One %name is %f');
      });

      test('null args describe', () {
        expect(() => LevelFormatter().describe(), throwsA(isA<Error>()));
      });

      test('fromJSON without template', () {
        String text = '{ "type": "Level" }';
        var f = DescriptionFormatter.fromJSON(json.decode(text));
        expect(f, isA<LevelFormatter>());
        expect(f.template, LevelFormatter.TEMPLATE);
        expect(f.describe(name: 'name', data: Data(level: 9)), 'name 9');
      });

      test('fromJSON with template', () {
        String text = '{ "type": "Level", "template": "%name %detail" }';
        var f = DescriptionFormatter.fromJSON(json.decode(text));
        expect(f, isA<LevelFormatter>());
        expect(f.template, '%name %detail');
        expect(f.describe(name: 'name', data: Data(detail: '9', level: 1)),
            'name 9');
      });

      test('const constructor', () {
        expect(const LevelFormatter(), same(const LevelFormatter()));
        expect(const LevelFormatter(template: '%name %f'),
            same(const LevelFormatter()));
      });

      test('object methods', () {
        var f1 = LevelFormatter();
        var f2 = LevelFormatter(template: '%name %f');
        var f3 = LevelFormatter(template: '%name %f, %detail');
        var f4 = DescriptionFormatter(template: '%name %f');

        expect(f1, equals(f1));
        expect(f1, equals(f2));
        expect(f1, isNot(equals(f3)));
        expect(f1 == f4, isFalse);
        expect(f4 == f1, isFalse);

        expect(f1.hashCode, equals(f2.hashCode));
        expect(f1.hashCode, isNot(equals(f3.hashCode)));
      });
    }, skip: false);

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
