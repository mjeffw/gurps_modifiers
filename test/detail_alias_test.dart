import 'dart:convert';

import 'package:gurps_modifiers/src/detail_alias.dart';
import 'package:test/test.dart';

void main() {
  group('AliasFormatter', () {
    test('no-args constructor', () {
      expect(() => DetailAlias(), throwsA(isA<AssertionError>()));
    });

    test('constructor', () {
      expect(DetailAlias(aliases: {'a': 'A', 'b': 'B'}), isNotNull);
    });

    test('alias', () {
      var f = DetailAlias(aliases: {'a': 'A', 'b': 'B'});
      expect(f.replace('b'), 'B');
      expect(f.replace('a'), 'A');
      expect(f.replace('c'), 'c');
    });

    test('null args alias', () {
      var f = DetailAlias(aliases: {'a': 'A', 'b': 'B'});
      expect(f.replace(null), isNull);
    });

    test('fromJSON -- missing aliases', () {
      expect(DetailAlias.fromJSON(json.decode('{}')), DetailAlias.NULL);
    });

    test('fromJSON', () {
      var text = '{"aliases":{"a":"A","b":"B","c":"C"}}';

      var f = DetailAlias.fromJSON(json.decode(text));
      expect(f.replace('a'), 'A');
      expect(f.replace('c'), 'C');
    });

    test('toJSON', () {
      var formatter = DetailAlias(aliases: {'a': 'A', 'b': 'B', 'c': 'C'});
      expect(formatter.toJSON(), '{"aliases":{"a":"A","b":"B","c":"C"}}');
    });

    test('object methods', () {
      var f1 = DetailAlias(aliases: {'a': 'A', 'b': 'B', 'c': 'C'});
      var f2 = DetailAlias(aliases: {'a': 'A', 'b': 'B', 'c': 'C'});
      var f3 = DetailAlias(aliases: {'x': 'A', 'y': 'B', 'z': 'C'});

      expect(f1, equals(f1));
      expect(f1, equals(f2));
      expect(f2, equals(f1));
      expect(f1, isNot(equals(f3)));
      expect(f3, isNot(equals(f1)));

      expect(f1.hashCode, equals(f2.hashCode));
      expect(f1.hashCode, isNot(equals(f3.hashCode)));
    });
  }, skip: false);
}
