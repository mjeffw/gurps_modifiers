import 'package:gurps_modifiers/src/modifiers.dart';
import 'package:test/test.dart';

main() {
  group('modifiers', () {
    test('fetch returns a new object', () {
      var m1 = ModifierTemplates.instance().templateByName('Accurate');
      var m2 = ModifierTemplates.instance().templateByName('Accurate');
      expect(m1, isNot(same(m2)));
    }, skip: false);

    test('printSourceData', () {
      print(ModifierTemplates.instance().printSourceData());
    }, skip: false);

    test('fetchKeys', () {
      expect(ModifierTemplates.instance().fetchKeys(), contains('Accurate'));
    });
  }, skip: false);
}
