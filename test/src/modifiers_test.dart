import 'dart:io';

import 'package:gurps_modifiers/src/modifiers.dart';
import 'package:test/test.dart';

void main() {
  group('modifiers', () {
    test('fetch returns a new object', () {
      var m1 = ModifierTemplates.instance().templateByName('Accurate');
      var m2 = ModifierTemplates.instance().templateByName('Accurate');
      expect(m1, isNot(same(m2)));
    });

    test('printSourceData', () async {
      var derived = ModifierTemplates.instance().printSourceData();

      var file = File('lib/src/modifier_data.json');
      var contents;

      if (await file.exists()) {
        // Read file
        contents = await file.readAsString();
      }
      expect(derived, contents);
    });

    test('fetchKeys', () {
      expect(ModifierTemplates.instance().fetchKeys(), contains('Accurate'));
    });
  }, skip: false);
}
