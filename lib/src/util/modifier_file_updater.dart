import 'dart:io';

import 'package:gurps_modifiers/src/modifiers.dart';

void main() async {
  var modifiers = ModifierTemplates.instance();
  var contents = modifiers.printSourceData();

  print(contents);

  // Write file
  var fileCopy =
      await File('lib/src/modifier_temp.json').writeAsString(contents);
  print(await fileCopy.exists());
  print(await fileCopy.length());
}
