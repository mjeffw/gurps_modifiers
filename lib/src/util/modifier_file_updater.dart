import 'dart:io';

import 'package:gurps_enhancers/src/modifiers.dart';

main() async {
  var contents = '''
String modifierDataString = \'\'\'
  ${modifiers.printSourceData()}
\'\'\';
''';

  // Write file
  var fileCopy =
      await File('lib/src/modifier_data.dart').writeAsString(contents);
  print(await fileCopy.exists());
  print(await fileCopy.length());
}
