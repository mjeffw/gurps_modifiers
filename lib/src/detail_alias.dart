import 'dart:convert';

import 'util/generic.dart';

class DetailAlias with HasAttributes {
  static final DetailAlias NULL = DetailAlias(aliases: {});

  final MyMap<String, String> aliases;

  DetailAlias({Map<String, String> aliases})
      : assert(aliases != null),
        aliases = MyMap(delegate: aliases);

  factory DetailAlias.fromJSON(Map<String, dynamic> json) {
    if (json == null || json['aliases'] == null) return DetailAlias.NULL;
    return DetailAlias(
      aliases: json['aliases'].map<String, String>(
          (key, value) => MapEntry(key.toString(), value.toString())),
    );
  }

  String replace(String detail) => aliases[detail] ?? detail;

  @override
  Map<String, dynamic> get attributeMap => {'aliases': aliases};

  ///
  /// Encode JSON from the object's attributes
  ///
  String toJSON() => json.encode(attributeMap);

  dynamic toJson() => attributeMap;
}
