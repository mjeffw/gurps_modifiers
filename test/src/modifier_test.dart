import 'package:gurps_modifiers/src/modifier.dart';
import 'package:test/test.dart';

void main() {
  group('Modifier', () {
    test('Constructor and percentage (default)', () {
      var mod = Modifier(name: 'bar');
      expect(mod.value, 0);
      expect(mod.toString(), '+0%');
      expect(mod.name, 'bar');
    });

    test('Positive percentage', () {
      var mod = Modifier(value: 20, name: 'foo');
      expect(mod.value, 20);
      expect(mod.toString(), '+20%');
      expect(mod.name, 'foo');
    });

    test('Negative percentage', () {
      var mod = Modifier(value: -50, name: 'baz');
      expect(mod.value, -50);
      expect(mod.toString(), '-50%');
    });

    test('null name', () {
      expect(
          () => Modifier(name: null, value: 0), throwsA(isA<AssertionError>()));
    });
  });

  group('leveled enhancer ', () {
    test('defaults', () {
      var mod = LeveledModifier(valuePerLevel: 5, name: 'Baz');
      expect(mod, isA<Modifier>());
      expect(mod.baseValue, 0);
      expect(mod.valuePerLevel, 5);
      expect(mod.level, 1);
      expect(mod.value, 5);
      expect(mod.toString(), '+5%');
    });

    test('negative valuePerLevel in constructor', () {
      var mod = LeveledModifier(valuePerLevel: -1, level: 1, name: 'Baz');
      expect(mod.valuePerLevel, -1);
      expect(mod.value, -1);
      mod.level = 3;
      expect(mod.value, -3);
    });

    test('negative level in constructor', () {
      expect(() => LeveledModifier(valuePerLevel: 1, level: -1, name: 'Baz'),
          throwsA(isA<AssertionError>()));
    });

    test('negative level in setter', () {
      var mod = LeveledModifier(valuePerLevel: 5, name: 'Baz');
      expect(() => mod.level = -1, throwsA(isA<RangeError>()));
    });

    test('level greater than 1', () {
      var mod = LeveledModifier(valuePerLevel: 5, level: 3, name: 'Baz');
      expect(mod, isA<Modifier>());
      expect(mod.baseValue, 0);
      expect(mod.valuePerLevel, 5);
      expect(mod.level, 3);
      expect(mod.value, 15);
      expect(mod.toString(), '+15%');
    });

    test('max level', () {
      var mod = LeveledModifier(valuePerLevel: 5, maxLevel: 4, name: 'Baz');

      mod.level = 4;
      expect(mod.level, 4);

      expect(() => mod.level = 6, throwsA(isA<RangeError>()));
    });
  });

  group('variable modifier', () {
    test('constructor', () {
      var mod = VariableModifier(
          name: 'Bar', levelValues: <int>[10, 20, 40, 50, 100]);
      expect(mod, isA<Modifier>());
      expect(mod.level, 1);
      expect(mod.value, 10);
      expect(mod.toString(), '+10%');
    });

    test('set level inside range', () {
      var mod =
          VariableModifier(levelValues: [10, 20, 40, 50, 100], name: 'Aaz');

      mod.level = 4;
      expect(mod.level, 4);
      expect(mod.value, 50);

      mod.level = 5;
      expect(mod.level, 5);
      expect(mod.value, 100);
    });

    test('set level outside range', () {
      var mod =
          VariableModifier(levelValues: [10, 20, 40, 50, 100], name: 'Aaz');
      expect(() => mod.level = 6, throwsA(isA<RangeError>()));
      expect(() => mod.level = 0, throwsA(isA<RangeError>()));
    });
  });
}
