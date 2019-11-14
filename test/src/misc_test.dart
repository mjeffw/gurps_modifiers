import 'dart:math';

import 'package:gurps_modifiers/src/description_formatter.dart';
import 'package:gurps_modifiers/src/modifiers.dart';
import 'package:test/test.dart';

void main() {
  group('toJSON', () {
    test('simple', () {
      var template = ModifierTemplates.instance()
          .templateByName('Accessibility, Only at day');
      var text = template.toJSON();
      expect(text, isNot(contains('null')));
    });

    test('level', () {
      var template =
          ModifierTemplates.instance().templateByName('Can Carry Objects');
      var text = template.toJSON();
      expect(text, isNot(contains('formatter')));
    });

    test('armor divisor', () {
      var template =
          ModifierTemplates.instance().templateByName('Armor Divisor');
      var text = template.toJSON();
      expect(text, contains('formatter'));
    }, skip: true);

    test('cosmic', () {
      var template = ModifierTemplates.instance().templateByName('Cosmic');
      var text = template.toJSON();
      print(text);
      expect(text, isNot(null));
    });
  }, skip: true);

  group('pattern', () {
    group('1, 2, 5, 10, 20, 50, ...', () {
      test('power of 10', () {
        expect(exponent(0), 0);
        expect(exponent(1), 0);
        expect(exponent(2), 0);
        expect(exponent(3), 1);
        expect(exponent(6), 2);
        expect(exponent(9), 3);
      });

      test('multiple', () {
        expect(mult(0), 1);
        expect(mult(1), 2);
        expect(mult(2), 5);
        expect(mult(3), 1);
        expect(mult(4), 2);
        expect(mult(5), 5);
        expect(mult(6), 1);
      });

      test('full equation', () {
        expect(equation(0), 1);
        expect(equation(1), 2);
        expect(equation(2), 5);
        expect(equation(3), 10);
        expect(equation(4), 20);
        expect(equation(5), 50);
        expect(equation(6), 100);
      });
    });
  }, skip: true);
}

int mult(int i) => pow((i % 3), 2) + 1;

int exponent(int level) => level ~/ 3;

int equation(int level) => (pow((level % 3), 2) + 1) * pow(10, level ~/ 3);
