import 'dart:io';

import 'package:gurps_modifiers/src/modifiers.dart';

main() async {
  ModifierTemplates modifiers = ModifierTemplates.instance();
  var contents = '''
String modifierDataString = \'\'\'
  ${modifiers.printSourceData()}
\'\'\';
''';

  // Write file
  var fileCopy =
      await File('lib/src/modifier_json.dart').writeAsString(contents);
  print(await fileCopy.exists());
  print(await fileCopy.length());
}
