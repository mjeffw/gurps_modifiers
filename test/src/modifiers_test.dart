import 'package:gurps_modifiers/src/modifiers.dart';
import 'package:test/test.dart';

main() {
  test('fetch returns a new object', () {
    var m1 = modifiers.fetch('Accurate');
    var m2 = modifiers.fetch('Accurate');
    expect(m1, isNot(same(m2)));
  }, skip: true);

  test('printSourceData', () {
    print(modifiers.printSourceData());
  }, skip: true);
}
