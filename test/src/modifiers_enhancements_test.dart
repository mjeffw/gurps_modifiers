import 'dart:convert';

import 'package:gurps_modifiers/src/modifier_template.dart';
import 'package:gurps_modifiers/src/modifiers.dart';
import 'package:test/test.dart';

main() {
  group('Simple enhancers', () {
    test('Affects Insubstantial', () {
      ModifierTemplate mod =
          ModifierTemplates.instance().fetch('Affects Insubstantial');
      expect(mod.percentage, 20);
      expect(mod.isAttackModifier, false);
    });

    test('Affects Insubstantial, Selective', () {
      ModifierTemplate mod = ModifierTemplates.instance()
          .fetch('Affects Insubstantial, Selective');
      expect(mod.percentage, 30);
      expect(mod.isAttackModifier, false);
    });

    test('Affects Substantial', () {
      ModifierTemplate mod =
          ModifierTemplates.instance().fetch('Affects Substantial');
      expect(mod.percentage, 40);
      expect(mod.isAttackModifier, false);
    });

    test('Affects Substantial, Selective', () {
      ModifierTemplate mod =
          ModifierTemplates.instance().fetch('Affects Substantial, Selective');
      expect(mod.percentage, 50);
      expect(mod.isAttackModifier, false);
    });

    //TODO: Ammo options value is reduced by 5% if it takes a second to switch
    // between ammo types.
    test('AP Ammo, Huge piercing', () {
      ModifierTemplate mod =
          ModifierTemplates.instance().fetch('AP Ammo, Huge piercing');
      expect(mod.percentage, 35);
      expect(mod.isAttackModifier, true);
    });

    //TODO: Ammo options value is reduced by 5% if it takes a second to switch
    // between ammo types.
    test('AP Ammo, Large piercing', () {
      ModifierTemplate mod =
          ModifierTemplates.instance().fetch('AP Ammo, Large piercing');
      expect(mod.percentage, 45);
      expect(mod.isAttackModifier, true);
    });

    //TODO: Ammo options value is reduced by 5% if it takes a second to switch
    // between ammo types.
    test('AP Ammo, Piercing', () {
      ModifierTemplate mod =
          ModifierTemplates.instance().fetch('AP Ammo, Piercing');
      expect(mod.percentage, 20);
      expect(mod.isAttackModifier, true);
    });

    test('Aura', () {
      var mod = ModifierTemplates.instance().fetch('Aura');
      expect(mod.percentage, 80);
      expect(mod.isAttackModifier, true);
    });

    test('Based on (Attribute)', () {
      var mod = ModifierTemplates.instance().fetch('Based On');
      expect(mod.percentage, 20);
      expect(mod.isAttackModifier, false);
    });

    test('Based on (Attribute), Own Roll', () {
      var mod = ModifierTemplates.instance().fetch('Based On, Own Roll');
      expect(mod.percentage, 20);
      expect(mod.isAttackModifier, false);
    });

    test('Cosmic, Avoiding drawbacks', () {
      var mod =
          ModifierTemplates.instance().fetch('Cosmic, Avoiding drawbacks');
      expect(mod.percentage, 50);
      expect(mod.isAttackModifier, false);
    });

    test('Cosmic, Defensive', () {
      var mod = ModifierTemplates.instance().fetch('Cosmic, Defensive');
      expect(mod.percentage, 50);
      expect(mod.isAttackModifier, false);
    });

    test('Cosmic, Irresistible attack', () {
      var mod =
          ModifierTemplates.instance().fetch('Cosmic, Irresistible attack');
      expect(mod.percentage, 300);
      expect(mod.isAttackModifier, false);
    });

    test('Cosmic, Lingering effect', () {
      var mod = ModifierTemplates.instance().fetch('Cosmic, Lingering effect');
      expect(mod.percentage, 100);
      expect(mod.isAttackModifier, false);
    });

    test('Cosmic, No active defense allowed', () {
      var mod = ModifierTemplates.instance()
          .fetch('Cosmic, No active defense allowed');
      expect(mod.percentage, 300);
      expect(mod.isAttackModifier, false);
    });

    test('Cosmic, No die roll required', () {
      var mod =
          ModifierTemplates.instance().fetch('Cosmic, No die roll required');
      expect(mod.percentage, 100);
      expect(mod.isAttackModifier, false);
    });

    test('Cosmic, No Rule of 16', () {
      var mod = ModifierTemplates.instance().fetch('Cosmic, No Rule of 16');
      expect(mod.percentage, 50);
      expect(mod.isAttackModifier, false);
    });

    test('Cosmic, Privileged attack', () {
      var mod = ModifierTemplates.instance().fetch('Cosmic, Privileged attack');
      expect(mod.percentage, 50);
      expect(mod.isAttackModifier, false);
    });

    test('Cosmic, Unhealing damage', () {
      var mod = ModifierTemplates.instance().fetch('Cosmic, Unhealing damage');
      expect(mod.percentage, 100);
      expect(mod.isAttackModifier, false);
    });

    test('Cosmic, Unrestricted powers', () {
      var mod =
          ModifierTemplates.instance().fetch('Cosmic, Unrestricted powers');
      expect(mod.percentage, 300);
      expect(mod.isAttackModifier, false);
    });

    test('Decreased Immunity 0', () {
      var mod = ModifierTemplates.instance().fetch('Decreased Immunity 0');
      expect(mod.percentage, 20);
      expect(mod.isAttackModifier, false);
    });

    test('Dehydration', () {
      var mod = ModifierTemplates.instance().fetch('Dehydration');
      expect(mod.percentage, 20);
      expect(mod.isAttackModifier, true);
    });

    test('Delay, Fixed', () {
      var mod = ModifierTemplates.instance().fetch('Delay, Fixed');
      expect(mod.percentage, 0);
      expect(mod.isAttackModifier, true);
    });

    test('Delay, Supernatural (fixed)', () {
      var mod =
          ModifierTemplates.instance().fetch('Delay, Supernatural, fixed');
      expect(mod.percentage, 50);
      expect(mod.isAttackModifier, true);
    });

    test('Delay, Supernatural (variable)', () {
      var mod =
          ModifierTemplates.instance().fetch('Delay, Supernatural, variable');
      expect(mod.percentage, 100);
      expect(mod.isAttackModifier, true);
    });

    test('Delay, Variable (short)', () {
      var mod = ModifierTemplates.instance().fetch('Delay, Variable, short');
      expect(mod.percentage, 10);
      expect(mod.isAttackModifier, true);
    });

    test('Delay, Variable (long)', () {
      var mod = ModifierTemplates.instance().fetch('Delay, Variable, long');
      expect(mod.percentage, 20);
      expect(mod.isAttackModifier, true);
    });

    test('Delay, Triggered', () {
      var mod = ModifierTemplates.instance().fetch('Delay, Triggered');
      expect(mod.percentage, 50);
      expect(mod.isAttackModifier, true);
    });

    test('Destructive Parry', () {
      var mod = ModifierTemplates.instance().fetch('Destructive Parry');
      expect(mod.percentage, 10);
      expect(mod.isAttackModifier, true);
    });

    test('Double Blunt Trauma', () {
      var mod = ModifierTemplates.instance().fetch('Double Blunt Trauma');
      expect(mod.percentage, 20);
      expect(mod.isAttackModifier, true);
    });

    test('Double Knockback', () {
      var mod = ModifierTemplates.instance().fetch('Double Knockback');
      expect(mod.percentage, 20);
      expect(mod.isAttackModifier, true);
    });

    //TODO: Mobile is mutually exclusive with Drifting.
    test('Drifting', () {
      var mod = ModifierTemplates.instance().fetch('Drifting');
      expect(mod.percentage, 20);
      expect(mod.isAttackModifier, true);
    });

    test('Drowning', () {
      var mod = ModifierTemplates.instance().fetch('Drowning');
      expect(mod.percentage, 0);
      expect(mod.isAttackModifier, true);
    });

    test('Dual', () {
      var mod = ModifierTemplates.instance().fetch('Dual');
      expect(mod.percentage, 10);
      expect(mod.isAttackModifier, true);
    });

    test('Erosive', () {
      var mod = ModifierTemplates.instance().fetch('Erosive');
      expect(mod.percentage, 10);
      expect(mod.isAttackModifier, true);
    });

    test('Extended Duration, Permanent', () {
      var mod =
          ModifierTemplates.instance().fetch('Extended Duration, Permanent');
      expect(mod.percentage, 300);
      expect(mod.isAttackModifier, false);
    });

    test('Extended Duration, Permanent, dispellable', () {
      var mod = ModifierTemplates.instance()
          .fetch('Extended Duration, Permanent, dispellable');
      expect(mod.percentage, 150);
      expect(mod.isAttackModifier, false);
    });

    test('Fixed Duration', () {
      var mod = ModifierTemplates.instance().fetch('Fixed Duration');
      expect(mod.percentage, 0);
      expect(mod.isAttackModifier, false);
    });

    //TODO: Exception: On a passive carrier attack such as Spines, Follow-Up is
    // a -50% limitation.
    //TODO: Follow-Up is a “penetration modifier”; you cannot combine it with
    // other penetration modifiers (although the carrier attack can have them).
    test('Follow-Up, Natural weapon', () {
      var mod = ModifierTemplates.instance().fetch('Follow-Up, Natural weapon');
      expect(mod.percentage, 0);
      expect(mod.isAttackModifier, false);
    });

    //TODO: Follow-Up, Universal is a "penetration modifier"; you cannot
    // combine it with other penetration modifiers.
    test('Follow-Up, Universal', () {
      var mod = ModifierTemplates.instance().fetch('Follow-Up, Universal');
      expect(mod.percentage, 50);
      expect(mod.isAttackModifier, false);
    });

    test('Force Field', () {
      var mod = ModifierTemplates.instance().fetch('Force Field');
      expect(mod.percentage, 20);
      expect(mod.isAttackModifier, false);
    });

    test('Freezing', () {
      var mod = ModifierTemplates.instance().fetch('Freezing');
      expect(mod.percentage, 20);
      expect(mod.isAttackModifier, true);
    });

    test('Game Time', () {
      var mod = ModifierTemplates.instance().fetch('Game Time');
      expect(mod.percentage, 0);
      expect(mod.isAttackModifier, false);
    });

    test('Guided', () {
      var mod = ModifierTemplates.instance().fetch('Guided');
      expect(mod.percentage, 50);
      expect(mod.isAttackModifier, true);
    });

    test('Heat', () {
      var mod = ModifierTemplates.instance().fetch('Heat');
      expect(mod.percentage, 20);
      expect(mod.isAttackModifier, true);
    });

    test('Incendiary, Non-burning', () {
      var mod = ModifierTemplates.instance().fetch('Incendiary, Non-burning');
      expect(mod.percentage, 10);
      expect(mod.isAttackModifier, true);
    });

    //TODO: Ammo options value is reduced by 5% if it takes a second to switch
    // between ammo types.
    test('HP Ammo, Piercing', () {
      ModifierTemplate mod =
          ModifierTemplates.instance().fetch('HP Ammo, Piercing');
      expect(mod.percentage, 20);
      expect(mod.isAttackModifier, true);
    });

    //TODO: Ammo options value is reduced by 5% if it takes a second to switch
    // between ammo types.
    test('HP Ammo, Large piercing', () {
      ModifierTemplate mod =
          ModifierTemplates.instance().fetch('HP Ammo, Large piercing');
      expect(mod.percentage, 20);
      expect(mod.isAttackModifier, true);
    });

    //TODO: Ammo options value is reduced by 5% if it takes a second to switch
    // between ammo types.
    test('HP Ammo, Small piercing', () {
      ModifierTemplate mod =
          ModifierTemplates.instance().fetch('HP Ammo, Small piercing');
      expect(mod.percentage, 40);
      expect(mod.isAttackModifier, true);
    });

    test('Independent', () {
      var mod = ModifierTemplates.instance().fetch('Independent');
      expect(mod.percentage, 40);
      expect(mod.isAttackModifier, false);
    });

    test('Independent, Simultaneous uses', () {
      var mod =
          ModifierTemplates.instance().fetch('Independent, Simultaneous uses');
      expect(mod.percentage, 70);
      expect(mod.isAttackModifier, false);
    });

    test('Jet', () {
      var mod = ModifierTemplates.instance().fetch('Jet');
      expect(mod.percentage, 0);
      expect(mod.isAttackModifier, true);
    });

    test('Link, Independent', () {
      var mod = ModifierTemplates.instance().fetch('Link, Independent');
      expect(mod.percentage, 20);
      expect(mod.isAttackModifier, false);
    });

    test('Link, Permanent', () {
      var mod = ModifierTemplates.instance().fetch('Link, Permanent');
      expect(mod.percentage, 10);
      expect(mod.isAttackModifier, false);
    });

    test('Low Signature', () {
      var mod = ModifierTemplates.instance().fetch('Low Signature');
      expect(mod.percentage, 10);
      expect(mod.isAttackModifier, true);
    });

    //TODO: Malediction is a "penetration modifier"; you cannot combine it with
    // other penetration modifiers, nor with modifiers that apply only to
    // conventional ranged attacks.
    test('Malediction, -1 per yard', () {
      var mod = ModifierTemplates.instance().fetch('Malediction, -1 per yard');
      expect(mod.isAttackModifier, true);
      expect(mod.percentage, 100);
    });

    //TODO: Malediction is a "penetration modifier"; you cannot combine it with
    // other penetration modifiers, nor with modifiers that apply only to
    // conventional ranged attacks.
    test('Malediction, Long-Distance Modifiers', () {
      var mod = ModifierTemplates.instance()
          .fetch('Malediction, Long-Distance Modifiers');
      expect(mod.isAttackModifier, true);
      expect(mod.percentage, 200);
    });

    //TODO: Malediction is a "penetration modifier"; you cannot combine it with
    // other penetration modifiers, nor with modifiers that apply only to
    // conventional ranged attacks.
    test('Malediction, Size and Speed/Range Table', () {
      var mod = ModifierTemplates.instance()
          .fetch('Malediction, Size and Speed/Range Table');
      expect(mod.isAttackModifier, true);
      expect(mod.percentage, 150);
    });

    test('Mental Defense Only', () {
      var mod = ModifierTemplates.instance().fetch('Mental Defense Only');
      expect(mod.percentage, 250);
      expect(mod.isAttackModifier, true);
    });

    test('Missed Sleep', () {
      var mod = ModifierTemplates.instance().fetch('Missed Sleep');
      expect(mod.percentage, 50);
      expect(mod.isAttackModifier, true);
    });

    //TODO: Ammo options value is reduced by 5% if it takes a second to switch
    // between ammo types.
    test('Multi-Ammo, Large piercing', () {
      var mod =
          ModifierTemplates.instance().fetch('Multi-Ammo, Large piercing');
      expect(mod.percentage, 65);
      expect(mod.isAttackModifier, true);
    });

    //TODO: Ammo options value is reduced by 5% if it takes a second to switch
    // between ammo types.
    test('Multi-Ammo, Piercing', () {
      var mod = ModifierTemplates.instance().fetch('Multi-Ammo, Piercing');
      expect(mod.percentage, 40);
      expect(mod.isAttackModifier, true);
    });

    test('No Signature', () {
      var mod = ModifierTemplates.instance().fetch('No Signature');
      expect(mod.percentage, 20);
      expect(mod.isAttackModifier, true);
    });

    test('Once On, Stays On', () {
      var mod = ModifierTemplates.instance().fetch('Once On, Stays On');
      expect(mod.percentage, 50);
      expect(mod.isAttackModifier, false);
    });

    test('Overhead', () {
      var mod = ModifierTemplates.instance().fetch('Overhead');
      expect(mod.percentage, 30);
      expect(mod.isAttackModifier, true);
    });

    test('Persistent', () {
      var mod = ModifierTemplates.instance().fetch('Persistent');
      expect(mod.percentage, 40);
      expect(mod.isAttackModifier, true);
    });

    test('Radiation, Toxic', () {
      var mod = ModifierTemplates.instance().fetch('Radiation, Toxic');
      expect(mod.percentage, 25);
      expect(mod.isAttackModifier, true);
    });

    test('Radiation, Burning', () {
      var mod = ModifierTemplates.instance().fetch('Radiation, Burning');
      expect(mod.percentage, 100);
      expect(mod.isAttackModifier, true);
    });

    test('Ranged', () {
      var mod = ModifierTemplates.instance().fetch('Ranged');
      expect(mod.percentage, 40);
      expect(mod.isAttackModifier, false);
    });

    //TODO: Incompatible with Always On, as well as Active Defense and Usually
    // On (both from Powers).
    test('Reflexive', () {
      var mod = ModifierTemplates.instance().fetch('Reflexive');
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
      var mod = ModifierTemplates.instance().fetch('Respiratory Agent');
      expect(mod.name, 'Respiratory Agent');
      expect(mod.percentage, 50);
      expect(mod.isAttackModifier, true);
    });

    test('Ricochet', () {
      var mod = ModifierTemplates.instance().fetch('Ricochet');
      expect(mod.name, 'Ricochet');
      expect(mod.percentage, 10);
      expect(mod.isAttackModifier, true);
    });

    // TODO You may add this enhancement to any Area Effect or Cone attack.
    test('Selective Area', () {
      var mod = ModifierTemplates.instance().fetch('Selective Area');
      expect(mod.name, 'Selective Area');
      expect(mod.percentage, 20);
      expect(mod.isAttackModifier, true);
    });

    test('Selective Effect', () {
      var mod = ModifierTemplates.instance().fetch('Selective Effect');
      expect(mod.name, 'Selective Effect');
      expect(mod.percentage, 20);
      expect(mod.isAttackModifier, false);
    });

    test('Selectivity', () {
      var mod = ModifierTemplates.instance().fetch('Selectivity');
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
      var mod = ModifierTemplates.instance().fetch('ST-Based');
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
      var mod = ModifierTemplates.instance().fetch('ST-Based, Limited');
      expect(mod.name, 'ST-Based, Limited');
      expect(mod.percentage, 30);
      expect(mod.isAttackModifier, true);
    });

    test('Starvation', () {
      var mod = ModifierTemplates.instance().fetch('Starvation');
      expect(mod.name, 'Starvation');
      expect(mod.percentage, 40);
      expect(mod.isAttackModifier, true);
    });

    test('Suffocation', () {
      var mod = ModifierTemplates.instance().fetch('Suffocation');
      expect(mod.name, 'Suffocation');
      expect(mod.percentage, 0);
      expect(mod.isAttackModifier, true);
    });

    test('Super Attribute', () {
      var mod = ModifierTemplates.instance().fetch('Super Attribute');
      expect(mod.name, 'Super Attribute');
      expect(mod.percentage, 25);
      expect(mod.isAttackModifier, false);
    });

    test('Surge', () {
      var mod = ModifierTemplates.instance().fetch('Surge');
      expect(mod.name, 'Surge');
      expect(mod.percentage, 20);
      expect(mod.isAttackModifier, true);
    });

    test('Surge, Arcing', () {
      var mod = ModifierTemplates.instance().fetch('Surge, Arcing');
      expect(mod.name, 'Surge, Arcing');
      expect(mod.percentage, 100);
      expect(mod.isAttackModifier, true);
    });

    test('Surprise Attack', () {
      var mod = ModifierTemplates.instance().fetch('Surprise Attack');
      expect(mod.name, 'Surprise Attack');
      expect(mod.percentage, 150);
      expect(mod.isAttackModifier, true);
    });

    test('Switchable', () {
      var mod = ModifierTemplates.instance().fetch('Switchable');
      expect(mod.name, 'Switchable');
      expect(mod.percentage, 10);
      expect(mod.isAttackModifier, false);
    });

    test('Thrusting Blade', () {
      var mod = ModifierTemplates.instance().fetch('Thrusting Blade');
      expect(mod.name, 'Thrusting Blade');
      expect(mod.percentage, 15);
      expect(mod.isAttackModifier, true);
    });

    test('Time-Spanning, Past or future plus present', () {
      var mod = ModifierTemplates.instance()
          .fetch('Time-Spanning, Past or future plus present');
      expect(mod.percentage, 50);
      expect(mod.isAttackModifier, false);
    });

    test('Time-Spanning, Universal', () {
      var mod = ModifierTemplates.instance().fetch('Time-Spanning, Universal');
      expect(mod.name, 'Time-Spanning, Universal');
      expect(mod.percentage, 100);
      expect(mod.isAttackModifier, false);
    });

    test('Time-Spanning, Past and future only', () {
      var mod = ModifierTemplates.instance()
          .fetch('Time-Spanning, Past and future only');
      expect(mod.name, 'Time-Spanning, Past and future only');
      expect(mod.percentage, 50);
      expect(mod.isAttackModifier, false);
    });

    test('Time-Spanning, Past or future only', () {
      var mod = ModifierTemplates.instance()
          .fetch('Time-Spanning, Past or future only');
      expect(mod.name, 'Time-Spanning, Past or future only');
      expect(mod.percentage, 0);
      expect(mod.isAttackModifier, false);
    });

    test('Underwater', () {
      var mod = ModifierTemplates.instance().fetch('Underwater');
      expect(mod.name, 'Underwater');
      expect(mod.percentage, 20);
      expect(mod.isAttackModifier, true);
    });

    test('Usually On', () {
      var mod = ModifierTemplates.instance().fetch('Usually On');
      expect(mod.name, 'Usually On');
      expect(mod.percentage, 5);
      expect(mod.isAttackModifier, false);
    });

    test('Variable', () {
      var mod = ModifierTemplates.instance().fetch('Variable');
      expect(mod.name, 'Variable');
      expect(mod.percentage, 5);
      expect(mod.isAttackModifier, true);
    });

    test('Wall, Fixed shape', () {
      var mod = ModifierTemplates.instance().fetch('Wall, Fixed shape');
      expect(mod.name, 'Wall, Fixed shape');
      expect(mod.percentage, 30);
      expect(mod.isAttackModifier, true);
    });

    test('Wall, Variable shape', () {
      var mod = ModifierTemplates.instance().fetch('Wall, Variable shape');
      expect(mod.name, 'Wall, Variable shape');
      expect(mod.percentage, 60);
      expect(mod.isAttackModifier, true);
    });

    test('World-Spanning, Others only', () {
      var mod =
          ModifierTemplates.instance().fetch('World-Spanning, Others only');
      expect(mod.name, 'World-Spanning, Others only');
      expect(mod.percentage, 50);
      expect(mod.isAttackModifier, false);
    });

    test('World-Spanning, Others plus current', () {
      var mod = ModifierTemplates.instance()
          .fetch('World-Spanning, Others plus current');
      expect(mod.name, 'World-Spanning, Others plus current');
      expect(mod.percentage, 100);
      expect(mod.isAttackModifier, false);
    });
  }, skip: false);

  group('Leveled enhancers', () {
    test('Accurate', () {
      var mod =
          ModifierTemplates.instance().fetch('Accurate') as BaseLeveledTemplate;
      expect(mod.isAttackModifier, true);
      expect(mod.levelPercentage(1), 5);
    });

    test('Affects Others', () {
      var mod = ModifierTemplates.instance().fetch('Affects Others')
          as BaseLeveledTemplate;
      expect(mod.isAttackModifier, false);
      expect(mod.levelPercentage(1), 50);
      expect(mod.levelPrompt, 'Number affected');
    });

    test('Area Effect', () {
      var mod = ModifierTemplates.instance().fetch('Area Effect')
          as BaseLeveledTemplate;
      expect(mod.isAttackModifier, true);
      expect(mod.levelPercentage(1), 50);
    });

    //TODO: You cannot combine Cone with Area Effect, Aura, Jet, Melee Attack,
    // Rapid Fire, or Emanation.
    test('Cone', () {
      var mod =
          ModifierTemplates.instance().fetch('Cone') as BaseLeveledTemplate;
      expect(mod.isAttackModifier, true);
      expect(mod.levelPercentage(1), 60);
      expect(mod.levelName(1), 'Cone 1');
    });

    test('Decreased Immunity', () {
      var mod = ModifierTemplates.instance().fetch('Decreased Immunity')
          as BaseLeveledTemplate;
      expect(mod.isAttackModifier, false);
      expect(mod.levelPercentage(1), 50);
    });

    test('Explosion', () {
      var mod = ModifierTemplates.instance().fetch('Explosion')
          as BaseLeveledTemplate;
      expect(mod.isAttackModifier, true);
      expect(mod.levelPercentage(1), 50);
    });

    test('Extended Duration', () {
      var mod = ModifierTemplates.instance().fetch('Extended Duration')
          as BaseLeveledTemplate;
      expect(mod.isAttackModifier, false);
      expect(mod.levelPercentage(1), 20);
    });

    test('Extra Passes', () {
      var mod = ModifierTemplates.instance().fetch('Extra Passes')
          as BaseLeveledTemplate;
      expect(mod.isAttackModifier, true);
      expect(mod.levelPercentage(1), 10);
    });

    test('Fragmentation, Cutting', () {
      var mod = ModifierTemplates.instance().fetch('Fragmentation, Cutting')
          as BaseLeveledTemplate;
      expect(mod.isAttackModifier, true);
      expect(mod.levelPercentage(1), 15);
    });

    test('Fragmentation, Hot', () {
      var mod = ModifierTemplates.instance().fetch('Fragmentation, Hot')
          as BaseLeveledTemplate;
      expect(mod.isAttackModifier, true);
      expect(mod.levelPercentage(1), 15);
    });

    test('Fragmentation, Impaling', () {
      var mod = ModifierTemplates.instance().fetch('Fragmentation, Impaling')
          as BaseLeveledTemplate;
      expect(mod.isAttackModifier, true);
      expect(mod.levelPercentage(1), 20);
    });

    test('Fragmentation, Large Piercing', () {
      var mod = ModifierTemplates.instance()
          .fetch('Fragmentation, Large Piercing') as BaseLeveledTemplate;
      expect(mod.isAttackModifier, true);
      expect(mod.levelPercentage(1), 15);
    });

    test('Incendiary, Burning', () {
      var mod = ModifierTemplates.instance().fetch('Incendiary, Burning')
          as BaseLeveledTemplate;
      expect(mod.isAttackModifier, true);
      expect(mod.levelPercentage(1), 10);
    });

    test('Increased Range', () {
      var mod = ModifierTemplates.instance().fetch('Increased Range')
          as BaseLeveledTemplate;
      expect(mod.isAttackModifier, false);
      expect(mod.levelPercentage(1), 10);
    });

    test('Long-Range', () {
      var mod = ModifierTemplates.instance().fetch('Long-Range')
          as BaseLeveledTemplate;
      expect(mod.isAttackModifier, false);
      expect(mod.levelPercentage(1), 50);
    });

    test('Low Psychic Signature', () {
      var mod = ModifierTemplates.instance().fetch('Low Psychic Signature')
          as BaseLeveledTemplate;
      expect(mod.isAttackModifier, false);
      expect(mod.levelPercentage(1), 5);
    });

    test('Low Signature, Variable', () {
      var mod = ModifierTemplates.instance().fetch('Low Signature, Variable')
          as BaseLeveledTemplate;
      expect(mod.isAttackModifier, false);
      expect(mod.levelPercentage(1), 5);
    });

    //TODO: You may only add this enhancement to an attack that has both Area
    // Effect and Persistent.
    //TODO: Mobile is mutually exclusive with Drifting.
    test('Mobile', () {
      var mod =
          ModifierTemplates.instance().fetch('Mobile') as BaseLeveledTemplate;
      expect(mod.isAttackModifier, true);
      expect(mod.levelPercentage(1), 40);
    });

    test('Reduced Fatigue Cost', () {
      var mod = ModifierTemplates.instance().fetch('Reduced Fatigue Cost')
          as BaseLeveledTemplate;
      expect(mod.isAttackModifier, false);
      expect(mod.levelPercentage(1), 20);
    });

    //TODO: You cannot add Reduced Time to attack powers, to traits that list
    // any kind of special modifier that affects activation time, or to Magery.
    test('Reduced Time', () {
      var mod = ModifierTemplates.instance().fetch('Reduced Time')
          as BaseLeveledTemplate;
      expect(mod.isAttackModifier, false);
      expect(mod.levelPercentage(1), 20);
    });

    test('Reliable', () {
      var mod =
          ModifierTemplates.instance().fetch('Reliable') as BaseLeveledTemplate;
      expect(mod.isAttackModifier, false);
      expect(mod.levelPercentage(1), 5);
    });
  }, skip: false);

  group('Variable enhancers', () {
    test('Armor Divisor', () {
      var mod = ModifierTemplates.instance().fetch('Armor Divisor')
          as BaseLeveledTemplate;
      expect(mod.isAttackModifier, true);
      expect(mod.levelPercentage(1), -70);
      expect(mod.levelName(1), 'Armor Divisor (0.1)');
      expect(mod.levelPercentage(2), -50);
      expect(mod.levelName(2), 'Armor Divisor (0.2)');
      expect(mod.levelPercentage(3), -30);
      expect(mod.levelName(3), 'Armor Divisor (0.5)');
      expect(mod.levelPercentage(4), 50);
      expect(mod.levelName(4), 'Armor Divisor (2)');
      expect(mod.levelPercentage(5), 100);
      expect(mod.levelName(5), 'Armor Divisor (3)');
      expect(mod.levelPercentage(6), 150);
      expect(mod.levelName(6), 'Armor Divisor (5)');
      expect(mod.levelPercentage(7), 200);
      expect(mod.levelName(7), 'Armor Divisor (10)');
    });

    test('Can Carry Objects', () {
      var mod = ModifierTemplates.instance().fetch('Can Carry Objects')
          as BaseLeveledTemplate;
      expect(mod.isAttackModifier, false);
      expect(mod.levelPercentage(1), 10);
      expect(mod.levelPercentage(2), 20);
      expect(mod.levelPercentage(3), 50);
      expect(mod.levelPercentage(4), 100);
      expect(mod.levelPercentage(5), 150);
    });

    group('Cyclic', () {
      test('constructor', () {
        var mod = ModifierTemplates.instance().fetch('Cyclic')
            as CyclicModifierTemplate;
        expect(mod.isAttackModifier, true);
        expect(mod.levelPercentage(CyclicData()), 10);
        expect(mod.levelName(CyclicData()), 'Cyclic, 1 day, 2 cycles');
      });

      test('per interval to max', () {
        CyclicModifierTemplate mod = CyclicModifierTemplate();
        var data = CyclicData(interval: CyclicInterval.PerHour);
        expect(mod.levelPercentage(data), 20);
        expect(mod.levelName(data), 'Cyclic, 1 hour, 2 cycles');

        data = CyclicData(interval: CyclicInterval.PerMinute);
        expect(mod.levelPercentage(data), 40);
        expect(mod.levelName(data), 'Cyclic, 1 minute, 2 cycles');

        data = CyclicData(interval: CyclicInterval.Per10Seconds);
        expect(mod.levelPercentage(data), 50);
        expect(mod.levelName(data), 'Cyclic, 10 seconds, 2 cycles');

        data = CyclicData(interval: CyclicInterval.PerSecond);
        expect(mod.levelPercentage(data), 100);
        expect(mod.levelName(data), 'Cyclic, 1 second, 2 cycles');
      });

      test('number of cycles multiplies percentage by (n - 1)', () {
        CyclicModifierTemplate temp = CyclicModifierTemplate();
        CyclicData data = CyclicData(cycles: 3);
        expect(temp.levelPercentage(data), 20);
        expect(temp.levelName(data), 'Cyclic, 1 day, 3 cycles');

        data = CyclicData(cycles: 4);
        expect(temp.levelPercentage(data), 30);
        expect(temp.levelName(data), 'Cyclic, 1 day, 4 cycles');
      });

      test('number of cycles + interval', () {
        CyclicModifierTemplate mod = CyclicModifierTemplate();
        var data = CyclicData(cycles: 3, interval: CyclicInterval.PerSecond);
        expect(mod.levelPercentage(data), 200);
        expect(mod.levelName(data), 'Cyclic, 1 second, 3 cycles');

        data = CyclicData(cycles: 4, interval: CyclicInterval.PerHour);
        expect(mod.levelPercentage(data), 60);
        expect(mod.levelName(data), 'Cyclic, 1 hour, 4 cycles');
      });

      test('resistible cuts percentage in half', () {
        CyclicModifierTemplate mod = CyclicModifierTemplate();
        var data = CyclicData(cycles: 3, interval: CyclicInterval.PerMinute);

        expect(mod.levelPercentage(data), 80);
        expect(mod.levelName(data), 'Cyclic, 1 minute, 3 cycles');

        data = CyclicData(
            cycles: 3, interval: CyclicInterval.PerMinute, resistible: true);
        expect(mod.levelPercentage(data), 40);
        expect(mod.levelName(data), 'Cyclic, 1 minute, 3 cycles, Resistible');

        data = CyclicData(
            cycles: 5, interval: CyclicInterval.Per10Seconds, resistible: true);
        expect(mod.levelPercentage(data), 100);
        expect(mod.levelName(data), 'Cyclic, 10 seconds, 5 cycles, Resistible');
      });

      test('Mildly Contagious adds +20%', () {
        CyclicModifierTemplate mod = CyclicModifierTemplate();
        var data = CyclicData(cycles: 3, interval: CyclicInterval.PerMinute);
        expect(mod.levelPercentage(data), 80);
        expect(mod.levelName(data), 'Cyclic, 1 minute, 3 cycles');

        data = CyclicData(
            cycles: 3,
            interval: CyclicInterval.PerMinute,
            contagion: ContagionType.Mildly);
        expect(mod.levelPercentage(data), 100);
        expect(mod.levelName(data),
            'Cyclic, 1 minute, 3 cycles, Mildly Contagious');

        data = CyclicData(
            cycles: 5,
            interval: CyclicInterval.Per10Seconds,
            contagion: ContagionType.Mildly);
        expect(mod.levelPercentage(data), 220);
        expect(mod.levelName(data),
            'Cyclic, 10 seconds, 5 cycles, Mildly Contagious');
      });

      test('Highly Contagious adds +50%', () {
        CyclicModifierTemplate mod = CyclicModifierTemplate();
        var data = CyclicData(cycles: 3, interval: CyclicInterval.PerMinute);
        expect(mod.levelPercentage(data), 80);
        expect(mod.levelName(data), 'Cyclic, 1 minute, 3 cycles');

        data = CyclicData(
            cycles: 3,
            interval: CyclicInterval.PerMinute,
            contagion: ContagionType.Highly);
        expect(mod.levelPercentage(data), 130);
        expect(mod.levelName(data),
            'Cyclic, 1 minute, 3 cycles, Highly Contagious');

        data = CyclicData(
            interval: CyclicInterval.Per10Seconds,
            cycles: 5,
            contagion: ContagionType.Highly);
        expect(mod.levelPercentage(data), 250);
        expect(mod.levelName(data),
            'Cyclic, 10 seconds, 5 cycles, Highly Contagious');
      });

      test('take 50% for resistible before +X for contagion', () {
        CyclicModifierTemplate mod = CyclicModifierTemplate();
        CyclicData data =
            CyclicData(cycles: 4, interval: CyclicInterval.Per10Seconds);
        expect(mod.levelPercentage(data), 150);
        expect(mod.levelName(data), 'Cyclic, 10 seconds, 4 cycles');

        data = CyclicData(
            cycles: 4,
            interval: CyclicInterval.Per10Seconds,
            resistible: true,
            contagion: ContagionType.Mildly);
        expect(mod.levelPercentage(data), 95);
        expect(mod.levelName(data),
            'Cyclic, 10 seconds, 4 cycles, Resistible, Mildly Contagious');

        data = CyclicData(
            cycles: 4,
            interval: CyclicInterval.Per10Seconds,
            resistible: true,
            contagion: ContagionType.Highly);
        expect(mod.levelPercentage(data), 125);
        expect(mod.levelName(data),
            'Cyclic, 10 seconds, 4 cycles, Resistible, Highly Contagious');
      });

      test('fromJSON - empty', () {
        var source = '''{}''';
        var m = CyclicModifierTemplate.fromJSON(json.decode(source));
        expect(m.name, 'Cyclic');
        expect(m.isAttackModifier, true);
      });
    });

    test('Increased Range, LOS', () {
      var mod = ModifierTemplates.instance().fetch('Increased Range, LOS')
          as BaseLeveledTemplate;
      expect(mod.isAttackModifier, false);
      expect(mod.levelPercentage(1), 90);
      expect(mod.levelPercentage(2), 80);
      expect(mod.levelPercentage(3), 70);
      expect(mod.levelPercentage(4), 60);
      expect(mod.levelPercentage(5), 50);
      expect(mod.levelPercentage(6), 40);
      expect(mod.levelPercentage(7), 30);
      expect(mod.levelPercentage(8), 20);
      expect(mod.levelPercentage(9), 10);
      expect(mod.levelPercentage(10), 0);
    });

    test('Rapid Fire', () {
      var mod = ModifierTemplates.instance().fetch('Rapid Fire')
          as BaseLeveledTemplate;
      expect(mod.isAttackModifier, true);
      expect(mod.levelPercentage(1), 40);
      expect(mod.levelPercentage(2), 50);
      expect(mod.levelPercentage(3), 70);
      expect(mod.levelPercentage(4), 100);
      expect(mod.levelPercentage(5), 150);
      expect(mod.levelPercentage(6), 200);
      expect(mod.levelPercentage(7), 250);
      expect(mod.levelPercentage(8), 300);
    });

    test('Rapid Fire, Selective', () {
      var mod = ModifierTemplates.instance().fetch('Rapid Fire, Selective')
          as BaseLeveledTemplate;
      expect(mod.isAttackModifier, true);
      expect(mod.levelPercentage(1), 80);
      expect(mod.levelPercentage(2), 110);
      expect(mod.levelPercentage(3), 160);
      expect(mod.levelPercentage(4), 210);
      expect(mod.levelPercentage(5), 260);
      expect(mod.levelPercentage(6), 310);
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
