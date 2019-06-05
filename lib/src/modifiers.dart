import 'dart:convert';

import 'package:gurps_enhancers/src/modifier.dart';

class Modifiers {
  final Map _constructors = {
    'Simple': (x) => Modifier.fromJSON(x),
    'Leveled': (x) => LeveledModifier.fromJSON(x),
    'Variable': (x) => VariableModifier.fromJSON(x)
  };

  final Map<String, Modifier> _map = {};

  Modifier fetch(String name) => _map[name];

  Modifiers() {
    var temp = json.decode(_source);
    var list = temp['modifiers'] as List;

    list.forEach((a) {
      var m = _constructors[a['type']].call(a);
      _map[m.name] = m;
    });
  }
}

String _source = '''
{
  "modifiers": 
    [
      {
        "name": "Accurate",
        "type": "Leveled",
        "valuePerLevel": 5,
        "isAttackModifier": true
      },
      {
        "name": "Active Defense",
        "type": "Simple",
        "percentage": -40
      },
      {
        "name": "Active Defense, Independent",
        "type": "Simple",
        "percentage": -20
      },
      {
        "name": "Affects Insubstantial",
        "type": "Simple",
        "percentage": 20
      },
      {
        "name": "Affects Insubstantial, Selective",
        "type": "Simple",
        "percentage": 30
      },
      {
        "name": "Affects Others",
        "type": "Leveled",
        "valuePerLevel": 50
      },
      {
        "name": "Affects Substantial",
        "type": "Simple",
        "percentage": 40
      },
      {
        "name": "Affects Substantial, Selective",
        "type": "Simple",
        "percentage": 50
      },
      {
        "name": "All-Out",
        "type": "Simple",
        "percentage": -25
      },
      {
        "name": "All-Out Concentrate",
        "type": "Simple",
        "percentage": -25
      },
      {
        "name": "AP Ammo, Huge piercing",
        "type": "Simple",
        "percentage": 35,
        "isAttackModifier": true
      },
      {
        "name": "AP Ammo, Large piercing",
        "type": "Simple",
        "percentage": 45,
        "isAttackModifier": true
      },
      {
        "name": "AP Ammo, Piercing",
        "type": "Simple",
        "percentage": 20,
        "isAttackModifier": true
      },
      {
        "name": "Area Effect",
        "type": "Leveled",
        "valuePerLevel": 50,
        "isAttackModifier": true
      },
      {
        "COMMENT": "Divisors: 0.1 (x10), 0.2 (x5), 0.5 (x2), 2 (x1/2), 3 (x1/3), 5 (x1/5), 10 (x0.1)",
        "name": "Armor Divisor",
        "type": "Variable",
        "levelPercentages": [-70, -50, -30, 50, 100, 150, 200],
        "isAttackModifier": true
      },
      {
        "name": "Aspected",
        "type": "Simple",
        "percentage": -20
      },
      {
        "name": "Attracts Threats, 6 or less",
        "type": "Simple",
        "percentage": -5
      },
      {
        "name": "Attracts Threats, 9 or less",
        "type": "Simple",
        "percentage": -10
      },
      {
        "name": "Aura",
        "type": "Simple",
        "percentage": 80,
        "isAttackModifier": true
      },
      {
        "name": "Based On",
        "type": "Simple",
        "percentage": 20
      },
      {
        "name": "Based On, Own Roll",
        "type": "Simple",
        "percentage": 20
      },
      {
        "name": "Blockable",
        "type": "Simple",
        "percentage": -5
      },
      {
        "name": "Blood Agent, Reversed",
        "type": "Simple",
        "percentage": -40
      },
      {
        "name": "Can Be Blocked or Parried",
        "type": "Simple",
        "percentage": -10
      },
      {
        "name": "Can Be Parried",
        "type": "Simple",
        "percentage": -5
      },
      {
        "name": "Can Carry Objects",
        "type": "Variable",
        "levelPercentages": [10, 20, 50, 100, 150]
      },
      {
        "name": "Cone",
        "type": "Leveled",
        "valuePerLevel": 10,
        "basePercentage": 50,
        "isAttackModifier": true
      },
      {
        "name": "Cosmic, Avoiding drawbacks",
        "type": "Simple",
        "percentage": 50
      },
      {
        "name": "Cosmic, Defensive",
        "type": "Simple",
        "percentage": 50
      },
      {
        "name": "Cosmic, Irresistible attack",
        "type": "Simple",
        "percentage": 300
      },
      {
        "name": "Cosmic, Lingering effect",
        "type": "Simple",
        "percentage": 100
      },
      {
        "name": "Cosmic, No active defense allowed",
        "type": "Simple",
        "percentage": 300
      },
      {
        "name": "Cosmic, No die roll required",
        "type": "Simple",
        "percentage": 100
      },
      {
        "name": "Cosmic, No Rule of 16",
        "type": "Simple",
        "percentage": 50
      },
      {
        "name": "Cosmic, Privileged attack",
        "type": "Simple",
        "percentage": 50
      },
      {
        "name": "Cosmic, Unhealing damage",
        "type": "Simple",
        "percentage": 100
      },
      {
        "name": "Cosmic, Unrestricted powers",
        "type": "Simple",
        "percentage": 300
      },
      {
        "name": "Cyclic",
        "type": "Variable",
        "isAttackModifier": true,
        "levelPercentages": [10, 20, 40, 50, 100]
      },
      {
        "name": "Decreased Immunity 0",
        "type": "Simple",
        "percentage": 20
      },
      {
        "name": "Decreased Immunity",
        "type": "Leveled",
        "valuePerLevel": 50,
        "maxLevel": 4
      },
      {
        "name": "Dehydration",
        "type": "Simple",
        "percentage": 20,
        "isAttackModifier": true
      },
      {
        "name": "Delay, Fixed",
        "type": "Simple",
        "isAttackModifier": true
      },
      {
        "name": "Delay, Supernatural (fixed)",
        "type": "Simple",
        "percentage": 50,
        "isAttackModifier": true
      },
      {
        "name": "Delay, Supernatural (variable)",
        "type": "Simple",
        "percentage": 100,
        "isAttackModifier": true
      },
      {
        "name": "Delay, Triggered",
        "type": "Simple",
        "percentage": 50,
        "isAttackModifier": true
      },
      {
        "name": "Delay, Variable (long)",
        "type": "Simple",
        "percentage": 20,
        "isAttackModifier": true
      },
      {
        "name": "Delay, Variable (short)",
        "type": "Simple",
        "percentage": 10,
        "isAttackModifier": true
      },
      {
        "name": "Destructive Parry",
        "type": "Simple",
        "percentage": 10,
        "isAttackModifier": true
      },
      {
        "name": "Dissipation",
        "type": "Simple",
        "percentage": -50,
        "isAttackModifier": true
      },
      {
        "name": "Double Blunt Trauma",
        "type": "Simple",
        "percentage": 20,
        "isAttackModifier": true
      },
      {
        "name": "Double Knockback",
        "type": "Simple",
        "percentage": 20,
        "isAttackModifier": true
      },
      {
        "name": "Drifting",
        "type": "Simple",
        "percentage": 20,
        "isAttackModifier": true
      },
      {
        "name": "Drowning",
        "type": "Simple",
        "isAttackModifier": true
      },
      {
        "name": "Dual",
        "type": "Simple",
        "percentage": 10,
        "isAttackModifier": true
      },
      {
        "name": "Emanation",
        "type": "Simple",
        "percentage": -20,
        "isAttackModifier": true
      },
      {
        "name": "Emergencies Only",
        "type": "Simple",
        "percentage": -30
      },
      {
        "name": "Erosive",
        "type": "Simple",
        "percentage": 10,
        "isAttackModifier": true
      },
      {
        "name": "Explosion",
        "type": "Leveled",
        "valuePerLevel": 50,
        "isAttackModifier": true
      },
      {
        "name": "Extended Duration",
        "type": "Leveled",
        "valuePerLevel": 20,
        "maxLevel": 14
      },
      {
        "name": "Extended Duration, Permanent",
        "type": "Simple",
        "percentage": 300
      },
      {
        "name": "Extended Duration, Permanent, dispellable",
        "type": "Simple",
        "percentage": 150
      },
      {
        "name": "Extra Passes",
        "type": "Leveled",
        "valuePerLevel": 10,
        "isAttackModifier": true
      },
      {
        "name": "Fixed Duration",
        "type": "Simple"
      },
      {
        "name": "Follow-Up, Universal",
        "type": "Simple",
        "percentage": 50
      },
      {
        "name": "Follow-Up, Natural weapon",
        "type": "Simple"
      },
      {
        "name": "Force Field",
        "type": "Simple",
        "percentage": 20
      },
      {
        "name": "Fragmentation, Cutting",
        "type": "Leveled",
        "valuePerLevel": 15,
        "isAttackModifier": true
      },
      {
        "name": "Fragmentation, Hot",
        "type": "Leveled",
        "valuePerLevel": 15,
        "isAttackModifier": true
      },
      {
        "name": "Fragmentation, Impaling",
        "type": "Leveled",
        "valuePerLevel": 20,
        "isAttackModifier": true
      },
      {
        "name": "Fragmentation, Large Piercing",
        "type": "Leveled",
        "valuePerLevel": 15,
        "isAttackModifier": true
      },
      {
        "name": "Freezing",
        "type": "Simple",
        "percentage": 20,
        "isAttackModifier": true
      },
      {
        "name": "Game Time",
        "type": "Simple"
      },
      {
        "name": "Guided",
        "type": "Simple",
        "percentage": 50,
        "isAttackModifier": true
      },
      {
        "name": "Heat",
        "type": "Simple",
        "percentage": 20,
        "isAttackModifier": true
      },
      {
        "name": "HP Ammo, Large piercing",
        "type": "Simple",
        "percentage": 20,
        "isAttackModifier": true
      },
      {
        "name": "HP Ammo, Piercing",
        "type": "Simple",
        "percentage": 20,
        "isAttackModifier": true
      },
      {
        "name": "HP Ammo, Small piercing",
        "type": "Simple",
        "percentage": 40,
        "isAttackModifier": true
      },
      {
        "name": "Incendiary (non-burn)",
        "type": "Simple",
        "percentage": 10,
        "isAttackModifier": true
      },
      {
        "name": "Incendiary, Burning",
        "type": "Leveled",
        "valuePerLevel": 10,
        "isAttackModifier": true
      },
      {
        "name": "Increased Range",
        "type": "Leveled",
        "valuePerLevel": 10
      },
      {
        "name": "Increased Range, LOS",
        "type": "Variable",
        "levelPercentages": [90, 80, 70, 60, 50, 40, 30, 20, 10, 0]
      },
      {
        "name": "Independent",
        "type": "Simple",
        "percentage": 40
      },
      {
        "name": "Independent, Simultaneous uses",
        "type": "Simple",
        "percentage": 70
      },
      {
        "name": "Jet",
        "type": "Simple",
        "isAttackModifier": true
      },
      {
        "name": "Link, Permanent",
        "type": "Simple",
        "percentage": 10
      },
      {
        "name": "Link, Independent",
        "type": "Simple",
        "percentage": 20
      },
      {
        "name": "Long-Range",
        "type": "Leveled",
        "valuePerLevel": 50,
        "maxLevel": 3
      },
      {
        "name": "Low Psychic Signature",
        "type": "Leveled",
        "valuePerLevel": 5,
        "maxLevel": 5
      },
      {
        "name": "Low Signature",
        "type": "Simple",
        "percentage": 10,
        "isAttackModifier": true
      },
      {
        "name": "Low Signature, Variable",
        "type": "Leveled",
        "valuePerLevel": 5,
        "maxLevel": 5
      },
      {
        "name": "Malediction, -1 per yard",
        "type": "Simple",
        "percentage": 100,
        "isAttackModifier": true
      },
      {
        "name": "Malediction, Long-Distance Modifiers",
        "type": "Simple",
        "percentage": 200,
        "isAttackModifier": true
      },
      {
        "name": "Malediction, Size and Speed/Range Table",
        "type": "Simple",
        "percentage": 150,
        "isAttackModifier": true
      },
      {
        "name": "Mental Defense Only",
        "type": "Simple",
        "percentage": 250,
        "isAttackModifier": true
      },
      {
        "name": "Missed Sleep",
        "type": "Simple",
        "percentage": 50,
        "isAttackModifier": true
      },
      {
        "name": "Multi-Ammo, Large piercing",
        "type": "Simple",
        "percentage": 65,
        "isAttackModifier": true
      },
      {
        "name": "Multi-Ammo, Piercing",
        "type": "Simple",
        "percentage": 40,
        "isAttackModifier": true
      },
      {
        "name": "Mobile",
        "type": "Leveled",
        "valuePerLevel": 40,
        "isAttackModifier": true
      },
      {
        "name": "No Signature",
        "type": "Simple",
        "percentage": 20,
        "isAttackModifier": true
      },
      {
        "name": "Once On, Stays On",
        "type": "Simple",
        "percentage": 50
      },
      {
        "name": "Overhead",
        "type": "Simple",
        "percentage": 30,
        "isAttackModifier": true
      },
      {
        "name": "Persistent",
        "type": "Simple",
        "percentage": 40,
        "isAttackModifier": true
      },
      {
        "name": "Radiation, Toxic",
        "type": "Simple",
        "percentage": 25,
        "isAttackModifier": true
      },
      {
        "name": "Radiation, Burning",
        "type": "Simple",
        "percentage": 100,
        "isAttackModifier": true
      },
      {
        "name": "Ranged",
        "type": "Simple",
        "percentage": 40
      },
      {
        "name": "Rapid Fire",
        "type": "Variable",
        "isAttackModifier": true,
        "levelPercentages": [40, 50, 70, 100, 150, 200, 250, 300]
      },
      {
        "name": "Rapid Fire, Selective",
        "type": "Variable",
        "isAttackModifier": true,
        "levelPercentages": [80, 110, 160, 210, 260, 310]
      },
      {
        "name": "Reduced Fatigue Cost",
        "type": "Leveled",
        "valuePerLevel": 20
      },
      {
        "name": "Reduced Time",
        "type": "Leveled",
        "valuePerLevel": 20
      },
      {
        "name": "Reflexive",
        "type": "Simple",
        "percentage": 40
      },
      {
        "name": "Reliable",
        "type": "Leveled",
        "valuePerLevel": 5,
        "maxLevel": 10
      },
      {
        "name": "Respiratory Agent",
        "type": "Simple",
        "percentage": 50,
        "isAttackModifier": true
      },
      {
        "name": "Ricochet",
        "type": "Simple",
        "percentage": 10,
        "isAttackModifier": true
      },
      {
        "name": "Selective Area",
        "type": "Simple",
        "percentage": 20,
        "isAttackModifier": true
      },
      {
        "name": "Selective Effect",
        "type": "Simple",
        "percentage": 20
      },
      {
        "name": "Selectivity",
        "type": "Simple",
        "percentage": 10
      },
      {
        "name": "ST-Based",
        "type": "Simple",
        "percentage": 100,
        "isAttackModifier": true
      },
      {
        "name": "ST-Based, Limited",
        "type": "Simple",
        "percentage": 30,
        "isAttackModifier": true
      },
      {
        "name": "Starvation",
        "type": "Simple",
        "percentage": 40,
        "isAttackModifier": true
      },
      {
        "name": "Suffocation",
        "type": "Simple",
        "isAttackModifier": true
      },
      {
        "name": "Super Attribute",
        "type": "Simple",
        "percentage": 25
      },
      {
        "name": "Surge",
        "type": "Simple",
        "percentage": 20,
        "isAttackModifier": true
      },
      {
        "name": "Surge, Arcing",
        "type": "Simple",
        "percentage": 100,
        "isAttackModifier": true
      },
      {
        "name": "Surprise Attack",
        "type": "Simple",
        "percentage": 150,
        "isAttackModifier": true
      },
      {
        "name": "Switchable",
        "type": "Simple",
        "percentage": 10
      },
      {
        "name": "Thrusting Blade",
        "type": "Simple",
        "percentage": 15,
        "isAttackModifier": true
      },
      {
        "name": "Time-Spanning, Present plus (past or future)",
        "type": "Simple",
        "percentage": 50
      },
      {
        "name": "Time-Spanning, Universal",
        "type": "Simple",
        "percentage": 100
      },
      {
        "name": "Time-Spanning, Past and future only",
        "type": "Simple",
        "percentage": 50
      },
      {
        "name": "Time-Spanning, Past or future only",
        "type": "Simple"
      },
      {
        "name": "Underwater",
        "type": "Simple",
        "percentage": 20,
        "isAttackModifier": true
      },
      {
        "name": "Usually On",
        "type": "Simple",
        "percentage": 5
      },
      {
        "name": "Variable",
        "type": "Simple",
        "percentage": 5,
        "isAttackModifier": true
      },
      {
        "name": "Wall, Fixed shape",
        "type": "Simple",
        "percentage": 30,
        "isAttackModifier": true
      },
      {
        "name": "Wall, Variable shape",
        "type": "Simple",
        "percentage": 60,
        "isAttackModifier": true
      },
      {
        "name": "World-Spanning, Others only",
        "type": "Simple",
        "percentage": 50
      },
      {
        "name": "World-Spanning, Others plus current",
        "type": "Simple",
        "percentage": 100
      }
    ]
}
''';
