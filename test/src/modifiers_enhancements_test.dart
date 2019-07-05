import 'package:gurps_modifiers/src/modifier.dart';
import 'package:gurps_modifiers/src/modifiers.dart';
import 'package:test/test.dart';

main() {
  var mods = modifiers;
  group('Simple enhancers', () {
    test('Affects Insubstantial', () {
      SimpleModifier mod = mods.fetch('Affects Insubstantial');
      expect(mod.percentage, 20);
      expect(mod.isAttackModifier, false);
    });

    test('Affects Insubstantial, Selective', () {
      SimpleModifier mod = mods.fetch('Affects Insubstantial, Selective');
      expect(mod.percentage, 30);
      expect(mod.isAttackModifier, false);
    });

    test('Affects Substantial', () {
      SimpleModifier mod = mods.fetch('Affects Substantial');
      expect(mod.percentage, 40);
      expect(mod.isAttackModifier, false);
    });

    test('Affects Substantial, Selective', () {
      SimpleModifier mod = mods.fetch('Affects Substantial, Selective');
      expect(mod.percentage, 50);
      expect(mod.isAttackModifier, false);
    });

    //TODO: Ammo options value is reduced by 5% if it takes a second to switch
    // between ammo types.
    test('AP Ammo, Huge piercing', () {
      SimpleModifier mod = mods.fetch('AP Ammo, Huge piercing');
      expect(mod.percentage, 35);
      expect(mod.isAttackModifier, true);
    });

    //TODO: Ammo options value is reduced by 5% if it takes a second to switch
    // between ammo types.
    test('AP Ammo, Large piercing', () {
      SimpleModifier mod = mods.fetch('AP Ammo, Large piercing');
      expect(mod.percentage, 45);
      expect(mod.isAttackModifier, true);
    });

    //TODO: Ammo options value is reduced by 5% if it takes a second to switch
    // between ammo types.
    test('AP Ammo, Piercing', () {
      SimpleModifier mod = mods.fetch('AP Ammo, Piercing');
      expect(mod.percentage, 20);
      expect(mod.isAttackModifier, true);
    });

    test('Aura', () {
      var mod = mods.fetch('Aura');
      expect(mod.percentage, 80);
      expect(mod.isAttackModifier, true);
    });

    test('Based on (Attribute)', () {
      var mod = mods.fetch('Based On');
      expect(mod.percentage, 20);
      expect(mod.isAttackModifier, false);
    });

    test('Based on (Attribute), Own Roll', () {
      var mod = mods.fetch('Based On, Own Roll');
      expect(mod.percentage, 20);
      expect(mod.isAttackModifier, false);
    });

    test('Cosmic, Avoiding drawbacks', () {
      var mod = mods.fetch('Cosmic, Avoiding drawbacks');
      expect(mod.percentage, 50);
      expect(mod.isAttackModifier, false);
    });

    test('Cosmic, Defensive', () {
      var mod = mods.fetch('Cosmic, Defensive');
      expect(mod.percentage, 50);
      expect(mod.isAttackModifier, false);
    });

    test('Cosmic, Irresistible attack', () {
      var mod = mods.fetch('Cosmic, Irresistible attack');
      expect(mod.percentage, 300);
      expect(mod.isAttackModifier, false);
    });

    test('Cosmic, Lingering effect', () {
      var mod = mods.fetch('Cosmic, Lingering effect');
      expect(mod.percentage, 100);
      expect(mod.isAttackModifier, false);
    });

    test('Cosmic, No active defense allowed', () {
      var mod = mods.fetch('Cosmic, No active defense allowed');
      expect(mod.percentage, 300);
      expect(mod.isAttackModifier, false);
    });

    test('Cosmic, No die roll required', () {
      var mod = mods.fetch('Cosmic, No die roll required');
      expect(mod.percentage, 100);
      expect(mod.isAttackModifier, false);
    });

    test('Cosmic, No Rule of 16', () {
      var mod = mods.fetch('Cosmic, No Rule of 16');
      expect(mod.percentage, 50);
      expect(mod.isAttackModifier, false);
    });

    test('Cosmic, Privileged attack', () {
      var mod = mods.fetch('Cosmic, Privileged attack');
      expect(mod.percentage, 50);
      expect(mod.isAttackModifier, false);
    });

    test('Cosmic, Unhealing damage', () {
      var mod = mods.fetch('Cosmic, Unhealing damage');
      expect(mod.percentage, 100);
      expect(mod.isAttackModifier, false);
    });

    test('Cosmic, Unrestricted powers', () {
      var mod = mods.fetch('Cosmic, Unrestricted powers');
      expect(mod.percentage, 300);
      expect(mod.isAttackModifier, false);
    });

    test('Decreased Immunity 0', () {
      var mod = mods.fetch('Decreased Immunity 0');
      expect(mod.percentage, 20);
      expect(mod.isAttackModifier, false);
    });

    test('Dehydration', () {
      var mod = mods.fetch('Dehydration');
      expect(mod.percentage, 20);
      expect(mod.isAttackModifier, true);
    });

    test('Delay, Fixed', () {
      var mod = mods.fetch('Delay, Fixed');
      expect(mod.percentage, 0);
      expect(mod.isAttackModifier, true);
    });

    test('Delay, Supernatural (fixed)', () {
      var mod = mods.fetch('Delay, Supernatural, fixed');
      expect(mod.percentage, 50);
      expect(mod.isAttackModifier, true);
    });

    test('Delay, Supernatural (variable)', () {
      var mod = mods.fetch('Delay, Supernatural, variable');
      expect(mod.percentage, 100);
      expect(mod.isAttackModifier, true);
    });

    test('Delay, Variable (short)', () {
      var mod = mods.fetch('Delay, Variable, short');
      expect(mod.percentage, 10);
      expect(mod.isAttackModifier, true);
    });

    test('Delay, Variable (long)', () {
      var mod = mods.fetch('Delay, Variable, long');
      expect(mod.percentage, 20);
      expect(mod.isAttackModifier, true);
    });

    test('Delay, Triggered', () {
      var mod = mods.fetch('Delay, Triggered');
      expect(mod.percentage, 50);
      expect(mod.isAttackModifier, true);
    });

    test('Destructive Parry', () {
      var mod = mods.fetch('Destructive Parry');
      expect(mod.percentage, 10);
      expect(mod.isAttackModifier, true);
    });

    test('Double Blunt Trauma', () {
      var mod = mods.fetch('Double Blunt Trauma');
      expect(mod.percentage, 20);
      expect(mod.isAttackModifier, true);
    });

    test('Double Knockback', () {
      var mod = mods.fetch('Double Knockback');
      expect(mod.percentage, 20);
      expect(mod.isAttackModifier, true);
    });

    //TODO: Mobile is mutually exclusive with Drifting.
    test('Drifting', () {
      var mod = mods.fetch('Drifting');
      expect(mod.percentage, 20);
      expect(mod.isAttackModifier, true);
    });

    test('Drowning', () {
      var mod = mods.fetch('Drowning');
      expect(mod.percentage, 0);
      expect(mod.isAttackModifier, true);
    });

    test('Dual', () {
      var mod = mods.fetch('Dual');
      expect(mod.percentage, 10);
      expect(mod.isAttackModifier, true);
    });

    test('Erosive', () {
      var mod = mods.fetch('Erosive');
      expect(mod.percentage, 10);
      expect(mod.isAttackModifier, true);
    });

    test('Extended Duration, Permanent', () {
      var mod = mods.fetch('Extended Duration, Permanent');
      expect(mod.percentage, 300);
      expect(mod.isAttackModifier, false);
    });

    test('Extended Duration, Permanent, dispellable', () {
      var mod = mods.fetch('Extended Duration, Permanent, dispellable');
      expect(mod.percentage, 150);
      expect(mod.isAttackModifier, false);
    });

    test('Fixed Duration', () {
      var mod = mods.fetch('Fixed Duration');
      expect(mod.percentage, 0);
      expect(mod.isAttackModifier, false);
    });

    //TODO: Exception: On a passive carrier attack such as Spines, Follow-Up is
    // a -50% limitation.
    //TODO: Follow-Up is a “penetration modifier”; you cannot combine it with
    // other penetration modifiers (although the carrier attack can have them).
    test('Follow-Up, Natural weapon', () {
      var mod = mods.fetch('Follow-Up, Natural weapon');
      expect(mod.percentage, 0);
      expect(mod.isAttackModifier, false);
    });

    //TODO: Follow-Up, Universal is a “penetration modifier”; you cannot
    // combine it with other penetration modifiers.
    test('Follow-Up, Universal', () {
      var mod = mods.fetch('Follow-Up, Universal');
      expect(mod.percentage, 50);
      expect(mod.isAttackModifier, false);
    });

    test('Force Field', () {
      var mod = mods.fetch('Force Field');
      expect(mod.percentage, 20);
      expect(mod.isAttackModifier, false);
    });

    test('Freezing', () {
      var mod = mods.fetch('Freezing');
      expect(mod.percentage, 20);
      expect(mod.isAttackModifier, true);
    });

    test('Game Time', () {
      var mod = mods.fetch('Game Time');
      expect(mod.percentage, 0);
      expect(mod.isAttackModifier, false);
    });

    test('Guided', () {
      var mod = mods.fetch('Guided');
      expect(mod.percentage, 50);
      expect(mod.isAttackModifier, true);
    });

    test('Heat', () {
      var mod = mods.fetch('Heat');
      expect(mod.percentage, 20);
      expect(mod.isAttackModifier, true);
    });

    test('Incendiary, Non-burning', () {
      var mod = mods.fetch('Incendiary, Non-burning');
      expect(mod.percentage, 10);
      expect(mod.isAttackModifier, true);
    });

    //TODO: Ammo options value is reduced by 5% if it takes a second to switch
    // between ammo types.
    test('HP Ammo, Piercing', () {
      SimpleModifier mod = mods.fetch('HP Ammo, Piercing');
      expect(mod.percentage, 20);
      expect(mod.isAttackModifier, true);
    });

    //TODO: Ammo options value is reduced by 5% if it takes a second to switch
    // between ammo types.
    test('HP Ammo, Large piercing', () {
      SimpleModifier mod = mods.fetch('HP Ammo, Large piercing');
      expect(mod.percentage, 20);
      expect(mod.isAttackModifier, true);
    });

    //TODO: Ammo options value is reduced by 5% if it takes a second to switch
    // between ammo types.
    test('HP Ammo, Small piercing', () {
      SimpleModifier mod = mods.fetch('HP Ammo, Small piercing');
      expect(mod.percentage, 40);
      expect(mod.isAttackModifier, true);
    });

    test('Independent', () {
      var mod = mods.fetch('Independent');
      expect(mod.percentage, 40);
      expect(mod.isAttackModifier, false);
    });

    test('Independent, Simultaneous uses', () {
      var mod = mods.fetch('Independent, Simultaneous uses');
      expect(mod.percentage, 70);
      expect(mod.isAttackModifier, false);
    });

    test('Jet', () {
      var mod = mods.fetch('Jet');
      expect(mod.percentage, 0);
      expect(mod.isAttackModifier, true);
    });

    test('Link, Independent', () {
      var mod = mods.fetch('Link, Independent');
      expect(mod.percentage, 20);
      expect(mod.isAttackModifier, false);
    });

    test('Link, Permanent', () {
      var mod = mods.fetch('Link, Permanent');
      expect(mod.percentage, 10);
      expect(mod.isAttackModifier, false);
    });

    test('Low Signature', () {
      var mod = mods.fetch('Low Signature');
      expect(mod.percentage, 10);
      expect(mod.isAttackModifier, true);
    });

    //TODO: Malediction is a "penetration modifier"; you cannot combine it with
    // other penetration modifiers, nor with modifiers that apply only to
    // conventional ranged attacks.
    test('Malediction, -1 per yard', () {
      var mod = mods.fetch('Malediction, -1 per yard');
      expect(mod.isAttackModifier, true);
      expect(mod.percentage, 100);
    });

    //TODO: Malediction is a "penetration modifier"; you cannot combine it with
    // other penetration modifiers, nor with modifiers that apply only to
    // conventional ranged attacks.
    test('Malediction, Long-Distance Modifiers', () {
      var mod = mods.fetch('Malediction, Long-Distance Modifiers');
      expect(mod.isAttackModifier, true);
      expect(mod.percentage, 200);
    });

    //TODO: Malediction is a "penetration modifier"; you cannot combine it with
    // other penetration modifiers, nor with modifiers that apply only to
    // conventional ranged attacks.
    test('Malediction, Size and Speed/Range Table', () {
      var mod = mods.fetch('Malediction, Size and Speed/Range Table');
      expect(mod.isAttackModifier, true);
      expect(mod.percentage, 150);
    });

    test('Mental Defense Only', () {
      var mod = mods.fetch('Mental Defense Only');
      expect(mod.percentage, 250);
      expect(mod.isAttackModifier, true);
    });

    test('Missed Sleep', () {
      var mod = mods.fetch('Missed Sleep');
      expect(mod.percentage, 50);
      expect(mod.isAttackModifier, true);
    });

    //TODO: Ammo options value is reduced by 5% if it takes a second to switch
    // between ammo types.
    test('Multi-Ammo, Large piercing', () {
      var mod = mods.fetch('Multi-Ammo, Large piercing');
      expect(mod.percentage, 65);
      expect(mod.isAttackModifier, true);
    });

    //TODO: Ammo options value is reduced by 5% if it takes a second to switch
    // between ammo types.
    test('Multi-Ammo, Piercing', () {
      var mod = mods.fetch('Multi-Ammo, Piercing');
      expect(mod.percentage, 40);
      expect(mod.isAttackModifier, true);
    });

    test('No Signature', () {
      var mod = mods.fetch('No Signature');
      expect(mod.percentage, 20);
      expect(mod.isAttackModifier, true);
    });

    test('Once On, Stays On', () {
      var mod = mods.fetch('Once On, Stays On');
      expect(mod.percentage, 50);
      expect(mod.isAttackModifier, false);
    });

    test('Overhead', () {
      var mod = mods.fetch('Overhead');
      expect(mod.percentage, 30);
      expect(mod.isAttackModifier, true);
    });

    test('Persistent', () {
      var mod = mods.fetch('Persistent');
      expect(mod.percentage, 40);
      expect(mod.isAttackModifier, true);
    });

    test('Radiation, Toxic', () {
      var mod = mods.fetch('Radiation, Toxic');
      expect(mod.percentage, 25);
      expect(mod.isAttackModifier, true);
    });

    test('Radiation, Burning', () {
      var mod = mods.fetch('Radiation, Burning');
      expect(mod.percentage, 100);
      expect(mod.isAttackModifier, true);
    });

    test('Ranged', () {
      var mod = mods.fetch('Ranged');
      expect(mod.percentage, 40);
      expect(mod.isAttackModifier, false);
    });

    //TODO: Incompatible with Always On, as well as Active Defense and Usually
    // On (both from Powers).
    test('Reflexive', () {
      var mod = mods.fetch('Reflexive');
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
      var mod = mods.fetch('Respiratory Agent');
      expect(mod.name, 'Respiratory Agent');
      expect(mod.percentage, 50);
      expect(mod.isAttackModifier, true);
    });

    test('Ricochet', () {
      var mod = mods.fetch('Ricochet');
      expect(mod.name, 'Ricochet');
      expect(mod.percentage, 10);
      expect(mod.isAttackModifier, true);
    });

    // TODO You may add this enhancement to any Area Effect or Cone attack.
    test('Selective Area', () {
      var mod = mods.fetch('Selective Area');
      expect(mod.name, 'Selective Area');
      expect(mod.percentage, 20);
      expect(mod.isAttackModifier, true);
    });

    test('Selective Effect', () {
      var mod = mods.fetch('Selective Effect');
      expect(mod.name, 'Selective Effect');
      expect(mod.percentage, 20);
      expect(mod.isAttackModifier, false);
    });

    test('Selectivity', () {
      var mod = mods.fetch('Selectivity');
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
      var mod = mods.fetch('ST-Based');
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
      var mod = mods.fetch('ST-Based, Limited');
      expect(mod.name, 'ST-Based, Limited');
      expect(mod.percentage, 30);
      expect(mod.isAttackModifier, true);
    });

    test('Starvation', () {
      var mod = mods.fetch('Starvation');
      expect(mod.name, 'Starvation');
      expect(mod.percentage, 40);
      expect(mod.isAttackModifier, true);
    });

    test('Suffocation', () {
      var mod = mods.fetch('Suffocation');
      expect(mod.name, 'Suffocation');
      expect(mod.percentage, 0);
      expect(mod.isAttackModifier, true);
    });

    test('Super Attribute', () {
      var mod = mods.fetch('Super Attribute');
      expect(mod.name, 'Super Attribute');
      expect(mod.percentage, 25);
      expect(mod.isAttackModifier, false);
    });

    test('Surge', () {
      var mod = mods.fetch('Surge');
      expect(mod.name, 'Surge');
      expect(mod.percentage, 20);
      expect(mod.isAttackModifier, true);
    });

    test('Surge, Arcing', () {
      var mod = mods.fetch('Surge, Arcing');
      expect(mod.name, 'Surge, Arcing');
      expect(mod.percentage, 100);
      expect(mod.isAttackModifier, true);
    });

    test('Surprise Attack', () {
      var mod = mods.fetch('Surprise Attack');
      expect(mod.name, 'Surprise Attack');
      expect(mod.percentage, 150);
      expect(mod.isAttackModifier, true);
    });

    test('Switchable', () {
      var mod = mods.fetch('Switchable');
      expect(mod.name, 'Switchable');
      expect(mod.percentage, 10);
      expect(mod.isAttackModifier, false);
    });

    test('Thrusting Blade', () {
      var mod = mods.fetch('Thrusting Blade');
      expect(mod.name, 'Thrusting Blade');
      expect(mod.percentage, 15);
      expect(mod.isAttackModifier, true);
    });

    test('Time-Spanning, Past or future plus present', () {
      var mod = mods.fetch('Time-Spanning, Past or future plus present');
      expect(mod.percentage, 50);
      expect(mod.isAttackModifier, false);
    });

    test('Time-Spanning, Universal', () {
      var mod = mods.fetch('Time-Spanning, Universal');
      expect(mod.name, 'Time-Spanning, Universal');
      expect(mod.percentage, 100);
      expect(mod.isAttackModifier, false);
    });

    test('Time-Spanning, Past and future only', () {
      var mod = mods.fetch('Time-Spanning, Past and future only');
      expect(mod.name, 'Time-Spanning, Past and future only');
      expect(mod.percentage, 50);
      expect(mod.isAttackModifier, false);
    });

    test('Time-Spanning, Past or future only', () {
      var mod = mods.fetch('Time-Spanning, Past or future only');
      expect(mod.name, 'Time-Spanning, Past or future only');
      expect(mod.percentage, 0);
      expect(mod.isAttackModifier, false);
    });

    test('Underwater', () {
      var mod = mods.fetch('Underwater');
      expect(mod.name, 'Underwater');
      expect(mod.percentage, 20);
      expect(mod.isAttackModifier, true);
    });

    test('Usually On', () {
      var mod = mods.fetch('Usually On');
      expect(mod.name, 'Usually On');
      expect(mod.percentage, 5);
      expect(mod.isAttackModifier, false);
    });

    test('Variable', () {
      var mod = mods.fetch('Variable');
      expect(mod.name, 'Variable');
      expect(mod.percentage, 5);
      expect(mod.isAttackModifier, true);
    });

    test('Wall, Fixed shape', () {
      var mod = mods.fetch('Wall, Fixed shape');
      expect(mod.name, 'Wall, Fixed shape');
      expect(mod.percentage, 30);
      expect(mod.isAttackModifier, true);
    });

    test('Wall, Variable shape', () {
      var mod = mods.fetch('Wall, Variable shape');
      expect(mod.name, 'Wall, Variable shape');
      expect(mod.percentage, 60);
      expect(mod.isAttackModifier, true);
    });

    test('World-Spanning, Others only', () {
      var mod = mods.fetch('World-Spanning, Others only');
      expect(mod.name, 'World-Spanning, Others only');
      expect(mod.percentage, 50);
      expect(mod.isAttackModifier, false);
    });

    test('World-Spanning, Others plus current', () {
      var mod = mods.fetch('World-Spanning, Others plus current');
      expect(mod.name, 'World-Spanning, Others plus current');
      expect(mod.percentage, 100);
      expect(mod.isAttackModifier, false);
    });
  });

  group('Leveled enhancers', () {
    test('Accurate', () {
      var mod = mods.fetch('Accurate') as LeveledModifier;
      expect(mod.isAttackModifier, true);
      expect(mod.level, 1);
      expect(mod.percentage, 5);
      var m = LeveledModifier.copyOf(mod, level: 3);

      expect(m.percentage, 15);
    });

    test('Affects Others', () {
      var mod = mods.fetch('Affects Others') as LeveledModifier;
      expect(mod.isAttackModifier, false);
      expect(mod.level, 1);
      expect(mod.percentage, 50);
      var m = LeveledModifier.copyOf(mod, level: 3);
      expect(m.percentage, 150);
    });

    test('Area Effect', () {
      var mod = mods.fetch('Area Effect') as LeveledModifier;
      expect(mod.isAttackModifier, true);
      expect(mod.level, 1);
      expect(mod.percentage, 50);
      var m = LeveledModifier.copyOf(mod, level: 3);
      expect(m.percentage, 150);
      expect(m.canonicalName, 'Area Effect, 8 yards');
    });

    //TODO: You cannot combine Cone with Area Effect, Aura, Jet, Melee Attack,
    // Rapid Fire, or Emanation.
    test('Cone', () {
      var mod = mods.fetch('Cone') as LeveledModifier;
      expect(mod.isAttackModifier, true);
      expect(mod.level, 1);
      expect(mod.percentage, 60);
      var m = LeveledModifier.copyOf(mod, level: 3);
      expect(m.percentage, 80);
    });

    test('Decreased Immunity', () {
      var mod = mods.fetch('Decreased Immunity') as LeveledModifier;
      expect(mod.isAttackModifier, false);
      expect(mod.level, 1);
      expect(mod.percentage, 50);
      var m = LeveledModifier.copyOf(mod, level: 4);
      expect(m.percentage, 200);
      expect(() => LeveledModifier.copyOf(mod, level: 5),
          throwsA(isA<AssertionError>()));
    });

    test('Explosion', () {
      var mod = mods.fetch('Explosion') as LeveledModifier;
      expect(mod.isAttackModifier, true);
      expect(mod.level, 1);
      expect(mod.percentage, 50);
      var m = LeveledModifier.copyOf(mod, level: 3);
      expect(m.percentage, 150);
    });

    test('Extended Duration', () {
      var mod = mods.fetch('Extended Duration') as LeveledModifier;
      expect(mod.isAttackModifier, false);
      expect(mod.level, 1);
      expect(mod.percentage, 20);
      var m = LeveledModifier.copyOf(mod, level: 3);
      expect(m.percentage, 60);
      expect(() => LeveledModifier.copyOf(mod, level: 15),
          throwsA(isA<AssertionError>()));
    });

    test('Extra Passes', () {
      var mod = mods.fetch('Extra Passes') as LeveledModifier;
      expect(mod.isAttackModifier, true);
      expect(mod.level, 1);
      expect(mod.percentage, 10);
      expect(LeveledModifier.copyOf(mod, level: 3).percentage, 30);
    });

    test('Fragmentation, Cutting', () {
      var mod = mods.fetch('Fragmentation, Cutting') as LeveledModifier;
      expect(mod.isAttackModifier, true);
      expect(mod.level, 1);
      expect(mod.percentage, 15);
      expect(LeveledModifier.copyOf(mod, level: 3).percentage, 45);
    });

    test('Fragmentation, Hot', () {
      var mod = mods.fetch('Fragmentation, Hot') as LeveledModifier;
      expect(mod.isAttackModifier, true);
      expect(mod.level, 1);
      expect(mod.percentage, 15);
      expect(LeveledModifier.copyOf(mod, level: 3).percentage, 45);
    });

    test('Fragmentation, Impaling', () {
      var mod = mods.fetch('Fragmentation, Impaling') as LeveledModifier;
      expect(mod.isAttackModifier, true);
      expect(mod.level, 1);
      expect(mod.percentage, 20);
      expect(LeveledModifier.copyOf(mod, level: 3).percentage, 60);
    });

    test('Fragmentation, Large Piercing', () {
      var mod = mods.fetch('Fragmentation, Large Piercing') as LeveledModifier;
      expect(mod.isAttackModifier, true);
      expect(mod.level, 1);
      expect(mod.percentage, 15);
      expect(LeveledModifier.copyOf(mod, level: 3).percentage, 45);
    });

    test('Incendiary, Burning', () {
      var mod = mods.fetch('Incendiary, Burning') as LeveledModifier;
      expect(mod.isAttackModifier, true);
      expect(mod.level, 1);
      expect(mod.percentage, 10);
      expect(LeveledModifier.copyOf(mod, level: 3).percentage, 30);
    });

    test('Increased Range', () {
      var mod = mods.fetch('Increased Range') as LeveledModifier;
      expect(mod.isAttackModifier, false);
      expect(mod.level, 1);
      expect(mod.percentage, 10);
      expect(LeveledModifier.copyOf(mod, level: 3).percentage, 30);
    });

    test('Long-Range', () {
      var mod = mods.fetch('Long-Range') as LeveledModifier;
      expect(mod.isAttackModifier, false);
      expect(mod.level, 1);
      expect(mod.percentage, 50);
      expect(LeveledModifier.copyOf(mod, level: 3).percentage, 150);
      expect(() => LeveledModifier.copyOf(mod, level: 4),
          throwsA(isA<AssertionError>()));
    });

    test('Low Psychic Signature', () {
      var mod = mods.fetch('Low Psychic Signature') as LeveledModifier;
      expect(mod.isAttackModifier, false);
      expect(mod.level, 1);
      expect(mod.percentage, 5);
      expect(LeveledModifier.copyOf(mod, level: 5).percentage, 25);
      expect(() => LeveledModifier.copyOf(mod, level: 6),
          throwsA(isA<AssertionError>()));
    });

    test('Low Signature, Variable', () {
      var mod = mods.fetch('Low Signature, Variable') as LeveledModifier;
      expect(mod.isAttackModifier, false);
      expect(mod.level, 1);
      expect(mod.percentage, 5);
      expect(LeveledModifier.copyOf(mod, level: 5).percentage, 25);
      expect(() => LeveledModifier.copyOf(mod, level: 6),
          throwsA(isA<AssertionError>()));
    });

    //TODO: You may only add this enhancement to an attack that has both Area
    // Effect and Persistent.
    //TODO: Mobile is mutually exclusive with Drifting.
    test('Mobile', () {
      var mod = mods.fetch('Mobile') as LeveledModifier;
      expect(mod.isAttackModifier, true);
      expect(mod.level, 1);
      expect(mod.percentage, 40);
      expect(LeveledModifier.copyOf(mod, level: 5).percentage, 200);
    });

    test('Reduced Fatigue Cost', () {
      var mod = mods.fetch('Reduced Fatigue Cost') as LeveledModifier;
      expect(mod.isAttackModifier, false);
      expect(mod.level, 1);
      expect(mod.percentage, 20);
      expect(LeveledModifier.copyOf(mod, level: 5).percentage, 100);
    });

    //TODO: You cannot add Reduced Time to attack powers, to traits that list
    // any kind of special modifier that affects activation time, or to Magery.
    test('Reduced Time', () {
      var mod = mods.fetch('Reduced Time') as LeveledModifier;
      expect(mod.isAttackModifier, false);
      expect(mod.level, 1);
      expect(mod.percentage, 20);
      expect(LeveledModifier.copyOf(mod, level: 5).percentage, 100);
    });

    test('Reliable', () {
      var mod = mods.fetch('Reliable') as LeveledModifier;
      expect(mod.isAttackModifier, false);
      expect(mod.level, 1);
      expect(mod.percentage, 5);
      expect(LeveledModifier.copyOf(mod, level: 10).percentage, 50);
      expect(() => LeveledModifier.copyOf(mod, level: 11),
          throwsA(isA<AssertionError>()));
    });
  });

  group('Variable enhancers', () {
    test('Armor Divisor', () {
      var mod = mods.fetch('Armor Divisor') as VariableModifier;
      expect(mod.isAttackModifier, true);
      expect(mod.level, 1);
      expect(mod.percentage, -70);
      expect(VariableModifier.copyOf(mod, level: 2).percentage, -50);
      expect(VariableModifier.copyOf(mod, level: 3).percentage, -30);
      expect(VariableModifier.copyOf(mod, level: 4).percentage, 50);
      expect(VariableModifier.copyOf(mod, level: 5).percentage, 100);
      expect(VariableModifier.copyOf(mod, level: 6).percentage, 150);
      expect(VariableModifier.copyOf(mod, level: 7).percentage, 200);
      expect(() => VariableModifier.copyOf(mod, level: 8),
          throwsA(isA<AssertionError>()));
    });

    test('Can Carry Objects', () {
      var mod = mods.fetch('Can Carry Objects') as VariableModifier;
      expect(mod.isAttackModifier, false);
      expect(mod.level, 1);
      expect(mod.percentage, 10);
      expect(VariableModifier.copyOf(mod, level: 2).percentage, 20);
      expect(VariableModifier.copyOf(mod, level: 3).percentage, 50);
      expect(VariableModifier.copyOf(mod, level: 4).percentage, 100);
      expect(VariableModifier.copyOf(mod, level: 5).percentage, 150);
      expect(() => VariableModifier.copyOf(mod, level: 6),
          throwsA(isA<AssertionError>()));
    });

    test('Cyclic', () {
      var mod = mods.fetch('Cyclic') as VariableModifier;
      expect(mod.isAttackModifier, true);
      expect(mod.level, 1);
      expect(mod.percentage, 10);
      expect(VariableModifier.copyOf(mod, level: 2).percentage, 20);
      expect(VariableModifier.copyOf(mod, level: 3).percentage, 40);
      expect(VariableModifier.copyOf(mod, level: 4).percentage, 50);
      expect(VariableModifier.copyOf(mod, level: 5).percentage, 100);
      expect(() => VariableModifier.copyOf(mod, level: 6),
          throwsA(isA<AssertionError>()));
    });

    test('Increased Range, LOS', () {
      var mod = mods.fetch('Increased Range, LOS') as VariableModifier;
      expect(mod.isAttackModifier, false);
      expect(mod.level, 1);
      expect(mod.percentage, 90);
      expect(VariableModifier.copyOf(mod, level: 2).percentage, 80);
      expect(VariableModifier.copyOf(mod, level: 3).percentage, 70);
      expect(VariableModifier.copyOf(mod, level: 4).percentage, 60);
      expect(VariableModifier.copyOf(mod, level: 5).percentage, 50);
      expect(VariableModifier.copyOf(mod, level: 6).percentage, 40);
      expect(VariableModifier.copyOf(mod, level: 7).percentage, 30);
      expect(VariableModifier.copyOf(mod, level: 8).percentage, 20);
      expect(VariableModifier.copyOf(mod, level: 9).percentage, 10);
      expect(VariableModifier.copyOf(mod, level: 10).percentage, 0);
      expect(() => VariableModifier.copyOf(mod, level: 11),
          throwsA(isA<AssertionError>()));
    });

    test('Rapid Fire', () {
      var mod = mods.fetch('Rapid Fire') as VariableModifier;
      expect(mod.isAttackModifier, true);
      expect(mod.level, 1);
      expect(mod.percentage, 40);
      expect(VariableModifier.copyOf(mod, level: 2).percentage, 50);
      expect(VariableModifier.copyOf(mod, level: 3).percentage, 70);
      expect(VariableModifier.copyOf(mod, level: 4).percentage, 100);
      expect(VariableModifier.copyOf(mod, level: 5).percentage, 150);
      expect(VariableModifier.copyOf(mod, level: 6).percentage, 200);
      expect(VariableModifier.copyOf(mod, level: 7).percentage, 250);
      expect(VariableModifier.copyOf(mod, level: 8).percentage, 300);
      expect(() => VariableModifier.copyOf(mod, level: 9),
          throwsA(isA<AssertionError>()));
    });

    test('Rapid Fire, Selective', () {
      var mod = mods.fetch('Rapid Fire, Selective') as VariableModifier;
      expect(mod.isAttackModifier, true);
      expect(mod.level, 1);
      expect(mod.percentage, 80);
      expect(VariableModifier.copyOf(mod, level: 2).percentage, 110);
      expect(VariableModifier.copyOf(mod, level: 3).percentage, 160);
      expect(VariableModifier.copyOf(mod, level: 4).percentage, 210);
      expect(VariableModifier.copyOf(mod, level: 5).percentage, 260);
      expect(VariableModifier.copyOf(mod, level: 6).percentage, 310);
      expect(() => VariableModifier.copyOf(mod, level: 7),
          throwsA(isA<AssertionError>()));
    });
  });

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
