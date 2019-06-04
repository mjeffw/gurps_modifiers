import 'package:gurps_enhancers/src/modifier.dart';
import 'package:test/test.dart';

void main() {
  group('Modifier', () {
    test('Constructor and percentage (default)', () {
      var mod = Modifier(name: 'bar');
      expect(mod.percentage, 0);
      expect(mod.isEnhancement, true);
      expect(mod.isLimitation, false);
      expect(mod.toString(), '+0%');
      expect(mod.name, 'bar');
    });

    test('Positive percentage', () {
      var mod = Modifier(percentage: 20, name: 'foo');
      expect(mod.isEnhancement, true);
      expect(mod.isLimitation, false);
      expect(mod.percentage, 20);
      expect(mod.toString(), '+20%');
      expect(mod.name, 'foo');
    });

    test('Negative percentage', () {
      var mod = Modifier(percentage: -50, name: 'baz');
      expect(mod.isEnhancement, false);
      expect(mod.isLimitation, true);
      expect(mod.percentage, -50);
      expect(mod.toString(), '-50%');
    });

    test('null name', () {
      expect(() => Modifier(name: null, percentage: 0),
          throwsA(isA<AssertionError>()));
    });
  });

  group('leveled enhancer ', () {
    test('defaults', () {
      var mod = LeveledModifier(valuePerLevel: 5, name: 'Baz');
      expect(mod, isA<Modifier>());
      expect(mod.basePercentage, 0);
      expect(mod.valuePerLevel, 5);
      expect(mod.level, 1);
      expect(mod.percentage, 5);
      expect(mod.isEnhancement, true);
      expect(mod.isLimitation, false);
      expect(mod.toString(), '+5%');
    });

    test('negative valuePerLevel in constructor', () {
      expect(() => LeveledModifier(valuePerLevel: -1, level: 1, name: 'Baz'),
          throwsA(isA<AssertionError>()));
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
      expect(mod.basePercentage, 0);
      expect(mod.valuePerLevel, 5);
      expect(mod.level, 3);
      expect(mod.percentage, 15);
      expect(mod.isEnhancement, true);
      expect(mod.isLimitation, false);
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
          name: 'Bar', levelPercentages: <int>[10, 20, 40, 50, 100]);
      expect(mod, isA<Modifier>());
      expect(mod.level, 1);
      expect(mod.percentage, 10);
      expect(mod.isEnhancement, true);
      expect(mod.isLimitation, false);
      expect(mod.toString(), '+10%');
    });

    test('set level inside range', () {
      var mod = VariableModifier(
          levelPercentages: [10, 20, 40, 50, 100], name: 'Aaz');

      mod.level = 4;
      expect(mod.level, 4);
      expect(mod.percentage, 50);

      mod.level = 5;
      expect(mod.level, 5);
      expect(mod.percentage, 100);
    });

    test('set level outside range', () {
      var mod = VariableModifier(
          levelPercentages: [10, 20, 40, 50, 100], name: 'Aaz');
      expect(() => mod.level = 6, throwsA(isA<RangeError>()));
      expect(() => mod.level = 0, throwsA(isA<RangeError>()));
    });
  });
}
