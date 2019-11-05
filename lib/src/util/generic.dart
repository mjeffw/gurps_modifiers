String reverseString(String s) {
  return s.codeUnits.reversed
      .map((it) => String.fromCharCode(it))
      .reduce((a, b) => a + b);
}

Map<String, T> jsonToMap<T>(Map<String, dynamic> json, String elementName) {
  List<dynamic> x = json[elementName];
  Map<String, T> map = {};
  x.forEach((f) {
    String name = f['key'];
    T value = f['value'] as T;
    map[name] = value;
  });
  return map;
}

String mapToJson<T>(Map<String, T> map, {String prefix = ''}) {
  var reduce = map.keys.map((key) {
    T map2 = map[key];
    if (map2 is String) {
      map2 = '"$map2"' as T;
    }
    var entry = '$prefix\t"key": "$key",\n$prefix\t"value": ${map2}';
    return '$prefix{\n${entry}\n$prefix}';
  }).reduce((a, b) => '$a,\n$b');
  return reduce;
}
