import 'package:gurps_modifiers/src/modifier.dart';
import 'package:gurps_modifiers/src/modifiers.dart';
import 'package:test/test.dart';

//TODO: Implementation idea: Modifiers with multiple options, like Bombardment, Effective skill 14
// AND Bombardment, Effective skill 12, etc, could be turned into a single entry ("Bombardment"),
// with a number of radio buttons (one for each option).
main() {
  var mods = modifiers;

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

    test('Environmental, Very common', () {
      var mod = mods.fetch('Environmental, Very common');
      expect(mod.value, -5);
      expect(mod.isAttackModifier, false);
    });

    test('Environmental, Common', () {
      var mod = mods.fetch('Environmental, Common');
      expect(mod.value, -10);
      expect(mod.isAttackModifier, false);
    });

    test('Environmental, Occasional', () {
      var mod = mods.fetch('Environmental, Occasional');
      expect(mod.value, -20);
      expect(mod.isAttackModifier, false);
    });

    test('Environmental, Rare', () {
      var mod = mods.fetch('Environmental, Rare');
      expect(mod.value, -40);
      expect(mod.isAttackModifier, false);
    });

    test('Environmental, Very rare', () {
      var mod = mods.fetch('Environmental, Very rare');
      expect(mod.value, -80);
      expect(mod.isAttackModifier, false);
    });

    test('Mitigator, Vulnerable', () {
      var mod = mods.fetch('Mitigator, Vulnerable');
      expect(mod.value, -60);
      expect(mod.isAttackModifier, false);
    });

    test('Mitigator, Daily', () {
      var mod = mods.fetch('Mitigator, Daily');
      expect(mod.value, -60);
      expect(mod.isAttackModifier, false);
    });

    test('Mitigator, Weekly', () {
      var mod = mods.fetch('Mitigator, Weekly');
      expect(mod.value, -65);
      expect(mod.isAttackModifier, false);
    });

    test('Mitigator, Horde Intelligence', () {
      var mod = mods.fetch('Mitigator, Horde Intelligence');
      expect(mod.value, -60);
      expect(mod.isAttackModifier, false);
    });

    test('Mitigator, Monthly', () {
      var mod = mods.fetch('Mitigator, Monthly');
      expect(mod.value, -70);
      expect(mod.isAttackModifier, false);
    });

    //TODO: Requires (Attribute) Roll - perhaps a better implementation is to
    // select the Attribute and use that to derive the value.
    test('Requires (Attribute) Roll, DX or IQ or HT', () {
      var mod = mods.fetch('Requires (Attribute) Roll, DX or IQ or HT');
      expect(mod.value, -10);
      expect(mod.isAttackModifier, false);
    });

    test('Requires (Attribute) Roll, Per or Will', () {
      var mod = mods.fetch('Requires (Attribute) Roll, Per or Will');
      expect(mod.value, -5);
      expect(mod.isAttackModifier, false);
    });

    //TODO: Requires (Skill) Roll - perhaps a better implementation is to
    // select the Skill and use that to derive the value.
    test('Requires (Skill) Roll, DX- or IQ- or HT-Based Average or harder', () {
      var mod = mods.fetch(
          'Requires (Skill) Roll, DX- or IQ- or HT-Based Average or harder');
      expect(mod.value, -10);
      expect(mod.isAttackModifier, false);
    });

    test('Requires (Skill) Roll, DX- or IQ- or HT-Based Easy', () {
      var mod =
          mods.fetch('Requires (Skill) Roll, DX- or IQ- or HT-Based Easy');
      expect(mod.value, -5);
      expect(mod.isAttackModifier, false);
    });

    test('Requires (Skill) Roll, Per- or Will-Based Average or harder', () {
      var mod = mods
          .fetch('Requires (Skill) Roll, Per- or Will-Based Average or harder');
      expect(mod.value, -5);
      expect(mod.isAttackModifier, false);
    });

    test('Requires (Attribute) Roll, Quick Contest of DX or IQ or HT', () {
      var mod = mods
          .fetch('Requires (Attribute) Roll, Quick Contest of DX or IQ or HT');
      expect(mod.value, -20);
      expect(mod.isAttackModifier, false);
    });

    test('Requires (Attribute) Roll, Quick Contest of Per or Will', () {
      var mod =
          mods.fetch('Requires (Attribute) Roll, Quick Contest of Per or Will');
      expect(mod.value, -15);
      expect(mod.isAttackModifier, false);
    });

    test('Requires (Attribute) Roll, Quick Contest replaces Attribute roll',
        () {
      var mod = mods.fetch(
          'Requires (Attribute) Roll, Quick Contest replaces Attribute roll');
      expect(mod.value, -10);
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
    test('Requires material component, extremely rare', () {
      var mod = mods
          .fetch('Accessibility, Requires material component, extremely rare');
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
      var mod = mods.fetch('Accessibility, Only while moving 1 step/turn');
      expect(mod.value, -10);
    });
    test('Only while moving (half Move)', () {
      var mod = mods.fetch('Accessibility, Only while moving half Move');
      expect(mod.value, -20);
    });
    test('While conscious', () {
      var mod = mods.fetch('Accessibility, While conscious');
      expect(mod.value, -5);
    });
    test('Only while moving (full Move)', () {
      var mod = mods.fetch('Accessibility, Only while moving full Move');
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

    test('Easily Resisted', () {
      var mod = mods.fetch('Easily Resisted') as LeveledModifier;
      expect(mod.isAttackModifier, false);
      expect(mod.level, 1);
      expect(mod.value, -5);
      mod.level = 6;
      expect(mod.value, -30);
    });

    test('Extra Recoil', () {
      var mod = mods.fetch('Extra Recoil') as LeveledModifier;
      expect(mod.isAttackModifier, true);
      expect(mod.level, 1);
      expect(mod.value, -10);
      mod.level = 4;
      expect(mod.value, -40);
      expect(() => mod.level = 5, throwsA(isA<RangeError>()));
    });

    test('Glamour', () {
      var mod = mods.fetch('Glamour') as LeveledModifier;
      expect(mod.isAttackModifier, false);
      expect(mod.level, 1);
      expect(mod.value, -5);
      mod.level = 10;
      expect(mod.value, -50);
    });

    test('Hard to Use', () {
      var mod = mods.fetch('Hard to Use') as LeveledModifier;
      expect(mod.isAttackModifier, false);
      expect(mod.level, 1);
      expect(mod.value, -5);
      mod.level = 4;
      expect(mod.value, -20);
      expect(() => mod.level = 5, throwsA(isA<RangeError>()));
    });

    test('Immediate Preparation Required', () {
      var mod =
          mods.fetch('Immediate Preparation Required') as VariableModifier;
      expect(mod.isAttackModifier, false);
      expect(mod.level, 1);
      expect(mod.value, -30);
      mod.level = 2;
      expect(mod.value, -45);
      mod.level = 3;
      expect(mod.value, -75);
      mod.level = 4;
      expect(mod.value, -90);
      expect(() => mod.level = 5, throwsA(isA<RangeError>()));
    });

    test('Increased Immunity', () {
      var mod = mods.fetch('Increased Immunity') as LeveledModifier;
      expect(mod.isAttackModifier, false);
      expect(mod.level, 1);
      expect(mod.value, -10);
      mod.level = 4;
      expect(mod.value, -40);
      expect(() => mod.level = 5, throwsA(isA<RangeError>()));
    });

    test('Inaccurate', () {
      var mod = mods.fetch('Inaccurate') as LeveledModifier;
      expect(mod.isAttackModifier, true);
      expect(mod.level, 1);
      expect(mod.value, -5);
      mod.level = 4;
      expect(mod.value, -20);
    });

    test('Limited Use', () {
      var mod = mods.fetch('Limited Use') as LeveledModifier;
      expect(mod.isAttackModifier, false);
      expect(mod.level, 1);
      expect(mod.value, -10);
      mod.level = 4;
      expect(mod.value, -40);
      expect(() => mod.level = 5, throwsA(isA<RangeError>()));
    });

    test('Limited Use, Fast Reload', () {
      var mod = mods.fetch('Limited Use, Fast Reload') as LeveledModifier;
      expect(mod.isAttackModifier, false);
      expect(mod.level, 1);
      expect(mod.value, -5);
      mod.level = 4;
      expect(mod.value, -20);
      expect(() => mod.level = 5, throwsA(isA<RangeError>()));
    });

    test('Limited Use, Slow Reload', () {
      var mod = mods.fetch('Limited Use, Slow Reload') as LeveledModifier;
      expect(mod.isAttackModifier, false);
      expect(mod.level, 1);
      expect(mod.value, -5);
      mod.level = 4;
      expect(mod.value, -35);
      expect(() => mod.level = 5, throwsA(isA<RangeError>()));
    });

    test('Maximum Duration', () {
      var mod = mods.fetch('Maximum Duration') as VariableModifier;
      expect(mod.isAttackModifier, false);
      expect(mod.level, 1);
      expect(mod.value, -5);
      mod.level = 2;
      expect(mod.value, -10);
      mod.level = 3;
      expect(mod.value, -25);
      mod.level = 4;
      expect(mod.value, -50);
      mod.level = 5;
      expect(mod.value, -65);
      mod.level = 6;
      expect(mod.value, -75);
      expect(() => mod.level = 7, throwsA(isA<RangeError>()));
    });

    //TODO: On an advantage that allows Always On, this limitation is worth at
    // most -5% less than Always On; e.g., if Always On is -20%, Minimum
    // Duration can’t go beyond -15%.
    test('Minimum Duration', () {
      var mod = mods.fetch('Minimum Duration') as LeveledModifier;
      expect(mod.isAttackModifier, false);
      expect(mod.level, 1);
      expect(mod.value, -5);
      mod.level = 2;
      expect(mod.value, -10);
      mod.level = 6;
      expect(mod.value, -30);
      expect(() => mod.level = 7, throwsA(isA<RangeError>()));
    });

    //TODO: Nuisance Effect: variable, depends on the effect. Guidelines:
    //// • Your ability earns a reaction penalty from those around you. Perhaps
    ////   it makes you look disgusting, or requires you to perform some sort of
    ////   distressing ritual. -5% per -1 to reactions (max -4). (Implemented.)
    // • Your ability makes you obvious, limiting stealth and attracting
    //   enemies. -5%.
    // • Your ability physically inconveniences you – it attracts stinging
    //   insects, causes your armor to rust, makes you ravenously hungry, etc.
    //   -5%.
    test('Nuisance Effect, Reaction penalty', () {
      var mod =
          mods.fetch('Nuisance Effect, Reaction penalty') as LeveledModifier;
      expect(mod.isAttackModifier, false);
      expect(mod.level, 1);
      expect(mod.value, -5);
      mod.level = 4;
      expect(mod.value, -20);
      expect(() => mod.level = 5, throwsA(isA<RangeError>()));
    });

    test('Onset', () {
      var mod = mods.fetch('Onset') as LeveledModifier;
      expect(mod.isAttackModifier, true);
      expect(mod.level, 1);
      expect(mod.value, -10);
      mod.level = 4;
      expect(mod.value, -40);
      expect(() => mod.level = 5, throwsA(isA<RangeError>()));
    });

    test('Exposure Time', () {
      var mod = mods.fetch('Exposure Time') as LeveledModifier;
      expect(mod.isAttackModifier, true);
      expect(mod.level, 1);
      expect(mod.value, -30);
      mod.level = 4;
      expect(mod.value, -60);
      expect(() => mod.level = 5, throwsA(isA<RangeError>()));
    });

    test('Periodic Recharge', () {
      var mod = mods.fetch('Periodic Recharge') as VariableModifier;
      expect(mod.isAttackModifier, false);
      expect(mod.level, 1);
      expect(mod.value, -5);
      mod.level = 2;
      expect(mod.value, -10);
      mod.level = 3;
      expect(mod.value, -20);
      mod.level = 4;
      expect(mod.value, -40);
      mod.level = 5;
      expect(mod.value, -80);
      expect(() => mod.level = 6, throwsA(isA<RangeError>()));
    });

    test('Preparation Required', () {
      var mod = mods.fetch('Preparation Required') as VariableModifier;
      expect(mod.isAttackModifier, false);
      expect(mod.level, 1);
      expect(mod.value, -20);
      mod.level = 2;
      expect(mod.value, -30);
      mod.level = 3;
      expect(mod.value, -50);
      mod.level = 4;
      expect(mod.value, -60);
      expect(() => mod.level = 5, throwsA(isA<RangeError>()));
    });

    test('Weakened Without Preparation', () {
      var mod = mods.fetch('Weakened Without Preparation') as VariableModifier;
      expect(mod.isAttackModifier, false);
      expect(mod.level, 1);
      expect(mod.value, -10);
      mod.level = 2;
      expect(mod.value, -15);
      mod.level = 3;
      expect(mod.value, -25);
      mod.level = 4;
      expect(mod.value, -30);
      expect(() => mod.level = 5, throwsA(isA<RangeError>()));
    });

    test('Reduced Duration', () {
      var mod = mods.fetch('Reduced Duration') as LeveledModifier;
      expect(mod.isAttackModifier, false);
      expect(mod.level, 1);
      expect(mod.value, -5);
      mod.level = 4;
      expect(mod.value, -20);
      mod.level = 7;
      expect(mod.value, -35);
      expect(() => mod.level = 8, throwsA(isA<RangeError>()));
    });

    test('Requires Low Gravity', () {
      var mod = mods.fetch('Requires Low Gravity') as LeveledModifier;
      expect(mod.isAttackModifier, false);
      expect(mod.level, 1);
      expect(mod.value, -5);
      mod.level = 4;
      expect(mod.value, -20);
      mod.level = 10;
      expect(mod.value, -50);
      expect(() => mod.level = 11, throwsA(isA<RangeError>()));
    });

    //TODO: This limitation is only available for Innate Attacks that inflict
    // fatigue or toxic damage. You must combine it with one of Blood Agent,
    // Contact Agent, Follow-Up, Respiratory Agent, or Sense-Based.
    test('Resistible', () {
      var mod = mods.fetch('Resistible') as LeveledModifier;
      expect(mod.isAttackModifier, true);
      expect(mod.level, 1);
      expect(mod.value, -5);
      mod.level = 4;
      expect(mod.value, -20);
      mod.level = 10;
      expect(mod.value, -50);
    });

    test('Short-Range', () {
      var mod = mods.fetch('Short-Range') as LeveledModifier;
      expect(mod.isAttackModifier, false);
      expect(mod.level, 1);
      expect(mod.value, -10);
      mod.level = 3;
      expect(mod.value, -30);
      expect(() => mod.level = 4, throwsA(isA<RangeError>()));
    });
  });

  //TODO: Pact - The limitation value is numerically equivalent to the point
  // cost of the required disadvantages; e.g., a -10-point Vow gives a -10%
  // Pact limitation.

  // TODO: a Power Modifier is a limitation or (rarely) enhancement shared by
  // every ability in a power. For example, all psionic abilities share a -10%
  // power modifier that makes them vulnerable to countermeasures and anti-psi.
  // Similarly, Mana-Sensitive is usually repurposed as the power modifier for
  // magical abilities. Any limitation from this book or the Basic Set could be
  // used as or in a power modifier, as long as the limitation could legally be
  // applied to every ability in that power.
  //
  // ! Plan is to create a "wrapper" modifier that contains other modifiers.

  // TODO: Required Disadvantage - The limitation value is numerically
  // equivalent to the point cost of the required disadvantages; e.g., a -15-
  // point Addiction gives a -15% Required Disadvantage limitation.
  //
  // ! Wrapper

  // TODO: Sense-Based, Reversed - This variant has the same value as normal
  // Sense-Based, but works “in reverse” – through the user’s senses, that is,
  // your senses. This variation is allowed as a limitation only on an
  // advantage that’s normally unaffected by DR.

  // TODO: Weaponized is worth a base -50% if the victim’s DR has no effect,
  // or -80% if his DR adds to his resistance roll, as for an Affliction. If
  // the subject has a fixed penalty to his resistance roll, this adjusts the
  // modifier value by +10% for every -1, to a maximum of -5. For example, a
  // Neutralize ray that ignored DR and gave the subject a Will-3 roll to
  // resist would have a net -20% limitation.
}
