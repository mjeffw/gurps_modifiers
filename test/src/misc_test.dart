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

    test('armor divison', () {
      var template =
          ModifierTemplates.instance().templateByName('Armor Divisor');
      var text = template.toJSON();
      expect(text, contains('formatter'));
    });

    test('cosmic', () {
      var template = ModifierTemplates.instance().templateByName('Cosmic');
      var text = template.toJSON();
      print(text);
      expect(text, isNot(null));
    });
  });

  //
}
