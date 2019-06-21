import 'dart:math';

import 'package:gurps_modifiers/src/modifier.dart';

///
/// Trait: An advantage, attribute, disadvantage, skill, or other character
/// “building block” that affects game play and costs points to add, modify,
/// or remove.
///
class Trait {
  ///
  /// Name of this trait.
  ///
  final String name;

  ///
  /// cp: Character Points
  ///
  final int baseCost;

  final bool hasLevels;

  ///
  /// A modifier is a feature that you can add to a trait – usually an
  /// advantage – to change the way it works. You can apply any number of
  /// modifiers to a trait.
  ///
  final List<Modifier> _modifiers;

  const Trait({this.name, this.baseCost, bool hasLevels, List<Modifier> mods})
      : _modifiers = mods ?? const <Modifier>[],
        this.hasLevels = hasLevels ?? false;

  List<Modifier> get modifiers => List.unmodifiable(_modifiers);

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
          : _modifiers.map((m) => m.value).reduce((a, b) => a + b));
}
