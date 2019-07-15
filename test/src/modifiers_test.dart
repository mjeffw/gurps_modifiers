import 'package:gurps_modifiers/src/modifiers.dart';
import 'package:test/test.dart';

main() {
  group('modifiers', () {
    test('fetch returns a new object', () {
      var m1 = Modifiers.instance().fetch('Accurate');
      var m2 = Modifiers.instance().fetch('Accurate');
      expect(m1, isNot(same(m2)));
    }, skip: false);

    test('printSourceData', () {
      print(Modifiers.instance().printSourceData());
    }, skip: false);

    test('fetchKeys', () {
      expect(Modifiers.instance().fetchKeys(), contains('Accurate'));
    });
  }, skip: false);
}
