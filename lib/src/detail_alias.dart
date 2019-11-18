import 'dart:convert';

import 'util/generic.dart';

class AliasFormatter with HasAttributes {
  final MyMap<String, String> aliases;

  AliasFormatter({Map<String, String> aliases})
      : assert(aliases != null),
        aliases = MyMap(delegate: aliases);

  factory AliasFormatter.fromJSON(Map<String, dynamic> json) {
    return AliasFormatter(
      aliases: json['aliases'] == null
          ? null
          : json['aliases'].map<String, String>(
              (key, value) => MapEntry(key.toString(), value.toString())),
    );
  }

  String alias(String detail) => aliases[detail] ?? detail;

  @override
  Map<String, dynamic> get attributeMap => {'aliases': aliases};

  ///
  /// Encode JSON from the object's attributes
  ///
  String toJSON() => json.encode(attributeMap);
}
