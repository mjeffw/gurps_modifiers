import 'dart:convert';

import 'package:gurps_modifiers/src/description_formatter.dart';
import 'package:gurps_modifiers/src/modifier_template.dart';
import 'package:gurps_modifiers/src/template_subtypes.dart';
import 'package:test/test.dart';

import 'data.dart';

void main() {
  group('templates', () {
    group('simple', () {
      test('Constructor and percentage (default)', () {
        var mod = SimpleModifierTemplate(name: 'bar');
        expect(mod.percentage(Data()), 0);
        expect(mod.name, 'bar');
      });

      test('Positive percentage', () {
        var mod = SimpleModifierTemplate(percentage: 20, name: 'foo');
        expect(mod.percentage(Data()), 20);
        expect(mod.name, 'foo');
        expect(mod.toString(), equals(mod.toJson().toString()));
      });

      test('Negative percentage', () {
        var mod = SimpleModifierTemplate(percentage: -50, name: 'baz');
        expect(mod.percentage(Data()), -50);
      });

      test('null percentage', () {
        expect(() => SimpleModifierTemplate(name: 'null', percentage: null),
            throwsA(isA<AssertionError>()));
      });

      test('null name', () {
        expect(() => SimpleModifierTemplate(name: null, percentage: 0),
            throwsA(isA<AssertionError>()));
      });

      test('null isAttackModifier', () {
        expect(
            () => SimpleModifierTemplate(
                name: 'null', percentage: 0, isAttackModifier: null),
            throwsA(isA<AssertionError>()));
      });

      test('equals and hashCode', () {
        var one = SimpleModifierTemplate(
            name: 'test', isAttackModifier: true, percentage: 10);
        var two = SimpleModifierTemplate(
            name: 'test', isAttackModifier: true, percentage: 10);
        var three = SimpleModifierTemplate(
            name: 'test', isAttackModifier: true, percentage: 9);
        var four = SimpleModifierTemplate(
            name: 'test', isAttackModifier: false, percentage: 10);
        var five = SimpleModifierTemplate(
            name: 'foo', isAttackModifier: true, percentage: 10);

        expect(one, equals(one));
        expect(one == two, true);
        expect(two == one, true);
        expect(one.hashCode, equals(two.hashCode));
        expect(one, isNot(same(two)));
        expect(one != three, true);
        expect(one.hashCode, isNot(equals(three.hashCode)));
        expect(one != four, true);
        expect(one.hashCode, isNot(equals(four.hashCode)));
        expect(one != five, true);
        expect(one.hashCode, isNot(equals(five.hashCode)));
      });

      test('fromJSON - minimal', () {
        String source = '''{ "type": "Simple", "name": "Foo" }''';

        SimpleModifierTemplate m =
            SimpleModifierTemplate.fromJSON(json.decode(source));
        expect(m.name, 'Foo');
        expect(m.isAttackModifier, false);
        expect(m.percentage(Data()), 0);
      });

      test('fromJSON + isAttackModifier', () {
        String source =
            '''{ "type": "Simple", "name": "Foo", "isAttackModifier": true }''';

        SimpleModifierTemplate m =
            SimpleModifierTemplate.fromJSON(json.decode(source));
        expect(m.name, 'Foo');
        expect(m.isAttackModifier, true);
        expect(m.percentage(Data()), 0);
      });

      test('fromJSON + Percentage', () {
        String source =
            '''{ "type": "Simple", "name": "Bar", "isAttackModifier": false, "percentage": -5 }''';

        SimpleModifierTemplate m =
            SimpleModifierTemplate.fromJSON(json.decode(source));
        expect(m.name, 'Bar');
        expect(m.isAttackModifier, false);
        expect(m.percentage(Data()), -5);
      });

      test('toJSON', () {
        var expected =
            '{"name":"test","isAttackModifier":true,"type":"Simple","percentage":10}';

        expect(
            SimpleModifierTemplate(
                    name: 'test', isAttackModifier: true, percentage: 10)
                .toJSON(),
            expected);
      });

      test('toJSON - template is true', () {
        var expected = '{"name":"Foo","type":"Simple","percentage":-20}';

        expect(
            SimpleModifierTemplate(
                    name: 'Foo', isAttackModifier: false, percentage: -20)
                .toJSON(),
            expected);
      });
    });

    group('leveled enhancer ', () {
      test('defaults', () {
        var mod = LeveledTemplate(valuePerLevel: 5, name: 'Baz');
        expect(mod, isA<ModifierTemplate>());
        expect(mod.baseValue, 0);
        expect(mod.valuePerLevel, 5);
        expect(mod.percentage(Data(level: 1)), 5);
        expect(mod.toString(), equals(mod.toJson().toString()));
      });

      test('negative valuePerLevel in constructor', () {
        var mod = LeveledTemplate(valuePerLevel: -1, name: 'Baz');
        expect(mod.valuePerLevel, -1);
        expect(mod.percentage(Data(level: 1)), -1);
      });

      test('level greater than 1', () {
        var mod = LeveledTemplate(valuePerLevel: 5, name: 'Baz');
        expect(mod, isA<ModifierTemplate>());
        expect(mod.baseValue, 0);
        expect(mod.valuePerLevel, 5);
        expect(mod.percentage(Data(level: 3)), 15);
      });

      test('valuePerLevel null', () {
        expect(() => LeveledTemplate(name: 'foo', valuePerLevel: null),
            throwsA(isA<AssertionError>()));
      });

      test('baseValue null', () {
        expect(
            LeveledTemplate(name: 'foo', valuePerLevel: -5, baseValue: null)
                .baseValue,
            0);
      });

      test('hashCode -- name & valuePerLevel', () {
        var one = LeveledTemplate(name: 'bar', valuePerLevel: 5);
        var two = LeveledTemplate(name: 'bar', valuePerLevel: 5);
        var three = LeveledTemplate(name: 'bar', valuePerLevel: -5);

        expect(one, isNot(same(true)));
        expect(one, equals(two));
        expect(one.hashCode, equals(two.hashCode));
        expect(one, isNot(equals(three)));
        expect(one.hashCode, isNot(equals(three.hashCode)));
      });

      test('hashCode -- name', () {
        var one = LeveledTemplate(name: 'bar', valuePerLevel: 5);
        var two = LeveledTemplate(name: 'bar', valuePerLevel: 5);
        var three = LeveledTemplate(name: 'foo', valuePerLevel: 5);

        expect(one, isNot(same(two)));
        expect(one, equals(two));
        expect(one.hashCode, equals(two.hashCode));
        expect(one, isNot(equals(three)));
        expect(one.hashCode, isNot(equals(three.hashCode)));
      });

      test('hashCode -- maxLevel', () {
        var one = LeveledTemplate(name: 'bar', valuePerLevel: 5, maxLevel: 5);
        var two = LeveledTemplate(name: 'bar', valuePerLevel: 5, maxLevel: 5);
        var three = LeveledTemplate(name: 'bar', valuePerLevel: 5, maxLevel: 4);

        expect(one, isNot(same(true)));
        expect(one, equals(two));
        expect(one.hashCode, equals(two.hashCode));
        expect(one, isNot(equals(three)));
        expect(one.hashCode, isNot(equals(three.hashCode)));
      });

      test('hashCode -- baseValue', () {
        var one = LeveledTemplate(name: 'bar', valuePerLevel: 5, baseValue: 5);
        var two = LeveledTemplate(name: 'bar', valuePerLevel: 5, baseValue: 5);
        var three =
            LeveledTemplate(name: 'bar', valuePerLevel: 5, baseValue: 4);

        expect(one, equals(one));
        expect(one, isNot(same(true)));
        expect(one, equals(two));
        expect(one.hashCode, equals(two.hashCode));
        expect(one, isNot(equals(three)));
        expect(one.hashCode, isNot(equals(three.hashCode)));
      });
      test('fromJSON -- null type', () {
        var source = '''{}''';
        expect(() => LeveledTemplate.fromJSON(json.decode(source)),
            throwsA(isA<AssertionError>()));
      });

      test('fromJSON -- wrong type', () {
        var source = ''' { "type": "null"  }''';
        expect(() => LeveledTemplate.fromJSON(json.decode(source)),
            throwsA(isA<AssertionError>()));
      });

      test('fromJSON -- missing name', () {
        var source = '''{ "type": "Leveled" }''';
        expect(() => LeveledTemplate.fromJSON(json.decode(source)),
            throwsA(isA<AssertionError>()));
      });

      test('fromJSON -- missing valuePerLevel', () {
        var source = '''{ "type": "Leveled", "name": "Foo" }''';
        expect(() => LeveledTemplate.fromJSON(json.decode(source)),
            throwsA(isA<AssertionError>()));
      });

      test('fromJSON -- minimal', () {
        var source =
            '''{ "type": "Leveled", "name": "Foo", "valuePerLevel": 7 }''';
        var m = LeveledTemplate.fromJSON(json.decode(source));
        expect(m.name, 'Foo');
        expect(m.isAttackModifier, false);
        expect(m.maxLevel, isNull);
        expect(m.baseValue, 0);
        expect(m.levelPrompt, 'Level');
      });

      test('fromJSON -- isAttackModifier', () {
        var source = '''{ "type": "Leveled", "name": "Foo", "valuePerLevel": 7,
            "isAttackModifier": true }''';
        var m = LeveledTemplate.fromJSON(json.decode(source));
        expect(m.isAttackModifier, true);
      });

      test('fromJSON -- baseValue', () {
        var source = '''{ "type": "Leveled", "name": "Foo", "valuePerLevel": 7,
            "baseValue": 13 }''';
        var m = LeveledTemplate.fromJSON(json.decode(source));
        expect(m.baseValue, 13);
      });

      test('fromJSON -- maxLevel', () {
        var source = '''{ "type": "Leveled", "name": "Foo", "valuePerLevel": 7,
            "maxLevel": 3 }''';
        var m = LeveledTemplate.fromJSON(json.decode(source));
        expect(m.maxLevel, 3);
      });

      test('fromJSON -- levelPrompt', () {
        var source = '''{ "type": "Leveled", "name": "Foo", "valuePerLevel": 7,
            "levelPrompt": "bar" }''';
        var m = LeveledTemplate.fromJSON(json.decode(source));
        expect(m.levelPrompt, 'bar');
      });

      test('fromJSON -- formatter', () {
        var source = '''{ "type": "Leveled", "name": "Foo", "valuePerLevel": 7,
            "formatter": {"type": "Level","template": "Boo-Ya"} }''';
        var m = LeveledTemplate.fromJSON(json.decode(source));
        expect(m.formatter, LevelFormatter(template: "Boo-Ya"));
      });
    });

    group('variable modifier', () {
      test('constructor: minimal', () {
        var mod = VariableLeveledTemplate(
            name: 'Bar', levelValues: <int>[10, 20, 40, 50, 100]);
        expect(mod, isA<ModifierTemplate>());
        expect(mod.percentage(Data(level: 1)), 10);
        expect(mod.isAttackModifier, false);
        expect(mod.toString(), equals(mod.toJson().toString()));
      });

      test('constructor + isAttackModifier', () {
        var mod = VariableLeveledTemplate(
            name: 'Bar',
            levelValues: <int>[10, 20, 40, 50, 100],
            isAttackModifier: true);
        expect(mod.isAttackModifier, true);
      });

      test('equals and hashCode -- name', () {
        var one = VariableLeveledTemplate(levelValues: [1, 2, 3], name: 'foo');
        var two = VariableLeveledTemplate(levelValues: [1, 2, 3], name: 'foo');
        var three =
            VariableLeveledTemplate(levelValues: [1, 2, 3], name: 'bar');

        expect(one, isNot(same(two)));
        expect(one, equals(two));
        expect(one.hashCode, equals(two.hashCode));
        expect(one, isNot(equals(three)));
        expect(one.hashCode, isNot(equals(three.hashCode)));
      });

      test('equals and hashCode -- levelValues', () {
        var one = VariableLeveledTemplate(levelValues: [1, 2, 3], name: 'foo');
        var two = VariableLeveledTemplate(levelValues: [1, 2, 3], name: 'foo');
        var three =
            VariableLeveledTemplate(levelValues: [1, 2, 4], name: 'foo');

        expect(one, equals(one));
        expect(one, isNot(same(two)));
        expect(one, equals(two));
        expect(one.hashCode, equals(two.hashCode));
        expect(one, isNot(equals(three)));
        expect(one.hashCode, isNot(equals(three.hashCode)));
      });

      test('fromJSON - no type', () {
        var source = "{}";
        expect(() => VariableLeveledTemplate.fromJSON(json.decode(source)),
            throwsA(isA<AssertionError>()));
      });

      test('fromJSON - bad type', () {
        var source = '''{ "type": "dummy"}''';
        expect(() => VariableLeveledTemplate.fromJSON(json.decode(source)),
            throwsA(isA<AssertionError>()));
      });

      test('fromJSON - only type', () {
        var source = '''{ "type": "Variable"}''';
        expect(() => VariableLeveledTemplate.fromJSON(json.decode(source)),
            throwsA(isA<Error>()));
      });

      test('fromJSON - missing name', () {
        var source = '''{ "type": "Variable", "levelValues": [1,2,3]}''';
        expect(() => VariableLeveledTemplate.fromJSON(json.decode(source)),
            throwsA(isA<AssertionError>()));
      });

      test('fromJSON - missing levelValues', () {
        var source = '''{ "type": "Variable", "name": "Foo" }''';
        expect(() => VariableLeveledTemplate.fromJSON(json.decode(source)),
            throwsA(isA<Error>()));
      });

      test('fromJSON - minimal good', () {
        var source =
            '''{ "type": "Variable", "name": "Foo", "levelValues": [1,2,3] }''';
        var m = VariableLeveledTemplate.fromJSON(json.decode(source));
        expect(m.name, 'Foo');
        expect(m.isAttackModifier, false);
        expect(m.maxLevel, 3);
        expect(m.percentage(Data(level: 1)), 1);
        expect(m.formatter, LevelFormatter(template: '%name %f'));
      });

      test('fromJSON - isAttackModifier', () {
        var source =
            '''{ "type": "Variable", "name": "Foo", "levelValues": [1,2,3], "isAttackModifier": true }''';
        var m = VariableLeveledTemplate.fromJSON(json.decode(source));
        expect(m.isAttackModifier, true);
      });

      test('fromJSON - formatter', () {
        var source =
            '''{ "type": "Variable", "name": "Bar", "levelValues": [1,2,3], 
            "formatter": { "type": "Level","template": "%f %name" } }''';
        BaseLeveledTemplate m =
            VariableLeveledTemplate.fromJSON(json.decode(source));
        expect(m.describe(Data(level: 1)), '1 Bar');
      });
    });

    group('cyclic', () {
      test('fromJSON - empty', () {
        var source = '''{}''';
        var m = CyclicModifierTemplate.fromJSON(json.decode(source));
        expect(m.name, 'Cyclic');
        expect(m.isAttackModifier, true);
      });
    });

    group('accessibility modifier', () {});
  }, skip: false);
}
