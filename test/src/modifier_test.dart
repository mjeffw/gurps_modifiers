import 'package:gurps_modifiers/src/modifier.dart';
import 'package:test/test.dart';

void main() {
  group('modifier', () {
    test('Constructor and percentage (default)', () {
      var mod = SimpleModifier(name: 'bar');
      expect(mod.percentage, 0);
      expect(mod.name, 'bar');
      expect(mod.canonicalName, mod.canonicalName);
    });

    test('Positive percentage', () {
      var mod = SimpleModifier(percentage: 20, name: 'foo');
      expect(mod.percentage, 20);
      expect(mod.name, 'foo');
      expect(mod.toString(), equals(mod.toJSON()));
    });

    test('Negative percentage', () {
      var mod = SimpleModifier(percentage: -50, name: 'baz');
      expect(mod.percentage, -50);
    });

    test('null percentage', () {
      expect(() => SimpleModifier(name: 'null', percentage: null),
          throwsA(isA<AssertionError>()));
    });

    test('null name', () {
      expect(() => SimpleModifier(name: null, percentage: 0),
          throwsA(isA<AssertionError>()));
    });

    test('null isAttackModifier', () {
      expect(
          () => SimpleModifier(
                name: 'null',
                percentage: 0,
                isAttackModifier: null,
              ),
          throwsA(isA<AssertionError>()));
    });

    test('equals and hashCode', () {
      var one =
          SimpleModifier(name: 'test', isAttackModifier: true, percentage: 10);
      var two =
          SimpleModifier(name: 'test', isAttackModifier: true, percentage: 10);
      var three =
          SimpleModifier(name: 'test', isAttackModifier: true, percentage: 9);
      var four =
          SimpleModifier(name: 'test', isAttackModifier: false, percentage: 10);
      var five =
          SimpleModifier(name: 'foo', isAttackModifier: true, percentage: 10);

      expect(one, equals(one));
      expect(one == two, true);
      expect(one.hashCode, equals(two.hashCode));
      expect(one, isNot(same(two)));
      expect(one != three, true);
      expect(one.hashCode, isNot(equals(three.hashCode)));
      expect(one != four, true);
      expect(one.hashCode, isNot(equals(four.hashCode)));
      expect(one != five, true);
      expect(one.hashCode, isNot(equals(five.hashCode)));
    });

    group('leveled enhancer ', () {
      test('defaults', () {
        var mod = LeveledModifier(valuePerLevel: 5, name: 'Baz');
        expect(mod, isA<Modifier>());
        expect(mod.baseValue, 0);
        expect(mod.valuePerLevel, 5);
        expect(mod.level, 1);
        expect(mod.percentage, 5);
        expect(mod.toString(), equals(mod.toJSON()));
      });

      test('negative valuePerLevel in constructor', () {
        var mod = LeveledModifier(valuePerLevel: -1, level: 1, name: 'Baz');
        expect(mod.valuePerLevel, -1);
        expect(mod.percentage, -1);
      });

      test('negative level in constructor', () {
        expect(() => LeveledModifier(valuePerLevel: 1, level: -1, name: 'Baz'),
            throwsA(isA<AssertionError>()));
      });

      test('level greater than 1', () {
        var mod = LeveledModifier(valuePerLevel: 5, level: 3, name: 'Baz');
        expect(mod, isA<Modifier>());
        expect(mod.baseValue, 0);
        expect(mod.valuePerLevel, 5);
        expect(mod.level, 3);
        expect(mod.percentage, 15);
      });

      test('max level', () {
        expect(
            () => LeveledModifier(
                  valuePerLevel: 5,
                  maxLevel: 4,
                  name: 'Baz',
                  level: 6,
                ),
            throwsA(isA<AssertionError>()));
      });

      test('valuePerLevel null', () {
        expect(() => LeveledModifier(name: 'foo', valuePerLevel: null),
            throwsA(isA<AssertionError>()));
      });

      test('hashCode -- name & valuePerLevel', () {
        var one = LeveledModifier(name: 'bar', valuePerLevel: 5);
        var two = LeveledModifier(name: 'bar', valuePerLevel: 5);
        var three = LeveledModifier(name: 'bar', valuePerLevel: -5);

        expect(one, isNot(same(true)));
        expect(one, equals(two));
        expect(one.hashCode, equals(two.hashCode));
        expect(one, isNot(equals(three)));
        expect(one.hashCode, isNot(equals(three.hashCode)));
      });

      test('hashCode -- level', () {
        var one = LeveledModifier(name: 'bar', valuePerLevel: 5, level: 5);
        var two = LeveledModifier(name: 'bar', valuePerLevel: 5, level: 5);
        var three = LeveledModifier(name: 'bar', valuePerLevel: 5, level: 4);

        expect(one, isNot(same(true)));
        expect(one, equals(two));
        expect(one.hashCode, equals(two.hashCode));
        expect(one, isNot(equals(three)));
        expect(one.hashCode, isNot(equals(three.hashCode)));
      });

      test('hashCode -- maxLevel', () {
        var one = LeveledModifier(name: 'bar', valuePerLevel: 5, maxLevel: 5);
        var two = LeveledModifier(name: 'bar', valuePerLevel: 5, maxLevel: 5);
        var three = LeveledModifier(name: 'bar', valuePerLevel: 5, maxLevel: 4);

        expect(one, isNot(same(true)));
        expect(one, equals(two));
        expect(one.hashCode, equals(two.hashCode));
        expect(one, isNot(equals(three)));
        expect(one.hashCode, isNot(equals(three.hashCode)));
      });

      test('hashCode -- baseValue', () {
        var one = LeveledModifier(name: 'bar', valuePerLevel: 5, baseValue: 5);
        var two = LeveledModifier(name: 'bar', valuePerLevel: 5, baseValue: 5);
        var three =
            LeveledModifier(name: 'bar', valuePerLevel: 5, baseValue: 4);

        expect(one, equals(one));
        expect(one, isNot(same(true)));
        expect(one, equals(two));
        expect(one.hashCode, equals(two.hashCode));
        expect(one, isNot(equals(three)));
        expect(one.hashCode, isNot(equals(three.hashCode)));
      });
    });

    group('variable modifier', () {
      test('constructor', () {
        var mod = VariableModifier(
            name: 'Bar', levelValues: <int>[10, 20, 40, 50, 100]);
        expect(mod, isA<Modifier>());
        expect(mod.level, 1);
        expect(mod.percentage, 10);
        expect(mod.toString(), equals(mod.toJSON()));
      });

      test('set level inside range', () {
        var mod = VariableModifier(
            levelValues: [10, 20, 40, 50, 100], name: 'Aaz', level: 4);
        expect(mod.level, 4);
        expect(mod.percentage, 50);

        mod = VariableModifier(
            levelValues: [10, 20, 40, 50, 100], name: 'Aaz', level: 5);
        expect(mod.level, 5);
        expect(mod.percentage, 100);
      });

      test('set level outside range', () {
        expect(
            () => VariableModifier(
                levelValues: [10, 20, 40, 50, 100], name: 'Aaz', level: 6),
            throwsA(isA<AssertionError>()));
        expect(
            () => VariableModifier(
                levelValues: [10, 20, 40, 50, 100], name: 'Aaz', level: 0),
            throwsA(isA<AssertionError>()));
      });

      test('equals and hashCode -- name', () {
        var one = VariableModifier(levelValues: [1, 2, 3], name: 'foo');
        var two = VariableModifier(levelValues: [1, 2, 3], name: 'foo');
        var three = VariableModifier(levelValues: [1, 2, 3], name: 'bar');

        expect(one, isNot(same(two)));
        expect(one, equals(two));
        expect(one.hashCode, equals(two.hashCode));
        expect(one, isNot(equals(three)));
        expect(one.hashCode, isNot(equals(three.hashCode)));
      });

      test('equals and hashCode -- levelValues', () {
        var one = VariableModifier(levelValues: [1, 2, 3], name: 'foo');
        var two = VariableModifier(levelValues: [1, 2, 3], name: 'foo');
        var three = VariableModifier(levelValues: [1, 2, 4], name: 'foo');

        expect(one, equals(one));
        expect(one, isNot(same(two)));
        expect(one, equals(two));
        expect(one.hashCode, equals(two.hashCode));
        expect(one, isNot(equals(three)));
        expect(one.hashCode, isNot(equals(three.hashCode)));
      });
    });
  }, skip: true);
}
