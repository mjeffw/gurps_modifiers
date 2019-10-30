import 'package:gurps_modifiers/modifier_data.dart';
import 'package:gurps_modifiers/src/modifier.dart';
import 'package:gurps_modifiers/src/modifiers.dart';
import 'package:test/test.dart';

main() {
  group('named variants', () {
    group('Afects (In)substantial', () {
      test('Insubstantial', () {
        var mod = Modifiers.instance().byName('Affects Insubstantial');
        expect(mod.percentage, 20);
        expect(mod.isAttackModifier, false);
        expect(mod.description, 'Affects Insubstantial');
      });

      test('Insubstantial, Selective', () {
        var mod = Modifiers.instance().byName('Affects Insubstantial');
        mod = Modifier.copyWith(mod, detail: 'Selective');

        expect(mod.percentage, 30);
        expect(mod.isAttackModifier, false);
        expect(mod.description, 'Affects Insubstantial, Selective');
      });

      test('Insubstantial, Bad Variation', () {
        var mod = Modifiers.instance().byName('Affects Insubstantial');
        expect(() => Modifier.copyWith(mod, detail: 'Bad Variation'),
            throwsA(isA<AssertionError>()));
      });

      test('Substantial', () {
        var mod = Modifiers.instance().byName('Affects Substantial');
        expect(mod.percentage, 40);
        expect(mod.isAttackModifier, false);
        expect(mod.description, 'Affects Substantial');
      });

      test('Substantial, Selective', () {
        var mod = Modifiers.instance().byName('Affects Substantial');
        mod = Modifier.copyWith(mod, detail: 'Selective');
        expect(mod.percentage, 50);
        expect(mod.isAttackModifier, false);
        expect(mod.description, 'Affects Substantial, Selective');
      });
    });

    group('AP Ammo', () {
      test('default (Piercing)', () {
        var mod = Modifiers.instance().byName('AP Ammo');
        expect(mod.percentage, 20);
        expect(mod.isAttackModifier, true);
        expect(mod.description, 'AP Ammo, Piercing');
      });
      test('Huge Piercing', () {
        var mod = Modifiers.instance().byName('AP Ammo');
        mod = Modifier.copyWith(mod, detail: 'Huge Piercing');
        expect(mod.percentage, 45);
        expect(mod.isAttackModifier, true);
        expect(mod.description, 'AP Ammo, Huge Piercing');
      });
      test('Large Piercing', () {
        var mod = Modifiers.instance().byName('AP Ammo');
        mod = Modifier.copyWith(mod, detail: 'Large Piercing');
        expect(mod.percentage, 35);
        expect(mod.isAttackModifier, true);
        expect(mod.description, 'AP Ammo, Large Piercing');
      });
    });
  });

  group('Cosmic', () {
    Modifier mod;

    setUp(() async {
      mod = Modifiers.instance().byName('Cosmic');
    });

    test('default', () {
      expect(mod.percentage, 50);
      expect(mod.isAttackModifier, false);
      expect(mod.description, 'Cosmic, Adding Utility');
    });

    test('Avoiding drawbacks', () {
      var m2 = Modifier.copyWith(mod, detail: 'Avoiding drawbacks');
      expect(m2.percentage, 50);
      expect(m2.description, 'Cosmic, Avoiding drawbacks');
    });

    test('Defensive', () {
      var m2 = Modifier.copyWith(mod, detail: 'Defensive');
      expect(m2.percentage, 50);
      expect(m2.description, 'Cosmic, Defensive');
    });

    test('Irresistible attack', () {
      var m2 = Modifier.copyWith(mod, detail: 'Irresistible attack');
      expect(m2.percentage, 300);
      expect(m2.description, 'Cosmic, Irresistible attack');
    });

    test('Lingering effect', () {
      var m2 = Modifier.copyWith(mod, detail: 'Lingering effect');
      expect(m2.percentage, 100);
      expect(m2.description, 'Cosmic, Lingering effect');
    });

    test('No active defense allowed', () {
      var m2 = Modifier.copyWith(mod, detail: 'No active defense allowed');
      expect(m2.percentage, 300);
      expect(m2.description, 'Cosmic, No active defense allowed');
    });

    test('No die roll required', () {
      var m2 = Modifier.copyWith(mod, detail: 'No die roll required');
      expect(m2.percentage, 100);
      expect(m2.description, 'Cosmic, No die roll required');
    });

    test('No Rule of 16', () {
      var m2 = Modifier.copyWith(mod, detail: 'No Rule of 16');
      expect(m2.percentage, 50);
      expect(m2.description, 'Cosmic, No Rule of 16');
    });

    test('Privileged attack', () {
      var m2 = Modifier.copyWith(mod, detail: 'Privileged attack');
      expect(m2.percentage, 50);
      expect(m2.description, 'Cosmic, Privileged attack');
    });

    test('Unhealing damage', () {
      var m2 = Modifier.copyWith(mod, detail: 'Unhealing damage');
      expect(m2.percentage, 100);
      expect(m2.description, 'Cosmic, Unhealing damage');
    });

    test('Unrestricted powers', () {
      var m2 = Modifier.copyWith(mod, detail: 'Unrestricted powers');
      expect(m2.percentage, 300);
      expect(m2.description, 'Cosmic, Unrestricted powers');
    });
  });

  group('Delay', () {
    Modifier m1;

    setUp(() {
      m1 = Modifiers.instance().byName('Delay');
    });

    test('Fixed', () {
      var mod = Modifier.copyWith(m1, detail: 'Fixed');
      expect(mod.percentage, 0);
      expect(mod.isAttackModifier, true);
      expect(mod.description, 'Delay, Fixed');
    });

    test('Supernatural (fixed)', () {
      var mod = Modifier.copyWith(m1, detail: 'Supernatural, fixed');
      expect(mod.percentage, 50);
      expect(mod.isAttackModifier, true);
      expect(mod.description, 'Delay, Supernatural, fixed');
    });

    test('Supernatural (variable)', () {
      var mod = Modifier.copyWith(m1, detail: 'Supernatural, variable');
      expect(mod.percentage, 100);
      expect(mod.isAttackModifier, true);
      expect(mod.description, 'Delay, Supernatural, variable');
    });

    test('Variable (short)', () {
      var mod = Modifier.copyWith(m1, detail: 'Variable, short');
      expect(mod.percentage, 10);
      expect(mod.isAttackModifier, true);
      expect(mod.description, 'Delay, Variable, short');
    });

    test('Variable (long)', () {
      var mod = Modifier.copyWith(m1, detail: 'Variable, long');
      expect(mod.percentage, 20);
      expect(mod.isAttackModifier, true);
      expect(mod.description, 'Delay, Variable, long');
    });

    test('Triggered', () {
      var mod = Modifier.copyWith(m1, detail: 'Triggered');
      expect(mod.percentage, 50);
      expect(mod.isAttackModifier, true);
      expect(mod.description, 'Delay, Triggered');
    });
  });

  group('Simple enhancers', () {
    //TODO: Ammo options value is reduced by 5% if it takes a second to switch
    // between ammo types.
    test('Aura', () {
      var mod = Modifiers.instance().byName('Aura');
      expect(mod.percentage, 80);
      expect(mod.isAttackModifier, true);
      expect(mod.description, 'Aura');
    });

    test('Based on (Attribute)', () {
      var mod = Modifiers.instance().byName('Based On');
      expect(mod.percentage, 20);
      expect(mod.isAttackModifier, false);
      expect(mod.description, 'Based On (Attribute)');

      var m2 = Modifier.copyWith(mod, detail: 'ST');
      expect(m2.percentage, 20);
      expect(m2.description, 'Based On ST');
    });

    test('Based on (Attribute), Own Roll', () {
      var mod = Modifiers.instance().byName('Based On, Own Roll');
      expect(mod.percentage, 20);
      expect(mod.isAttackModifier, false);
      expect(mod.description, 'Based On (Attribute), Own Roll');

      var m2 = Modifier.copyWith(mod, detail: 'Will');
      expect(m2.description, 'Based On Will, Own Roll');
    });

    test('Decreased Immunity 0', () {
      var mod = Modifiers.instance().byName('Decreased Immunity 0');
      expect(mod.percentage, 20);
      expect(mod.isAttackModifier, false);
    });

    test('Dehydration', () {
      var mod = Modifiers.instance().byName('Dehydration');
      expect(mod.percentage, 20);
      expect(mod.isAttackModifier, true);
    });

    test('Destructive Parry', () {
      var mod = Modifiers.instance().byName('Destructive Parry');
      expect(mod.percentage, 10);
      expect(mod.isAttackModifier, true);
    });

    test('Double Blunt Trauma', () {
      var mod = Modifiers.instance().byName('Double Blunt Trauma');
      expect(mod.percentage, 20);
      expect(mod.isAttackModifier, true);
    });

    test('Double Knockback', () {
      var mod = Modifiers.instance().byName('Double Knockback');
      expect(mod.percentage, 20);
      expect(mod.isAttackModifier, true);
    });

    //TODO: Mobile is mutually exclusive with Drifting.
    test('Drifting', () {
      var mod = Modifiers.instance().byName('Drifting');
      expect(mod.percentage, 20);
      expect(mod.isAttackModifier, true);
    });

    test('Drowning', () {
      var mod = Modifiers.instance().byName('Drowning');
      expect(mod.percentage, 0);
      expect(mod.isAttackModifier, true);
    });

    test('Dual', () {
      var mod = Modifiers.instance().byName('Dual');
      expect(mod.percentage, 10);
      expect(mod.isAttackModifier, true);
    });

    test('Erosive', () {
      var mod = Modifiers.instance().byName('Erosive');
      expect(mod.percentage, 10);
      expect(mod.isAttackModifier, true);
    });

    test('Extended Duration, Permanent', () {
      var mod = Modifiers.instance().byName('Extended Duration, Permanent');
      expect(mod.percentage, 300);
      expect(mod.isAttackModifier, false);
    });

    test('Extended Duration, Permanent, dispellable', () {
      var mod = Modifiers.instance()
          .byName('Extended Duration, Permanent, dispellable');
      expect(mod.percentage, 150);
      expect(mod.isAttackModifier, false);
    });

    test('Fixed Duration', () {
      var mod = Modifiers.instance().byName('Fixed Duration');
      expect(mod.percentage, 0);
      expect(mod.isAttackModifier, false);
    });

    //TODO: Exception: On a passive carrier attack such as Spines, Follow-Up is
    // a -50% limitation.
    //TODO: Follow-Up is a “penetration modifier”; you cannot combine it with
    // other penetration modifiers (although the carrier attack can have them).
    test('Follow-Up, Natural weapon', () {
      var mod = Modifiers.instance().byName('Follow-Up, Natural weapon');
      expect(mod.percentage, 0);
      expect(mod.isAttackModifier, false);
    });

    //TODO: Follow-Up, Universal is a "penetration modifier"; you cannot
    // combine it with other penetration modifiers.
    test('Follow-Up, Universal', () {
      var mod = Modifiers.instance().byName('Follow-Up, Universal');
      expect(mod.percentage, 50);
      expect(mod.isAttackModifier, false);
    });

    test('Force Field', () {
      var mod = Modifiers.instance().byName('Force Field');
      expect(mod.percentage, 20);
      expect(mod.isAttackModifier, false);
    });

    test('Freezing', () {
      var mod = Modifiers.instance().byName('Freezing');
      expect(mod.percentage, 20);
      expect(mod.isAttackModifier, true);
    });

    test('Game Time', () {
      var mod = Modifiers.instance().byName('Game Time');
      expect(mod.percentage, 0);
      expect(mod.isAttackModifier, false);
    });

    test('Guided', () {
      var mod = Modifiers.instance().byName('Guided');
      expect(mod.percentage, 50);
      expect(mod.isAttackModifier, true);
    });

    test('Heat', () {
      var mod = Modifiers.instance().byName('Heat');
      expect(mod.percentage, 20);
      expect(mod.isAttackModifier, true);
    });

    test('Incendiary, Non-burning', () {
      var mod = Modifiers.instance().byName('Incendiary, Non-burning');
      expect(mod.percentage, 10);
      expect(mod.isAttackModifier, true);
    });

    //TODO: Ammo options value is reduced by 5% if it takes a second to switch
    // between ammo types.
    test('HP Ammo, Piercing', () {
      var mod = Modifiers.instance().byName('HP Ammo, Piercing');
      expect(mod.percentage, 20);
      expect(mod.isAttackModifier, true);
    });

    //TODO: Ammo options value is reduced by 5% if it takes a second to switch
    // between ammo types.
    test('HP Ammo, Large piercing', () {
      Modifier mod = Modifiers.instance().byName('HP Ammo, Large piercing');
      expect(mod.percentage, 20);
      expect(mod.isAttackModifier, true);
    });

    //TODO: Ammo options value is reduced by 5% if it takes a second to switch
    // between ammo types.
    test('HP Ammo, Small piercing', () {
      var mod = Modifiers.instance().byName('HP Ammo, Small piercing');
      expect(mod.percentage, 40);
      expect(mod.isAttackModifier, true);
    });

    test('Independent', () {
      var mod = Modifiers.instance().byName('Independent');
      expect(mod.percentage, 40);
      expect(mod.isAttackModifier, false);
    });

    test('Independent, Simultaneous uses', () {
      var mod = Modifiers.instance().byName('Independent, Simultaneous uses');
      expect(mod.percentage, 70);
      expect(mod.isAttackModifier, false);
    });

    test('Jet', () {
      var mod = Modifiers.instance().byName('Jet');
      expect(mod.percentage, 0);
      expect(mod.isAttackModifier, true);
    });

    test('Link, Independent', () {
      var mod = Modifiers.instance().byName('Link, Independent');
      expect(mod.percentage, 20);
      expect(mod.isAttackModifier, false);
    });

    test('Link, Permanent', () {
      var mod = Modifiers.instance().byName('Link, Permanent');
      expect(mod.percentage, 10);
      expect(mod.isAttackModifier, false);
    });

    test('Low Signature', () {
      var mod = Modifiers.instance().byName('Low Signature');
      expect(mod.percentage, 10);
      expect(mod.isAttackModifier, true);
    });

    //TODO: Malediction is a "penetration modifier"; you cannot combine it with
    // other penetration modifiers, nor with modifiers that apply only to
    // conventional ranged attacks.
    test('Malediction, -1 per yard', () {
      var mod = Modifiers.instance().byName('Malediction, -1 per yard');
      expect(mod.isAttackModifier, true);
      expect(mod.percentage, 100);
    });

    //TODO: Malediction is a "penetration modifier"; you cannot combine it with
    // other penetration modifiers, nor with modifiers that apply only to
    // conventional ranged attacks.
    test('Malediction, Long-Distance Modifiers', () {
      var mod =
          Modifiers.instance().byName('Malediction, Long-Distance Modifiers');
      expect(mod.isAttackModifier, true);
      expect(mod.percentage, 200);
    });

    //TODO: Malediction is a "penetration modifier"; you cannot combine it with
    // other penetration modifiers, nor with modifiers that apply only to
    // conventional ranged attacks.
    test('Malediction, Size and Speed/Range Table', () {
      var mod = Modifiers.instance()
          .byName('Malediction, Size and Speed/Range Table');
      expect(mod.isAttackModifier, true);
      expect(mod.percentage, 150);
    });

    test('Mental Defense Only', () {
      var mod = Modifiers.instance().byName('Mental Defense Only');
      expect(mod.percentage, 250);
      expect(mod.isAttackModifier, true);
    });

    test('Missed Sleep', () {
      var mod = Modifiers.instance().byName('Missed Sleep');
      expect(mod.percentage, 50);
      expect(mod.isAttackModifier, true);
    });

    //TODO: Ammo options value is reduced by 5% if it takes a second to switch
    // between ammo types.
    test('Multi-Ammo, Large piercing', () {
      var mod = Modifiers.instance().byName('Multi-Ammo, Large piercing');
      expect(mod.percentage, 65);
      expect(mod.isAttackModifier, true);
    });

    //TODO: Ammo options value is reduced by 5% if it takes a second to switch
    // between ammo types.
    test('Multi-Ammo, Piercing', () {
      var mod = Modifiers.instance().byName('Multi-Ammo, Piercing');
      expect(mod.percentage, 40);
      expect(mod.isAttackModifier, true);
    });

    test('No Signature', () {
      var mod = Modifiers.instance().byName('No Signature');
      expect(mod.percentage, 20);
      expect(mod.isAttackModifier, true);
    });

    test('Once On, Stays On', () {
      var mod = Modifiers.instance().byName('Once On, Stays On');
      expect(mod.percentage, 50);
      expect(mod.isAttackModifier, false);
    });

    test('Overhead', () {
      var mod = Modifiers.instance().byName('Overhead');
      expect(mod.percentage, 30);
      expect(mod.isAttackModifier, true);
    });

    test('Persistent', () {
      var mod = Modifiers.instance().byName('Persistent');
      expect(mod.percentage, 40);
      expect(mod.isAttackModifier, true);
    });

    test('Radiation, Toxic', () {
      var mod = Modifiers.instance().byName('Radiation, Toxic');
      expect(mod.percentage, 25);
      expect(mod.isAttackModifier, true);
    });

    test('Radiation, Burning', () {
      var mod = Modifiers.instance().byName('Radiation, Burning');
      expect(mod.percentage, 100);
      expect(mod.isAttackModifier, true);
    });

    test('Ranged', () {
      var mod = Modifiers.instance().byName('Ranged');
      expect(mod.percentage, 40);
      expect(mod.isAttackModifier, false);
    });

    //TODO: Incompatible with Always On, as well as Active Defense and Usually
    // On (both from Powers).
    test('Reflexive', () {
      var mod = Modifiers.instance().byName('Reflexive');
      expect(mod.name, 'Reflexive');
      expect(mod.percentage, 40);
      expect(mod.isAttackModifier, false);
    });

    //TODO: You may only add this enhancement to an Affliction or to an Innate
    // Attack that inflicts toxic or fatigue damage, and you must combine it
    // with one of Area Effect, Cone, or Jet.
    //TODO: Respiratory Agent is a “penetration modifier”; you cannot combine
    // it with other penetration modifiers, such as Follow-Up.
    test('Respiratory Agent', () {
      var mod = Modifiers.instance().byName('Respiratory Agent');
      expect(mod.name, 'Respiratory Agent');
      expect(mod.percentage, 50);
      expect(mod.isAttackModifier, true);
    });

    test('Ricochet', () {
      var mod = Modifiers.instance().byName('Ricochet');
      expect(mod.name, 'Ricochet');
      expect(mod.percentage, 10);
      expect(mod.isAttackModifier, true);
    });

    // TODO You may add this enhancement to any Area Effect or Cone attack.
    test('Selective Area', () {
      var mod = Modifiers.instance().byName('Selective Area');
      expect(mod.name, 'Selective Area');
      expect(mod.percentage, 20);
      expect(mod.isAttackModifier, true);
    });

    test('Selective Effect', () {
      var mod = Modifiers.instance().byName('Selective Effect');
      expect(mod.name, 'Selective Effect');
      expect(mod.percentage, 20);
      expect(mod.isAttackModifier, false);
    });

    test('Selectivity', () {
      var mod = Modifiers.instance().byName('Selectivity');
      expect(mod.name, 'Selectivity');
      expect(mod.percentage, 10);
      expect(mod.isAttackModifier, false);
    });

    //TODO: Incompatible with any modifiers that don’t suit a muscle-powered
    // attack. These include Area Effect, Blood Agent, Cone, Contact Agent,
    // Cyclic, Explosion, Follow-Up, Jet, Malediction, Onset, Resistible,
    // Respiratory Agent, Sense-Based, and any modifier that has one of these
    // modifiers as a prerequisite.
    test('ST-Based', () {
      var mod = Modifiers.instance().byName('ST-Based');
      expect(mod.name, 'ST-Based');
      expect(mod.percentage, 100);
      expect(mod.isAttackModifier, true);
    });

    // TODO It must be combined with the Melee Attack limitation. When making
    // a cutting attack, you may only use your swing damage. When making an
    // impaling attack, you may only use your thrust damage. Crushing attacks
    // may use either. The total damage added by your ST cannot exceed that of
    // the Innate Attack. All-Out Attack (Strong), Mighty Blows, etc., can
    // still be applied to this capped damage.
    test('ST-Based, Limited', () {
      var mod = Modifiers.instance().byName('ST-Based, Limited');
      expect(mod.name, 'ST-Based, Limited');
      expect(mod.percentage, 30);
      expect(mod.isAttackModifier, true);
    });

    test('Starvation', () {
      var mod = Modifiers.instance().byName('Starvation');
      expect(mod.name, 'Starvation');
      expect(mod.percentage, 40);
      expect(mod.isAttackModifier, true);
    });

    test('Suffocation', () {
      var mod = Modifiers.instance().byName('Suffocation');
      expect(mod.name, 'Suffocation');
      expect(mod.percentage, 0);
      expect(mod.isAttackModifier, true);
    });

    test('Super Attribute', () {
      var mod = Modifiers.instance().byName('Super Attribute');
      expect(mod.name, 'Super Attribute');
      expect(mod.percentage, 25);
      expect(mod.isAttackModifier, false);
    });

    test('Surge', () {
      var mod = Modifiers.instance().byName('Surge');
      expect(mod.name, 'Surge');
      expect(mod.percentage, 20);
      expect(mod.isAttackModifier, true);
    });

    test('Surge, Arcing', () {
      var mod = Modifiers.instance().byName('Surge, Arcing');
      expect(mod.name, 'Surge, Arcing');
      expect(mod.percentage, 100);
      expect(mod.isAttackModifier, true);
    });

    test('Surprise Attack', () {
      var mod = Modifiers.instance().byName('Surprise Attack');
      expect(mod.name, 'Surprise Attack');
      expect(mod.percentage, 150);
      expect(mod.isAttackModifier, true);
    });

    test('Switchable', () {
      var mod = Modifiers.instance().byName('Switchable');
      expect(mod.name, 'Switchable');
      expect(mod.percentage, 10);
      expect(mod.isAttackModifier, false);
    });

    test('Thrusting Blade', () {
      var mod = Modifiers.instance().byName('Thrusting Blade');
      expect(mod.name, 'Thrusting Blade');
      expect(mod.percentage, 15);
      expect(mod.isAttackModifier, true);
    });

    test('Time-Spanning, Past or future plus present', () {
      var mod = Modifiers.instance()
          .byName('Time-Spanning, Past or future plus present');
      expect(mod.percentage, 50);
      expect(mod.isAttackModifier, false);
    });

    test('Time-Spanning, Universal', () {
      var mod = Modifiers.instance().byName('Time-Spanning, Universal');
      expect(mod.name, 'Time-Spanning, Universal');
      expect(mod.percentage, 100);
      expect(mod.isAttackModifier, false);
    });

    test('Time-Spanning, Past and future only', () {
      var mod =
          Modifiers.instance().byName('Time-Spanning, Past and future only');
      expect(mod.name, 'Time-Spanning, Past and future only');
      expect(mod.percentage, 50);
      expect(mod.isAttackModifier, false);
    });

    test('Time-Spanning, Past or future only', () {
      var mod =
          Modifiers.instance().byName('Time-Spanning, Past or future only');
      expect(mod.name, 'Time-Spanning, Past or future only');
      expect(mod.percentage, 0);
      expect(mod.isAttackModifier, false);
    });

    test('Underwater', () {
      var mod = Modifiers.instance().byName('Underwater');
      expect(mod.name, 'Underwater');
      expect(mod.percentage, 20);
      expect(mod.isAttackModifier, true);
    });

    test('Usually On', () {
      var mod = Modifiers.instance().byName('Usually On');
      expect(mod.name, 'Usually On');
      expect(mod.percentage, 5);
      expect(mod.isAttackModifier, false);
    });

    test('Variable', () {
      var mod = Modifiers.instance().byName('Variable');
      expect(mod.name, 'Variable');
      expect(mod.percentage, 5);
      expect(mod.isAttackModifier, true);
    });

    test('Wall, Fixed shape', () {
      var mod = Modifiers.instance().byName('Wall, Fixed shape');
      expect(mod.name, 'Wall, Fixed shape');
      expect(mod.percentage, 30);
      expect(mod.isAttackModifier, true);
    });

    test('Wall, Variable shape', () {
      var mod = Modifiers.instance().byName('Wall, Variable shape');
      expect(mod.name, 'Wall, Variable shape');
      expect(mod.percentage, 60);
      expect(mod.isAttackModifier, true);
    });

    test('World-Spanning, Others only', () {
      var mod = Modifiers.instance().byName('World-Spanning, Others only');
      expect(mod.name, 'World-Spanning, Others only');
      expect(mod.percentage, 50);
      expect(mod.isAttackModifier, false);
    });

    test('World-Spanning, Others plus current', () {
      var mod =
          Modifiers.instance().byName('World-Spanning, Others plus current');
      expect(mod.name, 'World-Spanning, Others plus current');
      expect(mod.percentage, 100);
      expect(mod.isAttackModifier, false);
    });
  }, skip: false);

  group('Leveled enhancers', () {
    test('Accurate', () {
      var mod = Modifiers.instance().byName('Accurate');
      expect(mod.isAttackModifier, true);
      expect(mod.percentage, 5);
    });

    test('Affects Others', () {
      var mod = Modifiers.instance().byName('Affects Others');
      expect(mod.isAttackModifier, false);
      expect(mod.percentage, 50);
    });

    test('Area Effect', () {
      var mod = Modifiers.instance().byName('Area Effect');
      expect(mod.isAttackModifier, true);
      expect(mod.percentage, 50);
    });

    //TODO: You cannot combine Cone with Area Effect, Aura, Jet, Melee Attack,
    // Rapid Fire, or Emanation.
    test('Cone', () {
      var mod = Modifiers.instance().byName('Cone');
      expect(mod.isAttackModifier, true);
      expect(mod.percentage, 60);
    });

    test('Decreased Immunity', () {
      var mod = Modifiers.instance().byName('Decreased Immunity');
      expect(mod.isAttackModifier, false);
      expect(mod.percentage, 50);
    });

    test('Explosion', () {
      var mod = Modifiers.instance().byName('Explosion');
      expect(mod.isAttackModifier, true);
      expect(mod.percentage, 50);
    });

    test('Extended Duration', () {
      var mod = Modifiers.instance().byName('Extended Duration');
      expect(mod.isAttackModifier, false);
      expect(mod.percentage, 20);
    });

    test('Extra Passes', () {
      var mod = Modifiers.instance().byName('Extra Passes');
      expect(mod.isAttackModifier, true);
      expect(mod.percentage, 10);
    });

    test('Fragmentation, Cutting', () {
      var mod = Modifiers.instance().byName('Fragmentation, Cutting');
      expect(mod.isAttackModifier, true);
      expect(mod.percentage, 15);
    });

    test('Fragmentation, Hot', () {
      var mod = Modifiers.instance().byName('Fragmentation, Hot');
      expect(mod.isAttackModifier, true);
      expect(mod.percentage, 15);
    });

    test('Fragmentation, Impaling', () {
      var mod = Modifiers.instance().byName('Fragmentation, Impaling');
      expect(mod.isAttackModifier, true);
      expect(mod.percentage, 20);
    });

    test('Fragmentation, Large Piercing', () {
      var mod = Modifiers.instance().byName('Fragmentation, Large Piercing');
      expect(mod.isAttackModifier, true);
      expect(mod.percentage, 15);
    });

    test('Incendiary, Burning', () {
      var mod = Modifiers.instance().byName('Incendiary, Burning');
      expect(mod.isAttackModifier, true);
      expect(mod.percentage, 10);
    });

    test('Increased Range', () {
      var mod = Modifiers.instance().byName('Increased Range');
      expect(mod.isAttackModifier, false);
      expect(mod.percentage, 10);
    });

    test('Long-Range', () {
      var mod = Modifiers.instance().byName('Long-Range');
      expect(mod.isAttackModifier, false);
      expect(mod.percentage, 50);
    });

    test('Low Psychic Signature', () {
      var mod = Modifiers.instance().byName('Low Psychic Signature');
      expect(mod.isAttackModifier, false);
      expect(mod.percentage, 5);
    });

    test('Low Signature, Variable', () {
      var mod = Modifiers.instance().byName('Low Signature, Variable');
      expect(mod.isAttackModifier, false);
      expect(mod.percentage, 5);
    });

    //TODO: You may only add this enhancement to an attack that has both Area
    // Effect and Persistent.
    //TODO: Mobile is mutually exclusive with Drifting.
    test('Mobile', () {
      var mod = Modifiers.instance().byName('Mobile');
      expect(mod.isAttackModifier, true);
      expect(mod.percentage, 40);
    });

    test('Reduced Fatigue Cost', () {
      var mod = Modifiers.instance().byName('Reduced Fatigue Cost');
      expect(mod.isAttackModifier, false);
      expect(mod.percentage, 20);
    });

    //TODO: You cannot add Reduced Time to attack powers, to traits that list
    // any kind of special modifier that affects activation time, or to Magery.
    test('Reduced Time', () {
      var mod = Modifiers.instance().byName('Reduced Time');
      expect(mod.isAttackModifier, false);
      expect(mod.percentage, 20);
    });

    test('Reliable', () {
      var mod = Modifiers.instance().byName('Reliable');
      expect(mod.isAttackModifier, false);
      expect(mod.percentage, 5);
    });
  }, skip: false);

  group('Variable enhancers', () {
    test('Armor Divisor', () {
      var mod = Modifiers.instance().byName('Armor Divisor');
      expect(mod.isAttackModifier, true);
      expect(mod.percentage, -70);
      expect(mod.description, 'Armor Divisor (0.1)');

      mod = Modifier.copyWith(mod, level: 2);
      expect(mod.percentage, -50);
      expect(mod.description, 'Armor Divisor (0.2)');
      mod = Modifier.copyWith(mod, level: 3);
      expect(mod.percentage, -30);
      expect(mod.description, 'Armor Divisor (0.5)');
      mod = Modifier.copyWith(mod, level: 4);
      expect(mod.percentage, 50);
      expect(mod.description, 'Armor Divisor (2)');
      mod = Modifier.copyWith(mod, level: 5);
      expect(mod.percentage, 100);
      expect(mod.description, 'Armor Divisor (3)');
      mod = Modifier.copyWith(mod, level: 6);
      expect(mod.percentage, 150);
      expect(mod.description, 'Armor Divisor (5)');
      mod = Modifier.copyWith(mod, level: 7);
      expect(mod.percentage, 200);
      expect(mod.description, 'Armor Divisor (10)');
    });

    test('Can Carry Objects', () {
      var mod = Modifiers.instance().byName('Can Carry Objects');
      expect(mod.isAttackModifier, false);
      expect(mod.percentage, 10);

      // TODO description?

      mod = Modifier.copyWith(mod, level: 2);
      expect(mod.percentage, 20);

      mod = Modifier.copyWith(mod, level: 3);
      expect(mod.percentage, 50);

      mod = Modifier.copyWith(mod, level: 4);
      expect(mod.percentage, 100);

      mod = Modifier.copyWith(mod, level: 5);
      expect(mod.percentage, 150);
    });

    group('Cyclic', () {
      test('constructor', () {
        var mod = Modifiers.instance().byName('Cyclic');

        expect(mod.isAttackModifier, true);
        expect(mod.percentage, 10);
        expect(mod.description, 'Cyclic, 1 day, 2 cycles');
      });

      test('per interval to max', () {
        var mod = Modifiers.instance().byName('Cyclic') as CyclicModifier;

        mod = CyclicModifier.copyWith(mod, interval: CyclicInterval.PerHour);
        expect(mod.percentage, 20);
        expect(mod.description, 'Cyclic, 1 hour, 2 cycles');

        mod = CyclicModifier.copyWith(mod, interval: CyclicInterval.PerMinute);
        expect(mod.percentage, 40);
        expect(mod.description, 'Cyclic, 1 minute, 2 cycles');

        mod =
            CyclicModifier.copyWith(mod, interval: CyclicInterval.Per10Seconds);
        expect(mod.percentage, 50);
        expect(mod.description, 'Cyclic, 10 seconds, 2 cycles');

        mod = CyclicModifier.copyWith(mod, interval: CyclicInterval.PerSecond);
        expect(mod.percentage, 100);
        expect(mod.description, 'Cyclic, 1 second, 2 cycles');
      });

      test('number of cycles multiplies percentage by (n - 1)', () {
        var mod = Modifiers.instance().byName('Cyclic') as CyclicModifier;

        mod = CyclicModifier.copyWith(mod, cycles: 3);
        expect(mod.percentage, 20);
        expect(mod.description, 'Cyclic, 1 day, 3 cycles');

        mod = CyclicModifier.copyWith(mod, cycles: 4);
        expect(mod.percentage, 30);
        expect(mod.description, 'Cyclic, 1 day, 4 cycles');
      });

      test('number of cycles + interval', () {
        var mod = Modifiers.instance().byName('Cyclic') as CyclicModifier;

        mod = CyclicModifier.copyWith(mod,
            cycles: 3, interval: CyclicInterval.PerSecond);
        expect(mod.percentage, 200);
        expect(mod.description, 'Cyclic, 1 second, 3 cycles');

        mod = CyclicModifier.copyWith(mod,
            cycles: 4, interval: CyclicInterval.PerHour);
        expect(mod.percentage, 60);
        expect(mod.description, 'Cyclic, 1 hour, 4 cycles');
      });

      test('resistible cuts percentage in half', () {
        var mod = Modifiers.instance().byName('Cyclic') as CyclicModifier;

        mod = CyclicModifier.copyWith(mod,
            cycles: 3, interval: CyclicInterval.PerMinute);
        expect(mod.percentage, 80);
        expect(mod.description, 'Cyclic, 1 minute, 3 cycles');

        mod = CyclicModifier.copyWith(mod,
            cycles: 3, interval: CyclicInterval.PerMinute, resistible: true);
        expect(mod.percentage, 40);
        expect(mod.description, 'Cyclic, 1 minute, 3 cycles, Resistible');

        mod = CyclicModifier.copyWith(mod,
            cycles: 5, interval: CyclicInterval.Per10Seconds, resistible: true);
        expect(mod.percentage, 100);
        expect(mod.description, 'Cyclic, 10 seconds, 5 cycles, Resistible');
      });

      test('Mildly Contagious adds +20%', () {
        var mod = Modifiers.instance().byName('Cyclic') as CyclicModifier;

        mod = CyclicModifier.copyWith(mod,
            cycles: 3, interval: CyclicInterval.PerMinute);
        expect(mod.percentage, 80);
        expect(mod.description, 'Cyclic, 1 minute, 3 cycles');

        mod = CyclicModifier.copyWith(mod, contagion: ContagionType.Mildly);
        expect(mod.percentage, 100);
        expect(
            mod.description, 'Cyclic, 1 minute, 3 cycles, Mildly Contagious');

        mod = CyclicModifier.copyWith(mod,
            cycles: 5, interval: CyclicInterval.Per10Seconds);
        expect(mod.percentage, 220);
        expect(
            mod.description, 'Cyclic, 10 seconds, 5 cycles, Mildly Contagious');
      });

      test('Highly Contagious adds +50%', () {
        var mod = Modifiers.instance().byName('Cyclic') as CyclicModifier;

        mod = CyclicModifier.copyWith(mod,
            cycles: 3, interval: CyclicInterval.PerMinute);
        expect(mod.percentage, 80);
        expect(mod.description, 'Cyclic, 1 minute, 3 cycles');

        mod = CyclicModifier.copyWith(mod, contagion: ContagionType.Highly);
        expect(mod.percentage, 130);
        expect(
            mod.description, 'Cyclic, 1 minute, 3 cycles, Highly Contagious');

        mod = CyclicModifier.copyWith(mod,
            interval: CyclicInterval.Per10Seconds, cycles: 5);
        expect(mod.percentage, 250);
        expect(
            mod.description, 'Cyclic, 10 seconds, 5 cycles, Highly Contagious');
      });

      test('take 50% for resistible before +X for contagion', () {
        var mod = Modifiers.instance().byName('Cyclic') as CyclicModifier;

        mod = CyclicModifier.copyWith(mod,
            cycles: 4, interval: CyclicInterval.Per10Seconds);
        expect(mod.percentage, 150);
        expect(mod.description, 'Cyclic, 10 seconds, 4 cycles');

        mod = CyclicModifier.copyWith(mod,
            resistible: true, contagion: ContagionType.Mildly);
        expect(mod.percentage, 95);
        expect(mod.description,
            'Cyclic, 10 seconds, 4 cycles, Resistible, Mildly Contagious');

        mod = CyclicModifier.copyWith(mod, contagion: ContagionType.Highly);
        expect(mod.percentage, 125);
        expect(mod.description,
            'Cyclic, 10 seconds, 4 cycles, Resistible, Highly Contagious');
      });
    });

    test('Increased Range, LOS', () {
      var mod = Modifiers.instance().byName('Increased Range, LOS');
      expect(mod.isAttackModifier, false);
      expect(mod.percentage, 90);

      mod = Modifier.copyWith(mod, level: 2);
      expect(mod.percentage, 80);
      mod = Modifier.copyWith(mod, level: 3);
      expect(mod.percentage, 70);
      mod = Modifier.copyWith(mod, level: 4);
      expect(mod.percentage, 60);
      mod = Modifier.copyWith(mod, level: 5);
      expect(mod.percentage, 50);
      mod = Modifier.copyWith(mod, level: 6);
      expect(mod.percentage, 40);
      mod = Modifier.copyWith(mod, level: 7);
      expect(mod.percentage, 30);
      mod = Modifier.copyWith(mod, level: 8);
      expect(mod.percentage, 20);
      mod = Modifier.copyWith(mod, level: 9);
      expect(mod.percentage, 10);
      mod = Modifier.copyWith(mod, level: 10);
      expect(mod.percentage, 0);
    });

    test('Rapid Fire', () {
      var mod = Modifiers.instance().byName('Rapid Fire');
      expect(mod.isAttackModifier, true);
      expect(mod.percentage, 40);

      mod = Modifier.copyWith(mod, level: 2);
      expect(mod.percentage, 50);

      mod = Modifier.copyWith(mod, level: 3);
      expect(mod.percentage, 70);

      mod = Modifier.copyWith(mod, level: 4);
      expect(mod.percentage, 100);

      mod = Modifier.copyWith(mod, level: 5);
      expect(mod.percentage, 150);

      mod = Modifier.copyWith(mod, level: 6);
      expect(mod.percentage, 200);

      mod = Modifier.copyWith(mod, level: 7);
      expect(mod.percentage, 250);

      mod = Modifier.copyWith(mod, level: 8);
      expect(mod.percentage, 300);
    });

    test('Rapid Fire, Selective', () {
      var mod = Modifiers.instance().byName('Rapid Fire, Selective');
      expect(mod.isAttackModifier, true);
      expect(mod.percentage, 80);

      mod = Modifier.copyWith(mod, level: 2);
      expect(mod.percentage, 110);

      mod = Modifier.copyWith(mod, level: 3);
      expect(mod.percentage, 160);

      mod = Modifier.copyWith(mod, level: 4);
      expect(mod.percentage, 210);

      mod = Modifier.copyWith(mod, level: 5);
      expect(mod.percentage, 260);

      mod = Modifier.copyWith(mod, level: 6);
      expect(mod.percentage, 310);
    });
  }, skip: false);

  //TODO: Blood Agent: -40% limitation UNLESS combined with Area Effect or
  // Cone, in which case it is a 100% enhancement. This is a “penetration
  // modifier”; you cannot combine it with other penetration modifiers,
  // such as Follow-Up.

  //TODO: Contact Agent: -30% limitation UNLESS combined with Area Effect or
  // Cone, in which case it is a 150% enhancement. This is a “penetration
  // modifier”; you cannot combine it with other penetration modifiers,
  // such as Follow-Up.

  //TODO: Corrupting: A trait with this limitation causes you to accumulate
  // Corruption each time it’s used. You gain 1 point of Corruption per point
  // by which Corrupting reduces the cost of the modified trait. Corrupting can
  // also be applied to a disadvantage that offers a self-control roll. In that
  // case, it’s a +20% enhancement, wors- ening the disadvantage. You gain 1
  // point of Corruption per 5 points of unmodified disadvantage value each
  // time you fail a self-control roll.

  //TODO: Decide how Homing seeks its target: with ordinary vision or a
  // sensory advantage such as Detect, Infravision, Night Vision, Scanning
  // Sense, or Vibration Sense. Homing costs a base +50%, plus 1% per point
  // the chosen homing mechanism would cost if bought as an advantage (with-
  // out any modifiers); e.g., Infravision costs 10 points, making Homing
  // (Infravision) +60%. Ordinary vision uses the base +50%.

  //TODO: The cost of Melee-Capable is +40%, plus whatever the value of the
  // equivalent Melee Attack (p B112) limitation would be. For example, Melee-
  // Capable, Reach 1-4, is a +25% enhancement, while Melee-Capable, Reach C,
  // Cannot Parry, is a +5% one.
  // You may switch between the two modes as a free action at the beginning of
  // your turn; if it takes a Ready maneuver to switch, add -5% to the final
  // value of this enhancement; this cannot reduce cost below +5%.
  //
  // Could be implemented as a composite -- select all the options, and
  // calculate the percentage?

  //TODO: The cost of Follow-Up equals the sum of the costs of whichever of
  //  the following modifiers apply to the carrier attack: Always On, Aura,
  //  Cone, Drifting, Emanation, Emergencies Only, Extra Recoil, Guided,
  //  Homing, Increased Range, Jet, Limited Use, Malediction, Melee Attack,
  //  Preparation Required, Rapid Fire, Reduced Range, Takes Extra Time, Takes
  //  Recharge, Unconscious Only, Uncontrollable, or Unreliable. If none of
  //  these modifiers apply to the carrier attack, Follow-Up costs +0%.

  //TODO: Rapid Fire, Multiple Projectile: Each shot splits into multiple
  // projectiles after you attack, like a shotgun blast or forked lightning.
  // Express this as a multiplier following RoF; for instance, RoF 3¥4 means
  // each of three shots fired divides into four individual projectiles.
  // Modifier cost is based on the RoF times the multiplier; e.g., RoF 3x4
  // costs the same as RoF 12.

  //TODO: Sense-based: Must specify the sense(s) affected. Cost is worth +150%,
  // plus an extra +50% per sense after the first. Sense-Based is a
  // “penetration modifier”; you cannot combine it with other penetration
  // modifiers, such as Follow-Up.
  //
  // Exception: You can combine Sense-Based with Malediction. In conjunction
  // with Malediction, or when added to an ability that already ignores DR
  // (e.g., Mind Control or Mind Reading), Sense-Based becomes a limitation.
  // It is worth -20% if it works through one sense, -15% if two senses, or
  // -10% if three senses. If it works through more than three senses, it is
  // not a significant limitation.

  //TODO: Side Effect: You may only add this enhancement to an Innate Attack,
  // and you cannot combine it with penetration modifiers other than Armor
  // Divisor. Choose the side effects from the effects described for
  // Affliction. Valid choices are stunning, Attribute Penalty, Disadvantage,
  // and Incapacitation. The cost of Side Effect is a base +50%, plus the cost
  // of the Affliction enhancements. For instance, stunning would be +50%,
  // while Disadvantage (Blindness) would be +100%.
  //
  // You may specify more than one side effect. If the victim gets a single
  // resistance roll against all of them, treat them as a single Side Effect
  // enhancement, totaling their cost.

  //TODO: Symptoms: Choose Symptoms from the following effects described as
  // enhancements for Affliction: Advantage, Attribute Penalty, Disadvantage,
  // Irritant, and Negated Advantage. If the threshold for the Symptom is 2/3
  // the victim’s basic HP, use the cost under Affliction. If the threshold is
  // 1/2 basic HP, double this cost. If it’s 1/3 basic HP, triple this cost.

  //TODO: Variable Enhancement: As an optional rule, the GM may allow abilities
  // built with a Variable Enhancement – an enhancement that’s actually a
  // “placeholder” for any enhancements the user wants. This decision is a free
  // action, and may be changed every time the ability is used. The value of
  // Variable Enhancement is equal to 10¥ the cost of the enhancements that can
  // be added (minimum final cost of +50%).

  //TODO: Very Rapid Fire: This costs +10% more than the equivalent Rapid Fire
  // enhancement would. It is incompatible with Extra Recoil.

  //TODO: Aftermath: You suffer the effects of a Temporary Disadvantage, but
  // only once your advantage switches off. You can add this only to a
  // switchable advantage that you can and must eventually turn off – whether
  // because you’ll run out of FP to maintain it, its duration is fixed by
  // Limited Use or Trigger, or leaving it on indefinitely would negatively
  // affect your health. Find the limitation value as usual, and halve it.
  //
  // Expanded Aftermath: With GM permission, other limitations may have
  // Aftermath variants that kick in after the fact, halving their normal
  // values.

  //TODO: Backlash: Choose from among Attribute Penalty, Incapacitation,
  // Irritant, and Stunning, as defined for Affliction (p. B35). If you succumb
  // for a minute (a second, for Stunning), and can roll against HT once per
  // minute (second) after that to recover, apply a limitation equal in size
  // to the equivalent enhancements. If you get a HT roll to resist, and the
  // effects last for minutes (seconds) equal to your margin of failure, halve
  // this.

  //TODO: Breakable: Add the following elements together to find the final limitation value.
  // Gadget limitation.

  //TODO: Costs Fatigue, Variable: Those adding Costs Fatigue to an Innate
  // Attack that has the Variable enhancement may, if the GM permits, specify
  // that the FP cost is proportional to the dice of damage used. To find the
  // size of the limitation:
  //  1. Set the FP cost to use the ability at full effect.
  //  2. Divide this maximum FP cost by the attack’s maximum dice of damage to find the FP cost per die.
  //  3. Multiply cost per die by “average” damage dice – (1 + maximum dice)/2 – to find average FP cost.
  //  4. Drop all fractions.
  // The result is the number of levels of Cost Fatigue to take.
}
