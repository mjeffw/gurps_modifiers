import 'dart:convert';

import 'package:quiver/collection.dart';
import 'package:quiver/core.dart';

String deleteTrailing(String text, String other) {
  if (text.endsWith(other)) {
    text = text.substring(0, text.length - other.length);
  }
  return text.trim();
}

bool attributeMapsEqual(Map<String, dynamic> map, Map<String, dynamic> other) {
  if (map == other) return true;
  if (map == null || other == null) return false;
  if (map.length != other.length) return false;

  for (final k in map.keys) {
    var bValue = other[k];
    if (bValue == null && !other.containsKey(k)) return false;

    var aValue = map[k];
    if (bValue == null && aValue == null) continue;
    if (identical(aValue, bValue)) continue;

    if (!identical(aValue.runtimeType, bValue.runtimeType)) return false;

    if (aValue is List) {
      if (!listsEqual(aValue, bValue)) return false;
    } else if (aValue is Map) {
      if (!mapsEqual(aValue, bValue)) return false;
    } else if (aValue != bValue) return false;
  }

  return true;
}

class MyMap<K, V> extends DelegatingMap<K, V> {
  @override
  final Map<K, V> delegate;

  MyMap({this.delegate});

  @override
  int get hashCode => hashObjects([...delegate.values, ...delegate.keys]);
}

class MyList<T> extends DelegatingList {
  @override
  final List<T> delegate;

  MyList({this.delegate});

  @override
  int get hashCode => hashObjects(delegate);
}

mixin HasAttributes {
  Map<String, dynamic> get attributeMap;

  ///
  /// Inheritable equals operator using the object's attributeMap.
  ///
  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    return identical(this.runtimeType, other.runtimeType) &&
        attributeMapsEqual(this.attributeMap, other.attributeMap);
  }

  ///
  /// Inheritable hashCode implementation using the object's attributeMap.
  ///
  @override
  int get hashCode => hashObjects(attributeMap.values);

  ///
  /// Encode JSON from the object's attributes
  ///
  String toJSON() => json.encode(attributeMap);

  Map<String, dynamic> toJson() => attributeMap;
}
