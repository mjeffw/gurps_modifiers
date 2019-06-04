import 'dart:math';

import 'package:gurps_enhancers/src/modifier.dart';

///
/// Trait: An advantage, attribute, disadvantage, skill, or other character
/// “building block” that affects game play and costs points to add, modify,
/// or remove.
///
class Trait {
  ///
  /// cp: Character Points
  ///
  final int baseCost;

  final _modifiers = <Modifier>[];

  Trait({this.baseCost});

  ///
  /// Find the net modifier, and then apply this modifier to the base cost of
  /// the trait. Round the resulting cost up to the next-highest whole number.
  ///
  int get cost => (netModifier * 0.01 * baseCost).ceil() + baseCost;

  ///
  /// Total the modifiers to find the net modifier. Modifiers can never reduce
  /// cost by more than 80%. Treat a net modifier of -80% or worse as -80%.
  ///
  int get netModifier => max(
      -80,
      (_modifiers.isEmpty)
          ? 0
          : _modifiers.map((m) => m.percentage).reduce((a, b) => a + b));

  ///
  /// A modifier is a feature that you can add to a trait – usually an
  /// advantage – to change the way it works. You can apply any number of
  /// modifiers to a trait.
  ///
  void add(Modifier mod) {
    _modifiers.add(mod);
  }
}
