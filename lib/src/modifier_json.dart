import 'dart:io';

class ModifierData {
  String contents;
  ModifierData() {
    var file = File('lib/src/modifier_data.json');

    if (file.existsSync()) {
      this.contents = file.readAsStringSync();
    }
  }
}
