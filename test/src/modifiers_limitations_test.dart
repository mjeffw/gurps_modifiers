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

    group('Cardiac Stress', () {
      var c;
      setUp(() {
        c = Modifiers.instance().byName('Cardiac Stress');
      });

      test('default', () {
        expect(c.isAttackModifier, false);
        expect(c.percentage, -30);
        expect(c.description, 'Cardiac Stress, Every minute');
      });

      test('Every minute', () {
        var mod = Modifier.copyWith(c, detail: 'Every minute');
        expect(mod.percentage, -30);
        expect(mod.description, 'Cardiac Stress, Every minute');
      });

      test('Every 10 seconds', () {
        var mod = Modifier.copyWith(c, detail: 'Every 10 seconds');
        expect(mod.percentage, -40);
        expect(mod.description, 'Cardiac Stress, Every 10 seconds');
      });

      test('Every second', () {
        var mod = Modifier.copyWith(c, detail: 'Every second');
        expect(mod.percentage, -50);
        expect(mod.description, 'Cardiac Stress, Every second');
      });

      test('Every 10 minutes', () {
        var mod = Modifier.copyWith(c, detail: 'Every 10 minutes');
        expect(mod.percentage, -20);
        expect(mod.description, 'Cardiac Stress, Every 10 minutes');
      });

      test('Every hour', () {
        var mod = Modifier.copyWith(c, detail: 'Every hour');
        expect(mod.percentage, -10);
        expect(mod.description, 'Cardiac Stress, Every hour');
      });
    });

    group('Cerebral Stress', () {
      var c;
      setUp(() {
        c = Modifiers.instance().byName('Cerebral Stress');
      });

      test('default', () {
        expect(c.isAttackModifier, false);
        expect(c.percentage, -30);
        expect(c.description, 'Cerebral Stress, Every minute');
      });

      test('Every minute', () {
        var mod = Modifier.copyWith(c, detail: 'Every minute');
        expect(mod.percentage, -30);
        expect(mod.description, 'Cerebral Stress, Every minute');
      });

      test('Every 10 seconds', () {
        var mod = Modifier.copyWith(c, detail: 'Every 10 seconds');
        expect(mod.percentage, -40);
        expect(mod.description, 'Cerebral Stress, Every 10 seconds');
      });

      test('Every second', () {
        var mod = Modifier.copyWith(c, detail: 'Every second');
        expect(mod.percentage, -50);
        expect(mod.description, 'Cerebral Stress, Every second');
      });

      test('Every 10 minutes', () {
        var mod = Modifier.copyWith(c, detail: 'Every 10 minutes');
        expect(mod.percentage, -20);
        expect(mod.description, 'Cerebral Stress, Every 10 minutes');
      });

      test('Every hour', () {
        var mod = Modifier.copyWith(c, detail: 'Every hour');
        expect(mod.percentage, -10);
        expect(mod.description, 'Cerebral Stress, Every hour');
      });
    });

    group('Exposure Time', () {
      var on;
      setUp(() {
        on = Modifiers.instance().byName('Exposure Time');
      });

      test('Default', () {
        expect(on, isNotNull);
        expect(on.description, 'Exposure Time, 1 minute');
        expect(on.isAttackModifier, true);
        expect(on.percentage, -30);
      });

      test('1 minute', () {
        var mod = Modifier.copyWith(on, detail: '1 minute');
        expect(mod.description, 'Exposure Time, 1 minute');
        expect(mod.percentage, -30);
      });

      test('1 hour', () {
        var mod = Modifier.copyWith(on, detail: '1 hour');
        expect(mod.description, 'Exposure Time, 1 hour');
        expect(mod.percentage, -40);
      });

      test('1 week', () {
        var mod = Modifier.copyWith(on, detail: '1 week');
        expect(mod.description, 'Exposure Time, 1 week');
        expect(mod.percentage, -60);
      });

      test('1 day', () {
        var mod = Modifier.copyWith(on, detail: '1 day');
        expect(mod.description, 'Exposure Time, 1 day');
        expect(mod.percentage, -50);
      });
    });

    group('Immediate Preparation Required', () {
      var prep;
      setUp(() {
        prep = Modifiers.instance().byName('Immediate Preparation Required');
      });

      test('default', () {
        expect(prep.isAttackModifier, false);
        expect(prep.description, 'Immediate Preparation Required, 1 minute');
        expect(prep.percentage, -30);
      });

      test('1 minute', () {
        var mod = Modifier.copyWith(prep, detail: '1 minute');
        expect(mod.description, 'Immediate Preparation Required, 1 minute');
        expect(mod.percentage, -30);
      });

      test('10 minutes', () {
        var mod = Modifier.copyWith(prep, detail: '10 minutes');
        expect(mod.description, 'Immediate Preparation Required, 10 minutes');
        expect(mod.percentage, -45);
      });

      test('1 hour', () {
        var mod = Modifier.copyWith(prep, detail: '1 hour');
        expect(mod.description, 'Immediate Preparation Required, 1 hour');
        expect(mod.percentage, -75);
      });

      test('8 hours', () {
        var mod = Modifier.copyWith(prep, detail: '8 hours');
        expect(mod.description, 'Immediate Preparation Required, 8 hours');
        expect(mod.percentage, -90);
      });
    });

    group('Limited Use', () {
      var use;
      setUp(() {
        use = Modifiers.instance().byName('Limited Use');
      });

      test('default', () {
        expect(use.isAttackModifier, false);
        expect(use.percentage, -40);
        expect(use.description, 'Limited Use, 1/day');
      });
      test('1/day', () {
        var mod = Modifier.copyWith(use, detail: '1/day');
        expect(mod.isAttackModifier, false);
        expect(mod.percentage, -40);
        expect(mod.description, 'Limited Use, 1/day');
      });
      test('2/day', () {
        var mod = Modifier.copyWith(use, detail: '2/day');
        expect(mod.percentage, -30);
        expect(mod.description, 'Limited Use, 2/day');
      });
      test('3-4/day', () {
        var mod = Modifier.copyWith(use, detail: '3-4/day');
        expect(mod.percentage, -20);
        expect(mod.description, 'Limited Use, 3-4/day');
      });
      test('5-10/day', () {
        var mod = Modifier.copyWith(use, detail: '5-10/day');
        expect(mod.percentage, -10);
        expect(mod.description, 'Limited Use, 5-10/day');
      });
    });

    group('Limited Use, Fast Reload', () {
      var use;
      setUp(() {
        use = Modifiers.instance().byName('Limited Use, Fast Reload');
      });

      test('default', () {
        expect(use.isAttackModifier, false);
        expect(use.percentage, -20);
        expect(use.description, 'Limited Use, 1/day, Fast Reload');
      });
      test('1/day', () {
        var mod = Modifier.copyWith(use, detail: '1/day');
        expect(mod.isAttackModifier, false);
        expect(mod.percentage, -20);
        expect(mod.description, 'Limited Use, 1/day, Fast Reload');
      });
      test('2/day', () {
        var mod = Modifier.copyWith(use, detail: '2/day');
        expect(mod.percentage, -15);
        expect(mod.description, 'Limited Use, 2/day, Fast Reload');
      });
      test('3-4/day', () {
        var mod = Modifier.copyWith(use, detail: '3-4/day');
        expect(mod.percentage, -10);
        expect(mod.description, 'Limited Use, 3-4/day, Fast Reload');
      });
      test('5-10/day', () {
        var mod = Modifier.copyWith(use, detail: '5-10/day');
        expect(mod.percentage, -5);
        expect(mod.description, 'Limited Use, 5-10/day, Fast Reload');
      });
    });

    group('Limited Use, Slow Reload', () {
      var use;
      setUp(() {
        use = Modifiers.instance().byName('Limited Use, Slow Reload');
      });

      test('default', () {
        expect(use.isAttackModifier, false);
        expect(use.percentage, -35);
        expect(use.description, 'Limited Use, 1/day, Slow Reload');
      });
      test('1/day', () {
        var mod = Modifier.copyWith(use, detail: '1/day');
        expect(mod.isAttackModifier, false);
        expect(mod.percentage, -35);
        expect(mod.description, 'Limited Use, 1/day, Slow Reload');
      });
      test('2/day', () {
        var mod = Modifier.copyWith(use, detail: '2/day');
        expect(mod.percentage, -25);
        expect(mod.description, 'Limited Use, 2/day, Slow Reload');
      });
      test('3-4/day', () {
        var mod = Modifier.copyWith(use, detail: '3-4/day');
        expect(mod.percentage, -15);
        expect(mod.description, 'Limited Use, 3-4/day, Slow Reload');
      });
      test('5-10/day', () {
        var mod = Modifier.copyWith(use, detail: '5-10/day');
        expect(mod.percentage, -5);
        expect(mod.description, 'Limited Use, 5-10/day, Slow Reload');
      });
    });

    group('Maximum Duration', () {
      var max;
      setUp(() {
        max = Modifiers.instance().byName('Maximum Duration');
      });

      test('default', () {
        expect(max.isAttackModifier, false);
        expect(max.percentage, -50);
        expect(max.description, 'Maximum Duration, 10 minutes');
      });

      test('12 hours', () {
        var mod = Modifier.copyWith(max, detail: '12 hours');
        expect(mod.percentage, -5);
        expect(mod.description, 'Maximum Duration, 12 hours');
      });

      test('1 hour', () {
        var mod = Modifier.copyWith(max, detail: '1 hour');
        expect(mod.percentage, -10);
        expect(mod.description, 'Maximum Duration, 1 hour');
      });

      test('30 minutes', () {
        var mod = Modifier.copyWith(max, detail: '30 minutes');
        expect(mod.percentage, -25);
        expect(mod.description, 'Maximum Duration, 30 minutes');
      });

      test('10 minutes', () {
        var mod = Modifier.copyWith(max, detail: '10 minutes');
        expect(mod.percentage, -50);
        expect(mod.description, 'Maximum Duration, 10 minutes');
      });

      test('1 minute', () {
        var mod = Modifier.copyWith(max, detail: '1 minute');
        expect(mod.percentage, -65);
        expect(mod.description, 'Maximum Duration, 1 minute');
      });

      test('10 seconds', () {
        var mod = Modifier.copyWith(max, detail: '10 seconds');
        expect(mod.percentage, -75);
        expect(mod.description, 'Maximum Duration, 10 seconds');
      });
    });

    group('Minimum Duration', () {
      //TODO: On an advantage that allows Always On, this limitation is worth at
      // most -5% less than Always On; e.g., if Always On is -20%, Minimum
      // Duration can’t go beyond -15%.
      var dur;
      setUp(() {
        dur = Modifiers.instance().byName('Minimum Duration');
      });

      test('default', () {
        expect(dur, isNotNull);
        expect(dur.isAttackModifier, false);
        expect(dur.percentage, -5);
        expect(dur.description, 'Minimum Duration, 8 hours');
      });

      test('8 hours', () {
        var mod = Modifier.copyWith(dur, detail: '8 hours');
        expect(mod.percentage, -5);
        expect(mod.description, 'Minimum Duration, 8 hours');
      });

      test('12 hours', () {
        var mod = Modifier.copyWith(dur, detail: '12 hours');
        expect(mod.percentage, -10);
        expect(mod.description, 'Minimum Duration, 12 hours');
      });

      test('24 hours', () {
        var mod = Modifier.copyWith(dur, detail: '24 hours');
        expect(mod.percentage, -15);
        expect(mod.description, 'Minimum Duration, 24 hours');
      });

      test('1 week', () {
        var mod = Modifier.copyWith(dur, detail: '1 week');
        expect(mod.percentage, -20);
        expect(mod.description, 'Minimum Duration, 1 week');
      });

      test('1 month', () {
        var mod = Modifier.copyWith(dur, detail: '1 month');
        expect(mod.percentage, -25);
        expect(mod.description, 'Minimum Duration, 1 month');
      });

      test('More than a month', () {
        var mod = Modifier.copyWith(dur, detail: 'More than a month');
        expect(mod.percentage, -30);
        expect(mod.description, 'Minimum Duration, More than a month');
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

    group('Nuisance Effect', () {
      var eff;
      setUp(() {
        eff = Modifiers.instance().byName('Nuisance Effect');
      });

      test('Default', () {
        expect(eff.percentage, -5);
        expect(eff.description, 'Nuisance Effect, Obvious');
        expect(eff.isAttackModifier, false);
      });

      test('Obvious', () {
        var mod = Modifier.copyWith(eff, detail: 'Obvious');
        expect(mod.percentage, -5);
        expect(mod.isAttackModifier, false);
      });

      test('Inconvenience', () {
        var mod = Modifier.copyWith(eff, detail: 'Inconvenience');
        expect(mod.percentage, -5);
        expect(mod.isAttackModifier, false);
      });

      test('-1 Reaction', () {
        var mod =
            Modifier.copyWith(eff, detail: '-1 Reaction from those nearby');
        expect(mod.percentage, -5);
        expect(mod.isAttackModifier, false);
      });

      test('-2 Reaction', () {
        var mod =
            Modifier.copyWith(eff, detail: '-2 Reaction from those nearby');
        expect(mod.percentage, -10);
        expect(mod.isAttackModifier, false);
      });

      test('-3 Reaction', () {
        var mod =
            Modifier.copyWith(eff, detail: '-3 Reaction from those nearby');
        expect(mod.percentage, -15);
        expect(mod.isAttackModifier, false);
      });

      test('-4 Reaction', () {
        var mod =
            Modifier.copyWith(eff, detail: '-4 Reaction from those nearby');
        expect(mod.percentage, -20);
        expect(mod.isAttackModifier, false);
      });
    });

    group('Onset', () {
      var on;
      setUp(() {
        on = Modifiers.instance().byName('Onset');
      });

      test('Default', () {
        expect(on, isNotNull);
        expect(on.description, 'Onset, 1 minute');
        expect(on.isAttackModifier, true);
        expect(on.percentage, -10);
      });

      test('1 minute', () {
        var mod = Modifier.copyWith(on, detail: '1 minute');
        expect(mod.description, 'Onset, 1 minute');
        expect(mod.percentage, -10);
      });

      test('1 day', () {
        var mod = Modifier.copyWith(on, detail: '1 hour');
        expect(mod.description, 'Onset, 1 hour');
        expect(mod.percentage, -20);
      });

      test('1 week', () {
        var mod = Modifier.copyWith(on, detail: '1 week');
        expect(mod.description, 'Onset, 1 week');
        expect(mod.percentage, -40);
      });

      test('1 day', () {
        var mod = Modifier.copyWith(on, detail: '1 day');
        expect(mod.description, 'Onset, 1 day');
        expect(mod.percentage, -30);
      });
    });

    group('Periodic Recharge', () {
      var pr;
      setUp(() {
        pr = Modifiers.instance().byName('Periodic Recharge');
      });

      test('default', () {
        expect(pr.description, 'Periodic Recharge, 1 minute');
        expect(pr.isAttackModifier, false);
        expect(pr.percentage, -80);
      });

      test('1 minute', () {
        var mod = Modifier.copyWith(pr, detail: '1 minute');
        expect(mod.description, 'Periodic Recharge, 1 minute');
        expect(mod.percentage, -80);
      });

      test('10 minutes', () {
        var mod = Modifier.copyWith(pr, detail: '10 minutes');
        expect(mod.description, 'Periodic Recharge, 10 minutes');
        expect(mod.percentage, -40);
      });

      test('1 hour', () {
        var mod = Modifier.copyWith(pr, detail: '1 hour');
        expect(mod.description, 'Periodic Recharge, 1 hour');
        expect(mod.percentage, -20);
      });

      test('8 hours', () {
        var mod = Modifier.copyWith(pr, detail: '8 hours');
        expect(mod.description, 'Periodic Recharge, 8 hours');
        expect(mod.percentage, -10);
      });

      test('24 hours', () {
        var mod = Modifier.copyWith(pr, detail: '24 hours');
        expect(mod.description, 'Periodic Recharge, 24 hours');
        expect(mod.percentage, -5);
      });
    });

    group('Preparation Required', () {
      var pr;
      setUp(() {
        pr = Modifiers.instance().byName('Preparation Required');
      });

      test('default', () {
        expect(pr.description, 'Preparation Required, 1 minute');
        expect(pr.percentage, -20);
        expect(pr.isAttackModifier, false);
      });

      test('1 minute', () {
        var mod = Modifier.copyWith(pr, detail: '1 minute');
        expect(mod.description, 'Preparation Required, 1 minute');
        expect(mod.percentage, -20);
      });

      test('10 minutes', () {
        var mod = Modifier.copyWith(pr, detail: '10 minutes');
        expect(mod.description, 'Preparation Required, 10 minutes');
        expect(mod.percentage, -30);
      });

      test('1 hour', () {
        var mod = Modifier.copyWith(pr, detail: '1 hour');
        expect(mod.description, 'Preparation Required, 1 hour');
        expect(mod.percentage, -50);
      });

      test('8 hours', () {
        var mod = Modifier.copyWith(pr, detail: '8 hours');
        expect(mod.description, 'Preparation Required, 8 hours');
        expect(mod.percentage, -60);
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
        expect(r.description, 'Requires DX vs. <Other> Roll\u00b2');
      });

      test('DX', () {
        var mod = Modifier.copyWith(r, detail: 'DX');
        expect(mod.percentage, -10);
        expect(mod.description, 'Requires DX vs. <Other> Roll\u00b2');
      });

      test('HT', () {
        var mod = Modifier.copyWith(r, detail: 'HT');
        expect(mod.percentage, -10);
        expect(mod.description, 'Requires HT vs. <Other> Roll\u00b2');
      });

      test('IQ', () {
        var mod = Modifier.copyWith(r, detail: 'IQ');
        expect(mod.percentage, -10);
        expect(mod.description, 'Requires IQ vs. <Other> Roll\u00b2');
      });

      test('Per', () {
        var mod = Modifier.copyWith(r, detail: 'Per');
        expect(mod.percentage, -10);
        expect(mod.description, 'Requires Per vs. <Other> Roll\u00b2');
      });

      test('Will', () {
        var mod = Modifier.copyWith(r, detail: 'Will');
        expect(mod.percentage, -10);
        expect(mod.description, 'Requires Will vs. <Other> Roll\u00b2');
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

    group('Weakened without Preparation', () {
      var pr;
      setUp(() {
        pr = Modifiers.instance().byName('Weakened Without Preparation');
      });

      test('default', () {
        expect(pr.description, 'Weakened Without Preparation, 1 minute');
        expect(pr.percentage, -10);
        expect(pr.isAttackModifier, false);
      });

      test('1 minute', () {
        var mod = Modifier.copyWith(pr, detail: '1 minute');
        expect(mod.description, 'Weakened Without Preparation, 1 minute');
        expect(mod.percentage, -10);
      });

      test('10 minutes', () {
        var mod = Modifier.copyWith(pr, detail: '10 minutes');
        expect(mod.description, 'Weakened Without Preparation, 10 minutes');
        expect(mod.percentage, -15);
      });

      test('1 hour', () {
        var mod = Modifier.copyWith(pr, detail: '1 hour');
        expect(mod.description, 'Weakened Without Preparation, 1 hour');
        expect(mod.percentage, -25);
      });

      test('8 hours', () {
        var mod = Modifier.copyWith(pr, detail: '8 hours');
        expect(mod.description, 'Weakened Without Preparation, 8 hours');
        expect(mod.percentage, -30);
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

  //TODO: This is the catch-all limitation. Must provide someway to enter limitation information (and potentially save it).
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
    test('Costs Fatigue', () {
      var mod = Modifiers.instance().byName('Costs Fatigue');
      expect(mod.isAttackModifier, false);
      expect(mod.percentage, -5);
      expect(mod.description, 'Costs Fatigue, 1 FP');

      mod = Modifier.copyWith(mod, level: 4);
      expect(mod.percentage, -20);
      expect(mod.description, 'Costs Fatigue, 4 FP');
    });

    test('Costs Fatigue, Per second', () {
      var mod = Modifiers.instance().byName('Costs Fatigue, Per second');
      expect(mod.isAttackModifier, false);
      expect(mod.percentage, -10);
      expect(mod.description, 'Costs Fatigue, 1 FP per second');

      mod = Modifier.copyWith(mod, level: 4);
      expect(mod.percentage, -40);
      expect(mod.description, 'Costs Fatigue, 4 FP per second');
    });

    test('Costs Hit Points', () {
      var mod = Modifiers.instance().byName('Costs Hit Points');
      expect(mod.isAttackModifier, false);
      expect(mod.percentage, -10);
      expect(mod.description, 'Costs Hit Points, 1 HP');

      mod = Modifier.copyWith(mod, level: 4);
      expect(mod.percentage, -40);
      expect(mod.description, 'Costs Hit Points, 4 HP');
    });

    test('Costs Hit Points, Per second', () {
      var mod = Modifiers.instance().byName('Costs Hit Points, Per second');
      expect(mod.isAttackModifier, false);
      expect(mod.percentage, -20);
      expect(mod.description, 'Costs Hit Points, 1 HP per second');

      mod = Modifier.copyWith(mod, level: 4);
      expect(mod.percentage, -80);
      expect(mod.description, 'Costs Hit Points, 4 HP per second');
    });

    test('Costs Hit Points, Instead of Fatigue', () {
      var mod =
          Modifiers.instance().byName('Costs Hit Points Instead of Fatigue');
      expect(mod.isAttackModifier, false);
      expect(mod.percentage, -5);
      expect(mod.description, 'Costs Hit Points\u00b9, 1 HP');

      mod = Modifier.copyWith(mod, level: 4);
      expect(mod.percentage, -20);
      expect(mod.description, 'Costs Hit Points\u00b9, 4 HP');
    });

    test('Costs Hit Points, Per second instead of Fatigue', () {
      var mod = Modifiers.instance()
          .byName('Costs Hit Points Per Second Instead of Fatigue');
      expect(mod.isAttackModifier, false);
      expect(mod.percentage, -10);
      expect(mod.description, 'Costs Hit Points\u00b9, 1 HP per second');

      mod = Modifier.copyWith(mod, level: 4);
      expect(mod.percentage, -40);
      expect(mod.description, 'Costs Hit Points\u00b9, 4 HP per second');
    });

    test('Easily Resisted', () {
      var mod = Modifiers.instance().byName('Easily Resisted');
      expect(mod.isAttackModifier, false);
      expect(mod.percentage, -5);
      expect(mod.description, 'Easily Resisted 1');

      mod = Modifier.copyWith(mod, level: 6);
      expect(mod.percentage, -30);
      expect(mod.description, 'Easily Resisted 6');
    });

    test('Extra Recoil', () {
      var mod = Modifiers.instance().byName('Extra Recoil');
      expect(mod.isAttackModifier, true);
      expect(mod.percentage, -10);
      expect(mod.description, 'Extra Recoil, Rcl 2');

      mod = Modifier.copyWith(mod, level: 4);
      expect(mod.percentage, -40);
      expect(mod.description, 'Extra Recoil, Rcl 5');
    });

    test('Glamour', () {
      var mod = Modifiers.instance().byName('Glamour');
      expect(mod.isAttackModifier, false);
      expect(mod.percentage, -5);
      expect(mod.description, 'Glamour 1');

      mod = Modifier.copyWith(mod, level: 10);
      expect(mod.percentage, -50);
      expect(mod.description, 'Glamour 10');
    });

    test('Hard to Use', () {
      var mod = Modifiers.instance().byName('Hard to Use');
      expect(mod.isAttackModifier, false);
      expect(mod.percentage, -5);
      expect(mod.description, 'Hard to Use 1');

      mod = Modifier.copyWith(mod, level: 4);
      expect(mod.percentage, -20);
      expect(mod.description, 'Hard to Use 4');

      expect(
          () => Modifier.copyWith(mod, level: 5), throwsA(isA<RangeError>()));
    });

    test('Increased Immunity', () {
      var mod = Modifiers.instance().byName('Increased Immunity');
      expect(mod.isAttackModifier, false);
      expect(mod.percentage, -10);
      expect(mod.description, 'Increased Immunity 1');

      mod = Modifier.copyWith(mod, level: 4);
      expect(mod.percentage, -40);
      expect(mod.description, 'Increased Immunity 4');

      expect(
          () => Modifier.copyWith(mod, level: 5), throwsA(isA<RangeError>()));
    });

    test('Inaccurate', () {
      var mod = Modifiers.instance().byName('Inaccurate');
      expect(mod.isAttackModifier, true);
      expect(mod.percentage, -5);
      expect(mod.description, 'Inaccurate 1');

      mod = Modifier.copyWith(mod, level: 4);
      expect(mod.percentage, -20);
      expect(mod.description, 'Inaccurate 4');
    });

    group('Reduced Duration', () {
      var rd;
      setUp(() {
        rd = Modifiers.instance().byName('Reduced Duration');
      });

      test('default', () {
        expect(rd.description, 'Reduced Duration, 1/2');
        expect(rd.percentage, -5);
        expect(rd.isAttackModifier, false);
        expect(rd.level, 1);
      });

      test('1/3', () {
        var mod = Modifier.copyWith(rd, level: 2);
        expect(mod.description, 'Reduced Duration, 1/3');
        expect(mod.percentage, -10);
      });

      test('1/6', () {
        var mod = Modifier.copyWith(rd, level: 3);
        expect(mod.description, 'Reduced Duration, 1/6');
        expect(mod.percentage, -15);
      });

      test('1/10', () {
        var mod = Modifier.copyWith(rd, level: 4);
        expect(mod.description, 'Reduced Duration, 1/10');
        expect(mod.percentage, -20);
      });

      test('1/20', () {
        var mod = Modifier.copyWith(rd, level: 5);
        expect(mod.description, 'Reduced Duration, 1/20');
        expect(mod.percentage, -25);
      });

      test('1/30', () {
        var mod = Modifier.copyWith(rd, level: 6);
        expect(mod.description, 'Reduced Duration, 1/30');
        expect(mod.percentage, -30);
      });

      test('1/60', () {
        var mod = Modifier.copyWith(rd, level: 7);
        expect(mod.description, 'Reduced Duration, 1/60');
        expect(mod.percentage, -35);
      });

      test('1/100', () {
        var mod = Modifier.copyWith(rd, level: 8);
        expect(mod.description, 'Reduced Duration, 1/100');
        expect(mod.percentage, -40);
      });

      test('1/300', () {
        var mod = Modifier.copyWith(rd, level: 10);
        expect(mod.description, 'Reduced Duration, 1/300');
        expect(mod.percentage, -50);
      });
    });

    test('Requires Low Gravity', () {
      var mod = Modifiers.instance().byName('Requires Low Gravity');
      expect(mod.isAttackModifier, false);
      expect(mod.percentage, -5);
      expect(mod.level, 1);
      expect(mod.description, 'Requires Low Gravity, 0.9G');

      var g = Modifier.copyWith(mod, level: 2);
      expect(g.percentage, -10);
      expect(g.description, 'Requires Low Gravity, 0.8G');

      g = Modifier.copyWith(mod, level: 10);
      expect(g.percentage, -50);
      expect(g.description, 'Requires Low Gravity, 0G');

      expect(
          () => Modifier.copyWith(mod, level: 11), throwsA(isA<RangeError>()));
    });

    //TODO: This limitation is only available for Innate Attacks that inflict
    // fatigue or toxic damage. You must combine it with one of Blood Agent,
    // Contact Agent, Follow-Up, Respiratory Agent, or Sense-Based.
    test('Resistible', () {
      var mod = Modifiers.instance().byName('Resistible');
      expect(mod.isAttackModifier, true);
      expect(mod.percentage, -5);
      expect(mod.level, 1);
      expect(mod.description, 'Resistible, HT-5');

      mod = Modifier.copyWith(mod, level: 4);
      expect(mod.percentage, -20);

      mod = Modifier.copyWith(mod, level: 10);
      expect(mod.percentage, -50);
      expect(mod.description, 'Resistible, HT+4');
    });

    test('Short-Range', () {
      var mod = Modifiers.instance().byName('Short-Range');
      expect(mod.isAttackModifier, false);
      expect(mod.description, 'Short-Range 1');
      expect(mod.percentage, -10);
      expect(mod.level, 1);

      mod = Modifier.copyWith(mod, level: 3);
      expect(mod.description, 'Short-Range 3');
      expect(mod.percentage, -30);

      expect(
          () => Modifier.copyWith(mod, level: 4), throwsA(isA<RangeError>()));
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
