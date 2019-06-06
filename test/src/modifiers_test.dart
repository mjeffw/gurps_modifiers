import 'dart:mirrors';

import 'package:gurps_enhancers/src/modifier.dart';
import 'package:gurps_enhancers/src/modifiers.dart';
import 'package:test/test.dart';

main() {
  var mods = Modifiers();
  group('Simple enhancers', () {
    test('Affects Insubstantial', () {
      Modifier mod = mods.fetch('Affects Insubstantial');
      expect(mod.value, 20);
      expect(mod.isAttackModifier, false);
    });

    test('Affects Insubstantial, Selective', () {
      Modifier mod = mods.fetch('Affects Insubstantial, Selective');
      expect(mod.value, 30);
      expect(mod.isAttackModifier, false);
    });

    test('Affects Substantial', () {
      Modifier mod = mods.fetch('Affects Substantial');
      expect(mod.value, 40);
      expect(mod.isAttackModifier, false);
    });

    test('Affects Substantial, Selective', () {
      Modifier mod = mods.fetch('Affects Substantial, Selective');
      expect(mod.value, 50);
      expect(mod.isAttackModifier, false);
    });

    //TODO: Ammo options value is reduced by 5% if it takes a second to switch
    // between ammo types.
    test('AP Ammo, Huge piercing', () {
      Modifier mod = mods.fetch('AP Ammo, Huge piercing');
      expect(mod.value, 35);
      expect(mod.isAttackModifier, true);
    });

    //TODO: Ammo options value is reduced by 5% if it takes a second to switch
    // between ammo types.
    test('AP Ammo, Large piercing', () {
      Modifier mod = mods.fetch('AP Ammo, Large piercing');
      expect(mod.value, 45);
      expect(mod.isAttackModifier, true);
    });

    //TODO: Ammo options value is reduced by 5% if it takes a second to switch
    // between ammo types.
    test('AP Ammo, Piercing', () {
      Modifier mod = mods.fetch('AP Ammo, Piercing');
      expect(mod.value, 20);
      expect(mod.isAttackModifier, true);
    });

    test('Aura', () {
      var mod = mods.fetch('Aura');
      expect(mod.value, 80);
      expect(mod.isAttackModifier, true);
    });

    test('Based on (Attribute)', () {
      var mod = mods.fetch('Based On');
      expect(mod.value, 20);
      expect(mod.isAttackModifier, false);
    });

    test('Based on (Attribute), Own Roll', () {
      var mod = mods.fetch('Based On, Own Roll');
      expect(mod.value, 20);
      expect(mod.isAttackModifier, false);
    });

    test('Cosmic, Avoiding drawbacks', () {
      var mod = mods.fetch('Cosmic, Avoiding drawbacks');
      expect(mod.value, 50);
      expect(mod.isAttackModifier, false);
    });

    test('Cosmic, Defensive', () {
      var mod = mods.fetch('Cosmic, Defensive');
      expect(mod.value, 50);
      expect(mod.isAttackModifier, false);
    });

    test('Cosmic, Irresistible attack', () {
      var mod = mods.fetch('Cosmic, Irresistible attack');
      expect(mod.value, 300);
      expect(mod.isAttackModifier, false);
    });

    test('Cosmic, Lingering effect', () {
      var mod = mods.fetch('Cosmic, Lingering effect');
      expect(mod.value, 100);
      expect(mod.isAttackModifier, false);
    });

    test('Cosmic, No active defense allowed', () {
      var mod = mods.fetch('Cosmic, No active defense allowed');
      expect(mod.value, 300);
      expect(mod.isAttackModifier, false);
    });

    test('Cosmic, No die roll required', () {
      var mod = mods.fetch('Cosmic, No die roll required');
      expect(mod.value, 100);
      expect(mod.isAttackModifier, false);
    });

    test('Cosmic, No Rule of 16', () {
      var mod = mods.fetch('Cosmic, No Rule of 16');
      expect(mod.value, 50);
      expect(mod.isAttackModifier, false);
    });

    test('Cosmic, Privileged attack', () {
      var mod = mods.fetch('Cosmic, Privileged attack');
      expect(mod.value, 50);
      expect(mod.isAttackModifier, false);
    });

    test('Cosmic, Unhealing damage', () {
      var mod = mods.fetch('Cosmic, Unhealing damage');
      expect(mod.value, 100);
      expect(mod.isAttackModifier, false);
    });

    test('Cosmic, Unrestricted powers', () {
      var mod = mods.fetch('Cosmic, Unrestricted powers');
      expect(mod.value, 300);
      expect(mod.isAttackModifier, false);
    });

    test('Decreased Immunity 0', () {
      var mod = mods.fetch('Decreased Immunity 0');
      expect(mod.value, 20);
      expect(mod.isAttackModifier, false);
    });

    test('Dehydration', () {
      var mod = mods.fetch('Dehydration');
      expect(mod.value, 20);
      expect(mod.isAttackModifier, true);
    });

    test('Delay, Fixed', () {
      var mod = mods.fetch('Delay, Fixed');
      expect(mod.value, 0);
      expect(mod.isAttackModifier, true);
    });

    test('Delay, Supernatural (fixed)', () {
      var mod = mods.fetch('Delay, Supernatural (fixed)');
      expect(mod.value, 50);
      expect(mod.isAttackModifier, true);
    });

    test('Delay, Supernatural (variable)', () {
      var mod = mods.fetch('Delay, Supernatural (variable)');
      expect(mod.value, 100);
      expect(mod.isAttackModifier, true);
    });

    test('Delay, Variable (short)', () {
      var mod = mods.fetch('Delay, Variable (short)');
      expect(mod.value, 10);
      expect(mod.isAttackModifier, true);
    });

    test('Delay, Variable (long)', () {
      var mod = mods.fetch('Delay, Variable (long)');
      expect(mod.value, 20);
      expect(mod.isAttackModifier, true);
    });

    test('Delay, Triggered', () {
      var mod = mods.fetch('Delay, Triggered');
      expect(mod.value, 50);
      expect(mod.isAttackModifier, true);
    });

    test('Destructive Parry', () {
      var mod = mods.fetch('Destructive Parry');
      expect(mod.value, 10);
      expect(mod.isAttackModifier, true);
    });

    test('Double Blunt Trauma', () {
      var mod = mods.fetch('Double Blunt Trauma');
      expect(mod.value, 20);
      expect(mod.isAttackModifier, true);
    });

    test('Double Knockback', () {
      var mod = mods.fetch('Double Knockback');
      expect(mod.value, 20);
      expect(mod.isAttackModifier, true);
    });

    //TODO: Mobile is mutually exclusive with Drifting.
    test('Drifting', () {
      var mod = mods.fetch('Drifting');
      expect(mod.value, 20);
      expect(mod.isAttackModifier, true);
    });

    test('Drowning', () {
      var mod = mods.fetch('Drowning');
      expect(mod.value, 0);
      expect(mod.isAttackModifier, true);
    });

    test('Dual', () {
      var mod = mods.fetch('Dual');
      expect(mod.value, 10);
      expect(mod.isAttackModifier, true);
    });

    test('Erosive', () {
      var mod = mods.fetch('Erosive');
      expect(mod.value, 10);
      expect(mod.isAttackModifier, true);
    });

    test('Extended Duration, Permanent', () {
      var mod = mods.fetch('Extended Duration, Permanent');
      expect(mod.value, 300);
      expect(mod.isAttackModifier, false);
    });

    test('Extended Duration, Permanent, dispellable', () {
      var mod = mods.fetch('Extended Duration, Permanent, dispellable');
      expect(mod.value, 150);
      expect(mod.isAttackModifier, false);
    });

    test('Fixed Duration', () {
      var mod = mods.fetch('Fixed Duration');
      expect(mod.value, 0);
      expect(mod.isAttackModifier, false);
    });

    //TODO: Exception: On a passive carrier attack such as Spines, Follow-Up is
    // a -50% limitation.
    //TODO: Follow-Up is a “penetration modifier”; you cannot combine it with
    // other penetration modifiers (although the carrier attack can have them).
    test('Follow-Up, Natural weapon', () {
      var mod = mods.fetch('Follow-Up, Natural weapon');
      expect(mod.value, 0);
      expect(mod.isAttackModifier, false);
    });

    //TODO: Follow-Up, Universal is a “penetration modifier”; you cannot
    // combine it with other penetration modifiers.
    test('Follow-Up, Universal', () {
      var mod = mods.fetch('Follow-Up, Universal');
      expect(mod.value, 50);
      expect(mod.isAttackModifier, false);
    });

    test('Force Field', () {
      var mod = mods.fetch('Force Field');
      expect(mod.value, 20);
      expect(mod.isAttackModifier, false);
    });

    test('Freezing', () {
      var mod = mods.fetch('Freezing');
      expect(mod.value, 20);
      expect(mod.isAttackModifier, true);
    });

    test('Game Time', () {
      var mod = mods.fetch('Game Time');
      expect(mod.value, 0);
      expect(mod.isAttackModifier, false);
    });

    test('Guided', () {
      var mod = mods.fetch('Guided');
      expect(mod.value, 50);
      expect(mod.isAttackModifier, true);
    });

    test('Heat', () {
      var mod = mods.fetch('Heat');
      expect(mod.value, 20);
      expect(mod.isAttackModifier, true);
    });

    test('Incendiary (non-burn)', () {
      var mod = mods.fetch('Incendiary (non-burn)');
      expect(mod.value, 10);
      expect(mod.isAttackModifier, true);
    });

    //TODO: Ammo options value is reduced by 5% if it takes a second to switch
    // between ammo types.
    test('HP Ammo, Piercing', () {
      Modifier mod = mods.fetch('HP Ammo, Piercing');
      expect(mod.value, 20);
      expect(mod.isAttackModifier, true);
    });

    //TODO: Ammo options value is reduced by 5% if it takes a second to switch
    // between ammo types.
    test('HP Ammo, Large piercing', () {
      Modifier mod = mods.fetch('HP Ammo, Large piercing');
      expect(mod.value, 20);
      expect(mod.isAttackModifier, true);
    });

    //TODO: Ammo options value is reduced by 5% if it takes a second to switch
    // between ammo types.
    test('HP Ammo, Small piercing', () {
      Modifier mod = mods.fetch('HP Ammo, Small piercing');
      expect(mod.value, 40);
      expect(mod.isAttackModifier, true);
    });

    test('Independent', () {
      var mod = mods.fetch('Independent');
      expect(mod.value, 40);
      expect(mod.isAttackModifier, false);
    });

    test('Independent, Simultaneous uses', () {
      var mod = mods.fetch('Independent, Simultaneous uses');
      expect(mod.value, 70);
      expect(mod.isAttackModifier, false);
    });

    test('Jet', () {
      var mod = mods.fetch('Jet');
      expect(mod.value, 0);
      expect(mod.isAttackModifier, true);
    });

    test('Link, Independent', () {
      var mod = mods.fetch('Link, Independent');
      expect(mod.value, 20);
      expect(mod.isAttackModifier, false);
    });

    test('Link, Permanent', () {
      var mod = mods.fetch('Link, Permanent');
      expect(mod.value, 10);
      expect(mod.isAttackModifier, false);
    });

    test('Low Signature', () {
      var mod = mods.fetch('Low Signature');
      expect(mod.value, 10);
      expect(mod.isAttackModifier, true);
    });

    //TODO: Malediction is a "penetration modifier"; you cannot combine it with
    // other penetration modifiers, nor with modifiers that apply only to
    // conventional ranged attacks.
    test('Malediction, -1 per yard', () {
      var mod = mods.fetch('Malediction, -1 per yard');
      expect(mod.isAttackModifier, true);
      expect(mod.value, 100);
    });

    //TODO: Malediction is a "penetration modifier"; you cannot combine it with
    // other penetration modifiers, nor with modifiers that apply only to
    // conventional ranged attacks.
    test('Malediction, Long-Distance Modifiers', () {
      var mod = mods.fetch('Malediction, Long-Distance Modifiers');
      expect(mod.isAttackModifier, true);
      expect(mod.value, 200);
    });

    //TODO: Malediction is a "penetration modifier"; you cannot combine it with
    // other penetration modifiers, nor with modifiers that apply only to
    // conventional ranged attacks.
    test('Malediction, Size and Speed/Range Table', () {
      var mod = mods.fetch('Malediction, Size and Speed/Range Table');
      expect(mod.isAttackModifier, true);
      expect(mod.value, 150);
    });

    test('Mental Defense Only', () {
      var mod = mods.fetch('Mental Defense Only');
      expect(mod.value, 250);
      expect(mod.isAttackModifier, true);
    });

    test('Missed Sleep', () {
      var mod = mods.fetch('Missed Sleep');
      expect(mod.value, 50);
      expect(mod.isAttackModifier, true);
    });

    //TODO: Ammo options value is reduced by 5% if it takes a second to switch
    // between ammo types.
    test('Multi-Ammo, Large piercing', () {
      var mod = mods.fetch('Multi-Ammo, Large piercing');
      expect(mod.value, 65);
      expect(mod.isAttackModifier, true);
    });

    //TODO: Ammo options value is reduced by 5% if it takes a second to switch
    // between ammo types.
    test('Multi-Ammo, Piercing', () {
      var mod = mods.fetch('Multi-Ammo, Piercing');
      expect(mod.value, 40);
      expect(mod.isAttackModifier, true);
    });

    test('No Signature', () {
      var mod = mods.fetch('No Signature');
      expect(mod.value, 20);
      expect(mod.isAttackModifier, true);
    });

    test('Once On, Stays On', () {
      var mod = mods.fetch('Once On, Stays On');
      expect(mod.value, 50);
      expect(mod.isAttackModifier, false);
    });

    test('Overhead', () {
      var mod = mods.fetch('Overhead');
      expect(mod.value, 30);
      expect(mod.isAttackModifier, true);
    });

    test('Persistent', () {
      var mod = mods.fetch('Persistent');
      expect(mod.value, 40);
      expect(mod.isAttackModifier, true);
    });

    test('Radiation, Toxic', () {
      var mod = mods.fetch('Radiation, Toxic');
      expect(mod.value, 25);
      expect(mod.isAttackModifier, true);
    });

    test('Radiation, Burning', () {
      var mod = mods.fetch('Radiation, Burning');
      expect(mod.value, 100);
      expect(mod.isAttackModifier, true);
    });

    test('Ranged', () {
      var mod = mods.fetch('Ranged');
      expect(mod.value, 40);
      expect(mod.isAttackModifier, false);
    });

    //TODO: Incompatible with Always On, as well as Active Defense and Usually
    // On (both from Powers).
    test('Reflexive', () {
      var mod = mods.fetch('Reflexive');
      expect(mod.name, 'Reflexive');
      expect(mod.value, 40);
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
      expect(mod.value, 50);
      expect(mod.isAttackModifier, true);
    });

    test('Ricochet', () {
      var mod = mods.fetch('Ricochet');
      expect(mod.name, 'Ricochet');
      expect(mod.value, 10);
      expect(mod.isAttackModifier, true);
    });

    // TODO You may add this enhancement to any Area Effect or Cone attack.
    test('Selective Area', () {
      var mod = mods.fetch('Selective Area');
      expect(mod.name, 'Selective Area');
      expect(mod.value, 20);
      expect(mod.isAttackModifier, true);
    });

    test('Selective Effect', () {
      var mod = mods.fetch('Selective Effect');
      expect(mod.name, 'Selective Effect');
      expect(mod.value, 20);
      expect(mod.isAttackModifier, false);
    });

    test('Selectivity', () {
      var mod = mods.fetch('Selectivity');
      expect(mod.name, 'Selectivity');
      expect(mod.value, 10);
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
      expect(mod.value, 100);
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
      expect(mod.value, 30);
      expect(mod.isAttackModifier, true);
    });

    test('Starvation', () {
      var mod = mods.fetch('Starvation');
      expect(mod.name, 'Starvation');
      expect(mod.value, 40);
      expect(mod.isAttackModifier, true);
    });

    test('Suffocation', () {
      var mod = mods.fetch('Suffocation');
      expect(mod.name, 'Suffocation');
      expect(mod.value, 0);
      expect(mod.isAttackModifier, true);
    });

    test('Super Attribute', () {
      var mod = mods.fetch('Super Attribute');
      expect(mod.name, 'Super Attribute');
      expect(mod.value, 25);
      expect(mod.isAttackModifier, false);
    });

    test('Surge', () {
      var mod = mods.fetch('Surge');
      expect(mod.name, 'Surge');
      expect(mod.value, 20);
      expect(mod.isAttackModifier, true);
    });

    test('Surge, Arcing', () {
      var mod = mods.fetch('Surge, Arcing');
      expect(mod.name, 'Surge, Arcing');
      expect(mod.value, 100);
      expect(mod.isAttackModifier, true);
    });

    test('Surprise Attack', () {
      var mod = mods.fetch('Surprise Attack');
      expect(mod.name, 'Surprise Attack');
      expect(mod.value, 150);
      expect(mod.isAttackModifier, true);
    });

    test('Switchable', () {
      var mod = mods.fetch('Switchable');
      expect(mod.name, 'Switchable');
      expect(mod.value, 10);
      expect(mod.isAttackModifier, false);
    });

    test('Thrusting Blade', () {
      var mod = mods.fetch('Thrusting Blade');
      expect(mod.name, 'Thrusting Blade');
      expect(mod.value, 15);
      expect(mod.isAttackModifier, true);
    });

    test('Time-Spanning, Present plus (past or future)', () {
      var mod = mods.fetch('Time-Spanning, Present plus (past or future)');
      expect(mod.name, 'Time-Spanning, Present plus (past or future)');
      expect(mod.value, 50);
      expect(mod.isAttackModifier, false);
    });

    test('Time-Spanning, Universal', () {
      var mod = mods.fetch('Time-Spanning, Universal');
      expect(mod.name, 'Time-Spanning, Universal');
      expect(mod.value, 100);
      expect(mod.isAttackModifier, false);
    });

    test('Time-Spanning, Past and future only', () {
      var mod = mods.fetch('Time-Spanning, Past and future only');
      expect(mod.name, 'Time-Spanning, Past and future only');
      expect(mod.value, 50);
      expect(mod.isAttackModifier, false);
    });

    test('Time-Spanning, Past or future only', () {
      var mod = mods.fetch('Time-Spanning, Past or future only');
      expect(mod.name, 'Time-Spanning, Past or future only');
      expect(mod.value, 0);
      expect(mod.isAttackModifier, false);
    });

    test('Underwater', () {
      var mod = mods.fetch('Underwater');
      expect(mod.name, 'Underwater');
      expect(mod.value, 20);
      expect(mod.isAttackModifier, true);
    });

    test('Usually On', () {
      var mod = mods.fetch('Usually On');
      expect(mod.name, 'Usually On');
      expect(mod.value, 5);
      expect(mod.isAttackModifier, false);
    });

    test('Variable', () {
      var mod = mods.fetch('Variable');
      expect(mod.name, 'Variable');
      expect(mod.value, 5);
      expect(mod.isAttackModifier, true);
    });

    test('Wall, Fixed shape', () {
      var mod = mods.fetch('Wall, Fixed shape');
      expect(mod.name, 'Wall, Fixed shape');
      expect(mod.value, 30);
      expect(mod.isAttackModifier, true);
    });

    test('Wall, Variable shape', () {
      var mod = mods.fetch('Wall, Variable shape');
      expect(mod.name, 'Wall, Variable shape');
      expect(mod.value, 60);
      expect(mod.isAttackModifier, true);
    });

    test('World-Spanning, Others only', () {
      var mod = mods.fetch('World-Spanning, Others only');
      expect(mod.name, 'World-Spanning, Others only');
      expect(mod.value, 50);
      expect(mod.isAttackModifier, false);
    });

    test('World-Spanning, Others plus current', () {
      var mod = mods.fetch('World-Spanning, Others plus current');
      expect(mod.name, 'World-Spanning, Others plus current');
      expect(mod.value, 100);
      expect(mod.isAttackModifier, false);
    });
  });

  group('Leveled enhancers', () {
    test('Accurate', () {
      var mod = mods.fetch('Accurate') as LeveledModifier;
      expect(mod.isAttackModifier, true);
      expect(mod.level, 1);
      expect(mod.value, 5);
      mod.level = 3;
      expect(mod.value, 15);
    });

    test('Affects Others', () {
      var mod = mods.fetch('Affects Others') as LeveledModifier;
      expect(mod.isAttackModifier, false);
      expect(mod.level, 1);
      expect(mod.value, 50);
      mod.level = 3;
      expect(mod.value, 150);
    });

    test('Area Effect', () {
      var mod = mods.fetch('Area Effect') as LeveledModifier;
      expect(mod.isAttackModifier, true);
      expect(mod.level, 1);
      expect(mod.value, 50);
      mod.level = 3;
      expect(mod.value, 150);
    });

    //TODO: You cannot combine Cone with Area Effect, Aura, Jet, Melee Attack,
    // Rapid Fire, or Emanation.
    test('Cone', () {
      var mod = mods.fetch('Cone') as LeveledModifier;
      expect(mod.isAttackModifier, true);
      expect(mod.level, 1);
      expect(mod.value, 60);
      mod.level = 3;
      expect(mod.value, 80);
    });

    test('Decreased Immunity', () {
      var mod = mods.fetch('Decreased Immunity') as LeveledModifier;
      expect(mod.isAttackModifier, false);
      expect(mod.level, 1);
      expect(mod.value, 50);
      mod.level = 4;
      expect(mod.value, 200);
      expect(() => mod.level = 5, throwsA(isA<RangeError>()));
    });

    test('Explosion', () {
      var mod = mods.fetch('Explosion') as LeveledModifier;
      expect(mod.isAttackModifier, true);
      expect(mod.level, 1);
      expect(mod.value, 50);
      mod.level = 3;
      expect(mod.value, 150);
    });

    test('Extended Duration', () {
      var mod = mods.fetch('Extended Duration') as LeveledModifier;
      expect(mod.isAttackModifier, false);
      expect(mod.level, 1);
      expect(mod.value, 20);
      mod.level = 14;
      expect(mod.value, 280);
      expect(() => mod.level = 15, throwsA(isA<RangeError>()));
    });

    test('Extra Passes', () {
      var mod = mods.fetch('Extra Passes') as LeveledModifier;
      expect(mod.isAttackModifier, true);
      expect(mod.level, 1);
      expect(mod.value, 10);
      mod.level = 3;
      expect(mod.value, 30);
    });

    test('Fragmentation, Cutting', () {
      var mod = mods.fetch('Fragmentation, Cutting') as LeveledModifier;
      expect(mod.isAttackModifier, true);
      expect(mod.level, 1);
      expect(mod.value, 15);
      mod.level = 3;
      expect(mod.value, 45);
    });

    test('Fragmentation, Hot', () {
      var mod = mods.fetch('Fragmentation, Hot') as LeveledModifier;
      expect(mod.isAttackModifier, true);
      expect(mod.level, 1);
      expect(mod.value, 15);
      mod.level = 3;
      expect(mod.value, 45);
    });

    test('Fragmentation, Impaling', () {
      var mod = mods.fetch('Fragmentation, Impaling') as LeveledModifier;
      expect(mod.isAttackModifier, true);
      expect(mod.level, 1);
      expect(mod.value, 20);
      mod.level = 3;
      expect(mod.value, 60);
    });

    test('Fragmentation, Large Piercing', () {
      var mod = mods.fetch('Fragmentation, Large Piercing') as LeveledModifier;
      expect(mod.isAttackModifier, true);
      expect(mod.level, 1);
      expect(mod.value, 15);
      mod.level = 3;
      expect(mod.value, 45);
    });

    test('Incendiary, Burning', () {
      var mod = mods.fetch('Incendiary, Burning') as LeveledModifier;
      expect(mod.isAttackModifier, true);
      expect(mod.level, 1);
      expect(mod.value, 10);
      mod.level = 3;
      expect(mod.value, 30);
    });

    test('Increased Range', () {
      var mod = mods.fetch('Increased Range') as LeveledModifier;
      expect(mod.isAttackModifier, false);
      expect(mod.level, 1);
      expect(mod.value, 10);
      mod.level = 3;
      expect(mod.value, 30);
    });

    test('Long-Range', () {
      var mod = mods.fetch('Long-Range') as LeveledModifier;
      expect(mod.isAttackModifier, false);
      expect(mod.level, 1);
      expect(mod.value, 50);
      mod.level = 3;
      expect(mod.value, 150);
      expect(() => mod.level = 4, throwsA(isA<RangeError>()));
    });

    test('Low Psychic Signature', () {
      var mod = mods.fetch('Low Psychic Signature') as LeveledModifier;
      expect(mod.isAttackModifier, false);
      expect(mod.level, 1);
      expect(mod.value, 5);
      mod.level = 5;
      expect(mod.value, 25);
      expect(() => mod.level = 6, throwsA(isA<RangeError>()));
    });

    test('Low Signature, Variable', () {
      var mod = mods.fetch('Low Signature, Variable') as LeveledModifier;
      expect(mod.isAttackModifier, false);
      expect(mod.level, 1);
      expect(mod.value, 5);
      mod.level = 5;
      expect(mod.value, 25);
      expect(() => mod.level = 6, throwsA(isA<RangeError>()));
    });

    //TODO: You may only add this enhancement to an attack that has both Area
    // Effect and Persistent.
    //TODO: Mobile is mutually exclusive with Drifting.
    test('Mobile', () {
      var mod = mods.fetch('Mobile') as LeveledModifier;
      expect(mod.isAttackModifier, true);
      expect(mod.level, 1);
      expect(mod.value, 40);
      mod.level = 5;
      expect(mod.value, 200);
    });

    test('Reduced Fatigue Cost', () {
      var mod = mods.fetch('Reduced Fatigue Cost') as LeveledModifier;
      expect(mod.isAttackModifier, false);
      expect(mod.level, 1);
      expect(mod.value, 20);
      mod.level = 5;
      expect(mod.value, 100);
    });

    //TODO: You cannot add Reduced Time to attack powers, to traits that list
    // any kind of special modifier that affects activation time, or to Magery.
    test('Reduced Time', () {
      var mod = mods.fetch('Reduced Time') as LeveledModifier;
      expect(mod.isAttackModifier, false);
      expect(mod.level, 1);
      expect(mod.value, 20);
      mod.level = 5;
      expect(mod.value, 100);
    });

    test('Reliable', () {
      var mod = mods.fetch('Reliable') as LeveledModifier;
      expect(mod.isAttackModifier, false);
      expect(mod.level, 1);
      expect(mod.value, 5);
      mod.level = 10;
      expect(mod.value, 50);
      expect(() => mod.level = 11, throwsA(isA<RangeError>()));
    });
  });

  group('Variable enhancers', () {
    test('Armor Divisor', () {
      var mod = mods.fetch('Armor Divisor') as VariableModifier;
      expect(mod.isAttackModifier, true);
      expect(mod.level, 1);
      expect(mod.value, -70);
      mod.level = 2;
      expect(mod.value, -50);
      mod.level = 3;
      expect(mod.value, -30);
      mod.level = 4;
      expect(mod.value, 50);
      mod.level = 5;
      expect(mod.value, 100);
      mod.level = 6;
      expect(mod.value, 150);
      mod.level = 7;
      expect(mod.value, 200);
      expect(() => mod.level = 8, throwsA(isA<RangeError>()));
    });

    test('Can Carry Objects', () {
      var mod = mods.fetch('Can Carry Objects') as VariableModifier;
      expect(mod.isAttackModifier, false);
      expect(mod.level, 1);
      expect(mod.value, 10);
      mod.level = 2;
      expect(mod.value, 20);
      mod.level = 3;
      expect(mod.value, 50);
      mod.level = 4;
      expect(mod.value, 100);
      mod.level = 5;
      expect(mod.value, 150);
      expect(() => mod.level = 6, throwsA(isA<RangeError>()));
    });

    test('Cyclic', () {
      var mod = mods.fetch('Cyclic') as VariableModifier;
      expect(mod.isAttackModifier, true);
      expect(mod.level, 1);
      expect(mod.value, 10);
      mod.level = 2;
      expect(mod.value, 20);
      mod.level = 3;
      expect(mod.value, 40);
      mod.level = 4;
      expect(mod.value, 50);
      mod.level = 5;
      expect(mod.value, 100);
      expect(() => mod.level = 6, throwsA(isA<RangeError>()));
    });

    test('Increased Range, LOS', () {
      var mod = mods.fetch('Increased Range, LOS') as VariableModifier;
      expect(mod.isAttackModifier, false);
      expect(mod.level, 1);
      expect(mod.value, 90);
      mod.level = 2;
      expect(mod.value, 80);
      mod.level = 3;
      expect(mod.value, 70);
      mod.level = 4;
      expect(mod.value, 60);
      mod.level = 5;
      expect(mod.value, 50);
      mod.level = 6;
      expect(mod.value, 40);
      mod.level = 7;
      expect(mod.value, 30);
      mod.level = 8;
      expect(mod.value, 20);
      mod.level = 9;
      expect(mod.value, 10);
      mod.level = 10;
      expect(mod.value, 0);
      expect(() => mod.level = 11, throwsA(isA<RangeError>()));
    });

    test('Rapid Fire', () {
      var mod = mods.fetch('Rapid Fire') as VariableModifier;
      expect(mod.isAttackModifier, true);
      expect(mod.level, 1);
      expect(mod.value, 40);
      mod.level = 2;
      expect(mod.value, 50);
      mod.level = 3;
      expect(mod.value, 70);
      mod.level = 4;
      expect(mod.value, 100);
      mod.level = 5;
      expect(mod.value, 150);
      mod.level = 6;
      expect(mod.value, 200);
      mod.level = 7;
      expect(mod.value, 250);
      mod.level = 8;
      expect(mod.value, 300);
      expect(() => mod.level = 9, throwsA(isA<RangeError>()));
    });

    test('Rapid Fire, Selective', () {
      var mod = mods.fetch('Rapid Fire, Selective') as VariableModifier;
      expect(mod.isAttackModifier, true);
      expect(mod.level, 1);
      expect(mod.value, 80);
      mod.level = 2;
      expect(mod.value, 110);
      mod.level = 3;
      expect(mod.value, 160);
      mod.level = 4;
      expect(mod.value, 210);
      mod.level = 5;
      expect(mod.value, 260);
      mod.level = 6;
      expect(mod.value, 310);
      expect(() => mod.level = 7, throwsA(isA<RangeError>()));
    });
  });

  group('Simple limitations', () {
    //TODO: You may only take this limitation in conjunction with Area Effect or Cone.
    test('Bombardment, Effective skill 14', () {
      var mod = mods.fetch('Bombardment, Effective skill 14');
      expect(mod.value, -5);
      expect(mod.isAttackModifier, true);
    });

    test('Bombardment, Effective skill 12', () {
      var mod = mods.fetch('Bombardment, Effective skill 12');
      expect(mod.value, -10);
      expect(mod.isAttackModifier, true);
    });

    test('Bombardment, Effective skill 10', () {
      var mod = mods.fetch('Bombardment, Effective skill 10');
      expect(mod.value, -15);
      expect(mod.isAttackModifier, true);
    });

    test('Bombardment, Effective skill 8', () {
      var mod = mods.fetch('Bombardment, Effective skill 8');
      expect(mod.value, -20);
      expect(mod.isAttackModifier, true);
    });

    //TODO: Gadget limitation.
    test('Can Be Stolen, Forcefully removed', () {
      var mod = mods.fetch('Can Be Stolen, Forcefully removed');
      expect(mod.value, -10);
      expect(mod.isAttackModifier, false);
    });

    //TODO: Gadget limitation.
    test('Can Be Stolen, Easily snatched', () {
      var mod = mods.fetch('Can Be Stolen, Easily snatched');
      expect(mod.value, -40);
      expect(mod.isAttackModifier, false);
    });

    //TODO: Gadget limitation.
    test('Can Be Stolen, Quick Contest', () {
      var mod = mods.fetch('Can Be Stolen, Quick Contest');
      expect(mod.value, -30);
      expect(mod.isAttackModifier, false);
    });

    //TODO: Gadget limitation.
    test('Can Be Stolen, Stealth or trickery', () {
      var mod = mods.fetch('Can Be Stolen, Stealth or trickery');
      expect(mod.value, -20);
      expect(mod.isAttackModifier, false);
    });

    test('Active Defense', () {
      var mod = mods.fetch('Active Defense');
      expect(mod.value, -40);
      expect(mod.isAttackModifier, false);
    });

    test('Active Defense, Indpependent', () {
      var mod = mods.fetch('Active Defense, Independent');
      expect(mod.value, -20);
      expect(mod.isAttackModifier, false);
    });

    test('All-Out', () {
      var mod = mods.fetch('All-Out');
      expect(mod.value, -25);
      expect(mod.isAttackModifier, false);
    });

    test('All-Out Concentrate', () {
      var mod = mods.fetch('All-Out Concentrate');
      expect(mod.value, -25);
      expect(mod.isAttackModifier, false);
    });

    test('Aspected', () {
      var mod = mods.fetch('Aspected');
      expect(mod.value, -20);
      expect(mod.isAttackModifier, false);
    });

    test('Attracts Threats, 6 or less', () {
      var mod = mods.fetch('Attracts Threats, 6 or less');
      expect(mod.value, -5);
      expect(mod.isAttackModifier, false);
    });

    test('Attracts Threats, 9 or less', () {
      var mod = mods.fetch('Attracts Threats, 9 or less');
      expect(mod.value, -10);
      expect(mod.isAttackModifier, false);
    });

    test('Blockable', () {
      var mod = mods.fetch('Blockable');
      expect(mod.value, -5);
      expect(mod.isAttackModifier, false);
    });

    test('Blood Agent, Reversed', () {
      var mod = mods.fetch('Blood Agent, Reversed');
      expect(mod.value, -40);
      expect(mod.isAttackModifier, false);
    });

    test('Can Be Blocked or Parried', () {
      var mod = mods.fetch('Can Be Blocked or Parried');
      expect(mod.value, -10);
      expect(mod.isAttackModifier, false);
    });

    test('Can Be Parried', () {
      var mod = mods.fetch('Can Be Parried');
      expect(mod.value, -5);
      expect(mod.isAttackModifier, false);
    });

    //TODO: You may only take this limitation in conjunction with Area Effect or Cone.
    test('Dissipation', () {
      var mod = mods.fetch('Dissipation');
      expect(mod.value, -50);
      expect(mod.isAttackModifier, true);
    });

    //TODO: You may only take this limitation in conjunction with Area Effect.
    test('Emanation', () {
      var mod = mods.fetch('Emanation');
      expect(mod.value, -20);
      expect(mod.isAttackModifier, true);
    });

    test('Emergencies Only', () {
      var mod = mods.fetch('Emergencies Only');
      expect(mod.value, -30);
      expect(mod.isAttackModifier, false);
    });

    test('Fickle', () {
      var mod = mods.fetch('Fickle');
      expect(mod.value, -20);
      expect(mod.isAttackModifier, false);
    });

    test('Full Power in Emergencies Only', () {
      var mod = mods.fetch('Full Power in Emergencies Only');
      expect(mod.value, -20);
      expect(mod.isAttackModifier, false);
    });

    test('Granted by (Other)', () {
      var mod = mods.fetch('Granted by (Other)');
      expect(mod.value, -40);
      expect(mod.isAttackModifier, false);
    });

    test('Informal', () {
      var mod = mods.fetch('Informal');
      expect(mod.value, -50);
      expect(mod.isAttackModifier, false);
    });

    test('Insubstantial Only', () {
      var mod = mods.fetch('Insubstantial Only');
      expect(mod.value, -30);
      expect(mod.isAttackModifier, false);
    });

    test('Magnetic', () {
      var mod = mods.fetch('Magnetic');
      expect(mod.value, -50);
      expect(mod.isAttackModifier, false);
    });

    test('Mana-Sensitive', () {
      var mod = mods.fetch('Mana-Sensitive');
      expect(mod.value, -10);
      expect(mod.isAttackModifier, false);
    });

    test('Minimum Range, 1% Max', () {
      var mod = mods.fetch('Minimum Range, 1% Max');
      expect(mod.value, -5);
      expect(mod.isAttackModifier, false);
    });

    test('Minimum Range, 5% Max', () {
      var mod = mods.fetch('Minimum Range, 5% Max');
      expect(mod.value, -10);
      expect(mod.isAttackModifier, false);
    });

    test('No Blunt Trauma', () {
      var mod = mods.fetch('No Blunt Trauma');
      expect(mod.value, -20);
      expect(mod.isAttackModifier, true);
    });

    test('No DR Reduction', () {
      var mod = mods.fetch('No DR Reduction');
      expect(mod.value, -20);
      expect(mod.isAttackModifier, true);
    });

    test('No Incendiary Effect', () {
      var mod = mods.fetch('No Incendiary Effect');
      expect(mod.value, -10);
      expect(mod.isAttackModifier, true);
    });

    test('No Knockback', () {
      var mod = mods.fetch('No Knockback');
      expect(mod.value, -10);
      expect(mod.isAttackModifier, true);
    });

    test('No Wounding', () {
      var mod = mods.fetch('No Wounding');
      expect(mod.value, -10);
      expect(mod.isAttackModifier, true);
    });

    test('Only When Berserk', () {
      var mod = mods.fetch('Only When Berserk');
      expect(mod.value, -20);
      expect(mod.isAttackModifier, false);
    });

    // TODO: You can’t combine this with All-Out, All-Out Concentrate, or
    // Requires Ready.
    test('Requires Concentrate', () {
      var mod = mods.fetch('Requires Concentrate');
      expect(mod.value, -15);
      expect(mod.isAttackModifier, false);
    });

    test('Requires Ready', () {
      var mod = mods.fetch('Requires Ready');
      expect(mod.value, -10);
      expect(mod.isAttackModifier, false);
    });

    test('Requires Reaction Roll', () {
      var mod = mods.fetch('Requires Reaction Roll');
      expect(mod.value, -5);
      expect(mod.isAttackModifier, false);
    });

    test('Skill Enhancement Only', () {
      var mod = mods.fetch('Skill Enhancement Only');
      expect(mod.value, -60);
      expect(mod.isAttackModifier, false);
    });

    test('Substantial Only', () {
      var mod = mods.fetch('Substantial Only');
      expect(mod.value, -10);
      expect(mod.isAttackModifier, false);
    });

    // TODO: You can only take this limitation in conjunction with Uncontrollable.
    test('Unconscious Only', () {
      var mod = mods.fetch('Unconscious Only');
      expect(mod.value, -20);
      expect(mod.isAttackModifier, false);
    });

    test('Uncontrollable, Inconvenient', () {
      var mod = mods.fetch('Uncontrollable, Inconvenient');
      expect(mod.value, -10);
      expect(mod.isAttackModifier, false);
    });

    test('Uncontrollable, Dangerous', () {
      var mod = mods.fetch('Uncontrollable, Dangerous');
      expect(mod.value, -30);
      expect(mod.isAttackModifier, false);
    });

    test('Unique', () {
      var mod = mods.fetch('Unique');
      expect(mod.value, -25);
      expect(mod.isAttackModifier, false);
    });

    test('Unsupported', () {
      var mod = mods.fetch('Unsupported');
      expect(mod.value, -25);
      expect(mod.isAttackModifier, false);
    });

    test('Untrainable', () {
      var mod = mods.fetch('Untrainable');
      expect(mod.value, -40);
      expect(mod.isAttackModifier, false);
    });

    test('Visible, Attack', () {
      var mod = mods.fetch('Visible, Attack');
      expect(mod.value, -20);
      expect(mod.isAttackModifier, false);
    });

    test('Visible, Non-Attack', () {
      var mod = mods.fetch('Visible, Non-Attack');
      expect(mod.value, -10);
      expect(mod.isAttackModifier, false);
    });

    test('Always On, Social or Cosmetic', () {
      var mod = mods.fetch('Always On, Social or Cosmetic');
      expect(mod.value, -10);
      expect(mod.isAttackModifier, false);
    });

    test('Always On, Dangerous', () {
      var mod = mods.fetch('Always On, Dangerous');
      expect(mod.value, -40);
      expect(mod.isAttackModifier, false);
    });

    test('Always On, Physically Inconvenient', () {
      var mod = mods.fetch('Always On, Physically Inconvenient');
      expect(mod.value, -20);
      expect(mod.isAttackModifier, false);
    });
  });

  //TODO: This is the catch-all limitation. Must provide someway to enter
  // limitation information (and potentially save it).
  group('Accessibility', () {
    test('Requires gestures', () {
      var mod = mods.fetch('Accessibility, Requires gestures');
      expect(mod.value, -10);
    });
    test('Requires magic words', () {
      var mod = mods.fetch('Accessibility, Requires magic words');
      expect(mod.value, -10);
    });
    test('Requires material component', () {
      var mod = mods.fetch('Accessibility, Requires material component');
      expect(mod.value, -10);
    });
    test('Requires material component (extremely rare)', () {
      var mod = mods
          .fetch('Accessibility, Requires material component (extremely rare)');
      expect(mod.value, -15);
    });
    test('Requires simple ritual', () {
      var mod = mods.fetch('Accessibility, Requires simple ritual');
      expect(mod.value, -5);
    });
    test('Requires typical ritual', () {
      var mod = mods.fetch('Accessibility, Requires typical ritual');
      expect(mod.value, -10);
    });
    test('Requires complex ritual', () {
      var mod = mods.fetch('Accessibility, Requires complex ritual');
      expect(mod.value, -20);
    });
    test('Requires (item)', () {
      var mod = mods.fetch('Accessibility, Requires (item)');
      expect(mod.value, -10);
    });
    test('Only on those who share a language with me', () {
      var mod = mods
          .fetch('Accessibility, Only on those who share a language with me');
      expect(mod.value, -10);
    });
    test('Only while moving (1 step/turn)', () {
      var mod = mods.fetch('Accessibility, Only while moving (1 step/turn)');
      expect(mod.value, -10);
    });
    test('Only while moving (half Move)', () {
      var mod = mods.fetch('Accessibility, Only while moving (half Move)');
      expect(mod.value, -20);
    });
    test('While conscious', () {
      var mod = mods.fetch('Accessibility, While conscious');
      expect(mod.value, -5);
    });
    test('Only while moving (full Move)', () {
      var mod = mods.fetch('Accessibility, Only while moving (full Move)');
      expect(mod.value, -30);
    });
    test('Only at day', () {
      var mod = mods.fetch('Accessibility, Only at day');
      expect(mod.value, -20);
    });
    test('Only at night', () {
      var mod = mods.fetch('Accessibility, Only at night');
      expect(mod.value, -20);
    });
    test('Only by one side of split personality', () {
      var mod =
          mods.fetch('Accessibility, Only by one side of split personality');
      expect(mod.value, -40);
    });
    test('Only in altered body form', () {
      var mod = mods.fetch('Accessibility, Only in altered body form');
      expect(mod.value, -10);
    });
    test('Only in direct sunlight', () {
      var mod = mods.fetch('Accessibility, Only in direct sunlight');
      expect(mod.value, -30);
    });
    test('Only during full moon', () {
      var mod = mods.fetch('Accessibility, Only during full moon');
      expect(mod.value, -40);
    });
    test('Only during new moon', () {
      var mod = mods.fetch('Accessibility, Only during new moon');
      expect(mod.value, -40);
    });
    test('Only while flying', () {
      var mod = mods.fetch('Accessibility, Only while flying');
      expect(mod.value, -30);
    });
    test('Only while in hypnotic trance', () {
      var mod = mods.fetch('Accessibility, Only while in hypnotic trance');
      expect(mod.value, -30);
    });
    test('Only while swimming', () {
      var mod = mods.fetch('Accessibility, Only while swimming');
      expect(mod.value, -30);
    });
    test('Only while playing musical instrument', () {
      var mod =
          mods.fetch('Accessibility, Only while playing musical instrument');
      expect(mod.value, -20);
    });
    test('Useless under stress', () {
      var mod = mods.fetch('Accessibility, Useless under stress');
      expect(mod.value, -60);
    });
  });

  group('Leveled limitations', () {
    test('Cardiac Stress', () {
      var mod = mods.fetch('Cardiac Stress') as VariableModifier;
      expect(mod.value, -50);
      expect(mod.level, 1);
      expect(mod.isAttackModifier, false);
      mod.level = 5;
      expect(mod.value, -10);
      expect(() => mod.level = 6, throwsA(isA<RangeError>()));
    });

    test('Cerebral Stress', () {
      var mod = mods.fetch('Cerebral Stress') as VariableModifier;
      expect(mod.value, -50);
      expect(mod.level, 1);
      expect(mod.isAttackModifier, false);
      mod.level = 5;
      expect(mod.value, -10);
      expect(() => mod.level = 6, throwsA(isA<RangeError>()));
    });

    test('Costs Fatigue', () {
      var mod = mods.fetch('Costs Fatigue') as LeveledModifier;
      expect(mod.isAttackModifier, false);
      expect(mod.level, 1);
      expect(mod.value, -5);
      mod.level = 4;
      expect(mod.value, -20);
    });

    test('Costs Fatigue, Per second', () {
      var mod = mods.fetch('Costs Fatigue, Per second') as LeveledModifier;
      expect(mod.isAttackModifier, false);
      expect(mod.level, 1);
      expect(mod.value, -10);
      mod.level = 4;
      expect(mod.value, -40);
    });

    test('Costs Hit Points', () {
      var mod = mods.fetch('Costs Hit Points') as LeveledModifier;
      expect(mod.isAttackModifier, false);
      expect(mod.level, 1);
      expect(mod.value, -10);
      mod.level = 4;
      expect(mod.value, -40);
    });

    test('Costs Hit Points, Per second', () {
      var mod = mods.fetch('Costs Hit Points, Per second') as LeveledModifier;
      expect(mod.isAttackModifier, false);
      expect(mod.level, 1);
      expect(mod.value, -20);
      mod.level = 4;
      expect(mod.value, -80);
    });

    test('Costs Hit Points, Instead of Fatigue', () {
      var mod =
          mods.fetch('Costs Hit Points, Instead of Fatigue') as LeveledModifier;
      expect(mod.isAttackModifier, false);
      expect(mod.level, 1);
      expect(mod.value, -5);
      mod.level = 4;
      expect(mod.value, -20);
    });

    test('Costs Hit Points, Per second instead of Fatigue', () {
      var mod = mods.fetch('Costs Hit Points, Per second instead of Fatigue')
          as LeveledModifier;
      expect(mod.isAttackModifier, false);
      expect(mod.level, 1);
      expect(mod.value, -10);
      mod.level = 4;
      expect(mod.value, -40);
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
