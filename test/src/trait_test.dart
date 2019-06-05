import 'package:gurps_enhancers/src/trait.dart';
import 'package:gurps_enhancers/src/modifier.dart';
import 'package:test/test.dart';

void main() {
  group('trait', () {
    test('constructor and cost', () {
      var trait = Trait(baseCost: 10);
      expect(trait.baseCost, 10);
      expect(trait.cost, 10);
      expect(trait.netModifier, 0);
    });
  });

  group('trait with modifier', () {
    test('enhancement', () {
      // Enhancements increase the cost, while limitations reduce the cost.
      // This is expressed as a percentage. For instance, a +20% enhancement
      // would increase the point cost of an advantage by 1/5 its base cost.
      var trait = Trait(baseCost: 20);
      trait.add(Modifier(value: 20, name: 'Foo'));
      expect(trait.cost, 24);
    });

    test('limitation', () {
      // ... while limitations reduce the cost. For instance, ... a -50%
      // limitation would reduce it by half its base cost.
      var trait = Trait(baseCost: 20);
      trait.add(Modifier(value: -50, name: 'Foo'));
      expect(trait.cost, 10);
    });

    test('multiple Enhancements and Limitations', () {
      // For example, a +10% enhancement, a +40% enhancement, a -30%
      // limitation, and a -45% limitation would give a net modifier of -25%.
      // This would reduce the cost of a 10-point advantage to 7.5 points,
      // which would round up to 8 points.
      var trait = Trait(baseCost: 10);
      trait.add(Modifier(value: 10, name: 'Foo'));
      trait.add(Modifier(value: 40, name: 'Foo'));
      trait.add(Modifier(value: -30, name: 'Foo'));
      trait.add(Modifier(value: -45, name: 'Foo'));
      expect(trait.netModifier, -25);
      expect(trait.cost, 8);
    });

    test('limitations more than -80', () {
      /// Modifiers can never reduce cost by more than 80%. Treat a net
      /// modifier of -80% or worse as -80%. Thus, no matter how many
      /// limitations you take, you cannot lower the cost of a trait to less
      /// than 1/5 its base cost.
      var trait = Trait(baseCost: 10);
      trait.add(Modifier(value: 10, name: 'Foo'));
      trait.add(Modifier(value: 40, name: 'Foo'));
      trait.add(Modifier(value: -30, name: 'Foo'));
      trait.add(Modifier(value: -20, name: 'Foo'));
      trait.add(Modifier(value: -45, name: 'Foo'));
      trait.add(Modifier(value: -45, name: 'Foo'));
      expect(trait.netModifier, -80);
      expect(trait.cost, 2);
    });
  });
}