import 'dart:convert';

import 'package:gurps_modifiers/src/level_text_formatter.dart';
import 'package:gurps_modifiers/src/modifier.dart';
import 'package:test/test.dart';

void main() {
  group('modifier', () {
    group('simple', () {
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
                name: 'null', percentage: 0, isAttackModifier: null),
            throwsA(isA<AssertionError>()));
      });

      test('equals and hashCode', () {
        var one = SimpleModifier(
            name: 'test', isAttackModifier: true, percentage: 10);
        var two = SimpleModifier(
            name: 'test', isAttackModifier: true, percentage: 10);
        var three =
            SimpleModifier(name: 'test', isAttackModifier: true, percentage: 9);
        var four = SimpleModifier(
            name: 'test', isAttackModifier: false, percentage: 10);
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

      test('canonical name', () {
        var one = SimpleModifier(
            name: 'test', isAttackModifier: true, percentage: 10);
        expect(one.canonicalName, 'test');

        var two = SimpleModifier(
            name: 'foo', isAttackModifier: false, percentage: -5);
        expect(two.canonicalName, 'foo');
      });

      test('copyOf', () {
        var one = SimpleModifier(
            name: 'test', isAttackModifier: true, percentage: 10);

        var two = SimpleModifier.copyOf(one);
        expect(one.isAttackModifier, two.isAttackModifier);
        expect(one.name, two.name);
        expect(one.canonicalName, two.canonicalName);
        expect(one.percentage, two.percentage);
      });

      test('copyOf - name', () {
        var one = SimpleModifier(
            name: 'test', isAttackModifier: true, percentage: 10);

        var two = SimpleModifier.copyOf(one, name: 'foo');
        expect(one.isAttackModifier, two.isAttackModifier);
        expect(one.name, isNot(two.name));
        expect(one.canonicalName, isNot(two.canonicalName));
        expect(one.percentage, two.percentage);
        expect(two.name, 'foo');
        expect(two.canonicalName, 'foo');
      });

      test('copyOf - isAttackModifier', () {
        var one = SimpleModifier(
            name: 'test', isAttackModifier: true, percentage: 10);

        var two = SimpleModifier.copyOf(one, isAttackModifier: false);
        expect(one.isAttackModifier, isNot(two.isAttackModifier));
        expect(two.isAttackModifier, false);
        expect(one.name, two.name);
        expect(one.canonicalName, two.canonicalName);
        expect(one.percentage, two.percentage);
      });

      test('copyOf - percentage', () {
        var one = SimpleModifier(
            name: 'test', isAttackModifier: true, percentage: 10);

        var two = SimpleModifier.copyOf(one, value: -5);
        expect(one.isAttackModifier, two.isAttackModifier);
        expect(one.name, two.name);
        expect(one.canonicalName, two.canonicalName);
        expect(one.percentage, isNot(two.percentage));
        expect(two.percentage, -5);
      });

      test('fromJSON - minimal', () {
        String source = '''{ "type": "Simple", "name": "Foo" }''';

        SimpleModifier m = SimpleModifier.fromJSON(json.decode(source));
        expect(m.name, 'Foo');
        expect(m.isAttackModifier, false);
        expect(m.percentage, 0);
      });

      test('fromJSON + isAttackModifier', () {
        String source =
            '''{ "type": "Simple", "name": "Foo", "isAttackModifier": true }''';

        SimpleModifier m = SimpleModifier.fromJSON(json.decode(source));
        expect(m.name, 'Foo');
        expect(m.isAttackModifier, true);
        expect(m.percentage, 0);
      });

      test('fromJSON + Percentage', () {
        String source =
            '''{ "type": "Simple", "name": "Bar", "isAttackModifier": false, "percentage": -5 }''';

        SimpleModifier m = SimpleModifier.fromJSON(json.decode(source));
        expect(m.name, 'Bar');
        expect(m.isAttackModifier, false);
        expect(m.percentage, -5);
      });

      test('toJSON', () {
        var expected = '''{
  "type": "Simple",
  "name": "test",
  "percentage": 10,
  "isAttackModifier": true
}''';

        expect(
            SimpleModifier(name: 'test', isAttackModifier: true, percentage: 10)
                .toJSON(),
            expected);
      });

      test('toJSON - template is true', () {
        var expected = '''{
  "type": "Simple",
  "name": "Foo",
  "percentage": -20,
  "isAttackModifier": false
}''';

        expect(
            SimpleModifier(
                    name: 'Foo', isAttackModifier: false, percentage: -20)
                .toJSON(template: true),
            expected);
      });
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
        expect(mod.canonicalName, 'Baz 1');
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
                valuePerLevel: 5, maxLevel: 4, name: 'Baz', level: 6),
            throwsA(isA<AssertionError>()));
      });

      test('valuePerLevel null', () {
        expect(() => LeveledModifier(name: 'foo', valuePerLevel: null),
            throwsA(isA<AssertionError>()));
      });

      test('baseValue null', () {
        expect(
            LeveledModifier(name: 'foo', valuePerLevel: -5, baseValue: null)
                .baseValue,
            0);
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

      test('copyOf - no variation', () {
        var one = LeveledModifier(name: 'bar', valuePerLevel: 5, baseValue: 5);
        var copy = LeveledModifier.copyOf(one);
        expect(one, equals(copy));
      });

      test('copyOf - name', () {
        var one = LeveledModifier(name: 'bar', valuePerLevel: 5, baseValue: 5);
        var copy = LeveledModifier.copyOf(one, name: 'foo');
        expect(one.name, isNot(copy.name));
        expect(one.isAttackModifier, copy.isAttackModifier);
        expect(one.level, copy.level);
        expect(one.maxLevel, copy.maxLevel);
        expect(one.valuePerLevel, copy.valuePerLevel);
        expect(one.baseValue, copy.baseValue);
        expect(one.formatter, copy.formatter);
        expect(copy.name, 'foo');
      });

      test('copyOf - levelPrompt', () {
        var one = LeveledModifier(name: 'bar', valuePerLevel: 5, baseValue: 5);
        var copy = LeveledModifier.copyOf(one, levelPrompt: 'foo');
        expect(one.levelPrompt, isNot(copy.levelPrompt));
        expect(copy.levelPrompt, 'foo');
      });

      test('copyOf - baseValue', () {
        var one = LeveledModifier(name: 'bar', valuePerLevel: 5, baseValue: 5);
        var copy = LeveledModifier.copyOf(one, baseValue: 3);
        expect(one.baseValue, isNot(copy.baseValue));
        expect(copy.baseValue, 3);
      });

      test('copyOf - valuePerLevel', () {
        var one = LeveledModifier(name: 'bar', valuePerLevel: 5, baseValue: 5);
        var copy = LeveledModifier.copyOf(one, valuePerLevel: 3);
        expect(one.valuePerLevel, isNot(copy.valuePerLevel));
        expect(copy.valuePerLevel, 3);
      });

      test('copyOf - maxLevel', () {
        var one = LeveledModifier(name: 'bar', valuePerLevel: 5, baseValue: 5);
        var copy = LeveledModifier.copyOf(one, maxLevel: 8);
        expect(one.maxLevel, isNot(copy.maxLevel));
        expect(copy.maxLevel, 8);
      });

      test('copyOf - level', () {
        var one = LeveledModifier(name: 'bar', valuePerLevel: 5, level: 5);
        var copy = LeveledModifier.copyOf(one, level: 8);
        expect(one.level, isNot(copy.level));
        expect(copy.level, 8);
      });

      test('copyOf - formatter', () {
        var one = LeveledModifier(name: 'bar', valuePerLevel: 5, level: 5);
        var copy = LeveledModifier.copyOf(one,
            formatter: LevelTextFormatter(template: 'dummy'));
        expect(one.formatter, isNot(copy.formatter));
      });

      test('fromJSON -- null type', () {
        var source = '''{}''';
        expect(() => LeveledModifier.fromJSON(json.decode(source)),
            throwsA(isA<AssertionError>()));
      });

      test('fromJSON -- wrong type', () {
        var source = ''' { "type": "null"  }''';
        expect(() => LeveledModifier.fromJSON(json.decode(source)),
            throwsA(isA<AssertionError>()));
      });

      test('fromJSON -- missing name', () {
        var source = '''{ "type": "Leveled" }''';
        expect(() => LeveledModifier.fromJSON(json.decode(source)),
            throwsA(isA<AssertionError>()));
      });

      test('fromJSON -- missing valuePerLevel', () {
        var source = '''{ "type": "Leveled", "name": "Foo" }''';
        expect(() => LeveledModifier.fromJSON(json.decode(source)),
            throwsA(isA<AssertionError>()));
      });

      test('fromJSON -- minimal', () {
        var source =
            '''{ "type": "Leveled", "name": "Foo", "valuePerLevel": 7 }''';
        var m = LeveledModifier.fromJSON(json.decode(source));
        expect(m.name, 'Foo');
        expect(m.isAttackModifier, false);
        expect(m.level, 1);
        expect(m.maxLevel, isNull);
        expect(m.baseValue, 0);
        expect(m.levelPrompt, 'Level');
      });

      test('fromJSON -- isAttackModifier', () {
        var source = '''{ "type": "Leveled", "name": "Foo", "valuePerLevel": 7,
            "isAttackModifier": true }''';
        var m = LeveledModifier.fromJSON(json.decode(source));
        expect(m.isAttackModifier, true);
      });

      test('fromJSON -- baseValue', () {
        var source = '''{ "type": "Leveled", "name": "Foo", "valuePerLevel": 7,
            "baseValue": 13 }''';
        var m = LeveledModifier.fromJSON(json.decode(source));
        expect(m.baseValue, 13);
      });

      test('fromJSON -- maxLevel', () {
        var source = '''{ "type": "Leveled", "name": "Foo", "valuePerLevel": 7,
            "maxLevel": 3 }''';
        var m = LeveledModifier.fromJSON(json.decode(source));
        expect(m.maxLevel, 3);
      });

      test('fromJSON -- levelPrompt', () {
        var source = '''{ "type": "Leveled", "name": "Foo", "valuePerLevel": 7,
            "levelPrompt": "bar" }''';
        var m = LeveledModifier.fromJSON(json.decode(source));
        expect(m.levelPrompt, 'bar');
      });

      test('fromJSON -- formatter', () {
        var source = '''{ "type": "Leveled", "name": "Foo", "valuePerLevel": 7,
            "formatter": {"template": "Boo-Ya"} }''';
        var m = LeveledModifier.fromJSON(json.decode(source));
        expect(m.formatter, LevelTextFormatter(template: "Boo-Ya"));
      });

      test('fromJSON -- level', () {
        var source = '''{ "type": "Leveled", "name": "Foo", "valuePerLevel": 7,
            "level": 3 }''';
        var m = LeveledModifier.fromJSON(json.decode(source));
        expect(m.level, 3);
        expect(m.percentage, 21);
      });
    }, skip: false);

    group('variable modifier', () {
      var source = VariableModifier(
          name: 'Bar', levelValues: <int>[10, 20, 40, 50, 100]);

      test('constructor: minimal', () {
        var mod = VariableModifier(
            name: 'Bar', levelValues: <int>[10, 20, 40, 50, 100]);
        expect(mod, isA<Modifier>());
        expect(mod.level, 1);
        expect(mod.percentage, 10);
        expect(mod.isAttackModifier, false);
        expect(mod.toString(), equals(mod.toJSON()));
        expect(mod.canonicalName, 'Bar 1');
      });

      test('constructor + isAttackModifier', () {
        var mod = VariableModifier(
            name: 'Bar',
            levelValues: <int>[10, 20, 40, 50, 100],
            isAttackModifier: true);
        expect(mod.isAttackModifier, true);
      });

      test('constructor + LevelTextFormatter', () {
        var mod = VariableModifier(
            name: 'Bar',
            levelValues: <int>[10, 20, 40, 50, 100],
            formatter: LevelTextFormatter(template: '%f %name'));
        expect(mod.canonicalName, '1 Bar');
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

      test('copyOf', () {
        expect(VariableModifier.copyOf(source), equals(source));
      });

      test('copyOf + name', () {
        expect(source.name, 'Bar');
        var copy = VariableModifier.copyOf(source, name: 'Foo');
        expect(copy.name, 'Foo');
      });

      test('copyOf + levelValues', () {
        expect(source.percentage, 10);
        var copy = VariableModifier.copyOf(source, levelValues: [3, 2, 1]);
        expect(copy.percentage, 3);
      });

      test('copyOf + isAttackModifier', () {
        expect(source.isAttackModifier, false);
        var copy = VariableModifier.copyOf(source, isAttackModifier: true);
        expect(copy.isAttackModifier, true);
      });

      test('copyOf + level', () {
        expect(source.level, 1);
        var copy = VariableModifier.copyOf(source, level: 3);
        expect(copy.level, 3);
      });

      test('copyOf + formatter', () {
        expect(source.formatter, LevelTextFormatter(template: '%name %f'));
        var copy = VariableModifier.copyOf(source,
            formatter: LevelTextFormatter(template: ''));
        expect(copy.formatter, LevelTextFormatter(template: ''));
      });

      test('fromJSON - no type', () {
        var source = "{}";
        expect(() => VariableModifier.fromJSON(json.decode(source)),
            throwsA(isA<AssertionError>()));
      });

      test('fromJSON - bad type', () {
        var source = '''{ "type": "dummy"}''';
        expect(() => VariableModifier.fromJSON(json.decode(source)),
            throwsA(isA<AssertionError>()));
      });

      test('fromJSON - only type', () {
        var source = '''{ "type": "Variable"}''';
        expect(() => VariableModifier.fromJSON(json.decode(source)),
            throwsA(isA<Error>()));
      });

      test('fromJSON - missing name', () {
        var source = '''{ "type": "Variable", "levelValues": [1,2,3]}''';
        expect(() => VariableModifier.fromJSON(json.decode(source)),
            throwsA(isA<AssertionError>()));
      });

      test('fromJSON - missing levelValues', () {
        var source = '''{ "type": "Variable", "name": "Foo" }''';
        expect(() => VariableModifier.fromJSON(json.decode(source)),
            throwsA(isA<Error>()));
      });

      test('fromJSON - minimal good', () {
        var source =
            '''{ "type": "Variable", "name": "Foo", "levelValues": [1,2,3] }''';
        var m = VariableModifier.fromJSON(json.decode(source));
        expect(m.name, 'Foo');
        expect(m.isAttackModifier, false);
        expect(m.level, 1);
        expect(m.maxLevel, 3);
        expect(m.percentage, 1);
        expect(m.canonicalName, "Foo 1");
        expect(m.formatter, LevelTextFormatter(template: '%name %f'));
      });

      test('fromJSON - isAttackModifier', () {
        var source =
            '''{ "type": "Variable", "name": "Foo", "levelValues": [1,2,3], "isAttackModifier": true }''';
        var m = VariableModifier.fromJSON(json.decode(source));
        expect(m.isAttackModifier, true);
      });

      test('fromJSON - formatter', () {
        var source =
            '''{ "type": "Variable", "name": "Bar", "levelValues": [1,2,3], 
            "formatter": { "template": "%f %name" } }''';
        var m = VariableModifier.fromJSON(json.decode(source));
        expect(m.canonicalName, '1 Bar');
      });

      test('fromJSON - level', () {
        var source =
            '''{ "type": "Variable", "name": "Bar", "levelValues": [10,20,30], 
            "level": 3 }''';
        var m = VariableModifier.fromJSON(json.decode(source));
        expect(m.level, 3);
        expect(m.percentage, 30);
      });
    }, skip: false);
  }, skip: false);
}
