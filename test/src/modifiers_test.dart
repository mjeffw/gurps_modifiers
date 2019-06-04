import 'package:gurps_enhancers/src/modifier.dart';
import 'package:gurps_enhancers/src/modifiers.dart';
import 'package:test/test.dart';

main() {
  var mods = Modifiers();
  group('Simple enhancers', () {
    test('Affects Insubstantial', () {
      Modifier mod = mods.fetch('Affects Insubstantial');
      expect(mod.name, 'Affects Insubstantial');
      expect(mod.isEnhancement, true);
      expect(mod.percentage, 20);
      expect(mod.isAttackModifier, false);
    });

    test('Affects Insubstantial, Selective', () {
      Modifier mod = mods.fetch('Affects Insubstantial, Selective');
      expect(mod.name, 'Affects Insubstantial, Selective');
      expect(mod.isEnhancement, true);
      expect(mod.percentage, 30);
      expect(mod.isAttackModifier, false);
    });

    test('Affects Substantial', () {
      Modifier mod = mods.fetch('Affects Substantial');
      expect(mod.name, 'Affects Substantial');
      expect(mod.percentage, 40);
      expect(mod.isEnhancement, true);
      expect(mod.isAttackModifier, false);
    });

    test('Affects Substantial, Selective', () {
      Modifier mod = mods.fetch('Affects Substantial, Selective');
      expect(mod.name, 'Affects Substantial, Selective');
      expect(mod.percentage, 50);
      expect(mod.isEnhancement, true);
      expect(mod.isAttackModifier, false);
    });

    //TODO: Ammo options value is reduced by 5% if it takes a second to switch
    // between ammo types.
    test('AP Ammo, Huge piercing', () {
      Modifier mod = mods.fetch('AP Ammo, Huge piercing');
      expect(mod.name, 'AP Ammo, Huge piercing');
      expect(mod.percentage, 35);
      expect(mod.isEnhancement, true);
      expect(mod.isAttackModifier, true);
    });

    //TODO: Ammo options value is reduced by 5% if it takes a second to switch
    // between ammo types.
    test('AP Ammo, Large piercing', () {
      Modifier mod = mods.fetch('AP Ammo, Large piercing');
      expect(mod.name, 'AP Ammo, Large piercing');
      expect(mod.percentage, 45);
      expect(mod.isEnhancement, true);
      expect(mod.isAttackModifier, true);
    });

    //TODO: Ammo options value is reduced by 5% if it takes a second to switch
    // between ammo types.
    test('AP Ammo, Piercing', () {
      Modifier mod = mods.fetch('AP Ammo, Piercing');
      expect(mod.name, 'AP Ammo, Piercing');
      expect(mod.percentage, 20);
      expect(mod.isEnhancement, true);
      expect(mod.isAttackModifier, true);
    });

    test('Aura', () {
      var mod = mods.fetch('Aura');
      expect(mod.name, 'Aura');
      expect(mod.isEnhancement, true);
      expect(mod.percentage, 80);
      expect(mod.isAttackModifier, true);
    });

    test('Based on (Attribute)', () {
      var mod = mods.fetch('Based On');
      expect(mod.name, 'Based On');
      expect(mod.isEnhancement, true);
      expect(mod.percentage, 20);
      expect(mod.isAttackModifier, false);
    });

    test('Based on (Attribute), Own Roll', () {
      var mod = mods.fetch('Based On, Own Roll');
      expect(mod.name, 'Based On, Own Roll');
      expect(mod.percentage, 20);
      expect(mod.isEnhancement, true);
      expect(mod.isAttackModifier, false);
    });

    test('Blood Agent', () {
      var mod = mods.fetch('Blood Agent');
      expect(mod.name, 'Blood Agent');
      expect(mod.isEnhancement, true);
      expect(mod.percentage, 100);
      expect(mod.isAttackModifier, false);
    });

    test('Contact Agent', () {
      var mod = mods.fetch('Contact Agent');
      expect(mod.name, 'Contact Agent');
      expect(mod.percentage, 150);
      expect(mod.isEnhancement, true);
      expect(mod.isAttackModifier, false);
    });

    test('Cosmic, Avoiding drawbacks', () {
      var mod = mods.fetch('Cosmic, Avoiding drawbacks');
      expect(mod.name, 'Cosmic, Avoiding drawbacks');
      expect(mod.isEnhancement, true);
      expect(mod.percentage, 50);
      expect(mod.isAttackModifier, false);
    });

    test('Cosmic, Defensive', () {
      var mod = mods.fetch('Cosmic, Defensive');
      expect(mod.name, 'Cosmic, Defensive');
      expect(mod.percentage, 50);
      expect(mod.isEnhancement, true);
      expect(mod.isAttackModifier, false);
    });

    test('Cosmic, Irresistible attack', () {
      var mod = mods.fetch('Cosmic, Irresistible attack');
      expect(mod.name, 'Cosmic, Irresistible attack');
      expect(mod.isEnhancement, true);
      expect(mod.percentage, 300);
      expect(mod.isAttackModifier, false);
    });

    test('Cosmic, Lingering effect', () {
      var mod = mods.fetch('Cosmic, Lingering effect');
      expect(mod.name, 'Cosmic, Lingering effect');
      expect(mod.isEnhancement, true);
      expect(mod.percentage, 100);
      expect(mod.isAttackModifier, false);
    });

    test('Cosmic, No active defense allowed', () {
      var mod = mods.fetch('Cosmic, No active defense allowed');
      expect(mod.isEnhancement, true);
      expect(mod.name, 'Cosmic, No active defense allowed');
      expect(mod.percentage, 300);
      expect(mod.isAttackModifier, false);
    });

    test('Cosmic, No die roll required', () {
      var mod = mods.fetch('Cosmic, No die roll required');
      expect(mod.name, 'Cosmic, No die roll required');
      expect(mod.percentage, 100);
      expect(mod.isEnhancement, true);
      expect(mod.isAttackModifier, false);
    });

    test('Cosmic, No Rule of 16', () {
      var mod = mods.fetch('Cosmic, No Rule of 16');
      expect(mod.name, 'Cosmic, No Rule of 16');
      expect(mod.percentage, 50);
      expect(mod.isEnhancement, true);
      expect(mod.isAttackModifier, false);
    });

    test('Cosmic, Privileged attack', () {
      var mod = mods.fetch('Cosmic, Privileged attack');
      expect(mod.name, 'Cosmic, Privileged attack');
      expect(mod.percentage, 50);
      expect(mod.isAttackModifier, false);
      expect(mod.isEnhancement, true);
    });

    test('Cosmic, Unhealing damage', () {
      var mod = mods.fetch('Cosmic, Unhealing damage');
      expect(mod.name, 'Cosmic, Unhealing damage');
      expect(mod.percentage, 100);
      expect(mod.isAttackModifier, false);
      expect(mod.isEnhancement, true);
    });

    test('Cosmic, Unrestricted powers', () {
      var mod = mods.fetch('Cosmic, Unrestricted powers');
      expect(mod.name, 'Cosmic, Unrestricted powers');
      expect(mod.percentage, 300);
      expect(mod.isAttackModifier, false);
      expect(mod.isEnhancement, true);
    });

    test('Decreased Immunity 0', () {
      var mod = mods.fetch('Decreased Immunity 0');
      expect(mod.name, 'Decreased Immunity 0');
      expect(mod.percentage, 20);
      expect(mod.isAttackModifier, false);
      expect(mod.isEnhancement, true);
    });

    test('Dehydration', () {
      var mod = mods.fetch('Dehydration');
      expect(mod.name, 'Dehydration');
      expect(mod.percentage, 20);
      expect(mod.isAttackModifier, true);
      expect(mod.isEnhancement, true);
    });

    test('Delay, Fixed', () {
      var mod = mods.fetch('Delay, Fixed');
      expect(mod.name, 'Delay, Fixed');
      expect(mod.percentage, 0);
      expect(mod.isAttackModifier, true);
      expect(mod.isEnhancement, true);
    });

    test('Delay, Supernatural (fixed)', () {
      var mod = mods.fetch('Delay, Supernatural (fixed)');
      expect(mod.name, 'Delay, Supernatural (fixed)');
      expect(mod.percentage, 50);
      expect(mod.isAttackModifier, true);
      expect(mod.isEnhancement, true);
    });

    test('Delay, Supernatural (variable)', () {
      var mod = mods.fetch('Delay, Supernatural (variable)');
      expect(mod.name, 'Delay, Supernatural (variable)');
      expect(mod.percentage, 100);
      expect(mod.isAttackModifier, true);
      expect(mod.isEnhancement, true);
    });

    test('Delay, Variable (short)', () {
      var mod = mods.fetch('Delay, Variable (short)');
      expect(mod.name, 'Delay, Variable (short)');
      expect(mod.percentage, 10);
      expect(mod.isAttackModifier, true);
      expect(mod.isEnhancement, true);
    });

    test('Delay, Variable (long)', () {
      var mod = mods.fetch('Delay, Variable (long)');
      expect(mod.name, 'Delay, Variable (long)');
      expect(mod.percentage, 20);
      expect(mod.isAttackModifier, true);
      expect(mod.isEnhancement, true);
    });

    test('Delay, Triggered', () {
      var mod = mods.fetch('Delay, Triggered');
      expect(mod.name, 'Delay, Triggered');
      expect(mod.percentage, 50);
      expect(mod.isAttackModifier, true);
      expect(mod.isEnhancement, true);
    });

    test('Destructive Parry', () {
      var mod = mods.fetch('Destructive Parry');
      expect(mod.name, 'Destructive Parry');
      expect(mod.percentage, 10);
      expect(mod.isAttackModifier, true);
      expect(mod.isEnhancement, true);
    });

    test('Double Blunt Trauma', () {
      var mod = mods.fetch('Double Blunt Trauma');
      expect(mod.name, 'Double Blunt Trauma');
      expect(mod.percentage, 20);
      expect(mod.isAttackModifier, true);
      expect(mod.isEnhancement, true);
    });

    test('Double Knockback', () {
      var mod = mods.fetch('Double Knockback');
      expect(mod.name, 'Double Knockback');
      expect(mod.percentage, 20);
      expect(mod.isAttackModifier, true);
      expect(mod.isEnhancement, true);
    });

    //TODO: Mobile is mutually exclusive with Drifting.
    test('Drifting', () {
      var mod = mods.fetch('Drifting');
      expect(mod.name, 'Drifting');
      expect(mod.percentage, 20);
      expect(mod.isAttackModifier, true);
      expect(mod.isEnhancement, true);
    });

    test('Drowning', () {
      var mod = mods.fetch('Drowning');
      expect(mod.name, 'Drowning');
      expect(mod.percentage, 0);
      expect(mod.isAttackModifier, true);
      expect(mod.isEnhancement, true);
    });

    test('Dual', () {
      var mod = mods.fetch('Dual');
      expect(mod.name, 'Dual');
      expect(mod.percentage, 10);
      expect(mod.isAttackModifier, true);
      expect(mod.isEnhancement, true);
    });

    test('Erosive', () {
      var mod = mods.fetch('Erosive');
      expect(mod.name, 'Erosive');
      expect(mod.percentage, 10);
      expect(mod.isAttackModifier, true);
      expect(mod.isEnhancement, true);
    });

    test('Extended Duration, Permanent', () {
      var mod = mods.fetch('Extended Duration, Permanent');
      expect(mod.name, 'Extended Duration, Permanent');
      expect(mod.percentage, 300);
      expect(mod.isAttackModifier, false);
      expect(mod.isEnhancement, true);
    });

    test('Extended Duration, Permanent, dispellable', () {
      var mod = mods.fetch('Extended Duration, Permanent, dispellable');
      expect(mod.name, 'Extended Duration, Permanent, dispellable');
      expect(mod.percentage, 150);
      expect(mod.isAttackModifier, false);
      expect(mod.isEnhancement, true);
    });

    test('Fixed Duration', () {
      var mod = mods.fetch('Fixed Duration');
      expect(mod.name, 'Fixed Duration');
      expect(mod.percentage, 0);
      expect(mod.isAttackModifier, false);
      expect(mod.isEnhancement, true);
    });

    //TODO: Exception: On a passive carrier attack such as Spines, Follow-Up is
    // a -50% limitation.
    //TODO: Follow-Up is a “penetration modifier”; you cannot combine it with
    // other penetration modifiers (although the carrier attack can have them).
    test('Follow-Up, Natural weapon', () {
      var mod = mods.fetch('Follow-Up, Natural weapon');
      expect(mod.percentage, 0);
      expect(mod.isAttackModifier, false);
      expect(mod.isEnhancement, true);
    });

    //TODO: Follow-Up, Universal is a “penetration modifier”; you cannot
    // combine it with other penetration modifiers.
    test('Follow-Up, Universal', () {
      var mod = mods.fetch('Follow-Up, Universal');
      expect(mod.name, 'Follow-Up, Universal');
      expect(mod.percentage, 50);
      expect(mod.isAttackModifier, false);
      expect(mod.isEnhancement, true);
    });

    test('Force Field', () {
      var mod = mods.fetch('Force Field');
      expect(mod.name, 'Force Field');
      expect(mod.percentage, 20);
      expect(mod.isAttackModifier, false);
      expect(mod.isEnhancement, true);
    });

    test('Freezing', () {
      var mod = mods.fetch('Freezing');
      expect(mod.name, 'Freezing');
      expect(mod.percentage, 20);
      expect(mod.isAttackModifier, true);
      expect(mod.isEnhancement, true);
    });

    test('Game Time', () {
      var mod = mods.fetch('Game Time');
      expect(mod.name, 'Game Time');
      expect(mod.percentage, 0);
      expect(mod.isAttackModifier, false);
      expect(mod.isEnhancement, true);
    });

    test('Guided', () {
      var mod = mods.fetch('Guided');
      expect(mod.name, 'Guided');
      expect(mod.percentage, 50);
      expect(mod.isAttackModifier, true);
      expect(mod.isEnhancement, true);
    });

    test('Heat', () {
      var mod = mods.fetch('Heat');
      expect(mod.name, 'Heat');
      expect(mod.percentage, 20);
      expect(mod.isAttackModifier, true);
      expect(mod.isEnhancement, true);
    });

    test('Incendiary (non-burn)', () {
      var mod = mods.fetch('Incendiary (non-burn)');
      expect(mod.name, 'Incendiary (non-burn)');
      expect(mod.percentage, 10);
      expect(mod.isAttackModifier, true);
      expect(mod.isEnhancement, true);
    });

    //TODO: Ammo options value is reduced by 5% if it takes a second to switch
    // between ammo types.
    test('HP Ammo, Piercing', () {
      Modifier mod = mods.fetch('HP Ammo, Piercing');
      expect(mod.name, 'HP Ammo, Piercing');
      expect(mod.percentage, 20);
      expect(mod.isEnhancement, true);
      expect(mod.isAttackModifier, true);
    });

    //TODO: Ammo options value is reduced by 5% if it takes a second to switch
    // between ammo types.
    test('HP Ammo, Large piercing', () {
      Modifier mod = mods.fetch('HP Ammo, Large piercing');
      expect(mod.name, 'HP Ammo, Large piercing');
      expect(mod.percentage, 20);
      expect(mod.isEnhancement, true);
      expect(mod.isAttackModifier, true);
    });

    //TODO: Ammo options value is reduced by 5% if it takes a second to switch
    // between ammo types.
    test('HP Ammo, Small piercing', () {
      Modifier mod = mods.fetch('HP Ammo, Small piercing');
      expect(mod.name, 'HP Ammo, Small piercing');
      expect(mod.percentage, 40);
      expect(mod.isEnhancement, true);
      expect(mod.isAttackModifier, true);
    });

    test('Independent', () {
      var mod = mods.fetch('Independent');
      expect(mod.name, 'Independent');
      expect(mod.percentage, 40);
      expect(mod.isAttackModifier, false);
      expect(mod.isEnhancement, true);
    });

    test('Independent, Simultaneous uses', () {
      var mod = mods.fetch('Independent, Simultaneous uses');
      expect(mod.name, 'Independent, Simultaneous uses');
      expect(mod.percentage, 70);
      expect(mod.isAttackModifier, false);
      expect(mod.isEnhancement, true);
    });

    test('Jet', () {
      var mod = mods.fetch('Jet');
      expect(mod.name, 'Jet');
      expect(mod.percentage, 0);
      expect(mod.isAttackModifier, true);
      expect(mod.isEnhancement, true);
    });

    test('Link, Independent', () {
      var mod = mods.fetch('Link, Independent');
      expect(mod.name, 'Link, Independent');
      expect(mod.percentage, 20);
      expect(mod.isAttackModifier, false);
      expect(mod.isEnhancement, true);
    });

    test('Link, Permanent', () {
      var mod = mods.fetch('Link, Permanent');
      expect(mod.name, 'Link, Permanent');
      expect(mod.percentage, 10);
      expect(mod.isAttackModifier, false);
      expect(mod.isEnhancement, true);
    });

    test('Low Signature', () {
      var mod = mods.fetch('Low Signature');
      expect(mod.name, 'Low Signature');
      expect(mod.percentage, 10);
      expect(mod.isAttackModifier, true);
      expect(mod.isEnhancement, true);
    });

    //TODO: Malediction is a "penetration modifier"; you cannot combine it with
    // other penetration modifiers, nor with modifiers that apply only to
    // conventional ranged attacks.
    test('Malediction, -1 per yard', () {
      var mod = mods.fetch('Malediction, -1 per yard');
      expect(mod.isAttackModifier, true);
      expect(mod.isEnhancement, true);
      expect(mod.percentage, 100);
    });

    //TODO: Malediction is a "penetration modifier"; you cannot combine it with
    // other penetration modifiers, nor with modifiers that apply only to
    // conventional ranged attacks.
    test('Malediction, Long-Distance Modifiers', () {
      var mod = mods.fetch('Malediction, Long-Distance Modifiers');
      expect(mod.isAttackModifier, true);
      expect(mod.isEnhancement, true);
      expect(mod.percentage, 200);
    });

    //TODO: Malediction is a "penetration modifier"; you cannot combine it with
    // other penetration modifiers, nor with modifiers that apply only to
    // conventional ranged attacks.
    test('Malediction, Size and Speed/Range Table', () {
      var mod = mods.fetch('Malediction, Size and Speed/Range Table');
      expect(mod.isAttackModifier, true);
      expect(mod.isEnhancement, true);
      expect(mod.percentage, 150);
    });

    test('Mental Defense Only', () {
      var mod = mods.fetch('Mental Defense Only');
      expect(mod.name, 'Mental Defense Only');
      expect(mod.percentage, 250);
      expect(mod.isAttackModifier, true);
      expect(mod.isEnhancement, true);
    });

    test('Missed Sleep', () {
      var mod = mods.fetch('Missed Sleep');
      expect(mod.name, 'Missed Sleep');
      expect(mod.percentage, 50);
      expect(mod.isAttackModifier, true);
      expect(mod.isEnhancement, true);
    });

    //TODO: Ammo options value is reduced by 5% if it takes a second to switch
    // between ammo types.
    test('Multi-Ammo, Large piercing', () {
      var mod = mods.fetch('Multi-Ammo, Large piercing');
      expect(mod.name, 'Multi-Ammo, Large piercing');
      expect(mod.percentage, 65);
      expect(mod.isAttackModifier, true);
      expect(mod.isEnhancement, true);
    });

    //TODO: Ammo options value is reduced by 5% if it takes a second to switch
    // between ammo types.
    test('Multi-Ammo, Piercing', () {
      var mod = mods.fetch('Multi-Ammo, Piercing');
      expect(mod.name, 'Multi-Ammo, Piercing');
      expect(mod.percentage, 40);
      expect(mod.isAttackModifier, true);
      expect(mod.isEnhancement, true);
    });

    test('No Signature', () {
      var mod = mods.fetch('No Signature');
      expect(mod.name, 'No Signature');
      expect(mod.percentage, 20);
      expect(mod.isAttackModifier, true);
      expect(mod.isEnhancement, true);
    });

    test('Once On, Stays On', () {
      var mod = mods.fetch('Once On, Stays On');
      expect(mod.name, 'Once On, Stays On');
      expect(mod.percentage, 50);
      expect(mod.isAttackModifier, false);
      expect(mod.isEnhancement, true);
    });

    test('Overhead', () {
      var mod = mods.fetch('Overhead');
      expect(mod.name, 'Overhead');
      expect(mod.percentage, 30);
      expect(mod.isAttackModifier, true);
      expect(mod.isEnhancement, true);
    });

    test('Persistent', () {
      var mod = mods.fetch('Persistent');
      expect(mod.name, 'Persistent');
      expect(mod.percentage, 40);
      expect(mod.isAttackModifier, true);
      expect(mod.isEnhancement, true);
    });

    test('Radiation, Toxic', () {
      var mod = mods.fetch('Radiation, Toxic');
      expect(mod.name, 'Radiation, Toxic');
      expect(mod.percentage, 25);
      expect(mod.isAttackModifier, true);
      expect(mod.isEnhancement, true);
    });

    test('Radiation, Burning', () {
      var mod = mods.fetch('Radiation, Burning');
      expect(mod.name, 'Radiation, Burning');
      expect(mod.percentage, 100);
      expect(mod.isAttackModifier, true);
      expect(mod.isEnhancement, true);
    });

    test('Ranged', () {
      var mod = mods.fetch('Ranged');
      expect(mod.name, 'Ranged');
      expect(mod.percentage, 40);
      expect(mod.isAttackModifier, false);
      expect(mod.isEnhancement, true);
    });

    //TODO: Incompatible with Always On, as well as Active Defense and Usually
    // On (both from Powers).
    test('Reflexive', () {
      var mod = mods.fetch('Reflexive');
      expect(mod.name, 'Reflexive');
      expect(mod.percentage, 40);
      expect(mod.isAttackModifier, false);
      expect(mod.isEnhancement, true);
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
      expect(mod.isEnhancement, true);
    });

    test('Ricochet', () {
      var mod = mods.fetch('Ricochet');
      expect(mod.name, 'Ricochet');
      expect(mod.percentage, 10);
      expect(mod.isAttackModifier, true);
      expect(mod.isEnhancement, true);
    });

    // TODO You may add this enhancement to any Area Effect or Cone attack.
    test('Selective Area', () {
      var mod = mods.fetch('Selective Area');
      expect(mod.name, 'Selective Area');
      expect(mod.percentage, 20);
      expect(mod.isAttackModifier, true);
      expect(mod.isEnhancement, true);
    });

    test('Selective Effect', () {
      var mod = mods.fetch('Selective Effect');
      expect(mod.name, 'Selective Effect');
      expect(mod.percentage, 20);
      expect(mod.isAttackModifier, false);
      expect(mod.isEnhancement, true);
    });

    test('Selectivity', () {
      var mod = mods.fetch('Selectivity');
      expect(mod.name, 'Selectivity');
      expect(mod.percentage, 10);
      expect(mod.isAttackModifier, false);
      expect(mod.isEnhancement, true);
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
      expect(mod.isEnhancement, true);
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
      expect(mod.isEnhancement, true);
    });

    test('Starvation', () {
      var mod = mods.fetch('Starvation');
      expect(mod.name, 'Starvation');
      expect(mod.percentage, 40);
      expect(mod.isAttackModifier, true);
      expect(mod.isEnhancement, true);
    });

    test('Suffocation', () {
      var mod = mods.fetch('Suffocation');
      expect(mod.name, 'Suffocation');
      expect(mod.percentage, 0);
      expect(mod.isAttackModifier, true);
      expect(mod.isEnhancement, true);
    });

    test('Super Attribute', () {
      var mod = mods.fetch('Super Attribute');
      expect(mod.name, 'Super Attribute');
      expect(mod.percentage, 25);
      expect(mod.isAttackModifier, false);
      expect(mod.isEnhancement, true);
    });

    test('Surge', () {
      var mod = mods.fetch('Surge');
      expect(mod.name, 'Surge');
      expect(mod.percentage, 20);
      expect(mod.isAttackModifier, true);
      expect(mod.isEnhancement, true);
    });

    test('Surge, Arcing', () {
      var mod = mods.fetch('Surge, Arcing');
      expect(mod.name, 'Surge, Arcing');
      expect(mod.percentage, 100);
      expect(mod.isAttackModifier, true);
      expect(mod.isEnhancement, true);
    });

    test('Surprise Attack', () {
      var mod = mods.fetch('Surprise Attack');
      expect(mod.name, 'Surprise Attack');
      expect(mod.percentage, 150);
      expect(mod.isAttackModifier, true);
      expect(mod.isEnhancement, true);
    });

    test('Switchable', () {
      var mod = mods.fetch('Switchable');
      expect(mod.name, 'Switchable');
      expect(mod.percentage, 10);
      expect(mod.isAttackModifier, false);
      expect(mod.isEnhancement, true);
    });

    test('Thrusting Blade', () {
      var mod = mods.fetch('Thrusting Blade');
      expect(mod.name, 'Thrusting Blade');
      expect(mod.percentage, 15);
      expect(mod.isAttackModifier, true);
      expect(mod.isEnhancement, true);
    });

    test('Time-Spanning, Present plus (past or future)', () {
      var mod = mods.fetch('Time-Spanning, Present plus (past or future)');
      expect(mod.name, 'Time-Spanning, Present plus (past or future)');
      expect(mod.percentage, 50);
      expect(mod.isAttackModifier, false);
      expect(mod.isEnhancement, true);
    });

    test('Time-Spanning, Universal', () {
      var mod = mods.fetch('Time-Spanning, Universal');
      expect(mod.name, 'Time-Spanning, Universal');
      expect(mod.percentage, 100);
      expect(mod.isAttackModifier, false);
      expect(mod.isEnhancement, true);
    });

    test('Time-Spanning, Past and future only', () {
      var mod = mods.fetch('Time-Spanning, Past and future only');
      expect(mod.name, 'Time-Spanning, Past and future only');
      expect(mod.percentage, 50);
      expect(mod.isAttackModifier, false);
      expect(mod.isEnhancement, true);
    });

    test('Time-Spanning, Past or future only', () {
      var mod = mods.fetch('Time-Spanning, Past or future only');
      expect(mod.name, 'Time-Spanning, Past or future only');
      expect(mod.percentage, 0);
      expect(mod.isAttackModifier, false);
      expect(mod.isEnhancement, true);
    });

    test('Underwater', () {
      var mod = mods.fetch('Underwater');
      expect(mod.name, 'Underwater');
      expect(mod.percentage, 20);
      expect(mod.isAttackModifier, true);
      expect(mod.isEnhancement, true);
    });

    test('Usually On', () {
      var mod = mods.fetch('Usually On');
      expect(mod.name, 'Usually On');
      expect(mod.percentage, 5);
      expect(mod.isAttackModifier, false);
      expect(mod.isEnhancement, true);
    });

    test('Variable', () {
      var mod = mods.fetch('Variable');
      expect(mod.name, 'Variable');
      expect(mod.percentage, 5);
      expect(mod.isAttackModifier, true);
      expect(mod.isEnhancement, true);
    });

    test('Wall, Fixed shape', () {
      var mod = mods.fetch('Wall, Fixed shape');
      expect(mod.name, 'Wall, Fixed shape');
      expect(mod.percentage, 30);
      expect(mod.isAttackModifier, true);
      expect(mod.isEnhancement, true);
    });

    test('Wall, Variable shape', () {
      var mod = mods.fetch('Wall, Variable shape');
      expect(mod.name, 'Wall, Variable shape');
      expect(mod.percentage, 60);
      expect(mod.isAttackModifier, true);
      expect(mod.isEnhancement, true);
    });

    test('World-Spanning, Others only', () {
      var mod = mods.fetch('World-Spanning, Others only');
      expect(mod.name, 'World-Spanning, Others only');
      expect(mod.percentage, 50);
      expect(mod.isAttackModifier, false);
      expect(mod.isEnhancement, true);
    });

    test('World-Spanning, Others plus current', () {
      var mod = mods.fetch('World-Spanning, Others plus current');
      expect(mod.name, 'World-Spanning, Others plus current');
      expect(mod.percentage, 100);
      expect(mod.isAttackModifier, false);
      expect(mod.isEnhancement, true);
    });
  });

  group('Leveled enhancers', () {
    test('Accurate', () {
      var mod = mods.fetch('Accurate') as LeveledModifier;
      expect(mod.isEnhancement, true);
      expect(mod.isAttackModifier, true);
      expect(mod.level, 1);
      expect(mod.percentage, 5);
      mod.level = 3;
      expect(mod.percentage, 15);
    });

    test('Affects Others', () {
      var mod = mods.fetch('Affects Others') as LeveledModifier;
      expect(mod.isEnhancement, true);
      expect(mod.isAttackModifier, false);
      expect(mod.level, 1);
      expect(mod.percentage, 50);
      mod.level = 3;
      expect(mod.percentage, 150);
    });

    test('Area Effect', () {
      var mod = mods.fetch('Area Effect') as LeveledModifier;
      expect(mod.isEnhancement, true);
      expect(mod.isAttackModifier, true);
      expect(mod.level, 1);
      expect(mod.percentage, 50);
      mod.level = 3;
      expect(mod.percentage, 150);
    });

    test('Armor Divisor', () {
      var mod = mods.fetch('Armor Divisor') as LeveledModifier;
      expect(mod.isEnhancement, true);
      expect(mod.isAttackModifier, true);
      expect(mod.level, 1);
      expect(mod.percentage, 50);
      mod.level = 3;
      expect(mod.percentage, 150);
    });

    //TODO: You cannot combine Cone with Area Effect, Aura, Jet, Melee Attack,
    // Rapid Fire, or Emanation.
    test('Cone', () {
      var mod = mods.fetch('Cone') as LeveledModifier;
      expect(mod.isEnhancement, true);
      expect(mod.isAttackModifier, true);
      expect(mod.level, 1);
      expect(mod.percentage, 60);
      mod.level = 3;
      expect(mod.percentage, 80);
    });

    test('Decreased Immunity', () {
      var mod = mods.fetch('Decreased Immunity') as LeveledModifier;
      expect(mod.isEnhancement, true);
      expect(mod.isAttackModifier, false);
      expect(mod.level, 1);
      expect(mod.percentage, 50);
      mod.level = 4;
      expect(mod.percentage, 200);
      expect(() => mod.level = 5, throwsA(isA<RangeError>()));
    });

    test('Explosion', () {
      var mod = mods.fetch('Explosion') as LeveledModifier;
      expect(mod.isEnhancement, true);
      expect(mod.isAttackModifier, true);
      expect(mod.level, 1);
      expect(mod.percentage, 50);
      mod.level = 3;
      expect(mod.percentage, 150);
    });

    test('Extended Duration', () {
      var mod = mods.fetch('Extended Duration') as LeveledModifier;
      expect(mod.isEnhancement, true);
      expect(mod.isAttackModifier, false);
      expect(mod.level, 1);
      expect(mod.percentage, 20);
      mod.level = 14;
      expect(mod.percentage, 280);
      expect(() => mod.level = 15, throwsA(isA<RangeError>()));
    });

    test('Extra Passes', () {
      var mod = mods.fetch('Extra Passes') as LeveledModifier;
      expect(mod.isEnhancement, true);
      expect(mod.isAttackModifier, true);
      expect(mod.level, 1);
      expect(mod.percentage, 10);
      mod.level = 3;
      expect(mod.percentage, 30);
    });

    test('Fragmentation, Cutting', () {
      var mod = mods.fetch('Fragmentation, Cutting') as LeveledModifier;
      expect(mod.isEnhancement, true);
      expect(mod.isAttackModifier, true);
      expect(mod.level, 1);
      expect(mod.percentage, 15);
      mod.level = 3;
      expect(mod.percentage, 45);
    });

    test('Fragmentation, Hot', () {
      var mod = mods.fetch('Fragmentation, Hot') as LeveledModifier;
      expect(mod.isEnhancement, true);
      expect(mod.isAttackModifier, true);
      expect(mod.level, 1);
      expect(mod.percentage, 15);
      mod.level = 3;
      expect(mod.percentage, 45);
    });

    test('Fragmentation, Impaling', () {
      var mod = mods.fetch('Fragmentation, Impaling') as LeveledModifier;
      expect(mod.isEnhancement, true);
      expect(mod.isAttackModifier, true);
      expect(mod.level, 1);
      expect(mod.percentage, 20);
      mod.level = 3;
      expect(mod.percentage, 60);
    });

    test('Fragmentation, Large Piercing', () {
      var mod = mods.fetch('Fragmentation, Large Piercing') as LeveledModifier;
      expect(mod.isEnhancement, true);
      expect(mod.isAttackModifier, true);
      expect(mod.level, 1);
      expect(mod.percentage, 15);
      mod.level = 3;
      expect(mod.percentage, 45);
    });

    test('Incendiary, Burning', () {
      var mod = mods.fetch('Incendiary, Burning') as LeveledModifier;
      expect(mod.isEnhancement, true);
      expect(mod.isAttackModifier, true);
      expect(mod.level, 1);
      expect(mod.percentage, 10);
      mod.level = 3;
      expect(mod.percentage, 30);
    });

    test('Increased Range', () {
      var mod = mods.fetch('Increased Range') as LeveledModifier;
      expect(mod.isEnhancement, true);
      expect(mod.isAttackModifier, false);
      expect(mod.level, 1);
      expect(mod.percentage, 10);
      mod.level = 3;
      expect(mod.percentage, 30);
    });

    test('Long-Range', () {
      var mod = mods.fetch('Long-Range') as LeveledModifier;
      expect(mod.isEnhancement, true);
      expect(mod.isAttackModifier, false);
      expect(mod.level, 1);
      expect(mod.percentage, 50);
      mod.level = 3;
      expect(mod.percentage, 150);
      expect(() => mod.level = 4, throwsA(isA<RangeError>()));
    });

    test('Low Psychic Signature', () {
      var mod = mods.fetch('Low Psychic Signature') as LeveledModifier;
      expect(mod.isEnhancement, true);
      expect(mod.isAttackModifier, false);
      expect(mod.level, 1);
      expect(mod.percentage, 5);
      mod.level = 5;
      expect(mod.percentage, 25);
      expect(() => mod.level = 6, throwsA(isA<RangeError>()));
    });

    test('Low Signature, Variable', () {
      var mod = mods.fetch('Low Signature, Variable') as LeveledModifier;
      expect(mod.isEnhancement, true);
      expect(mod.isAttackModifier, false);
      expect(mod.level, 1);
      expect(mod.percentage, 5);
      mod.level = 5;
      expect(mod.percentage, 25);
      expect(() => mod.level = 6, throwsA(isA<RangeError>()));
    });

    //TODO: You may only add this enhancement to an attack that has both Area
    // Effect and Persistent.
    //TODO: Mobile is mutually exclusive with Drifting.
    test('Mobile', () {
      var mod = mods.fetch('Mobile') as LeveledModifier;
      expect(mod.isEnhancement, true);
      expect(mod.isAttackModifier, true);
      expect(mod.level, 1);
      expect(mod.percentage, 40);
      mod.level = 5;
      expect(mod.percentage, 200);
    });

    test('Reduced Fatigue Cost', () {
      var mod = mods.fetch('Reduced Fatigue Cost') as LeveledModifier;
      expect(mod.isEnhancement, true);
      expect(mod.isAttackModifier, false);
      expect(mod.level, 1);
      expect(mod.percentage, 20);
      mod.level = 5;
      expect(mod.percentage, 100);
    });

    //TODO: You cannot add Reduced Time to attack powers, to traits that list
    // any kind of special modifier that affects activation time, or to Magery.
    test('Reduced Time', () {
      var mod = mods.fetch('Reduced Time') as LeveledModifier;
      expect(mod.isEnhancement, true);
      expect(mod.isAttackModifier, false);
      expect(mod.level, 1);
      expect(mod.percentage, 20);
      mod.level = 5;
      expect(mod.percentage, 100);
    });

    test('Reliable', () {
      var mod = mods.fetch('Reliable') as LeveledModifier;
      expect(mod.isEnhancement, true);
      expect(mod.isAttackModifier, false);
      expect(mod.level, 1);
      expect(mod.percentage, 5);
      mod.level = 10;
      expect(mod.percentage, 50);
      expect(() => mod.level = 11, throwsA(isA<RangeError>()));
    });
  });

  group('Variable enhancers', () {
    test('Can Carry Objects', () {
      var mod = mods.fetch('Can Carry Objects') as VariableModifier;
      expect(mod.isAttackModifier, false);
      expect(mod.isEnhancement, true);
      expect(mod.level, 1);
      expect(mod.percentage, 10);
      mod.level = 2;
      expect(mod.percentage, 20);
      mod.level = 3;
      expect(mod.percentage, 50);
      mod.level = 4;
      expect(mod.percentage, 100);
      mod.level = 5;
      expect(mod.percentage, 150);
      expect(() => mod.level = 6, throwsA(isA<RangeError>()));
    });

    test('Cyclic', () {
      var mod = mods.fetch('Cyclic') as VariableModifier;
      expect(mod.isAttackModifier, true);
      expect(mod.isEnhancement, true);
      expect(mod.level, 1);
      expect(mod.percentage, 10);
      mod.level = 2;
      expect(mod.percentage, 20);
      mod.level = 3;
      expect(mod.percentage, 40);
      mod.level = 4;
      expect(mod.percentage, 50);
      mod.level = 5;
      expect(mod.percentage, 100);
      expect(() => mod.level = 6, throwsA(isA<RangeError>()));
    });

    test('Increased Range, LOS', () {
      var mod = mods.fetch('Increased Range, LOS') as VariableModifier;
      expect(mod.isAttackModifier, false);
      expect(mod.isEnhancement, true);
      expect(mod.level, 1);
      expect(mod.percentage, 90);
      mod.level = 2;
      expect(mod.percentage, 80);
      mod.level = 3;
      expect(mod.percentage, 70);
      mod.level = 4;
      expect(mod.percentage, 60);
      mod.level = 5;
      expect(mod.percentage, 50);
      mod.level = 6;
      expect(mod.percentage, 40);
      mod.level = 7;
      expect(mod.percentage, 30);
      mod.level = 8;
      expect(mod.percentage, 20);
      mod.level = 9;
      expect(mod.percentage, 10);
      mod.level = 10;
      expect(mod.percentage, 0);
      expect(() => mod.level = 11, throwsA(isA<RangeError>()));
    });

    test('Rapid Fire', () {
      var mod = mods.fetch('Rapid Fire') as VariableModifier;
      expect(mod.isAttackModifier, true);
      expect(mod.isEnhancement, true);
      expect(mod.level, 1);
      expect(mod.percentage, 40);
      mod.level = 2;
      expect(mod.percentage, 50);
      mod.level = 3;
      expect(mod.percentage, 70);
      mod.level = 4;
      expect(mod.percentage, 100);
      mod.level = 5;
      expect(mod.percentage, 150);
      mod.level = 6;
      expect(mod.percentage, 200);
      mod.level = 7;
      expect(mod.percentage, 250);
      mod.level = 8;
      expect(mod.percentage, 300);
      expect(() => mod.level = 9, throwsA(isA<RangeError>()));
    });

    test('Rapid Fire, Selective', () {
      var mod = mods.fetch('Rapid Fire, Selective') as VariableModifier;
      expect(mod.isAttackModifier, true);
      expect(mod.isEnhancement, true);
      expect(mod.level, 1);
      expect(mod.percentage, 80);
      mod.level = 2;
      expect(mod.percentage, 110);
      mod.level = 3;
      expect(mod.percentage, 160);
      mod.level = 4;
      expect(mod.percentage, 210);
      mod.level = 5;
      expect(mod.percentage, 260);
      mod.level = 6;
      expect(mod.percentage, 310);
      expect(() => mod.level = 7, throwsA(isA<RangeError>()));
    });
  });

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
}
