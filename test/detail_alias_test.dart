import 'dart:convert';

import 'package:gurps_modifiers/src/detail_alias.dart';
import 'package:test/test.dart';

void main() {
  group('AliasFormatter', () {
    test('no-args constructor', () {
      expect(() => AliasFormatter(), throwsA(isA<AssertionError>()));
    });

    test('constructor', () {
      expect(AliasFormatter(aliases: {'a': 'A', 'b': 'B'}), isNotNull);
    });

    test('alias', () {
      var f = AliasFormatter(aliases: {'a': 'A', 'b': 'B'});
      expect(f.alias('b'), 'B');
      expect(f.alias('a'), 'A');
      expect(f.alias('c'), 'c');
    });

    test('null args alias', () {
      var f = AliasFormatter(aliases: {'a': 'A', 'b': 'B'});
      expect(f.alias(null), isNull);
    });

    test('fromJSON -- missing aliases', () {
      expect(() => AliasFormatter.fromJSON(json.decode('{}')),
          throwsA(isA<AssertionError>()));
    });

    test('fromJSON', () {
      var text = '{"aliases":{"a":"A","b":"B","c":"C"}}';

      var f = AliasFormatter.fromJSON(json.decode(text));
      expect(f.alias('a'), 'A');
      expect(f.alias('c'), 'C');
    });

    test('toJSON', () {
      var formatter = AliasFormatter(aliases: {'a': 'A', 'b': 'B', 'c': 'C'});
      expect(formatter.toJSON(), '{"aliases":{"a":"A","b":"B","c":"C"}}');
    });

    test('object methods', () {
      var f1 = AliasFormatter(aliases: {'a': 'A', 'b': 'B', 'c': 'C'});
      var f2 = AliasFormatter(aliases: {'a': 'A', 'b': 'B', 'c': 'C'});
      var f3 = AliasFormatter(aliases: {'x': 'A', 'y': 'B', 'z': 'C'});

      expect(f1, equals(f1));
      expect(f1, equals(f2));
      expect(f2, equals(f1));
      expect(f1, isNot(equals(f3)));
      expect(f3, isNot(equals(f1)));

      expect(f1.hashCode, equals(f2.hashCode));
      expect(f1.hashCode, isNot(equals(f3.hashCode)));
    });
  });
}
