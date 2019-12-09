import 'dart:convert';

import 'package:gurps_modifiers/src/description_formatter.dart';
import 'package:gurps_modifiers/src/detail_alias.dart';
import 'package:test/test.dart';

import 'data.dart';

void main() {
  group('toJSON', () {});

  group('formatters', () {
    group('DescriptionFormatter', () {
      test('no-args constructor', () {
        expect(DescriptionFormatter().template, DescriptionFormatter.TEMPLATE);
        expect(DescriptionFormatter().alias, DetailAlias.NULL);
      });

      test('null template constructor', () {
        var formatter = DescriptionFormatter(template: null);
        expect(formatter.template, DescriptionFormatter.TEMPLATE);
        expect(formatter.alias, DetailAlias.NULL);
      });

      test('template constructor', () {
        var formatter = DescriptionFormatter(template: 'One %name is %f');
        expect(formatter.template, 'One %name is %f');
        expect(formatter.alias, DetailAlias.NULL);
      });

      test('alias constructor', () {
        var f = DescriptionFormatter(alias: DetailAlias(aliases: {'1': 'one'}));
        expect(f.template, '%name, %detail');
        expect(f.alias, isNot(DetailAlias.NULL));
      });

      test('constructor', () {
        var f = DescriptionFormatter(
            alias: DetailAlias(aliases: {'1': 'one'}),
            template: 'One %name is %detail');
        expect(f.template, 'One %name is %detail');
        expect(f.alias, isNot(DetailAlias.NULL));
      });

      test('describe', () {
        var f = DescriptionFormatter(
            alias: DetailAlias(aliases: {'1': 'one'}),
            template: 'One %name is %detail');

        expect(f.describe(data: Data(detail: 'test'), name: 'foo'),
            'One foo is test');
        expect(
            f.describe(data: Data(detail: '1'), name: 'foo'), 'One foo is one');
        expect(f.describe(data: Data(), name: 'foo'), 'One foo is');

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

      test('fromJSON with nothing', () {
        var f = DescriptionFormatter.fromJSON(json.decode('{}'));
        expect(f, isA<DescriptionFormatter>());
        expect(f.template, DescriptionFormatter.TEMPLATE);
        expect(
            f.describe(name: 'name', data: Data(detail: 'boo')), 'name, boo');
      });

      test('fromJSON without template', () {
        var f = DescriptionFormatter.fromJSON(
            json.decode('{ "detailAlias": {"aliases": {"1":"ONE"}}}'));
        expect(f, isA<DescriptionFormatter>());
        expect(f.template, DescriptionFormatter.TEMPLATE);
        expect(f.describe(name: 'name', data: Data(detail: '1')), 'name, ONE');
      });

      test('fromJSON with template', () {
        String text = '{ "type": "Simple", "template": "%name %detail" }';
        var f = DescriptionFormatter.fromJSON(json.decode(text));
        expect(f, isA<DescriptionFormatter>());
        expect(f.template, '%name %detail');
        expect(f.describe(name: 'name', data: Data(detail: '9', level: 1)),
            'name 9');
      });

      test('fromJSON with null', () {
        var f = DescriptionFormatter.fromJSON(null);
        expect(f, isA<DescriptionFormatter>());
        expect(f.template, '%name, %detail');
        expect(f.describe(name: 'name', data: Data(detail: '9', level: 1)),
            'name, 9');
      });

      test('object methods', () {
        var f1 = DescriptionFormatter();
        var f2 = DescriptionFormatter(template: '%name, %detail');
        var f3 = DescriptionFormatter(template: '%name %f, %detail');
        var f4 = LevelFormatter(template: '%name, %detail');

        expect(f1, equals(f1));
        expect(f1, equals(f2));
        expect(f2, equals(f1));
        expect(f1, isNot(equals(f3)));
        expect(f3, isNot(equals(f1)));
        expect(f1 == f4, isFalse);
        expect(f4 == f1, isFalse);

        expect(f1.hashCode, equals(f2.hashCode));
        expect(f1.hashCode, isNot(equals(f3.hashCode)));
      });

      test('toJSON', () {
        var formatter = DescriptionFormatter(template: 'Andf asdf er2');
        expect(formatter.toJSON(), '{"template":"Andf asdf er2"}');
      });

      test('toJSON, null template', () {
        var formatter = DescriptionFormatter(template: null);
        expect(formatter.toJSON(), '{}');
      });
    });

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

      test('object methods', () {
        var f1 = LevelFormatter();
        var f2 = LevelFormatter(template: '%name %f');
        var f3 = LevelFormatter(template: '%name %f, %detail');
        var f4 = DescriptionFormatter(template: '%name %f');

        expect(f1, equals(f1));
        expect(f1, equals(f2));
        expect(f2, equals(f1));
        expect(f1, isNot(equals(f3)));
        expect(f3, isNot(equals(f1)));
        expect(f1 == f4, isFalse);
        expect(f4 == f1, isFalse);

        expect(f1.hashCode, equals(f2.hashCode));
        expect(f1.hashCode, isNot(equals(f3.hashCode)));
      });

      test('toJSON', () {
        var formatter = LevelFormatter(template: 'Andf asdf er2');
        expect(formatter.toJSON(),
            '''{"type":"Level","template":"Andf asdf er2"}''');
      });

      test('toJSON, default template', () {
        var formatter = LevelFormatter();
        expect(formatter.toJSON(), '''{"type":"Level"}''');
      });
    });

    // group('ArrayFormatter', () {
    //   const text =
    //       '{"type":"Array","template":"%name %f","array":["A","B","C"]}';

    //   test('no-args constuctor', () {
    //     expect(() => ArrayFormatter(), throwsA(isA<AssertionError>()));
    //   });

    //   test('null template constuctor', () {
    //     expect(ArrayFormatter(array: ['a', 'b', 'c']).template, '%name %f');
    //   });
    //   test('template constuctor', () {
    //     expect(ArrayFormatter(template: 'Boo', array: ['a', 'b', 'c']).template,
    //         'Boo');
    //   });

    //   test('describe', () {
    //     var f = ArrayFormatter(array: ['a', 'b', 'c']);
    //     expect(f.describe(data: Data(level: 2), name: 'foo'), 'foo b');
    //     expect(f.describe(data: Data(level: 1), name: 'foo'), 'foo a');

    //     var f2 =
    //         ArrayFormatter(array: ['a', 'b', 'c'], template: '%f :: %name');
    //     expect(f2.describe(data: Data(level: 2), name: 'foo'), 'b :: foo');
    //     expect(f2.describe(data: Data(level: 3), name: 'foo'), 'c :: foo');
    //   });

    //   test('null args describe', () {
    //     var f = ArrayFormatter(array: ['a', 'b', 'c']);
    //     expect(() => f.describe(), throwsA(isA<Error>()));
    //     expect(
    //         () => f.describe(data: null, name: 'foo'), throwsA(isA<Error>()));
    //     expect(() => f.describe(data: null, name: null), throwsA(isA<Error>()));
    //     expect(() => f.describe(name: null), throwsA(isA<Error>()));
    //     expect(() => f.describe(name: 'foo', data: Data(level: null)),
    //         throwsA(isA<Error>()));
    //   });

    //   test('fromJSON', () {
    //     var f1 = DescriptionFormatter.fromJSON(json.decode(text));
    //     expect(f1.describe(name: 'name', data: Data(level: 1)), 'name A');
    //     expect(f1.describe(name: 'bob', data: Data(level: 2)), 'bob B');
    //   });

    //   test('fromJSON without template', () {
    //     var text = '{ "type": "Array", "array": ["A", "B", "C"] }';
    //     expect(ArrayFormatter.fromJSON(json.decode(text)).template, '%name %f');
    //   });

    //   test('fromJSON missing array', () {
    //     var text = '{ "type": "Array", "template": "%name %f" }';
    //     expect(() => ArrayFormatter.fromJSON(json.decode(text)),
    //         throwsA(isA<AssertionError>()));
    //   });

    //   test('fromJSON with template', () {
    //     var text =
    //         '{"type":"Array","template":"AA %f --** %name!","array":["A","B"]}';
    //     var f = ArrayFormatter.fromJSON(json.decode(text));
    //     expect(f.template, 'AA %f --** %name!');
    //     expect(
    //         f.describe(name: 'name', data: Data(level: 1)), 'AA A --** name!');
    //     expect(f.describe(name: 'bob', data: Data(level: 2)), 'AA B --** bob!');
    //   });

    //   test('toJSON, default template', () {
    //     var formatter = ArrayFormatter(array: ['a', 'b', 'c']);
    //     expect(formatter.toJSON(), '{"type":"Array","array":["a","b","c"]}');
    //   });

    //   test('toJSON', () {
    //     var formatter =
    //         ArrayFormatter(array: ['a', 'b', 'c'], template: '%name level %f');
    //     expect(formatter.toJSON(),
    //         '{"type":"Array","template":"%name level %f","array":["a","b","c"]}');
    //   });

    //   test('object methods', () {
    //     var f1 = ArrayFormatter(array: ['a', 'b', 'c']);
    //     var f2 = ArrayFormatter(array: ['a', 'b', 'c'], template: '%name %f');
    //     var f3 = ArrayFormatter(
    //         array: ['a', 'b', 'c'], template: '%name %f, %detail');
    //     var f4 = LevelFormatter(template: '%name %f');

    //     expect(f1, equals(f1));
    //     expect(f1, equals(f2));
    //     expect(f2, equals(f1));
    //     expect(f1, isNot(equals(f3)));
    //     expect(f3, isNot(equals(f1)));
    //     expect(f1, isNot(equals(f4)));
    //     expect(f4, isNot(equals(f1)));

    //     expect(f1.hashCode, equals(f2.hashCode));
    //     expect(f1.hashCode, isNot(equals(f3.hashCode)));
    //   });
    // });

    group('GeometricFormatter', () {
      test('no-args constructor', () {
        expect(() => GeometricFormatter(), throwsA(isA<AssertionError>()));
      });

      test('no-b constructor', () {
        expect(() => GeometricFormatter(a: 2), throwsA(isA<AssertionError>()));
      });

      test('no-a constructor', () {
        expect(() => GeometricFormatter(b: 2), throwsA(isA<AssertionError>()));
      });

      test('no template constructor', () {
        expect(
            GeometricFormatter(a: 5, b: 2).template, LevelFormatter.TEMPLATE);
      });

      test('null template constructor', () {
        expect(GeometricFormatter(a: 5, b: 3, template: null).template,
            LevelFormatter.TEMPLATE);
      });

      test('template constructor', () {
        expect(
            GeometricFormatter(a: 1, b: 1, template: 'One %name is %f')
                .template,
            'One %name is %f');
      });

      test('describe', () {
        var f = GeometricFormatter(a: 2, b: 3);
        expect(f.describe(data: Data(level: 2), name: 'foo'), 'foo 18');
        expect(f.describe(data: Data(level: 1), name: 'foo'), 'foo 6');

        var f2 = GeometricFormatter(a: 1, b: 2, template: '%f :: %name');
        expect(f2.describe(data: Data(level: 4), name: 'bar'), '16 :: bar');
      });

      test('null args describe', () {
        var f = GeometricFormatter(a: 2, b: 2);
        expect(() => f.describe(), throwsA(isA<Error>()));
        expect(() => f.describe(data: null), throwsA(isA<Error>()));
        expect(
            () => f.describe(data: null, name: 'bar'), throwsA(isA<Error>()));
        expect(() => f.describe(name: null), throwsA(isA<Error>()));
        expect(
            () => f.describe(data: Data(), name: 'baz'), throwsA(isA<Error>()));
      });

      test('fromJSON -- missing a', () {
        var text = '''{ "type": "Exponent", "template": "%name %f", "b": 2 }''';

        expect(() => GeometricFormatter.fromJSON(json.decode(text)),
            throwsA(isA<AssertionError>()));
      });

      test('fromJSON -- missing b', () {
        var text = '''{ "type": "Exponent", "template": "%name %f", "a": 5 }''';

        expect(() => GeometricFormatter.fromJSON(json.decode(text)),
            throwsA(isA<AssertionError>()));
      });

      test('fromJSON -- missing template', () {
        var text = '''{ "type": "Exponent", "a": 5, "b": 2 }''';

        expect(() => GeometricFormatter.fromJSON(json.decode(text)),
            isNot(throwsA(isA<AssertionError>())));
      });

      test('fromJSON', () {
        var text =
            '''{ "type": "Geometric", "template": "%name: %f", "a": 5, "b": 2 }''';

        var f = GeometricFormatter.fromJSON(json.decode(text));
        expect(f.describe(name: 'name', data: Data(level: 2)), 'name: 20');
        expect(f.describe(name: 'foo', data: Data(level: 3)), 'foo: 40');
      });

      test('toJSON default template ', () {
        var formatter = GeometricFormatter(a: 2, b: 3);
        expect(formatter.toJSON(), '{"type":"Geometric","a":2,"b":3,"c":0}');
      });

      test('toJSON', () {
        var formatter =
            GeometricFormatter(a: 2, b: 3, template: '%name, %f yards');
        expect(formatter.toJSON(),
            '{"type":"Geometric","template":"%name, %f yards","a":2,"b":3,"c":0}');
      });

      test('object methods', () {
        var f1 = GeometricFormatter(a: 2, b: 3);
        var f2 = GeometricFormatter(a: 2, b: 3, template: '%name %f');
        var f3 = GeometricFormatter(a: 2, b: 3, template: '%name %f, %detail');
        var f4 = LevelFormatter();

        expect(f1, equals(f1));
        expect(f1, equals(f2));
        expect(f2, equals(f1));
        expect(f1, isNot(equals(f3)));
        expect(f3, isNot(equals(f1)));
        expect(f1, isNot(equals(f4)));
        expect(f4, isNot(equals(f1)));

        expect(f1.hashCode, equals(f2.hashCode));
        expect(f1.hashCode, isNot(equals(f3.hashCode)));
      });
    });

    group('PatternFormatter', () {
      test('no-args constructor', () {
        expect(() => PatternFormatter(), throwsA(isA<AssertionError>()));
      });

      test('null template constructor', () {
        expect(
            PatternFormatter(pattern: [2, 3, 5, 10], template: null).template,
            LevelFormatter.TEMPLATE);
      });

      test('template constructor', () {
        expect(
            PatternFormatter(
                    pattern: [2, 3, 5, 10], template: 'One %name is %f')
                .template,
            'One %name is %f');
      });

      test('describe', () {
        var f = PatternFormatter(pattern: [2, 3, 5, 10]);
        expect(f.describe(data: Data(level: 1), name: 'foo'), 'foo 2');
        expect(f.describe(data: Data(level: 2), name: 'foo'), 'foo 3');
        expect(f.describe(data: Data(level: 3), name: 'foo'), 'foo 5');
        expect(f.describe(data: Data(level: 4), name: 'foo'), 'foo 10');
        expect(f.describe(data: Data(level: 5), name: 'foo'), 'foo 20');

        var f2 = PatternFormatter(pattern: [2, 4, 9], template: '%f :: %name');
        expect(f2.describe(data: Data(level: 1), name: 'bar'), '2 :: bar');
        expect(f2.describe(data: Data(level: 2), name: 'bar'), '4 :: bar');
        expect(f2.describe(data: Data(level: 3), name: 'bar'), '9 :: bar');
        expect(f2.describe(data: Data(level: 4), name: 'bar'), '20 :: bar');
        expect(f2.describe(data: Data(level: 5), name: 'bar'), '40 :: bar');
        expect(f2.describe(data: Data(level: 6), name: 'bar'), '90 :: bar');
      });

      test('null args describe', () {
        var f = PatternFormatter(pattern: [2, 4, 9]);
        expect(() => f.describe(), throwsA(isA<Error>()));
        expect(() => f.describe(data: null), throwsA(isA<Error>()));
        expect(
            () => f.describe(data: null, name: 'bar'), throwsA(isA<Error>()));
        expect(() => f.describe(name: null), throwsA(isA<Error>()));
        expect(
            () => f.describe(data: Data(), name: 'baz'), throwsA(isA<Error>()));
      });

      test('fromJSON -- missing pattern', () {
        var text = '''{ "type": "Pattern", "template": "%name %f"}''';

        expect(() => PatternFormatter.fromJSON(json.decode(text)),
            throwsA(isA<AssertionError>()));
      });

      test('fromJSON -- missing template', () {
        var text = '''{ "type": "Pattern", "pattern": [1,3,5,7,9]}''';

        expect(PatternFormatter.fromJSON(json.decode(text)).template,
            LevelFormatter.TEMPLATE);
      });

      test('fromJSON', () {
        var text =
            '''{ "type": "Pattern", "template": "%name: %f", "pattern": [5, 10]}''';

        var f = PatternFormatter.fromJSON(json.decode(text));
        expect(f.describe(name: 'name', data: Data(level: 2)), 'name: 10');
        expect(f.describe(name: 'foo', data: Data(level: 3)), 'foo: 50');
      });

      test('toJSON', () {
        var formatter =
            PatternFormatter(pattern: [2, 4, 9], template: '%name, %f steps');
        expect(formatter.toJSON(),
            '{"type":"Pattern","template":"%name, %f steps","pattern":[2,4,9]}');
      });

      test('toJSON, default template', () {
        var formatter = PatternFormatter(pattern: [2, 4, 9]);
        expect(formatter.toJSON(), '{"type":"Pattern","pattern":[2,4,9]}');
      });

      test('object methods', () {
        var f1 = PatternFormatter(pattern: [2, 4, 9]);
        var f2 = PatternFormatter(pattern: [2, 4, 9], template: '%name %f');
        var f3 = PatternFormatter(
            pattern: [2, 3, 5, 10], template: '%name %f, %detail');
        var f4 = LevelFormatter();

        expect(f1, equals(f1));
        expect(f1, equals(f2));
        expect(f2, equals(f1));
        expect(f1, isNot(equals(f3)));
        expect(f3, isNot(equals(f1)));
        expect(f1, isNot(equals(f4)));
        expect(f4, isNot(equals(f1)));

        expect(f1.hashCode, equals(f2.hashCode));
        expect(f1.hashCode, isNot(equals(f3.hashCode)));
      });
    });
  }, skip: false);
}
