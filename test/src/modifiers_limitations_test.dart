import 'package:gurps_modifiers/src/modifier.dart';
import 'package:gurps_modifiers/src/modifier_template.dart';
import 'package:gurps_modifiers/src/modifiers.dart';
import 'package:test/test.dart';

import 'data.dart';

//TODO: Implementation idea: Modifiers with multiple options, like Bombardment, Effective skill 14
// AND Bombardment, Effective skill 12, etc, could be turned into a single entry ("Bombardment"),
// with a number of radio buttons (one for each option).
main() {
  group('NamedVariants', () {
    group('Active Defense', () {
      Modifier a;
      setUp(() {
        a = Modifiers.instance().byName('Active Defense');
      });
      test('default', () {
        expect(a.percentage, -40);
        expect(a.isAttackModifier, false);
        expect(a.description, 'Active Defense');
      });

      test('Independent', () {
        var mod = Modifier.copyWith(a, detail: 'Independent');
        expect(mod.percentage, -20);
        expect(mod.description, 'Active Defense, Independent');
      });
    });

    group('All-Out', () {
      var m;
      setUp(() {
        m = Modifiers.instance().byName('All-Out');
      });

      test('default', () {
        expect(m.percentage, -25);
        expect(m.isAttackModifier, false);
        expect(m.description, 'All-Out');
      });

      test('Concentrate', () {
        var mod = Modifier.copyWith(m, detail: 'Concentrate');
        expect(mod.percentage, -25);
        expect(mod.description, 'All-Out, Concentrate');
      });
    });

    group('Attracts Threats', () {
      Modifier m;
      setUp(() {
        m = Modifiers.instance().byName('Attracts Threats');
      });

      test('default', () {
        expect(m.description, 'Attracts Threats, 6 or less');
        expect(m.percentage, -5);
        expect(m.isAttackModifier, false);
      });

      test('6 or less', () {
        var mod = Modifier.copyWith(m, detail: '6 or less');
        expect(mod.description, 'Attracts Threats, 6 or less');
        expect(mod.percentage, -5);
      });

      test('9 or less', () {
        var mod = Modifier.copyWith(m, detail: '9 or less');
        expect(mod.description, 'Attracts Threats, 9 or less');
        expect(mod.percentage, -10);
      });
    });

    group('Bombardment', () {
      //TODO: You may only take this limitation in conjunction with Area Effect or Cone.
      Modifier b;

      setUp(() {
        b = Modifiers.instance().byName('Bombardment');
      });
      test('default', () {
        expect(b.detail, 'Skill 12');
        expect(b.percentage, -10);
        expect(b.description, 'Bombardment, Skill 12');
      });

      test('Skill 12', () {
        var m = Modifier.copyWith(b, detail: 'Skill 12');
        expect(m.percentage, -10);
        expect(m.description, 'Bombardment, Skill 12');
      });

      test('Skill 14', () {
        var m = Modifier.copyWith(b, detail: 'Skill 14');
        expect(m.percentage, -5);
        expect(m.description, 'Bombardment, Skill 14');
      });

      test('Skill 10', () {
        var m = Modifier.copyWith(b, detail: 'Skill 10');
        expect(m.percentage, -15);
        expect(m.description, 'Bombardment, Skill 10');
      });

      test('Skill 8', () {
        var m = Modifier.copyWith(b, detail: 'Skill 8');
        expect(m.percentage, -20);
        expect(m.description, 'Bombardment, Skill 8');
      });

      test('bad variation', () {
        expect(() => Modifier.copyWith(b, detail: 'Skill 6'),
            throwsA(isA<AssertionError>()));
      });
    });

    group('Can Be Stolen', () {
      Modifier c;

      setUp(() {
        c = Modifiers.instance().byName('Can Be Stolen');
      });

      test('default', () {
        expect(c.percentage, -40);
        expect(c.description, 'Can Be Stolen, Easily');
      });

      test('Easily', () {
        var m = Modifier.copyWith(c, detail: 'Easily');
        expect(m.percentage, -40);
        expect(m.description, 'Can Be Stolen, Easily');
      });

      test('Quick Contest', () {
        var m = Modifier.copyWith(c, detail: 'Quick Contest');
        expect(m.percentage, -30);
        expect(m.description, 'Can Be Stolen, Quick Contest');
      });

      test('Stealth/Trickery', () {
        var m = Modifier.copyWith(c, detail: 'Stealth/Trickery');
        expect(m.percentage, -20);
        expect(m.description, 'Can Be Stolen, Stealth/Trickery');
      });

      test('Forcefully', () {
        var m = Modifier.copyWith(c, detail: 'Forcefully');
        expect(m.percentage, -10);
        expect(m.description, 'Can Be Stolen, Forcefully');
      });
    });

    group('Minimum Range', () {
      var r;
      setUp(() {
        r = Modifiers.instance().byName('Minimum Range');
      });

      test('default', () {
        expect(r.percentage, -10);
        expect(r.isAttackModifier, false);
        expect(r.description, 'Minimum Range, 5% Max Range');
      });

      test('1% Max', () {
        var mod = Modifier.copyWith(r, detail: '1% Max Range');
        expect(mod.percentage, -5);
        expect(mod.description, 'Minimum Range, 1% Max Range');
      });

      test('5% Max', () {
        var mod = Modifier.copyWith(r, detail: '5% Max Range');
        expect(mod.percentage, -10);
        expect(mod.description, 'Minimum Range, 5% Max Range');
      });
    });

    group('Requires (Attribute) Roll', () {
      var r;
      setUp(() {
        r = Modifiers.instance().byName('Requires (Attribute) Roll');
      });

      test('default', () {
        expect(r.percentage, -10);
        expect(r.isAttackModifier, false);
        expect(r.description, 'Requires DX Roll');
      });

      test('DX', () {
        var mod = Modifier.copyWith(r, detail: 'DX');
        expect(mod.percentage, -10);
        expect(mod.description, 'Requires DX Roll');
      });

      test('HT', () {
        var mod = Modifier.copyWith(r, detail: 'HT');
        expect(mod.percentage, -10);
        expect(mod.description, 'Requires HT Roll');
      });

      test('IQ', () {
        var mod = Modifier.copyWith(r, detail: 'IQ');
        expect(mod.percentage, -10);
        expect(mod.description, 'Requires IQ Roll');
      });

      test('Will', () {
        var mod = Modifier.copyWith(r, detail: 'Will');
        expect(mod.percentage, -5);
        expect(mod.description, 'Requires Will Roll');
      });

      test('Per', () {
        var mod = Modifier.copyWith(r, detail: 'Per');
        expect(mod.percentage, -5);
        expect(mod.description, 'Requires Per Roll');
      });

      test('Quick Contest, DX', () {
        var mod = Modifier.copyWith(r, detail: 'DX vs. <Other>');
        expect(mod.percentage, -20);
        expect(mod.description, 'Requires DX vs. <Other> Roll');
      });

      test('Quick Contest, HT', () {
        var mod = Modifier.copyWith(r, detail: 'HT vs. <Other>');
        expect(mod.percentage, -20);
        expect(mod.description, 'Requires HT vs. <Other> Roll');
      });

      test('Quick Contest, IQ', () {
        var mod = Modifier.copyWith(r, detail: 'IQ vs. <Other>');
        expect(mod.percentage, -20);
        expect(mod.description, 'Requires IQ vs. <Other> Roll');
      });

      test('Quick Contest, Per', () {
        var mod = Modifier.copyWith(r, detail: 'Per vs. <Other>');
        expect(mod.percentage, -15);
        expect(mod.description, 'Requires Per vs. <Other> Roll');
      });

      test('Quick Contest, Will', () {
        var mod = Modifier.copyWith(r, detail: 'Will vs. <Other>');
        expect(mod.percentage, -15);
        expect(mod.description, 'Requires Will vs. <Other> Roll');
      });
    });

    group('Requires (Quick Contest replaces Attribute) Roll', () {
      var r;
      setUp(() {
        r = Modifiers.instance()
            .byName('Requires (Quick Contest replaces Attribute) Roll');
      });

      test('default', () {
        expect(r.percentage, -10);
        expect(r.isAttackModifier, false);
        expect(r.description,
            'Requires DX vs. <Other> Roll, replaces Attribute roll');
      });

      test('DX', () {
        var mod = Modifier.copyWith(r, detail: 'DX');
        expect(mod.percentage, -10);
        expect(mod.description,
            'Requires DX vs. <Other> Roll, replaces Attribute roll');
      });

      test('HT', () {
        var mod = Modifier.copyWith(r, detail: 'HT');
        expect(mod.percentage, -10);
        expect(mod.description,
            'Requires HT vs. <Other> Roll, replaces Attribute roll');
      });

      test('IQ', () {
        var mod = Modifier.copyWith(r, detail: 'IQ');
        expect(mod.percentage, -10);
        expect(mod.description,
            'Requires IQ vs. <Other> Roll, replaces Attribute roll');
      });

      test('Per', () {
        var mod = Modifier.copyWith(r, detail: 'Per');
        expect(mod.percentage, -10);
        expect(mod.description,
            'Requires Per vs. <Other> Roll, replaces Attribute roll');
      });

      test('Will', () {
        var mod = Modifier.copyWith(r, detail: 'Will');
        expect(mod.percentage, -10);
        expect(mod.description,
            'Requires Will vs. <Other> Roll, replaces Attribute roll');
      });
    });

    group('Uncontrollable', () {
      var m;
      setUp(() {
        m = Modifiers.instance().byName('Uncontrollable');
      });

      test('default', () {
        expect(m.percentage, -10);
        expect(m.isAttackModifier, false);
        expect(m.description, 'Uncontrollable, Inconvenient');
      });

      test('Inconvenient', () {
        var mod = Modifier.copyWith(m, detail: 'Inconvenient');
        expect(mod.percentage, -10);
        expect(mod.description, 'Uncontrollable, Inconvenient');
      });

      test('Dangerous', () {
        var mod = Modifier.copyWith(m, detail: 'Dangerous');
        expect(mod.percentage, -30);
        expect(mod.description, 'Uncontrollable, Dangerous');
      });
    });

    group('Visible', () {
      var m;
      setUp(() {
        m = Modifiers.instance().byName('Visible');
      });

      test('default', () {
        expect(m.percentage, -10);
        expect(m.isAttackModifier, false);
        expect(m.description, 'Visible');
      });

      test('Allows Defense', () {
        var mod = Modifier.copyWith(m, detail: 'Allows Defense Roll');
        expect(mod.percentage, -20);
      });
    });
  });

  group('Categorized', () {
    group('Always On', () {
      var m;
      setUp(() {
        m = Modifiers.instance().byName('Always On');
      });

      test('default', () {
        expect(m.percentage, -10);
        expect(m.isAttackModifier, false);
        expect(m.description, 'Always On, Social or Cosmetic');
      });

      test('Social or Cosmetic', () {
        var mod = Modifier.copyWith(m, detail: 'Social or Cosmetic');
        expect(mod.percentage, -10);
        expect(mod.description, 'Always On, Social or Cosmetic');
      });

      test('Inconvenient', () {
        var mod = Modifier.copyWith(m, detail: 'Inconvenient');
        expect(mod.percentage, -20);
        expect(mod.description, 'Always On, Inconvenient');
      });

      test('Dangerous', () {
        var mod = Modifier.copyWith(m, detail: 'Dangerous');
        expect(mod.percentage, -40);
        expect(mod.description, 'Always On, Dangerous');
      });
    });

    group('Environmental', () {
      var m;
      setUp(() {
        m = Modifiers.instance().byName('Environmental');
      });

      _verify({int percent, String detail}) {
        var mod = Modifier.copyWith(m, detail: detail);
        expect(mod.percentage, percent);
        expect(mod.description, 'Environmental, $detail');
      }

      test('default', () {
        expect(m.percentage, -5);
        expect(m.isAttackModifier, false);
        expect(m.description, 'Environmental, Very Common');
      });

      test('Very Common', () {
        var mod = Modifier.copyWith(m, detail: 'Very Common');
        expect(mod.percentage, -5);
        expect(mod.description, 'Environmental, Very Common');
      });

      test('Very Common items', () {
        var items = ['In air', 'On a planet', 'In a gravity field'];

        items.forEach((f) => _verify(detail: f, percent: -5));
      });

      test('Common', () {
        var mod = Modifier.copyWith(m, detail: 'Common');
        expect(mod.percentage, -10);
        expect(mod.description, 'Environmental, Common');
      });

      test('Common items', () {
        var items = ['In contact with dust', 'In the presence of microbes'];

        items.forEach((f) => _verify(detail: f, percent: -10));
      });

      test('Occasional', () {
        var mod = Modifier.copyWith(m, detail: 'Occasional');
        expect(mod.percentage, -20);
        expect(mod.description, 'Environmental, Occasional');
      });

      test('Occasional items', () {
        var items = [
          'Touching the ground',
          'Outdoors',
          'In the wilderness',
          'In a city'
        ];

        items.forEach((f) => _verify(detail: f, percent: -20));
      });

      test('Rare', () {
        var mod = Modifier.copyWith(m, detail: 'Rare');
        expect(mod.percentage, -40);
        expect(mod.description, 'Environmental, Rare');
      });

      test('Rare items', () {
        var items = [
          'In a storm',
          'In dense vegetation',
          'In the desert',
          'Underground'
        ];

        items.forEach((f) => _verify(detail: f, percent: -40));
      });

      test('Very Rare', () {
        var mod = Modifier.copyWith(m, detail: 'Very Rare');
        expect(mod.percentage, -80);
        expect(mod.description, 'Environmental, Very Rare');
      });

      test('Very Rare items', () {
        var items = ['In lava', 'In quicksand', 'In vacuum'];

        items.forEach((f) => _verify(detail: f, percent: -80));
      });
    });

    group('Mitigator', () {
      var m;
      setUp(() {
        m = Modifiers.instance().byName('Mitigator');
      });

      test('default', () {
        expect(m.description, 'Mitigator, Vulnerable');
        expect(m.isAttackModifier, false);
        expect(m.percentage, -60);
      });

      test('Vulnerable', () {
        var mod = Modifier.copyWith(m, detail: 'Vulnerable');
        expect(mod.description, 'Mitigator, Vulnerable');
        expect(mod.percentage, -60);
      });

      test('Daily Treatment', () {
        var mod = Modifier.copyWith(m, detail: 'Daily Treatment');
        expect(mod.description, 'Mitigator, Daily Treatment');
        expect(mod.percentage, -60);
      });

      test('Weekly Treatment', () {
        var mod = Modifier.copyWith(m, detail: 'Weekly Treatment');
        expect(mod.description, 'Mitigator, Weekly Treatment');
        expect(mod.percentage, -65);
      });

      test('Monthly Treatment', () {
        var mod = Modifier.copyWith(m, detail: 'Monthly Treatment');
        expect(mod.description, 'Mitigator, Monthly Treatment');
        expect(mod.percentage, -70);
      });

      test('Horde Intelligence', () {
        var mod = Modifier.copyWith(m, detail: 'Horde Intelligence');
        expect(mod.description, 'Mitigator, Horde Intelligence');
        expect(mod.percentage, -60);
      });
    });

    group('Requires (Skill) Roll', () {
      var r;
      setUp(() {
        r = Modifiers.instance().byName('Requires (Skill) Roll');
      });

      test('default', () {
        expect(r.percentage, -10);
        expect(r.isAttackModifier, false);
        expect(r.description, 'Requires DX/Average Skill Roll');
      });

      test('Easy DX, IQ, or HT', () {
        var mod = Modifier.copyWith(r, detail: 'DX/Easy Skill');
        expect(mod.percentage, -5);
        expect(mod.description, 'Requires DX/Easy Skill Roll');

        mod = Modifier.copyWith(r, detail: 'IQ/Easy Skill');
        expect(mod.percentage, -5);
        expect(mod.description, 'Requires IQ/Easy Skill Roll');

        mod = Modifier.copyWith(r, detail: 'HT/Easy Skill');
        expect(mod.percentage, -5);
        expect(mod.description, 'Requires HT/Easy Skill Roll');
      });

      test('Average DX, IQ, or HT', () {
        var mod = Modifier.copyWith(r, detail: 'DX/Average Skill');
        expect(mod.percentage, -10);
        expect(mod.description, 'Requires DX/Average Skill Roll');

        mod = Modifier.copyWith(r, detail: 'IQ/Average Skill');
        expect(mod.percentage, -10);
        expect(mod.description, 'Requires IQ/Average Skill Roll');

        mod = Modifier.copyWith(r, detail: 'HT/Average Skill');
        expect(mod.percentage, -10);
        expect(mod.description, 'Requires HT/Average Skill Roll');
      });

      test('Hard DX, IQ, or HT', () {
        var mod = Modifier.copyWith(r, detail: 'DX/Hard Skill');
        expect(mod.percentage, -10);
        expect(mod.description, 'Requires DX/Hard Skill Roll');

        mod = Modifier.copyWith(r, detail: 'IQ/Hard Skill');
        expect(mod.percentage, -10);
        expect(mod.description, 'Requires IQ/Hard Skill Roll');

        mod = Modifier.copyWith(r, detail: 'HT/Hard Skill');
        expect(mod.percentage, -10);
        expect(mod.description, 'Requires HT/Hard Skill Roll');
      });

      test('Very Hard DX, IQ, or HT', () {
        var mod = Modifier.copyWith(r, detail: 'DX/Very Hard Skill');
        expect(mod.percentage, -10);
        expect(mod.description, 'Requires DX/Very Hard Skill Roll');

        mod = Modifier.copyWith(r, detail: 'IQ/Very Hard Skill');
        expect(mod.percentage, -10);
        expect(mod.description, 'Requires IQ/Very Hard Skill Roll');

        mod = Modifier.copyWith(r, detail: 'HT/Very Hard Skill');
        expect(mod.percentage, -10);
        expect(mod.description, 'Requires HT/Very Hard Skill Roll');
      });

      test('Easy Per or Will', () {
        var mod = Modifier.copyWith(r, detail: 'Per/Easy Skill');
        expect(mod.percentage, 0);
        expect(mod.description, 'Requires Per/Easy Skill Roll');

        mod = Modifier.copyWith(r, detail: 'Will/Easy Skill');
        expect(mod.percentage, 0);
        expect(mod.description, 'Requires Will/Easy Skill Roll');
      });

      test('Average Per or Will', () {
        var mod = Modifier.copyWith(r, detail: 'Per/Average Skill');
        expect(mod.percentage, -5);
        expect(mod.description, 'Requires Per/Average Skill Roll');

        mod = Modifier.copyWith(r, detail: 'Will/Average Skill');
        expect(mod.percentage, -5);
        expect(mod.description, 'Requires Will/Average Skill Roll');
      });

      test('Hard Per or Will', () {
        var mod = Modifier.copyWith(r, detail: 'Per/Hard Skill');
        expect(mod.percentage, -5);
        expect(mod.description, 'Requires Per/Hard Skill Roll');

        mod = Modifier.copyWith(r, detail: 'Will/Hard Skill');
        expect(mod.percentage, -5);
        expect(mod.description, 'Requires Will/Hard Skill Roll');
      });

      test('Very Hard Per or Will', () {
        var mod = Modifier.copyWith(r, detail: 'Per/Very Hard Skill');
        expect(mod.percentage, -5);
        expect(mod.description, 'Requires Per/Very Hard Skill Roll');

        mod = Modifier.copyWith(r, detail: 'Will/Very Hard Skill');
        expect(mod.percentage, -5);
        expect(mod.description, 'Requires Will/Very Hard Skill Roll');
      });
    });
  });

  group('Simple limitations', () {
    test('Aspected', () {
      var mod = Modifiers.instance().byName('Aspected');
      expect(mod.percentage, -20);
      expect(mod.description, 'Aspected');
      expect(mod.isAttackModifier, false);

      var m = Modifier.copyWith(mod, detail: 'Faith');
      expect(m.description, 'Aspected, Faith');
    });

    test('Blockable', () {
      var mod = Modifiers.instance().byName('Blockable');
      expect(mod.percentage, -5);
      expect(mod.isAttackModifier, false);
      expect(mod.description, 'Blockable');
    });

    test('Blood Agent, Reversed', () {
      var mod = Modifiers.instance().byName('Blood Agent, Reversed');
      expect(mod.percentage, -40);
      expect(mod.isAttackModifier, false);
      expect(mod.description, 'Blood Agent, Reversed');
    });

    test('Can Be Blocked or Parried', () {
      var mod = Modifiers.instance().byName('Can Be Blocked or Parried');
      expect(mod.percentage, -10);
      expect(mod.description, 'Can Be Blocked or Parried');
      expect(mod.isAttackModifier, false);
    });

    test('Can Be Parried', () {
      var mod = Modifiers.instance().byName('Can Be Parried');
      expect(mod.percentage, -5);
      expect(mod.description, 'Can Be Parried');
      expect(mod.isAttackModifier, false);
    });

    //TODO: You may only take this limitation in conjunction with Area Effect or Cone.
    test('Dissipation', () {
      var mod = Modifiers.instance().byName('Dissipation');
      expect(mod.percentage, -50);
      expect(mod.isAttackModifier, true);
      expect(mod.description, 'Dissipation');
    });

    //TODO: You may only take this limitation in conjunction with Area Effect.
    test('Emanation', () {
      var mod = Modifiers.instance().byName('Emanation');
      expect(mod.percentage, -20);
      expect(mod.isAttackModifier, true);
      expect(mod.description, 'Emanation');
    });

    test('Emergencies Only', () {
      var mod = Modifiers.instance().byName('Emergencies Only');
      expect(mod.percentage, -30);
      expect(mod.isAttackModifier, false);
      expect(mod.description, 'Emergencies Only');
    });

    test('Fickle', () {
      var mod = Modifiers.instance().byName('Fickle');
      expect(mod.percentage, -20);
      expect(mod.isAttackModifier, false);
      expect(mod.description, 'Fickle');
    });

    test('Full Power in Emergencies Only', () {
      var mod = Modifiers.instance().byName('Full Power in Emergencies Only');
      expect(mod.percentage, -20);
      expect(mod.isAttackModifier, false);
      expect(mod.description, 'Full Power in Emergencies Only');
    });

    test('Granted by (Other)', () {
      var mod = Modifiers.instance().byName('Granted by (Other)');
      expect(mod.percentage, -40);
      expect(mod.isAttackModifier, false);
      expect(mod.description, 'Granted by (Other)');

      var m = Modifier.copyWith(mod, detail: 'Ancestor');
      expect(m.description, 'Granted by Ancestor');
    });

    test('Informal', () {
      var mod = Modifiers.instance().byName('Informal');
      expect(mod.percentage, -50);
      expect(mod.isAttackModifier, false);
      expect(mod.description, 'Informal');
    });

    test('Insubstantial Only', () {
      var mod = Modifiers.instance().byName('Insubstantial Only');
      expect(mod.percentage, -30);
      expect(mod.isAttackModifier, false);
      expect(mod.description, 'Insubstantial Only');
    });

    test('Magnetic', () {
      var mod = Modifiers.instance().byName('Magnetic');
      expect(mod.percentage, -50);
      expect(mod.isAttackModifier, false);
      expect(mod.description, 'Magnetic');
    });

    test('Mana-Sensitive', () {
      var mod = Modifiers.instance().byName('Mana-Sensitive');
      expect(mod.percentage, -10);
      expect(mod.isAttackModifier, false);
      expect(mod.description, 'Mana-Sensitive');
    });

    test('No Blunt Trauma', () {
      var mod = Modifiers.instance().byName('No Blunt Trauma');
      expect(mod.percentage, -20);
      expect(mod.isAttackModifier, true);
      expect(mod.description, 'No Blunt Trauma');
    });

    test('No DR Reduction', () {
      var mod = Modifiers.instance().byName('No DR Reduction');
      expect(mod.percentage, -20);
      expect(mod.isAttackModifier, true);
      expect(mod.description, 'No DR Reduction');
    });

    test('No Incendiary Effect', () {
      var mod = Modifiers.instance().byName('No Incendiary Effect');
      expect(mod.percentage, -10);
      expect(mod.isAttackModifier, true);
      expect(mod.description, 'No Incendiary Effect');
    });

    test('No Knockback', () {
      var mod = Modifiers.instance().byName('No Knockback');
      expect(mod.percentage, -10);
      expect(mod.isAttackModifier, true);
      expect(mod.description, 'No Knockback');
    });

    test('No Wounding', () {
      var mod = Modifiers.instance().byName('No Wounding');
      expect(mod.percentage, -10);
      expect(mod.isAttackModifier, true);
      expect(mod.description, 'No Wounding');
    });

    test('Only When Berserk', () {
      var mod = Modifiers.instance().byName('Only When Berserk');
      expect(mod.percentage, -20);
      expect(mod.isAttackModifier, false);
      expect(mod.description, 'Only When Berserk');
    });

    // TODO: You can’t combine this with All-Out, All-Out Concentrate, or Requires Ready.
    test('Requires Concentrate', () {
      var mod = Modifiers.instance().byName('Requires Concentrate');
      expect(mod.percentage, -15);
      expect(mod.isAttackModifier, false);
      expect(mod.description, 'Requires Concentrate');
    });

    test('Requires Ready', () {
      var mod = Modifiers.instance().byName('Requires Ready');
      expect(mod.percentage, -10);
      expect(mod.isAttackModifier, false);
      expect(mod.description, 'Requires Ready');
    });

    test('Requires Reaction Roll', () {
      var mod = Modifiers.instance().byName('Requires Reaction Roll');
      expect(mod.percentage, -5);
      expect(mod.isAttackModifier, false);
      expect(mod.description, 'Requires Reaction Roll');
    });

    test('Skill Enhancement Only', () {
      var mod = Modifiers.instance().byName('Skill Enhancement Only');
      expect(mod.percentage, -60);
      expect(mod.isAttackModifier, false);
      expect(mod.description, 'Skill Enhancement Only');
    });

    test('Substantial Only', () {
      var mod = Modifiers.instance().byName('Substantial Only');
      expect(mod.percentage, -10);
      expect(mod.isAttackModifier, false);
      expect(mod.description, 'Substantial Only');
    });

    // TODO: You can only take this limitation in conjunction with Uncontrollable.
    test('Unconscious Only', () {
      var mod = Modifiers.instance().byName('Unconscious Only');
      expect(mod.percentage, -20);
      expect(mod.isAttackModifier, false);
      expect(mod.description, 'Unconscious Only');
    });

    test('Unique', () {
      var mod = Modifiers.instance().byName('Unique');
      expect(mod.percentage, -25);
      expect(mod.isAttackModifier, false);
      expect(mod.description, 'Unique');
    });

    test('Unsupported', () {
      var mod = Modifiers.instance().byName('Unsupported');
      expect(mod.percentage, -25);
      expect(mod.isAttackModifier, false);
      expect(mod.description, 'Unsupported');
    });

    test('Untrainable', () {
      var mod = Modifiers.instance().byName('Untrainable');
      expect(mod.percentage, -40);
      expect(mod.isAttackModifier, false);
      expect(mod.description, 'Untrainable');
    });
  }, skip: false);

  //TODO: This is the catch-all limitation. Must provide someway to enter
  // limitation information (and potentially save it).
  group('Accessibility', () {
    var acc;
    setUp(() {
      acc = Modifiers.instance().byName('Accessibility');
    });

    test('default', () {
      expect(() => acc.percentage, throwsA(isA<StateError>()));
    });

    _verify(String detail, int percent) {
      var mod = Modifier.copyWith(acc, detail: detail);
      expect(mod.percentage, percent,
          reason:
              'Accessibility, $detail: expected $percent; was ${mod.percentage}');
      expect(mod.description, 'Accessibility, $detail',
          reason:
              "Accessibility, $detail: expected 'Accessibility, $detail'; was '${mod.description}'");
    }

    test('variations', () {
      var data = {
        'Requires gestures': -10,
        'Requires magic words': -10,
        'Requires material component': -10,
        'Requires extremely rare material component': -15,
        'Requires simple ritual': -5,
        'Requires typical ritual': -10,
        'Requires complex ritual': -20,
        'Requires (item)': -10,
        'Only on those who share a language with me': -10,
        'Only while moving 1 step/turn': -10,
        'Only while moving (half Move)': -20,
        'While conscious': -5,
        'Only while moving (full Move)': -30,
        'Only at day': -20,
        'Only at night': -20,
        'Only by one side of split personality': -40,
        'Only in altered body form': -10,
        'Only in direct sunlight': -30,
        'Only during full moon': -40,
        'Only during new moon': -40,
        'Only while flying': -30,
        'Only while in hypnotic trance': -30,
        'Only while playing musical instrument': -20,
        'Only while swimming': -30,
        'Useless under stress': -60,
      };
      data.forEach((key, value) => _verify(key, value));
    });
  }, skip: false);

  group('Leveled limitations', () {
    test('Cardiac Stress', () {
      var mod = ModifierTemplates.instance().templateByName('Cardiac Stress')
          as BaseLeveledTemplate;
      expect(mod.percentage(Data(level: 1)), -50);
      expect(mod.isAttackModifier, false);
      expect(mod.percentage(Data(level: 5)), -10);
    });

    test('Cerebral Stress', () {
      var mod = ModifierTemplates.instance().templateByName('Cerebral Stress')
          as BaseLeveledTemplate;
      expect(mod.percentage(Data(level: 1)), -50);
      expect(mod.isAttackModifier, false);
      expect(mod.percentage(Data(level: 5)), -10);
    });

    test('Costs Fatigue', () {
      var mod = ModifierTemplates.instance().templateByName('Costs Fatigue')
          as BaseLeveledTemplate;
      expect(mod.isAttackModifier, false);
      expect(mod.percentage(Data(level: 1)), -5);
      expect(mod.percentage(Data(level: 4)), -20);
    });

    test('Costs Fatigue, Per second', () {
      var mod = ModifierTemplates.instance()
          .templateByName('Costs Fatigue, Per second') as BaseLeveledTemplate;
      expect(mod.isAttackModifier, false);
      expect(mod.percentage(Data(level: 1)), -10);
      expect(mod.percentage(Data(level: 4)), -40);
    });

    test('Costs Hit Points', () {
      var mod = ModifierTemplates.instance().templateByName('Costs Hit Points')
          as BaseLeveledTemplate;
      expect(mod.isAttackModifier, false);
      expect(mod.percentage(Data(level: 1)), -10);
      expect(mod.percentage(Data(level: 4)), -40);
    });

    test('Costs Hit Points, Per second', () {
      var mod = ModifierTemplates.instance()
              .templateByName('Costs Hit Points, Per second')
          as BaseLeveledTemplate;
      expect(mod.isAttackModifier, false);
      expect(mod.percentage(Data(level: 1)), -20);
      expect(mod.percentage(Data(level: 4)), -80);
    });

    test('Costs Hit Points, Instead of Fatigue', () {
      var mod = ModifierTemplates.instance()
              .templateByName('Costs Hit Points, Instead of Fatigue')
          as BaseLeveledTemplate;
      expect(mod.isAttackModifier, false);
      expect(mod.percentage(Data(level: 1)), -5);
      expect(mod.percentage(Data(level: 4)), -20);
    });

    test('Costs Hit Points, Per second instead of Fatigue', () {
      var mod = ModifierTemplates.instance()
              .templateByName('Costs Hit Points, Per second instead of Fatigue')
          as BaseLeveledTemplate;
      expect(mod.isAttackModifier, false);
      expect(mod.percentage(Data(level: 1)), -10);
      expect(mod.percentage(Data(level: 4)), -40);
    });

    test('Easily Resisted', () {
      var mod = ModifierTemplates.instance().templateByName('Easily Resisted')
          as BaseLeveledTemplate;
      expect(mod.isAttackModifier, false);
      expect(mod.percentage(Data(level: 1)), -5);
      expect(mod.percentage(Data(level: 6)), -30);
    });

    test('Extra Recoil', () {
      var mod = ModifierTemplates.instance().templateByName('Extra Recoil')
          as BaseLeveledTemplate;
      expect(mod.isAttackModifier, true);
      expect(mod.percentage(Data(level: 1)), -10);
      expect(mod.percentage(Data(level: 4)), -40);
    });

    test('Glamour', () {
      var mod = ModifierTemplates.instance().templateByName('Glamour')
          as BaseLeveledTemplate;
      expect(mod.isAttackModifier, false);
      expect(mod.percentage(Data(level: 1)), -5);
      expect(mod.percentage(Data(level: 10)), -50);
    });

    test('Hard to Use', () {
      var mod = ModifierTemplates.instance().templateByName('Hard to Use')
          as BaseLeveledTemplate;
      expect(mod.isAttackModifier, false);
      expect(mod.percentage(Data(level: 1)), -5);
      expect(mod.percentage(Data(level: 4)), -20);
    });

    test('Immediate Preparation Required', () {
      var mod = ModifierTemplates.instance()
              .templateByName('Immediate Preparation Required')
          as BaseLeveledTemplate;
      expect(mod.isAttackModifier, false);
      expect(mod.percentage(Data(level: 1)), -30);
      expect(mod.percentage(Data(level: 2)), -45);
      expect(mod.percentage(Data(level: 3)), -75);
      expect(mod.percentage(Data(level: 4)), -90);
    });

    test('Increased Immunity', () {
      var mod = ModifierTemplates.instance()
          .templateByName('Increased Immunity') as BaseLeveledTemplate;
      expect(mod.isAttackModifier, false);
      expect(mod.percentage(Data(level: 1)), -10);
      expect(mod.percentage(Data(level: 4)), -40);
    });

    test('Inaccurate', () {
      var mod = ModifierTemplates.instance().templateByName('Inaccurate')
          as BaseLeveledTemplate;
      expect(mod.isAttackModifier, true);
      expect(mod.percentage(Data(level: 1)), -5);
      expect(mod.percentage(Data(level: 4)), -20);
    });

    test('Limited Use', () {
      var mod = ModifierTemplates.instance().templateByName('Limited Use')
          as BaseLeveledTemplate;
      expect(mod.isAttackModifier, false);
      expect(mod.percentage(Data(level: 1)), -10);
      expect(mod.percentage(Data(level: 4)), -40);
    });

    test('Limited Use, Fast Reload', () {
      var mod = ModifierTemplates.instance()
          .templateByName('Limited Use, Fast Reload') as BaseLeveledTemplate;
      expect(mod.isAttackModifier, false);
      expect(mod.percentage(Data(level: 1)), -5);
      expect(mod.percentage(Data(level: 4)), -20);
    });

    test('Limited Use, Slow Reload', () {
      var mod = ModifierTemplates.instance()
          .templateByName('Limited Use, Slow Reload') as BaseLeveledTemplate;
      expect(mod.isAttackModifier, false);
      expect(mod.percentage(Data(level: 1)), -5);
      expect(mod.percentage(Data(level: 4)), -35);
    });

    test('Maximum Duration', () {
      var mod = ModifierTemplates.instance().templateByName('Maximum Duration')
          as BaseLeveledTemplate;
      expect(mod.isAttackModifier, false);
      expect(mod.percentage(Data(level: 1)), -5);
      expect(mod.percentage(Data(level: 2)), -10);
      expect(mod.percentage(Data(level: 3)), -25);
      expect(mod.percentage(Data(level: 4)), -50);
      expect(mod.percentage(Data(level: 5)), -65);
      expect(mod.percentage(Data(level: 6)), -75);
    });

    //TODO: On an advantage that allows Always On, this limitation is worth at
    // most -5% less than Always On; e.g., if Always On is -20%, Minimum
    // Duration can’t go beyond -15%.
    test('Minimum Duration', () {
      var mod = ModifierTemplates.instance().templateByName('Minimum Duration')
          as BaseLeveledTemplate;
      expect(mod.isAttackModifier, false);
      expect(mod.percentage(Data(level: 1)), -5);
      expect(mod.percentage(Data(level: 2)), -10);
      expect(mod.percentage(Data(level: 6)), -30);
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
              .templateByName('Nuisance Effect, Reaction penalty')
          as BaseLeveledTemplate;
      expect(mod.isAttackModifier, false);
      expect(mod.percentage(Data(level: 1)), -5);
      expect(mod.percentage(Data(level: 4)), -20);
    });

    test('Onset', () {
      var mod = ModifierTemplates.instance().templateByName('Onset')
          as BaseLeveledTemplate;
      expect(mod.isAttackModifier, true);
      expect(mod.percentage(Data(level: 1)), -10);
      expect(mod.percentage(Data(level: 4)), -40);
    });

    test('Exposure Time', () {
      var mod = ModifierTemplates.instance().templateByName('Exposure Time')
          as BaseLeveledTemplate;
      expect(mod.isAttackModifier, true);
      expect(mod.percentage(Data(level: 1)), -30);
      expect(mod.percentage(Data(level: 4)), -60);
    });

    test('Periodic Recharge', () {
      var mod = ModifierTemplates.instance().templateByName('Periodic Recharge')
          as BaseLeveledTemplate;
      expect(mod.isAttackModifier, false);
      expect(mod.percentage(Data(level: 1)), -5);
      expect(mod.percentage(Data(level: 2)), -10);
      expect(mod.percentage(Data(level: 3)), -20);
      expect(mod.percentage(Data(level: 4)), -40);
      expect(mod.percentage(Data(level: 5)), -80);
    });

    test('Preparation Required', () {
      var mod = ModifierTemplates.instance()
          .templateByName('Preparation Required') as BaseLeveledTemplate;
      expect(mod.isAttackModifier, false);
      expect(mod.percentage(Data(level: 1)), -20);
      expect(mod.percentage(Data(level: 2)), -30);
      expect(mod.percentage(Data(level: 3)), -50);
      expect(mod.percentage(Data(level: 4)), -60);
    });

    test('Weakened Without Preparation', () {
      var mod = ModifierTemplates.instance()
              .templateByName('Weakened Without Preparation')
          as BaseLeveledTemplate;
      expect(mod.isAttackModifier, false);
      expect(mod.percentage(Data(level: 1)), -10);
      expect(mod.percentage(Data(level: 2)), -15);
      expect(mod.percentage(Data(level: 3)), -25);
      expect(mod.percentage(Data(level: 4)), -30);
    });

    test('Reduced Duration', () {
      var mod = ModifierTemplates.instance().templateByName('Reduced Duration')
          as BaseLeveledTemplate;
      expect(mod.isAttackModifier, false);
      expect(mod.percentage(Data(level: 1)), -5);
      expect(mod.percentage(Data(level: 4)), -20);
      expect(mod.percentage(Data(level: 7)), -35);
    });

    test('Requires Low Gravity', () {
      var mod = ModifierTemplates.instance()
          .templateByName('Requires Low Gravity') as BaseLeveledTemplate;
      expect(mod.isAttackModifier, false);
      expect(mod.percentage(Data(level: 1)), -5);
      expect(mod.percentage(Data(level: 4)), -20);
      expect(mod.percentage(Data(level: 10)), -50);
    });

    //TODO: This limitation is only available for Innate Attacks that inflict
    // fatigue or toxic damage. You must combine it with one of Blood Agent,
    // Contact Agent, Follow-Up, Respiratory Agent, or Sense-Based.
    test('Resistible', () {
      var mod = ModifierTemplates.instance().templateByName('Resistible')
          as BaseLeveledTemplate;
      expect(mod.isAttackModifier, true);
      expect(mod.percentage(Data(level: 1)), -5);
      expect(mod.percentage(Data(level: 4)), -20);
      expect(mod.percentage(Data(level: 10)), -50);
    });

    test('Short-Range', () {
      var mod = ModifierTemplates.instance().templateByName('Short-Range')
          as BaseLeveledTemplate;
      expect(mod.isAttackModifier, false);
      expect(mod.percentage(Data(level: 1)), -10);
      expect(mod.percentage(Data(level: 3)), -30);
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
