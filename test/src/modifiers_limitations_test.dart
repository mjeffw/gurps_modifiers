import 'package:gurps_modifiers/src/modifier_template.dart';
import 'package:gurps_modifiers/src/modifiers.dart';
import 'package:test/test.dart';

//TODO: Implementation idea: Modifiers with multiple options, like Bombardment, Effective skill 14
// AND Bombardment, Effective skill 12, etc, could be turned into a single entry ("Bombardment"),
// with a number of radio buttons (one for each option).
main() {
  group('Simple limitations', () {
    //TODO: You may only take this limitation in conjunction with Area Effect or Cone.
    test('Bombardment, Effective skill 14', () {
      var mod =
          ModifierTemplates.instance().fetch('Bombardment, Effective skill 14');
      expect(mod.percentage, -5);
      expect(mod.isAttackModifier, true);
    });

    test('Bombardment, Effective skill 12', () {
      var mod =
          ModifierTemplates.instance().fetch('Bombardment, Effective skill 12');
      expect(mod.percentage, -10);
      expect(mod.isAttackModifier, true);
    });

    test('Bombardment, Effective skill 10', () {
      var mod =
          ModifierTemplates.instance().fetch('Bombardment, Effective skill 10');
      expect(mod.percentage, -15);
      expect(mod.isAttackModifier, true);
    });

    test('Bombardment, Effective skill 8', () {
      var mod =
          ModifierTemplates.instance().fetch('Bombardment, Effective skill 8');
      expect(mod.percentage, -20);
      expect(mod.isAttackModifier, true);
    });

    //TODO: Gadget limitation.
    test('Can Be Stolen, Forcefully removed', () {
      var mod = ModifierTemplates.instance()
          .fetch('Can Be Stolen, Forcefully removed');
      expect(mod.percentage, -10);
      expect(mod.isAttackModifier, false);
    });

    //TODO: Gadget limitation.
    test('Can Be Stolen, Easily snatched', () {
      var mod =
          ModifierTemplates.instance().fetch('Can Be Stolen, Easily snatched');
      expect(mod.percentage, -40);
      expect(mod.isAttackModifier, false);
    });

    //TODO: Gadget limitation.
    test('Can Be Stolen, Quick Contest', () {
      var mod =
          ModifierTemplates.instance().fetch('Can Be Stolen, Quick Contest');
      expect(mod.percentage, -30);
      expect(mod.isAttackModifier, false);
    });

    //TODO: Gadget limitation.
    test('Can Be Stolen, Stealth or trickery', () {
      var mod = ModifierTemplates.instance()
          .fetch('Can Be Stolen, Stealth or trickery');
      expect(mod.percentage, -20);
      expect(mod.isAttackModifier, false);
    });

    test('Active Defense', () {
      var mod = ModifierTemplates.instance().fetch('Active Defense');
      expect(mod.percentage, -40);
      expect(mod.isAttackModifier, false);
    });

    test('Active Defense, Indpependent', () {
      var mod =
          ModifierTemplates.instance().fetch('Active Defense, Independent');
      expect(mod.percentage, -20);
      expect(mod.isAttackModifier, false);
    });

    test('All-Out', () {
      var mod = ModifierTemplates.instance().fetch('All-Out');
      expect(mod.percentage, -25);
      expect(mod.isAttackModifier, false);
    });

    test('All-Out Concentrate', () {
      var mod = ModifierTemplates.instance().fetch('All-Out Concentrate');
      expect(mod.percentage, -25);
      expect(mod.isAttackModifier, false);
    });

    test('Aspected', () {
      var mod = ModifierTemplates.instance().fetch('Aspected');
      expect(mod.percentage, -20);
      expect(mod.isAttackModifier, false);
    });

    test('Attracts Threats, 6 or less', () {
      var mod =
          ModifierTemplates.instance().fetch('Attracts Threats, 6 or less');
      expect(mod.percentage, -5);
      expect(mod.isAttackModifier, false);
    });

    test('Attracts Threats, 9 or less', () {
      var mod =
          ModifierTemplates.instance().fetch('Attracts Threats, 9 or less');
      expect(mod.percentage, -10);
      expect(mod.isAttackModifier, false);
    });

    test('Blockable', () {
      var mod = ModifierTemplates.instance().fetch('Blockable');
      expect(mod.percentage, -5);
      expect(mod.isAttackModifier, false);
    });

    test('Blood Agent, Reversed', () {
      var mod = ModifierTemplates.instance().fetch('Blood Agent, Reversed');
      expect(mod.percentage, -40);
      expect(mod.isAttackModifier, false);
    });

    test('Can Be Blocked or Parried', () {
      var mod = ModifierTemplates.instance().fetch('Can Be Blocked or Parried');
      expect(mod.percentage, -10);
      expect(mod.isAttackModifier, false);
    });

    test('Can Be Parried', () {
      var mod = ModifierTemplates.instance().fetch('Can Be Parried');
      expect(mod.percentage, -5);
      expect(mod.isAttackModifier, false);
    });

    //TODO: You may only take this limitation in conjunction with Area Effect or Cone.
    test('Dissipation', () {
      var mod = ModifierTemplates.instance().fetch('Dissipation');
      expect(mod.percentage, -50);
      expect(mod.isAttackModifier, true);
    });

    //TODO: You may only take this limitation in conjunction with Area Effect.
    test('Emanation', () {
      var mod = ModifierTemplates.instance().fetch('Emanation');
      expect(mod.percentage, -20);
      expect(mod.isAttackModifier, true);
    });

    test('Emergencies Only', () {
      var mod = ModifierTemplates.instance().fetch('Emergencies Only');
      expect(mod.percentage, -30);
      expect(mod.isAttackModifier, false);
    });

    test('Fickle', () {
      var mod = ModifierTemplates.instance().fetch('Fickle');
      expect(mod.percentage, -20);
      expect(mod.isAttackModifier, false);
    });

    test('Full Power in Emergencies Only', () {
      var mod =
          ModifierTemplates.instance().fetch('Full Power in Emergencies Only');
      expect(mod.percentage, -20);
      expect(mod.isAttackModifier, false);
    });

    test('Granted by (Other)', () {
      var mod = ModifierTemplates.instance().fetch('Granted by (Other)');
      expect(mod.percentage, -40);
      expect(mod.isAttackModifier, false);
    });

    test('Informal', () {
      var mod = ModifierTemplates.instance().fetch('Informal');
      expect(mod.percentage, -50);
      expect(mod.isAttackModifier, false);
    });

    test('Insubstantial Only', () {
      var mod = ModifierTemplates.instance().fetch('Insubstantial Only');
      expect(mod.percentage, -30);
      expect(mod.isAttackModifier, false);
    });

    test('Magnetic', () {
      var mod = ModifierTemplates.instance().fetch('Magnetic');
      expect(mod.percentage, -50);
      expect(mod.isAttackModifier, false);
    });

    test('Mana-Sensitive', () {
      var mod = ModifierTemplates.instance().fetch('Mana-Sensitive');
      expect(mod.percentage, -10);
      expect(mod.isAttackModifier, false);
    });

    test('Minimum Range, 1% Max', () {
      var mod = ModifierTemplates.instance().fetch('Minimum Range, 1% Max');
      expect(mod.percentage, -5);
      expect(mod.isAttackModifier, false);
    });

    test('Minimum Range, 5% Max', () {
      var mod = ModifierTemplates.instance().fetch('Minimum Range, 5% Max');
      expect(mod.percentage, -10);
      expect(mod.isAttackModifier, false);
    });

    test('No Blunt Trauma', () {
      var mod = ModifierTemplates.instance().fetch('No Blunt Trauma');
      expect(mod.percentage, -20);
      expect(mod.isAttackModifier, true);
    });

    test('No DR Reduction', () {
      var mod = ModifierTemplates.instance().fetch('No DR Reduction');
      expect(mod.percentage, -20);
      expect(mod.isAttackModifier, true);
    });

    test('No Incendiary Effect', () {
      var mod = ModifierTemplates.instance().fetch('No Incendiary Effect');
      expect(mod.percentage, -10);
      expect(mod.isAttackModifier, true);
    });

    test('No Knockback', () {
      var mod = ModifierTemplates.instance().fetch('No Knockback');
      expect(mod.percentage, -10);
      expect(mod.isAttackModifier, true);
    });

    test('No Wounding', () {
      var mod = ModifierTemplates.instance().fetch('No Wounding');
      expect(mod.percentage, -10);
      expect(mod.isAttackModifier, true);
    });

    test('Only When Berserk', () {
      var mod = ModifierTemplates.instance().fetch('Only When Berserk');
      expect(mod.percentage, -20);
      expect(mod.isAttackModifier, false);
    });

    // TODO: You can’t combine this with All-Out, All-Out Concentrate, or
    // Requires Ready.
    test('Requires Concentrate', () {
      var mod = ModifierTemplates.instance().fetch('Requires Concentrate');
      expect(mod.percentage, -15);
      expect(mod.isAttackModifier, false);
    });

    test('Requires Ready', () {
      var mod = ModifierTemplates.instance().fetch('Requires Ready');
      expect(mod.percentage, -10);
      expect(mod.isAttackModifier, false);
    });

    test('Requires Reaction Roll', () {
      var mod = ModifierTemplates.instance().fetch('Requires Reaction Roll');
      expect(mod.percentage, -5);
      expect(mod.isAttackModifier, false);
    });

    test('Skill Enhancement Only', () {
      var mod = ModifierTemplates.instance().fetch('Skill Enhancement Only');
      expect(mod.percentage, -60);
      expect(mod.isAttackModifier, false);
    });

    test('Substantial Only', () {
      var mod = ModifierTemplates.instance().fetch('Substantial Only');
      expect(mod.percentage, -10);
      expect(mod.isAttackModifier, false);
    });

    // TODO: You can only take this limitation in conjunction with Uncontrollable.
    test('Unconscious Only', () {
      var mod = ModifierTemplates.instance().fetch('Unconscious Only');
      expect(mod.percentage, -20);
      expect(mod.isAttackModifier, false);
    });

    test('Uncontrollable, Inconvenient', () {
      var mod =
          ModifierTemplates.instance().fetch('Uncontrollable, Inconvenient');
      expect(mod.percentage, -10);
      expect(mod.isAttackModifier, false);
    });

    test('Uncontrollable, Dangerous', () {
      var mod = ModifierTemplates.instance().fetch('Uncontrollable, Dangerous');
      expect(mod.percentage, -30);
      expect(mod.isAttackModifier, false);
    });

    test('Unique', () {
      var mod = ModifierTemplates.instance().fetch('Unique');
      expect(mod.percentage, -25);
      expect(mod.isAttackModifier, false);
    });

    test('Unsupported', () {
      var mod = ModifierTemplates.instance().fetch('Unsupported');
      expect(mod.percentage, -25);
      expect(mod.isAttackModifier, false);
    });

    test('Untrainable', () {
      var mod = ModifierTemplates.instance().fetch('Untrainable');
      expect(mod.percentage, -40);
      expect(mod.isAttackModifier, false);
    });

    test('Visible, Attack', () {
      var mod = ModifierTemplates.instance().fetch('Visible, Attack');
      expect(mod.percentage, -20);
      expect(mod.isAttackModifier, false);
    });

    test('Visible, Non-Attack', () {
      var mod = ModifierTemplates.instance().fetch('Visible, Non-Attack');
      expect(mod.percentage, -10);
      expect(mod.isAttackModifier, false);
    });

    test('Always On, Social or Cosmetic', () {
      var mod =
          ModifierTemplates.instance().fetch('Always On, Social or Cosmetic');
      expect(mod.percentage, -10);
      expect(mod.isAttackModifier, false);
    });

    test('Always On, Dangerous', () {
      var mod = ModifierTemplates.instance().fetch('Always On, Dangerous');
      expect(mod.percentage, -40);
      expect(mod.isAttackModifier, false);
    });

    test('Always On, Physically Inconvenient', () {
      var mod = ModifierTemplates.instance()
          .fetch('Always On, Physically Inconvenient');
      expect(mod.percentage, -20);
      expect(mod.isAttackModifier, false);
    });

    test('Environmental, Very common', () {
      var mod =
          ModifierTemplates.instance().fetch('Environmental, Very common');
      expect(mod.percentage, -5);
      expect(mod.isAttackModifier, false);
    });

    test('Environmental, Common', () {
      var mod = ModifierTemplates.instance().fetch('Environmental, Common');
      expect(mod.percentage, -10);
      expect(mod.isAttackModifier, false);
    });

    test('Environmental, Occasional', () {
      var mod = ModifierTemplates.instance().fetch('Environmental, Occasional');
      expect(mod.percentage, -20);
      expect(mod.isAttackModifier, false);
    });

    test('Environmental, Rare', () {
      var mod = ModifierTemplates.instance().fetch('Environmental, Rare');
      expect(mod.percentage, -40);
      expect(mod.isAttackModifier, false);
    });

    test('Environmental, Very rare', () {
      var mod = ModifierTemplates.instance().fetch('Environmental, Very rare');
      expect(mod.percentage, -80);
      expect(mod.isAttackModifier, false);
    });

    test('Mitigator, Vulnerable', () {
      var mod = ModifierTemplates.instance().fetch('Mitigator, Vulnerable');
      expect(mod.percentage, -60);
      expect(mod.isAttackModifier, false);
    });

    test('Mitigator, Daily', () {
      var mod = ModifierTemplates.instance().fetch('Mitigator, Daily');
      expect(mod.percentage, -60);
      expect(mod.isAttackModifier, false);
    });

    test('Mitigator, Weekly', () {
      var mod = ModifierTemplates.instance().fetch('Mitigator, Weekly');
      expect(mod.percentage, -65);
      expect(mod.isAttackModifier, false);
    });

    test('Mitigator, Horde Intelligence', () {
      var mod =
          ModifierTemplates.instance().fetch('Mitigator, Horde Intelligence');
      expect(mod.percentage, -60);
      expect(mod.isAttackModifier, false);
    });

    test('Mitigator, Monthly', () {
      var mod = ModifierTemplates.instance().fetch('Mitigator, Monthly');
      expect(mod.percentage, -70);
      expect(mod.isAttackModifier, false);
    });

    //TODO: Requires (Attribute) Roll - perhaps a better implementation is to
    // select the Attribute and use that to derive the value.
    test('Requires (Attribute) Roll, DX or IQ or HT', () {
      var mod = ModifierTemplates.instance()
          .fetch('Requires (Attribute) Roll, DX or IQ or HT');
      expect(mod.percentage, -10);
      expect(mod.isAttackModifier, false);
    });

    test('Requires (Attribute) Roll, Per or Will', () {
      var mod = ModifierTemplates.instance()
          .fetch('Requires (Attribute) Roll, Per or Will');
      expect(mod.percentage, -5);
      expect(mod.isAttackModifier, false);
    });

    //TODO: Requires (Skill) Roll - perhaps a better implementation is to
    // select the Skill and use that to derive the value.
    test('Requires (Skill) Roll, DX- or IQ- or HT-Based Average or harder', () {
      var mod = ModifierTemplates.instance().fetch(
          'Requires (Skill) Roll, DX- or IQ- or HT-Based Average or harder');
      expect(mod.percentage, -10);
      expect(mod.isAttackModifier, false);
    });

    test('Requires (Skill) Roll, DX- or IQ- or HT-Based Easy', () {
      var mod = ModifierTemplates.instance()
          .fetch('Requires (Skill) Roll, DX- or IQ- or HT-Based Easy');
      expect(mod.percentage, -5);
      expect(mod.isAttackModifier, false);
    });

    test('Requires (Skill) Roll, Per- or Will-Based Average or harder', () {
      var mod = ModifierTemplates.instance()
          .fetch('Requires (Skill) Roll, Per- or Will-Based Average or harder');
      expect(mod.percentage, -5);
      expect(mod.isAttackModifier, false);
    });

    test('Requires (Attribute) Roll, Quick Contest of DX or IQ or HT', () {
      var mod = ModifierTemplates.instance()
          .fetch('Requires (Attribute) Roll, Quick Contest of DX or IQ or HT');
      expect(mod.percentage, -20);
      expect(mod.isAttackModifier, false);
    });

    test('Requires (Attribute) Roll, Quick Contest of Per or Will', () {
      var mod = ModifierTemplates.instance()
          .fetch('Requires (Attribute) Roll, Quick Contest of Per or Will');
      expect(mod.percentage, -15);
      expect(mod.isAttackModifier, false);
    });

    test('Requires (Attribute) Roll, Quick Contest replaces Attribute roll',
        () {
      var mod = ModifierTemplates.instance().fetch(
          'Requires (Attribute) Roll, Quick Contest replaces Attribute roll');
      expect(mod.percentage, -10);
      expect(mod.isAttackModifier, false);
    });
  }, skip: false);

  //TODO: This is the catch-all limitation. Must provide someway to enter
  // limitation information (and potentially save it).
  group('Accessibility', () {
    test('Requires gestures', () {
      var mod = ModifierTemplates.instance()
          .fetch('Accessibility, Requires gestures');
      expect(mod.percentage, -10);
    });
    test('Requires magic words', () {
      var mod = ModifierTemplates.instance()
          .fetch('Accessibility, Requires magic words');
      expect(mod.percentage, -10);
    });
    test('Requires material component', () {
      var mod = ModifierTemplates.instance()
          .fetch('Accessibility, Requires material component');
      expect(mod.percentage, -10);
    });
    test('Requires material component, extremely rare', () {
      var mod = ModifierTemplates.instance()
          .fetch('Accessibility, Requires material component, extremely rare');
      expect(mod.percentage, -15);
    });
    test('Requires simple ritual', () {
      var mod = ModifierTemplates.instance()
          .fetch('Accessibility, Requires simple ritual');
      expect(mod.percentage, -5);
    });
    test('Requires typical ritual', () {
      var mod = ModifierTemplates.instance()
          .fetch('Accessibility, Requires typical ritual');
      expect(mod.percentage, -10);
    });
    test('Requires complex ritual', () {
      var mod = ModifierTemplates.instance()
          .fetch('Accessibility, Requires complex ritual');
      expect(mod.percentage, -20);
    });
    test('Requires (item)', () {
      var mod =
          ModifierTemplates.instance().fetch('Accessibility, Requires (item)');
      expect(mod.percentage, -10);
    });
    test('Only on those who share a language with me', () {
      var mod = ModifierTemplates.instance()
          .fetch('Accessibility, Only on those who share a language with me');
      expect(mod.percentage, -10);
    });
    test('Only while moving (1 step/turn)', () {
      var mod = ModifierTemplates.instance()
          .fetch('Accessibility, Only while moving 1 step/turn');
      expect(mod.percentage, -10);
    });
    test('Only while moving (half Move)', () {
      var mod = ModifierTemplates.instance()
          .fetch('Accessibility, Only while moving half Move');
      expect(mod.percentage, -20);
    });
    test('While conscious', () {
      var mod =
          ModifierTemplates.instance().fetch('Accessibility, While conscious');
      expect(mod.percentage, -5);
    });
    test('Only while moving (full Move)', () {
      var mod = ModifierTemplates.instance()
          .fetch('Accessibility, Only while moving full Move');
      expect(mod.percentage, -30);
    });
    test('Only at day', () {
      var mod =
          ModifierTemplates.instance().fetch('Accessibility, Only at day');
      expect(mod.percentage, -20);
    });
    test('Only at night', () {
      var mod =
          ModifierTemplates.instance().fetch('Accessibility, Only at night');
      expect(mod.percentage, -20);
    });
    test('Only by one side of split personality', () {
      var mod = ModifierTemplates.instance()
          .fetch('Accessibility, Only by one side of split personality');
      expect(mod.percentage, -40);
    });
    test('Only in altered body form', () {
      var mod = ModifierTemplates.instance()
          .fetch('Accessibility, Only in altered body form');
      expect(mod.percentage, -10);
    });
    test('Only in direct sunlight', () {
      var mod = ModifierTemplates.instance()
          .fetch('Accessibility, Only in direct sunlight');
      expect(mod.percentage, -30);
    });
    test('Only during full moon', () {
      var mod = ModifierTemplates.instance()
          .fetch('Accessibility, Only during full moon');
      expect(mod.percentage, -40);
    });
    test('Only during new moon', () {
      var mod = ModifierTemplates.instance()
          .fetch('Accessibility, Only during new moon');
      expect(mod.percentage, -40);
    });
    test('Only while flying', () {
      var mod = ModifierTemplates.instance()
          .fetch('Accessibility, Only while flying');
      expect(mod.percentage, -30);
    });
    test('Only while in hypnotic trance', () {
      var mod = ModifierTemplates.instance()
          .fetch('Accessibility, Only while in hypnotic trance');
      expect(mod.percentage, -30);
    });
    test('Only while swimming', () {
      var mod = ModifierTemplates.instance()
          .fetch('Accessibility, Only while swimming');
      expect(mod.percentage, -30);
    });
    test('Only while playing musical instrument', () {
      var mod = ModifierTemplates.instance()
          .fetch('Accessibility, Only while playing musical instrument');
      expect(mod.percentage, -20);
    });
    test('Useless under stress', () {
      var mod = ModifierTemplates.instance()
          .fetch('Accessibility, Useless under stress');
      expect(mod.percentage, -60);
    });
  }, skip: false);

  group('Leveled limitations', () {
    test('Cardiac Stress', () {
      var mod = ModifierTemplates.instance().fetch('Cardiac Stress')
          as BaseLeveledTemplate;
      expect(mod.levelPercentage(1), -50);
      expect(mod.isAttackModifier, false);
      expect(mod.levelPercentage(5), -10);
    });

    test('Cerebral Stress', () {
      var mod = ModifierTemplates.instance().fetch('Cerebral Stress')
          as BaseLeveledTemplate;
      expect(mod.levelPercentage(1), -50);
      expect(mod.isAttackModifier, false);
      expect(mod.levelPercentage(5), -10);
    });

    test('Costs Fatigue', () {
      var mod = ModifierTemplates.instance().fetch('Costs Fatigue')
          as BaseLeveledTemplate;
      expect(mod.isAttackModifier, false);
      expect(mod.levelPercentage(1), -5);
      expect(mod.levelPercentage(4), -20);
    });

    test('Costs Fatigue, Per second', () {
      var mod = ModifierTemplates.instance().fetch('Costs Fatigue, Per second')
          as BaseLeveledTemplate;
      expect(mod.isAttackModifier, false);
      expect(mod.levelPercentage(1), -10);
      expect(mod.levelPercentage(4), -40);
    });

    test('Costs Hit Points', () {
      var mod = ModifierTemplates.instance().fetch('Costs Hit Points')
          as BaseLeveledTemplate;
      expect(mod.isAttackModifier, false);
      expect(mod.levelPercentage(1), -10);
      expect(mod.levelPercentage(4), -40);
    });

    test('Costs Hit Points, Per second', () {
      var mod = ModifierTemplates.instance()
          .fetch('Costs Hit Points, Per second') as BaseLeveledTemplate;
      expect(mod.isAttackModifier, false);
      expect(mod.levelPercentage(1), -20);
      expect(mod.levelPercentage(4), -80);
    });

    test('Costs Hit Points, Instead of Fatigue', () {
      var mod = ModifierTemplates.instance()
          .fetch('Costs Hit Points, Instead of Fatigue') as BaseLeveledTemplate;
      expect(mod.isAttackModifier, false);
      expect(mod.levelPercentage(1), -5);
      expect(mod.levelPercentage(4), -20);
    });

    test('Costs Hit Points, Per second instead of Fatigue', () {
      var mod = ModifierTemplates.instance()
              .fetch('Costs Hit Points, Per second instead of Fatigue')
          as BaseLeveledTemplate;
      expect(mod.isAttackModifier, false);
      expect(mod.levelPercentage(1), -10);
      expect(mod.levelPercentage(4), -40);
    });

    test('Easily Resisted', () {
      var mod = ModifierTemplates.instance().fetch('Easily Resisted')
          as BaseLeveledTemplate;
      expect(mod.isAttackModifier, false);
      expect(mod.levelPercentage(1), -5);
      expect(mod.levelPercentage(6), -30);
    });

    test('Extra Recoil', () {
      var mod = ModifierTemplates.instance().fetch('Extra Recoil')
          as BaseLeveledTemplate;
      expect(mod.isAttackModifier, true);
      expect(mod.levelPercentage(1), -10);
      expect(mod.levelPercentage(4), -40);
    });

    test('Glamour', () {
      var mod =
          ModifierTemplates.instance().fetch('Glamour') as BaseLeveledTemplate;
      expect(mod.isAttackModifier, false);
      expect(mod.levelPercentage(1), -5);
      expect(mod.levelPercentage(10), -50);
    });

    test('Hard to Use', () {
      var mod = ModifierTemplates.instance().fetch('Hard to Use')
          as BaseLeveledTemplate;
      expect(mod.isAttackModifier, false);
      expect(mod.levelPercentage(1), -5);
      expect(mod.levelPercentage(4), -20);
    });

    test('Immediate Preparation Required', () {
      var mod = ModifierTemplates.instance()
          .fetch('Immediate Preparation Required') as BaseLeveledTemplate;
      expect(mod.isAttackModifier, false);
      expect(mod.levelPercentage(1), -30);
      expect(mod.levelPercentage(2), -45);
      expect(mod.levelPercentage(3), -75);
      expect(mod.levelPercentage(4), -90);
    });

    test('Increased Immunity', () {
      var mod = ModifierTemplates.instance().fetch('Increased Immunity')
          as BaseLeveledTemplate;
      expect(mod.isAttackModifier, false);
      expect(mod.levelPercentage(1), -10);
      expect(mod.levelPercentage(4), -40);
    });

    test('Inaccurate', () {
      var mod = ModifierTemplates.instance().fetch('Inaccurate')
          as BaseLeveledTemplate;
      expect(mod.isAttackModifier, true);
      expect(mod.levelPercentage(1), -5);
      expect(mod.levelPercentage(4), -20);
    });

    test('Limited Use', () {
      var mod = ModifierTemplates.instance().fetch('Limited Use')
          as BaseLeveledTemplate;
      expect(mod.isAttackModifier, false);
      expect(mod.levelPercentage(1), -10);
      expect(mod.levelPercentage(4), -40);
    });

    test('Limited Use, Fast Reload', () {
      var mod = ModifierTemplates.instance().fetch('Limited Use, Fast Reload')
          as BaseLeveledTemplate;
      expect(mod.isAttackModifier, false);
      expect(mod.levelPercentage(1), -5);
      expect(mod.levelPercentage(4), -20);
    });

    test('Limited Use, Slow Reload', () {
      var mod = ModifierTemplates.instance().fetch('Limited Use, Slow Reload')
          as BaseLeveledTemplate;
      expect(mod.isAttackModifier, false);
      expect(mod.levelPercentage(1), -5);
      expect(mod.levelPercentage(4), -35);
    });

    test('Maximum Duration', () {
      var mod = ModifierTemplates.instance().fetch('Maximum Duration')
          as BaseLeveledTemplate;
      expect(mod.isAttackModifier, false);
      expect(mod.levelPercentage(1), -5);
      expect(mod.levelPercentage(2), -10);
      expect(mod.levelPercentage(3), -25);
      expect(mod.levelPercentage(4), -50);
      expect(mod.levelPercentage(5), -65);
      expect(mod.levelPercentage(6), -75);
    });

    //TODO: On an advantage that allows Always On, this limitation is worth at
    // most -5% less than Always On; e.g., if Always On is -20%, Minimum
    // Duration can’t go beyond -15%.
    test('Minimum Duration', () {
      var mod = ModifierTemplates.instance().fetch('Minimum Duration')
          as BaseLeveledTemplate;
      expect(mod.isAttackModifier, false);
      expect(mod.levelPercentage(1), -5);
      expect(mod.levelPercentage(2), -10);
      expect(mod.levelPercentage(6), -30);
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
      var mod = ModifierTemplates.instance()
          .fetch('Nuisance Effect, Reaction penalty') as BaseLeveledTemplate;
      expect(mod.isAttackModifier, false);
      expect(mod.levelPercentage(1), -5);
      expect(mod.levelPercentage(4), -20);
    });

    test('Onset', () {
      var mod =
          ModifierTemplates.instance().fetch('Onset') as BaseLeveledTemplate;
      expect(mod.isAttackModifier, true);
      expect(mod.levelPercentage(1), -10);
      expect(mod.levelPercentage(4), -40);
    });

    test('Exposure Time', () {
      var mod = ModifierTemplates.instance().fetch('Exposure Time')
          as BaseLeveledTemplate;
      expect(mod.isAttackModifier, true);
      expect(mod.levelPercentage(1), -30);
      expect(mod.levelPercentage(4), -60);
    });

    test('Periodic Recharge', () {
      var mod = ModifierTemplates.instance().fetch('Periodic Recharge')
          as BaseLeveledTemplate;
      expect(mod.isAttackModifier, false);
      expect(mod.levelPercentage(1), -5);
      expect(mod.levelPercentage(2), -10);
      expect(mod.levelPercentage(3), -20);
      expect(mod.levelPercentage(4), -40);
      expect(mod.levelPercentage(5), -80);
    });

    test('Preparation Required', () {
      var mod = ModifierTemplates.instance().fetch('Preparation Required')
          as BaseLeveledTemplate;
      expect(mod.isAttackModifier, false);
      expect(mod.levelPercentage(1), -20);
      expect(mod.levelPercentage(2), -30);
      expect(mod.levelPercentage(3), -50);
      expect(mod.levelPercentage(4), -60);
    });

    test('Weakened Without Preparation', () {
      var mod = ModifierTemplates.instance()
          .fetch('Weakened Without Preparation') as BaseLeveledTemplate;
      expect(mod.isAttackModifier, false);
      expect(mod.levelPercentage(1), -10);
      expect(mod.levelPercentage(2), -15);
      expect(mod.levelPercentage(3), -25);
      expect(mod.levelPercentage(4), -30);
    });

    test('Reduced Duration', () {
      var mod = ModifierTemplates.instance().fetch('Reduced Duration')
          as BaseLeveledTemplate;
      expect(mod.isAttackModifier, false);
      expect(mod.levelPercentage(1), -5);
      expect(mod.levelPercentage(4), -20);
      expect(mod.levelPercentage(7), -35);
    });

    test('Requires Low Gravity', () {
      var mod = ModifierTemplates.instance().fetch('Requires Low Gravity')
          as BaseLeveledTemplate;
      expect(mod.isAttackModifier, false);
      expect(mod.levelPercentage(1), -5);
      expect(mod.levelPercentage(4), -20);
      expect(mod.levelPercentage(10), -50);
    });

    //TODO: This limitation is only available for Innate Attacks that inflict
    // fatigue or toxic damage. You must combine it with one of Blood Agent,
    // Contact Agent, Follow-Up, Respiratory Agent, or Sense-Based.
    test('Resistible', () {
      var mod = ModifierTemplates.instance().fetch('Resistible')
          as BaseLeveledTemplate;
      expect(mod.isAttackModifier, true);
      expect(mod.levelPercentage(1), -5);
      expect(mod.levelPercentage(4), -20);
      expect(mod.levelPercentage(10), -50);
    });

    test('Short-Range', () {
      var mod = ModifierTemplates.instance().fetch('Short-Range')
          as BaseLeveledTemplate;
      expect(mod.isAttackModifier, false);
      expect(mod.levelPercentage(1), -10);
      expect(mod.levelPercentage(3), -30);
    });
  }, skip: false);

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
