
mixin ModifierData {
  String get detail;
  int get level;
}

enum CyclicInterval { PerSecond, Per10Seconds, PerMinute, PerHour, PerDay }
enum ContagionType { None, Mildly, Highly }

mixin CyclicData implements ModifierData {
  CyclicInterval get interval;
  int get cycles;
  bool get resistible;
  ContagionType get contagion;
}
