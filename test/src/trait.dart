import 'dart:math';

import 'package:gurps_modifiers/src/modifier_template.dart';

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
  /// Unmodified character point cost.
  ///
  /// If the trait has levels, this is the cost per level. Otherwise it is the
  /// flat cost of the trait.
  ///
  final int baseCost;

  ///
  /// True if this trait is leveled.
  ///
  final bool hasLevels;

  ///
  /// If this trait has levels, the cost per level.
  ///
  final int numberOfLevels;

  ///
  /// A modifier is a feature that you can add to a trait – usually an
  /// advantage – to change the way it works. You can apply any number of
  /// modifiers to a trait.
  ///
  final List<ModifierTemplate> modifiers;

  const Trait(
      {this.name,
      this.baseCost,
      bool hasLevels,
      List<ModifierTemplate> modifiers,
      this.numberOfLevels})
      : modifiers = modifiers ?? const <ModifierTemplate>[],
        this.hasLevels = hasLevels ?? false;

  ///
  /// Cost of the trait, including levels, but before applying modifiers
  ///
  int get unmodifiedCost => hasLevels ? baseCost * numberOfLevels : baseCost;

  ///
  /// Find the net modifier, and then apply this modifier to the base cost of
  /// the trait. Round the resulting cost up to the next-highest whole number.
  ///
  int get cost => (netModifier * 0.01 * unmodifiedCost).ceil() + unmodifiedCost;

  ///
  /// Total the modifiers to find the net modifier. Modifiers can never reduce
  /// cost by more than 80%. Treat a net modifier of -80% or worse as -80%.
  ///
  int get netModifier => max(
      -80,
      (modifiers.isEmpty)
          ? 0
          : modifiers.map((m) => m.percentage).reduce((a, b) => a + b));
}
