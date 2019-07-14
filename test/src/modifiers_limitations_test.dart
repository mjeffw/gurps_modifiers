import 'package:gurps_modifiers/src/modifier.dart';
import 'package:gurps_modifiers/src/modifiers.dart';
import 'package:test/test.dart';

//TODO: Implementation idea: Modifiers with multiple options, like Bombardment, Effective skill 14
// AND Bombardment, Effective skill 12, etc, could be turned into a single entry ("Bombardment"),
// with a number of radio buttons (one for each option).
main() {
  group('Simple limitations', () {
    //TODO: You may only take this limitation in conjunction with Area Effect or Cone.
    test('Bombardment, Effective skill 14', () {
      var mod = Modifiers.instance().fetch('Bombardment, Effective skill 14');
      expect(mod.percentage, -5);
      expect(mod.isAttackModifier, true);
    });

    test('Bombardment, Effective skill 12', () {
      var mod = Modifiers.instance().fetch('Bombardment, Effective skill 12');
      expect(mod.percentage, -10);
      expect(mod.isAttackModifier, true);
    });

    test('Bombardment, Effective skill 10', () {
      var mod = Modifiers.instance().fetch('Bombardment, Effective skill 10');
      expect(mod.percentage, -15);
      expect(mod.isAttackModifier, true);
    });

    test('Bombardment, Effective skill 8', () {
      var mod = Modifiers.instance().fetch('Bombardment, Effective skill 8');
      expect(mod.percentage, -20);
      expect(mod.isAttackModifier, true);
    });

    //TODO: Gadget limitation.
    test('Can Be Stolen, Forcefully removed', () {
      var mod = Modifiers.instance().fetch('Can Be Stolen, Forcefully removed');
      expect(mod.percentage, -10);
      expect(mod.isAttackModifier, false);
    });

    //TODO: Gadget limitation.
    test('Can Be Stolen, Easily snatched', () {
      var mod = Modifiers.instance().fetch('Can Be Stolen, Easily snatched');
      expect(mod.percentage, -40);
      expect(mod.isAttackModifier, false);
    });

    //TODO: Gadget limitation.
    test('Can Be Stolen, Quick Contest', () {
      var mod = Modifiers.instance().fetch('Can Be Stolen, Quick Contest');
      expect(mod.percentage, -30);
      expect(mod.isAttackModifier, false);
    });

    //TODO: Gadget limitation.
    test('Can Be Stolen, Stealth or trickery', () {
      var mod =
          Modifiers.instance().fetch('Can Be Stolen, Stealth or trickery');
      expect(mod.percentage, -20);
      expect(mod.isAttackModifier, false);
    });

    test('Active Defense', () {
      var mod = Modifiers.instance().fetch('Active Defense');
      expect(mod.percentage, -40);
      expect(mod.isAttackModifier, false);
    });

    test('Active Defense, Indpependent', () {
      var mod = Modifiers.instance().fetch('Active Defense, Independent');
      expect(mod.percentage, -20);
      expect(mod.isAttackModifier, false);
    });

    test('All-Out', () {
      var mod = Modifiers.instance().fetch('All-Out');
      expect(mod.percentage, -25);
      expect(mod.isAttackModifier, false);
    });

    test('All-Out Concentrate', () {
      var mod = Modifiers.instance().fetch('All-Out Concentrate');
      expect(mod.percentage, -25);
      expect(mod.isAttackModifier, false);
    });

    test('Aspected', () {
      var mod = Modifiers.instance().fetch('Aspected');
      expect(mod.percentage, -20);
      expect(mod.isAttackModifier, false);
    });

    test('Attracts Threats, 6 or less', () {
      var mod = Modifiers.instance().fetch('Attracts Threats, 6 or less');
      expect(mod.percentage, -5);
      expect(mod.isAttackModifier, false);
    });

    test('Attracts Threats, 9 or less', () {
      var mod = Modifiers.instance().fetch('Attracts Threats, 9 or less');
      expect(mod.percentage, -10);
      expect(mod.isAttackModifier, false);
    });

    test('Blockable', () {
      var mod = Modifiers.instance().fetch('Blockable');
      expect(mod.percentage, -5);
      expect(mod.isAttackModifier, false);
    });

    test('Blood Agent, Reversed', () {
      var mod = Modifiers.instance().fetch('Blood Agent, Reversed');
      expect(mod.percentage, -40);
      expect(mod.isAttackModifier, false);
    });

    test('Can Be Blocked or Parried', () {
      var mod = Modifiers.instance().fetch('Can Be Blocked or Parried');
      expect(mod.percentage, -10);
      expect(mod.isAttackModifier, false);
    });

    test('Can Be Parried', () {
      var mod = Modifiers.instance().fetch('Can Be Parried');
      expect(mod.percentage, -5);
      expect(mod.isAttackModifier, false);
    });

    //TODO: You may only take this limitation in conjunction with Area Effect or Cone.
    test('Dissipation', () {
      var mod = Modifiers.instance().fetch('Dissipation');
      expect(mod.percentage, -50);
      expect(mod.isAttackModifier, true);
    });

    //TODO: You may only take this limitation in conjunction with Area Effect.
    test('Emanation', () {
      var mod = Modifiers.instance().fetch('Emanation');
      expect(mod.percentage, -20);
      expect(mod.isAttackModifier, true);
    });

    test('Emergencies Only', () {
      var mod = Modifiers.instance().fetch('Emergencies Only');
      expect(mod.percentage, -30);
      expect(mod.isAttackModifier, false);
    });

    test('Fickle', () {
      var mod = Modifiers.instance().fetch('Fickle');
      expect(mod.percentage, -20);
      expect(mod.isAttackModifier, false);
    });

    test('Full Power in Emergencies Only', () {
      var mod = Modifiers.instance().fetch('Full Power in Emergencies Only');
      expect(mod.percentage, -20);
      expect(mod.isAttackModifier, false);
    });

    test('Granted by (Other)', () {
      var mod = Modifiers.instance().fetch('Granted by (Other)');
      expect(mod.percentage, -40);
      expect(mod.isAttackModifier, false);
    });

    test('Informal', () {
      var mod = Modifiers.instance().fetch('Informal');
      expect(mod.percentage, -50);
      expect(mod.isAttackModifier, false);
    });

    test('Insubstantial Only', () {
      var mod = Modifiers.instance().fetch('Insubstantial Only');
      expect(mod.percentage, -30);
      expect(mod.isAttackModifier, false);
    });

    test('Magnetic', () {
      var mod = Modifiers.instance().fetch('Magnetic');
      expect(mod.percentage, -50);
      expect(mod.isAttackModifier, false);
    });

    test('Mana-Sensitive', () {
      var mod = Modifiers.instance().fetch('Mana-Sensitive');
      expect(mod.percentage, -10);
      expect(mod.isAttackModifier, false);
    });

    test('Minimum Range, 1% Max', () {
      var mod = Modifiers.instance().fetch('Minimum Range, 1% Max');
      expect(mod.percentage, -5);
      expect(mod.isAttackModifier, false);
    });

    test('Minimum Range, 5% Max', () {
      var mod = Modifiers.instance().fetch('Minimum Range, 5% Max');
      expect(mod.percentage, -10);
      expect(mod.isAttackModifier, false);
    });

    test('No Blunt Trauma', () {
      var mod = Modifiers.instance().fetch('No Blunt Trauma');
      expect(mod.percentage, -20);
      expect(mod.isAttackModifier, true);
    });

    test('No DR Reduction', () {
      var mod = Modifiers.instance().fetch('No DR Reduction');
      expect(mod.percentage, -20);
      expect(mod.isAttackModifier, true);
    });

    test('No Incendiary Effect', () {
      var mod = Modifiers.instance().fetch('No Incendiary Effect');
      expect(mod.percentage, -10);
      expect(mod.isAttackModifier, true);
    });

    test('No Knockback', () {
      var mod = Modifiers.instance().fetch('No Knockback');
      expect(mod.percentage, -10);
      expect(mod.isAttackModifier, true);
    });

    test('No Wounding', () {
      var mod = Modifiers.instance().fetch('No Wounding');
      expect(mod.percentage, -10);
      expect(mod.isAttackModifier, true);
    });

    test('Only When Berserk', () {
      var mod = Modifiers.instance().fetch('Only When Berserk');
      expect(mod.percentage, -20);
      expect(mod.isAttackModifier, false);
    });

    // TODO: You can’t combine this with All-Out, All-Out Concentrate, or
    // Requires Ready.
    test('Requires Concentrate', () {
      var mod = Modifiers.instance().fetch('Requires Concentrate');
      expect(mod.percentage, -15);
      expect(mod.isAttackModifier, false);
    });

    test('Requires Ready', () {
      var mod = Modifiers.instance().fetch('Requires Ready');
      expect(mod.percentage, -10);
      expect(mod.isAttackModifier, false);
    });

    test('Requires Reaction Roll', () {
      var mod = Modifiers.instance().fetch('Requires Reaction Roll');
      expect(mod.percentage, -5);
      expect(mod.isAttackModifier, false);
    });

    test('Skill Enhancement Only', () {
      var mod = Modifiers.instance().fetch('Skill Enhancement Only');
      expect(mod.percentage, -60);
      expect(mod.isAttackModifier, false);
    });

    test('Substantial Only', () {
      var mod = Modifiers.instance().fetch('Substantial Only');
      expect(mod.percentage, -10);
      expect(mod.isAttackModifier, false);
    });

    // TODO: You can only take this limitation in conjunction with Uncontrollable.
    test('Unconscious Only', () {
      var mod = Modifiers.instance().fetch('Unconscious Only');
      expect(mod.percentage, -20);
      expect(mod.isAttackModifier, false);
    });

    test('Uncontrollable, Inconvenient', () {
      var mod = Modifiers.instance().fetch('Uncontrollable, Inconvenient');
      expect(mod.percentage, -10);
      expect(mod.isAttackModifier, false);
    });

    test('Uncontrollable, Dangerous', () {
      var mod = Modifiers.instance().fetch('Uncontrollable, Dangerous');
      expect(mod.percentage, -30);
      expect(mod.isAttackModifier, false);
    });

    test('Unique', () {
      var mod = Modifiers.instance().fetch('Unique');
      expect(mod.percentage, -25);
      expect(mod.isAttackModifier, false);
    });

    test('Unsupported', () {
      var mod = Modifiers.instance().fetch('Unsupported');
      expect(mod.percentage, -25);
      expect(mod.isAttackModifier, false);
    });

    test('Untrainable', () {
      var mod = Modifiers.instance().fetch('Untrainable');
      expect(mod.percentage, -40);
      expect(mod.isAttackModifier, false);
    });

    test('Visible, Attack', () {
      var mod = Modifiers.instance().fetch('Visible, Attack');
      expect(mod.percentage, -20);
      expect(mod.isAttackModifier, false);
    });

    test('Visible, Non-Attack', () {
      var mod = Modifiers.instance().fetch('Visible, Non-Attack');
      expect(mod.percentage, -10);
      expect(mod.isAttackModifier, false);
    });

    test('Always On, Social or Cosmetic', () {
      var mod = Modifiers.instance().fetch('Always On, Social or Cosmetic');
      expect(mod.percentage, -10);
      expect(mod.isAttackModifier, false);
    });

    test('Always On, Dangerous', () {
      var mod = Modifiers.instance().fetch('Always On, Dangerous');
      expect(mod.percentage, -40);
      expect(mod.isAttackModifier, false);
    });

    test('Always On, Physically Inconvenient', () {
      var mod =
          Modifiers.instance().fetch('Always On, Physically Inconvenient');
      expect(mod.percentage, -20);
      expect(mod.isAttackModifier, false);
    });

    test('Environmental, Very common', () {
      var mod = Modifiers.instance().fetch('Environmental, Very common');
      expect(mod.percentage, -5);
      expect(mod.isAttackModifier, false);
    });

    test('Environmental, Common', () {
      var mod = Modifiers.instance().fetch('Environmental, Common');
      expect(mod.percentage, -10);
      expect(mod.isAttackModifier, false);
    });

    test('Environmental, Occasional', () {
      var mod = Modifiers.instance().fetch('Environmental, Occasional');
      expect(mod.percentage, -20);
      expect(mod.isAttackModifier, false);
    });

    test('Environmental, Rare', () {
      var mod = Modifiers.instance().fetch('Environmental, Rare');
      expect(mod.percentage, -40);
      expect(mod.isAttackModifier, false);
    });

    test('Environmental, Very rare', () {
      var mod = Modifiers.instance().fetch('Environmental, Very rare');
      expect(mod.percentage, -80);
      expect(mod.isAttackModifier, false);
    });

    test('Mitigator, Vulnerable', () {
      var mod = Modifiers.instance().fetch('Mitigator, Vulnerable');
      expect(mod.percentage, -60);
      expect(mod.isAttackModifier, false);
    });

    test('Mitigator, Daily', () {
      var mod = Modifiers.instance().fetch('Mitigator, Daily');
      expect(mod.percentage, -60);
      expect(mod.isAttackModifier, false);
    });

    test('Mitigator, Weekly', () {
      var mod = Modifiers.instance().fetch('Mitigator, Weekly');
      expect(mod.percentage, -65);
      expect(mod.isAttackModifier, false);
    });

    test('Mitigator, Horde Intelligence', () {
      var mod = Modifiers.instance().fetch('Mitigator, Horde Intelligence');
      expect(mod.percentage, -60);
      expect(mod.isAttackModifier, false);
    });

    test('Mitigator, Monthly', () {
      var mod = Modifiers.instance().fetch('Mitigator, Monthly');
      expect(mod.percentage, -70);
      expect(mod.isAttackModifier, false);
    });

    //TODO: Requires (Attribute) Roll - perhaps a better implementation is to
    // select the Attribute and use that to derive the value.
    test('Requires (Attribute) Roll, DX or IQ or HT', () {
      var mod = Modifiers.instance()
          .fetch('Requires (Attribute) Roll, DX or IQ or HT');
      expect(mod.percentage, -10);
      expect(mod.isAttackModifier, false);
    });

    test('Requires (Attribute) Roll, Per or Will', () {
      var mod =
          Modifiers.instance().fetch('Requires (Attribute) Roll, Per or Will');
      expect(mod.percentage, -5);
      expect(mod.isAttackModifier, false);
    });

    //TODO: Requires (Skill) Roll - perhaps a better implementation is to
    // select the Skill and use that to derive the value.
    test('Requires (Skill) Roll, DX- or IQ- or HT-Based Average or harder', () {
      var mod = Modifiers.instance().fetch(
          'Requires (Skill) Roll, DX- or IQ- or HT-Based Average or harder');
      expect(mod.percentage, -10);
      expect(mod.isAttackModifier, false);
    });

    test('Requires (Skill) Roll, DX- or IQ- or HT-Based Easy', () {
      var mod = Modifiers.instance()
          .fetch('Requires (Skill) Roll, DX- or IQ- or HT-Based Easy');
      expect(mod.percentage, -5);
      expect(mod.isAttackModifier, false);
    });

    test('Requires (Skill) Roll, Per- or Will-Based Average or harder', () {
      var mod = Modifiers.instance()
          .fetch('Requires (Skill) Roll, Per- or Will-Based Average or harder');
      expect(mod.percentage, -5);
      expect(mod.isAttackModifier, false);
    });

    test('Requires (Attribute) Roll, Quick Contest of DX or IQ or HT', () {
      var mod = Modifiers.instance()
          .fetch('Requires (Attribute) Roll, Quick Contest of DX or IQ or HT');
      expect(mod.percentage, -20);
      expect(mod.isAttackModifier, false);
    });

    test('Requires (Attribute) Roll, Quick Contest of Per or Will', () {
      var mod = Modifiers.instance()
          .fetch('Requires (Attribute) Roll, Quick Contest of Per or Will');
      expect(mod.percentage, -15);
      expect(mod.isAttackModifier, false);
    });

    test('Requires (Attribute) Roll, Quick Contest replaces Attribute roll',
        () {
      var mod = Modifiers.instance().fetch(
          'Requires (Attribute) Roll, Quick Contest replaces Attribute roll');
      expect(mod.percentage, -10);
      expect(mod.isAttackModifier, false);
    });
  }, skip: true);

  //TODO: This is the catch-all limitation. Must provide someway to enter
  // limitation information (and potentially save it).
  group('Accessibility', () {
    test('Requires gestures', () {
      var mod = Modifiers.instance().fetch('Accessibility, Requires gestures');
      expect(mod.percentage, -10);
    });
    test('Requires magic words', () {
      var mod =
          Modifiers.instance().fetch('Accessibility, Requires magic words');
      expect(mod.percentage, -10);
    });
    test('Requires material component', () {
      var mod = Modifiers.instance()
          .fetch('Accessibility, Requires material component');
      expect(mod.percentage, -10);
    });
    test('Requires material component, extremely rare', () {
      var mod = Modifiers.instance()
          .fetch('Accessibility, Requires material component, extremely rare');
      expect(mod.percentage, -15);
    });
    test('Requires simple ritual', () {
      var mod =
          Modifiers.instance().fetch('Accessibility, Requires simple ritual');
      expect(mod.percentage, -5);
    });
    test('Requires typical ritual', () {
      var mod =
          Modifiers.instance().fetch('Accessibility, Requires typical ritual');
      expect(mod.percentage, -10);
    });
    test('Requires complex ritual', () {
      var mod =
          Modifiers.instance().fetch('Accessibility, Requires complex ritual');
      expect(mod.percentage, -20);
    });
    test('Requires (item)', () {
      var mod = Modifiers.instance().fetch('Accessibility, Requires (item)');
      expect(mod.percentage, -10);
    });
    test('Only on those who share a language with me', () {
      var mod = Modifiers.instance()
          .fetch('Accessibility, Only on those who share a language with me');
      expect(mod.percentage, -10);
    });
    test('Only while moving (1 step/turn)', () {
      var mod = Modifiers.instance()
          .fetch('Accessibility, Only while moving 1 step/turn');
      expect(mod.percentage, -10);
    });
    test('Only while moving (half Move)', () {
      var mod = Modifiers.instance()
          .fetch('Accessibility, Only while moving half Move');
      expect(mod.percentage, -20);
    });
    test('While conscious', () {
      var mod = Modifiers.instance().fetch('Accessibility, While conscious');
      expect(mod.percentage, -5);
    });
    test('Only while moving (full Move)', () {
      var mod = Modifiers.instance()
          .fetch('Accessibility, Only while moving full Move');
      expect(mod.percentage, -30);
    });
    test('Only at day', () {
      var mod = Modifiers.instance().fetch('Accessibility, Only at day');
      expect(mod.percentage, -20);
    });
    test('Only at night', () {
      var mod = Modifiers.instance().fetch('Accessibility, Only at night');
      expect(mod.percentage, -20);
    });
    test('Only by one side of split personality', () {
      var mod = Modifiers.instance()
          .fetch('Accessibility, Only by one side of split personality');
      expect(mod.percentage, -40);
    });
    test('Only in altered body form', () {
      var mod = Modifiers.instance()
          .fetch('Accessibility, Only in altered body form');
      expect(mod.percentage, -10);
    });
    test('Only in direct sunlight', () {
      var mod =
          Modifiers.instance().fetch('Accessibility, Only in direct sunlight');
      expect(mod.percentage, -30);
    });
    test('Only during full moon', () {
      var mod =
          Modifiers.instance().fetch('Accessibility, Only during full moon');
      expect(mod.percentage, -40);
    });
    test('Only during new moon', () {
      var mod =
          Modifiers.instance().fetch('Accessibility, Only during new moon');
      expect(mod.percentage, -40);
    });
    test('Only while flying', () {
      var mod = Modifiers.instance().fetch('Accessibility, Only while flying');
      expect(mod.percentage, -30);
    });
    test('Only while in hypnotic trance', () {
      var mod = Modifiers.instance()
          .fetch('Accessibility, Only while in hypnotic trance');
      expect(mod.percentage, -30);
    });
    test('Only while swimming', () {
      var mod =
          Modifiers.instance().fetch('Accessibility, Only while swimming');
      expect(mod.percentage, -30);
    });
    test('Only while playing musical instrument', () {
      var mod = Modifiers.instance()
          .fetch('Accessibility, Only while playing musical instrument');
      expect(mod.percentage, -20);
    });
    test('Useless under stress', () {
      var mod =
          Modifiers.instance().fetch('Accessibility, Useless under stress');
      expect(mod.percentage, -60);
    });
  }, skip: true);

  group('Leveled limitations', () {
    test('Cardiac Stress', () {
      var mod =
          Modifiers.instance().fetch('Cardiac Stress') as VariableModifier;
      expect(mod.percentage, -50);
      expect(mod.level, 1);
      expect(mod.isAttackModifier, false);
      expect(VariableModifier.copyOf(mod, level: 5).percentage, -10);
      expect(() => VariableModifier.copyOf(mod, level: 6),
          throwsA(isA<AssertionError>()));
    });

    test('Cerebral Stress', () {
      var mod =
          Modifiers.instance().fetch('Cerebral Stress') as VariableModifier;
      expect(mod.percentage, -50);
      expect(mod.level, 1);
      expect(mod.isAttackModifier, false);
      expect(VariableModifier.copyOf(mod, level: 5).percentage, -10);
      expect(() => VariableModifier.copyOf(mod, level: 6),
          throwsA(isA<AssertionError>()));
    });

    test('Costs Fatigue', () {
      var mod = Modifiers.instance().fetch('Costs Fatigue') as LeveledModifier;
      expect(mod.isAttackModifier, false);
      expect(mod.level, 1);
      expect(mod.percentage, -5);
      expect(LeveledModifier.copyOf(mod, level: 4).percentage, -20);
    });

    test('Costs Fatigue, Per second', () {
      var mod = Modifiers.instance().fetch('Costs Fatigue, Per second')
          as LeveledModifier;
      expect(mod.isAttackModifier, false);
      expect(mod.level, 1);
      expect(mod.percentage, -10);
      expect(LeveledModifier.copyOf(mod, level: 4).percentage, -40);
    });

    test('Costs Hit Points', () {
      var mod =
          Modifiers.instance().fetch('Costs Hit Points') as LeveledModifier;
      expect(mod.isAttackModifier, false);
      expect(mod.level, 1);
      expect(mod.percentage, -10);
      expect(LeveledModifier.copyOf(mod, level: 4).percentage, -40);
    });

    test('Costs Hit Points, Per second', () {
      var mod = Modifiers.instance().fetch('Costs Hit Points, Per second')
          as LeveledModifier;
      expect(mod.isAttackModifier, false);
      expect(mod.level, 1);
      expect(mod.percentage, -20);
      expect(LeveledModifier.copyOf(mod, level: 4).percentage, -80);
    });

    test('Costs Hit Points, Instead of Fatigue', () {
      var mod = Modifiers.instance()
          .fetch('Costs Hit Points, Instead of Fatigue') as LeveledModifier;
      expect(mod.isAttackModifier, false);
      expect(mod.level, 1);
      expect(mod.percentage, -5);
      expect(LeveledModifier.copyOf(mod, level: 4).percentage, -20);
    });

    test('Costs Hit Points, Per second instead of Fatigue', () {
      var mod = Modifiers.instance()
              .fetch('Costs Hit Points, Per second instead of Fatigue')
          as LeveledModifier;
      expect(mod.isAttackModifier, false);
      expect(mod.level, 1);
      expect(mod.percentage, -10);
      expect(LeveledModifier.copyOf(mod, level: 4).percentage, -40);
    });

    test('Easily Resisted', () {
      var mod =
          Modifiers.instance().fetch('Easily Resisted') as LeveledModifier;
      expect(mod.isAttackModifier, false);
      expect(mod.level, 1);
      expect(mod.percentage, -5);
      expect(LeveledModifier.copyOf(mod, level: 6).percentage, -30);
    });

    test('Extra Recoil', () {
      var mod = Modifiers.instance().fetch('Extra Recoil') as LeveledModifier;
      expect(mod.isAttackModifier, true);
      expect(mod.level, 1);
      expect(mod.percentage, -10);
      expect(LeveledModifier.copyOf(mod, level: 4).percentage, -40);
      expect(() => LeveledModifier.copyOf(mod, level: 5),
          throwsA(isA<AssertionError>()));
    });

    test('Glamour', () {
      var mod = Modifiers.instance().fetch('Glamour') as LeveledModifier;
      expect(mod.isAttackModifier, false);
      expect(mod.level, 1);
      expect(mod.percentage, -5);
      expect(LeveledModifier.copyOf(mod, level: 10).percentage, -50);
    });

    test('Hard to Use', () {
      var mod = Modifiers.instance().fetch('Hard to Use') as LeveledModifier;
      expect(mod.isAttackModifier, false);
      expect(mod.level, 1);
      expect(mod.percentage, -5);
      expect(LeveledModifier.copyOf(mod, level: 4).percentage, -20);
      expect(() => LeveledModifier.copyOf(mod, level: 5),
          throwsA(isA<AssertionError>()));
    });

    test('Immediate Preparation Required', () {
      var mod = Modifiers.instance().fetch('Immediate Preparation Required')
          as VariableModifier;
      expect(mod.isAttackModifier, false);
      expect(mod.level, 1);
      expect(mod.percentage, -30);
      expect(VariableModifier.copyOf(mod, level: 2).percentage, -45);
      expect(VariableModifier.copyOf(mod, level: 3).percentage, -75);
      expect(VariableModifier.copyOf(mod, level: 4).percentage, -90);
      expect(() => VariableModifier.copyOf(mod, level: 5),
          throwsA(isA<AssertionError>()));
    });

    test('Increased Immunity', () {
      var mod =
          Modifiers.instance().fetch('Increased Immunity') as LeveledModifier;
      expect(mod.isAttackModifier, false);
      expect(mod.level, 1);
      expect(mod.percentage, -10);
      expect(LeveledModifier.copyOf(mod, level: 4).percentage, -40);
      expect(() => LeveledModifier.copyOf(mod, level: 5),
          throwsA(isA<AssertionError>()));
    });

    test('Inaccurate', () {
      var mod = Modifiers.instance().fetch('Inaccurate') as LeveledModifier;
      expect(mod.isAttackModifier, true);
      expect(mod.level, 1);
      expect(mod.percentage, -5);
      expect(LeveledModifier.copyOf(mod, level: 4).percentage, -20);
    });

    test('Limited Use', () {
      var mod = Modifiers.instance().fetch('Limited Use') as LeveledModifier;
      expect(mod.isAttackModifier, false);
      expect(mod.level, 1);
      expect(mod.percentage, -10);
      expect(LeveledModifier.copyOf(mod, level: 4).percentage, -40);
      expect(() => LeveledModifier.copyOf(mod, level: 5),
          throwsA(isA<AssertionError>()));
    });

    test('Limited Use, Fast Reload', () {
      var mod = Modifiers.instance().fetch('Limited Use, Fast Reload')
          as LeveledModifier;
      expect(mod.isAttackModifier, false);
      expect(mod.level, 1);
      expect(mod.percentage, -5);
      expect(LeveledModifier.copyOf(mod, level: 4).percentage, -20);
      expect(() => LeveledModifier.copyOf(mod, level: 5),
          throwsA(isA<AssertionError>()));
    });

    test('Limited Use, Slow Reload', () {
      var mod = Modifiers.instance().fetch('Limited Use, Slow Reload')
          as LeveledModifier;
      expect(mod.isAttackModifier, false);
      expect(mod.level, 1);
      expect(mod.percentage, -5);
      expect(LeveledModifier.copyOf(mod, level: 4).percentage, -35);
      expect(() => LeveledModifier.copyOf(mod, level: 5),
          throwsA(isA<AssertionError>()));
    });

    test('Maximum Duration', () {
      var mod =
          Modifiers.instance().fetch('Maximum Duration') as VariableModifier;
      expect(mod.isAttackModifier, false);
      expect(mod.level, 1);
      expect(mod.percentage, -5);
      expect(VariableModifier.copyOf(mod, level: 2).percentage, -10);
      expect(VariableModifier.copyOf(mod, level: 3).percentage, -25);
      expect(VariableModifier.copyOf(mod, level: 4).percentage, -50);
      expect(VariableModifier.copyOf(mod, level: 5).percentage, -65);
      expect(VariableModifier.copyOf(mod, level: 6).percentage, -75);
      expect(() => VariableModifier.copyOf(mod, level: 7),
          throwsA(isA<AssertionError>()));
    });

    //TODO: On an advantage that allows Always On, this limitation is worth at
    // most -5% less than Always On; e.g., if Always On is -20%, Minimum
    // Duration can’t go beyond -15%.
    test('Minimum Duration', () {
      var mod =
          Modifiers.instance().fetch('Minimum Duration') as LeveledModifier;
      expect(mod.isAttackModifier, false);
      expect(mod.level, 1);
      expect(mod.percentage, -5);
      expect(LeveledModifier.copyOf(mod, level: 2).percentage, -10);
      expect(LeveledModifier.copyOf(mod, level: 6).percentage, -30);
      expect(() => LeveledModifier.copyOf(mod, level: 7),
          throwsA(isA<AssertionError>()));
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
      var mod = Modifiers.instance().fetch('Nuisance Effect, Reaction penalty')
          as LeveledModifier;
      expect(mod.isAttackModifier, false);
      expect(mod.level, 1);
      expect(mod.percentage, -5);
      expect(LeveledModifier.copyOf(mod, level: 4).percentage, -20);
      expect(() => LeveledModifier.copyOf(mod, level: 5),
          throwsA(isA<AssertionError>()));
    });

    test('Onset', () {
      var mod = Modifiers.instance().fetch('Onset') as LeveledModifier;
      expect(mod.isAttackModifier, true);
      expect(mod.level, 1);
      expect(mod.percentage, -10);
      expect(LeveledModifier.copyOf(mod, level: 4).percentage, -40);
      expect(() => LeveledModifier.copyOf(mod, level: 5),
          throwsA(isA<AssertionError>()));
    });

    test('Exposure Time', () {
      var mod = Modifiers.instance().fetch('Exposure Time') as LeveledModifier;
      expect(mod.isAttackModifier, true);
      expect(mod.level, 1);
      expect(mod.percentage, -30);
      expect(LeveledModifier.copyOf(mod, level: 4).percentage, -60);
      expect(() => LeveledModifier.copyOf(mod, level: 5),
          throwsA(isA<AssertionError>()));
    });

    test('Periodic Recharge', () {
      var mod =
          Modifiers.instance().fetch('Periodic Recharge') as VariableModifier;
      expect(mod.isAttackModifier, false);
      expect(mod.level, 1);
      expect(mod.percentage, -5);
      expect(VariableModifier.copyOf(mod, level: 2).percentage, -10);
      expect(VariableModifier.copyOf(mod, level: 3).percentage, -20);
      expect(VariableModifier.copyOf(mod, level: 4).percentage, -40);
      expect(VariableModifier.copyOf(mod, level: 5).percentage, -80);
      expect(() => VariableModifier.copyOf(mod, level: 6),
          throwsA(isA<AssertionError>()));
    });

    test('Preparation Required', () {
      var mod = Modifiers.instance().fetch('Preparation Required')
          as VariableModifier;
      expect(mod.isAttackModifier, false);
      expect(mod.level, 1);
      expect(mod.percentage, -20);
      expect(VariableModifier.copyOf(mod, level: 2).percentage, -30);
      expect(VariableModifier.copyOf(mod, level: 3).percentage, -50);
      expect(VariableModifier.copyOf(mod, level: 4).percentage, -60);
      expect(() => VariableModifier.copyOf(mod, level: 5),
          throwsA(isA<AssertionError>()));
    });

    test('Weakened Without Preparation', () {
      var mod = Modifiers.instance().fetch('Weakened Without Preparation')
          as VariableModifier;
      expect(mod.isAttackModifier, false);
      expect(mod.level, 1);
      expect(mod.percentage, -10);
      expect(VariableModifier.copyOf(mod, level: 2).percentage, -15);
      expect(VariableModifier.copyOf(mod, level: 3).percentage, -25);
      expect(VariableModifier.copyOf(mod, level: 4).percentage, -30);
      expect(() => VariableModifier.copyOf(mod, level: 5),
          throwsA(isA<AssertionError>()));
    });

    test('Reduced Duration', () {
      var mod =
          Modifiers.instance().fetch('Reduced Duration') as LeveledModifier;
      expect(mod.isAttackModifier, false);
      expect(mod.level, 1);
      expect(mod.percentage, -5);
      expect(LeveledModifier.copyOf(mod, level: 4).percentage, -20);
      expect(LeveledModifier.copyOf(mod, level: 7).percentage, -35);
      expect(() => LeveledModifier.copyOf(mod, level: 8),
          throwsA(isA<AssertionError>()));
    });

    test('Requires Low Gravity', () {
      var mod =
          Modifiers.instance().fetch('Requires Low Gravity') as LeveledModifier;
      expect(mod.isAttackModifier, false);
      expect(mod.level, 1);
      expect(mod.percentage, -5);
      expect(LeveledModifier.copyOf(mod, level: 4).percentage, -20);
      expect(LeveledModifier.copyOf(mod, level: 10).percentage, -50);
      expect(() => LeveledModifier.copyOf(mod, level: 11),
          throwsA(isA<AssertionError>()));
    });

    //TODO: This limitation is only available for Innate Attacks that inflict
    // fatigue or toxic damage. You must combine it with one of Blood Agent,
    // Contact Agent, Follow-Up, Respiratory Agent, or Sense-Based.
    test('Resistible', () {
      var mod = Modifiers.instance().fetch('Resistible') as LeveledModifier;
      expect(mod.isAttackModifier, true);
      expect(mod.level, 1);
      expect(mod.percentage, -5);
      expect(LeveledModifier.copyOf(mod, level: 4).percentage, -20);
      expect(LeveledModifier.copyOf(mod, level: 10).percentage, -50);
    });

    test('Short-Range', () {
      var mod = Modifiers.instance().fetch('Short-Range') as LeveledModifier;
      expect(mod.isAttackModifier, false);
      expect(mod.level, 1);
      expect(mod.percentage, -10);
      expect(LeveledModifier.copyOf(mod, level: 3).percentage, -30);
      expect(() => LeveledModifier.copyOf(mod, level: 4),
          throwsA(isA<AssertionError>()));
    });
  }, skip: true);

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
