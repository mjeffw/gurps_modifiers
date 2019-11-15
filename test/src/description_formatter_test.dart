import 'dart:convert';

import 'package:gurps_modifiers/src/description_formatter.dart';
import 'package:test/test.dart';

import 'data.dart';

void main() {
  group('toJSON', () {
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

      test('toJSON', () {
        var formatter = const DescriptionFormatter(template: 'Andf asdf er2');
        expect(formatter.toJSON(), '{"template":"Andf asdf er2"}');
      });

      test('toJSON, null template', () {
        var formatter = const DescriptionFormatter(template: null);
        expect(formatter.toJSON(), '{}');
      });
    }, skip: false);

    group('LevelFormatter', () {
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

      test('LevelFormatter', () {
        var formatter = const LevelFormatter(template: 'Andf asdf er2');
        expect(formatter.toJSON(),
            '''{"type":"Level","template":"Andf asdf er2"}''');
      });

      test('LevelFormatter, default template', () {
        var formatter = const LevelFormatter();
        expect(formatter.toJSON(), '''{"type":"Level"}''');
      });
    }, skip: false);

    group('ArrayFormatter', () {
      var text = '{"type":"Array","template":"%name %f","array":["A","B","C"]}';
      var f1 = DescriptionFormatter.fromJSON(json.decode(text));
      var expected = ''' {
    "type": "Array",
    "array": %array,
    "template": "%template"
  }''';

      test('no-args constuctor', () {
        expect(() => ArrayFormatter(), throwsA(isA<AssertionError>()));
      });

      test('null template constuctor', () {
        expect(ArrayFormatter(array: ['a', 'b', 'c']).template, '%name %f');
      });
      test('template constuctor', () {
        expect(ArrayFormatter(template: 'Boo', array: ['a', 'b', 'c']).template,
            'Boo');
      });

      test('describe', () {
        var f = ArrayFormatter(array: ['a', 'b', 'c']);
        expect(f.describe(data: Data(level: 2), name: 'foo'), 'foo b');
        expect(f.describe(data: Data(level: 1), name: 'foo'), 'foo a');

        var f2 =
            ArrayFormatter(array: ['a', 'b', 'c'], template: '%f :: %name');
        expect(f2.describe(data: Data(level: 2), name: 'foo'), 'b :: foo');
        expect(f2.describe(data: Data(level: 3), name: 'foo'), 'c :: foo');
      });

      test('null args describe', () {
        var f = ArrayFormatter(array: ['a', 'b', 'c']);
        expect(() => f.describe(), throwsA(isA<Error>()));
        expect(
            () => f.describe(data: null, name: 'foo'), throwsA(isA<Error>()));
        expect(() => f.describe(data: null, name: null), throwsA(isA<Error>()));
        expect(() => f.describe(name: null), throwsA(isA<Error>()));
        expect(() => f.describe(name: 'foo', data: Data(level: null)),
            throwsA(isA<Error>()));
      });

      test('fromJSON', () {
        expect(f1.describe(name: 'name', data: Data(level: 1)), 'name A');
        expect(f1.describe(name: 'bob', data: Data(level: 2)), 'bob B');
      });

      test('fromJSON without template', () {
        var text = '{ "type": "Array", "array": ["A", "B", "C"] }';
        expect(ArrayFormatter.fromJSON(json.decode(text)).template, '%name %f');
      });

      test('fromJSON missing array', () {
        var text = '{ "type": "Array", "template": "%name %f" }';
        expect(() => ArrayFormatter.fromJSON(json.decode(text)),
            throwsA(isA<AssertionError>()));
      });

      test('fromJSON with template', () {
        var text =
            '{"type":"Array","template":"AA %f --** %name!","array":["A","B"]}';
        var f = ArrayFormatter.fromJSON(json.decode(text));
        expect(f.template, 'AA %f --** %name!');
        expect(
            f.describe(name: 'name', data: Data(level: 1)), 'AA A --** name!');
        expect(f.describe(name: 'bob', data: Data(level: 2)), 'AA B --** bob!');
      });

      test('toJSON, default template', () {
        var formatter = const ArrayFormatter(array: ['a', 'b', 'c']);
        expect(formatter.toJSON(), '{"type":"Array","array":["a","b","c"]}');
      });

      test('toJSON', () {
        var formatter = const ArrayFormatter(
            array: ['a', 'b', 'c'], template: '%name level %f');
        expect(formatter.toJSON(),
            '{"type":"Array","template":"%name level %f","array":["a","b","c"]}');
      });

      test('const constructor', () {
        expect(const ArrayFormatter(array: ['a', 'b', 'c']),
            same(const ArrayFormatter(array: ['a', 'b', 'c'])));
        expect(
            const ArrayFormatter(array: ['a', 'b', 'c'], template: '%name %f'),
            same(const ArrayFormatter(array: ['a', 'b', 'c'])));
      });

      test('object methods', () {
        var f1 = ArrayFormatter(array: ['a', 'b', 'c']);
        var f2 = ArrayFormatter(array: ['a', 'b', 'c'], template: '%name %f');
        var f3 = ArrayFormatter(
            array: ['a', 'b', 'c'], template: '%name %f, %detail');
        var f4 = LevelFormatter(template: '%name %f');

        expect(f1, equals(f1));
        expect(f1, equals(f2));
        expect(f1, isNot(equals(f3)));
        expect(f1 == f4, isFalse);
        expect(f4 == f1, isFalse);

        expect(f1.hashCode, equals(f2.hashCode));
        expect(f1.hashCode, isNot(equals(f3.hashCode)));
      });
    }, skip: false);

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
