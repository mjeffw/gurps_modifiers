import 'dart:convert';

import 'package:gurps_enhancers/src/modifier.dart';

class Modifiers {
  var ctor = (x) => Modifier.fromJSON(x);

  final Map _constructors = {
    'Modifier': (x) => Modifier.fromJSON(x),
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
        "name": "Affects Insubstantial",
        "type": "Modifier",
        "percentage": 20
      },
      {
        "name": "Affects Insubstantial, Selective",
        "type": "Modifier",
        "percentage": 30
      },
      {
        "name": "Affects Others",
        "type": "Leveled",
        "valuePerLevel": 50
      },
      {
        "name": "Affects Substantial",
        "type": "Modifier",
        "percentage": 40
      },
      {
        "name": "Affects Substantial, Selective",
        "type": "Modifier",
        "percentage": 50
      },
      {
        "name": "Area Effect",
        "type": "Leveled",
        "valuePerLevel": 50,
        "isAttackModifier": true
      },
      {
        "name": "Armor Divisor",
        "type": "Leveled",
        "valuePerLevel": 50,
        "isAttackModifier": true
      },
      {
        "name": "AP Ammo, Huge piercing",
        "type": "Modifier",
        "percentage": 35,
        "isAttackModifier": true
      },
      {
        "name": "AP Ammo, Large piercing",
        "type": "Modifier",
        "percentage": 45,
        "isAttackModifier": true
      },
      {
        "name": "AP Ammo, Piercing",
        "type": "Modifier",
        "percentage": 20,
        "isAttackModifier": true
      },
      {
        "name": "Aura",
        "type": "Modifier",
        "percentage": 80,
        "isAttackModifier": true
      },
      {
        "name": "Based On",
        "type": "Modifier",
        "percentage": 20
      },
      {
        "name": "Based On, Own Roll",
        "type": "Modifier",
        "percentage": 20
      },
      {
        "name": "Blood Agent",
        "type": "Modifier",
        "percentage": 100
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
        "name": "Contact Agent",
        "type": "Modifier",
        "percentage": 150
      },
      {
        "name": "Cosmic, Avoiding drawbacks",
        "type": "Modifier",
        "percentage": 50
      },
      {
        "name": "Cosmic, Defensive",
        "type": "Modifier",
        "percentage": 50
      },
      {
        "name": "Cosmic, Irresistible attack",
        "type": "Modifier",
        "percentage": 300
      },
      {
        "name": "Cosmic, Lingering effect",
        "type": "Modifier",
        "percentage": 100
      },
      {
        "name": "Cosmic, No active defense allowed",
        "type": "Modifier",
        "percentage": 300
      },
      {
        "name": "Cosmic, No die roll required",
        "type": "Modifier",
        "percentage": 100
      },
      {
        "name": "Cosmic, No Rule of 16",
        "type": "Modifier",
        "percentage": 50
      },
      {
        "name": "Cosmic, Privileged attack",
        "type": "Modifier",
        "percentage": 50
      },
      {
        "name": "Cosmic, Unhealing damage",
        "type": "Modifier",
        "percentage": 100
      },
      {
        "name": "Cosmic, Unrestricted powers",
        "type": "Modifier",
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
        "type": "Modifier",
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
        "type": "Modifier",
        "percentage": 20,
        "isAttackModifier": true
      },
      {
        "name": "Delay, Fixed",
        "type": "Modifier",
        "isAttackModifier": true
      },
      {
        "name": "Delay, Supernatural (fixed)",
        "type": "Modifier",
        "percentage": 50,
        "isAttackModifier": true
      },
      {
        "name": "Delay, Supernatural (variable)",
        "type": "Modifier",
        "percentage": 100,
        "isAttackModifier": true
      },
      {
        "name": "Delay, Triggered",
        "type": "Modifier",
        "percentage": 50,
        "isAttackModifier": true
      },
      {
        "name": "Delay, Variable (long)",
        "type": "Modifier",
        "percentage": 20,
        "isAttackModifier": true
      },
      {
        "name": "Delay, Variable (short)",
        "type": "Modifier",
        "percentage": 10,
        "isAttackModifier": true
      },
      {
        "name": "Destructive Parry",
        "type": "Modifier",
        "percentage": 10,
        "isAttackModifier": true
      },
      {
        "name": "Double Blunt Trauma",
        "type": "Modifier",
        "percentage": 20,
        "isAttackModifier": true
      },
      {
        "name": "Double Knockback",
        "type": "Modifier",
        "percentage": 20,
        "isAttackModifier": true
      },
      {
        "name": "Drifting",
        "type": "Modifier",
        "percentage": 20,
        "isAttackModifier": true
      },
      {
        "name": "Drowning",
        "type": "Modifier",
        "isAttackModifier": true
      },
      {
        "name": "Dual",
        "type": "Modifier",
        "percentage": 10,
        "isAttackModifier": true
      },
      {
        "name": "Erosive",
        "type": "Modifier",
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
        "type": "Modifier",
        "percentage": 300
      },
      {
        "name": "Extended Duration, Permanent, dispellable",
        "type": "Modifier",
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
        "type": "Modifier"
      },
      {
        "name": "Follow-Up, Universal",
        "type": "Modifier",
        "percentage": 50
      },
      {
        "name": "Follow-Up, Natural weapon",
        "type": "Modifier"
      },
      {
        "name": "Force Field",
        "type": "Modifier",
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
        "type": "Modifier",
        "percentage": 20,
        "isAttackModifier": true
      },
      {
        "name": "Game Time",
        "type": "Modifier"
      },
      {
        "name": "Guided",
        "type": "Modifier",
        "percentage": 50,
        "isAttackModifier": true
      },
      {
        "name": "Heat",
        "type": "Modifier",
        "percentage": 20,
        "isAttackModifier": true
      },
      {
        "name": "HP Ammo, Large piercing",
        "type": "Modifier",
        "percentage": 20,
        "isAttackModifier": true
      },
      {
        "name": "HP Ammo, Piercing",
        "type": "Modifier",
        "percentage": 20,
        "isAttackModifier": true
      },
      {
        "name": "HP Ammo, Small piercing",
        "type": "Modifier",
        "percentage": 40,
        "isAttackModifier": true
      },
      {
        "name": "Incendiary (non-burn)",
        "type": "Modifier",
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
        "type": "Modifier",
        "percentage": 40
      },
      {
        "name": "Independent, Simultaneous uses",
        "type": "Modifier",
        "percentage": 70
      },
      {
        "name": "Jet",
        "type": "Modifier",
        "isAttackModifier": true
      },
      {
        "name": "Link, Permanent",
        "type": "Modifier",
        "percentage": 10
      },
      {
        "name": "Link, Independent",
        "type": "Modifier",
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
        "type": "Modifier",
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
        "type": "Modifier",
        "percentage": 100,
        "isAttackModifier": true
      },
      {
        "name": "Malediction, Long-Distance Modifiers",
        "type": "Modifier",
        "percentage": 200,
        "isAttackModifier": true
      },
      {
        "name": "Malediction, Size and Speed/Range Table",
        "type": "Modifier",
        "percentage": 150,
        "isAttackModifier": true
      },
      {
        "name": "Mental Defense Only",
        "type": "Modifier",
        "percentage": 250,
        "isAttackModifier": true
      },
      {
        "name": "Missed Sleep",
        "type": "Modifier",
        "percentage": 50,
        "isAttackModifier": true
      },
      {
        "name": "Multi-Ammo, Large piercing",
        "type": "Modifier",
        "percentage": 65,
        "isAttackModifier": true
      },
      {
        "name": "Multi-Ammo, Piercing",
        "type": "Modifier",
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
        "type": "Modifier",
        "percentage": 20,
        "isAttackModifier": true
      },
      {
        "name": "Once On, Stays On",
        "type": "Modifier",
        "percentage": 50
      },
      {
        "name": "Overhead",
        "type": "Modifier",
        "percentage": 30,
        "isAttackModifier": true
      },
      {
        "name": "Persistent",
        "type": "Modifier",
        "percentage": 40,
        "isAttackModifier": true
      },
      {
        "name": "Radiation, Toxic",
        "type": "Modifier",
        "percentage": 25,
        "isAttackModifier": true
      },
      {
        "name": "Radiation, Burning",
        "type": "Modifier",
        "percentage": 100,
        "isAttackModifier": true
      },
      {
        "name": "Ranged",
        "type": "Modifier",
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
        "type": "Modifier",
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
        "type": "Modifier",
        "percentage": 50,
        "isAttackModifier": true
      },
      {
        "name": "Ricochet",
        "type": "Modifier",
        "percentage": 10,
        "isAttackModifier": true
      },
      {
        "name": "Selective Area",
        "type": "Modifier",
        "percentage": 20,
        "isAttackModifier": true
      },
      {
        "name": "Selective Effect",
        "type": "Modifier",
        "percentage": 20
      },
      {
        "name": "Selectivity",
        "type": "Modifier",
        "percentage": 10
      },
      {
        "name": "ST-Based",
        "type": "Modifier",
        "percentage": 100,
        "isAttackModifier": true
      },
      {
        "name": "ST-Based, Limited",
        "type": "Modifier",
        "percentage": 30,
        "isAttackModifier": true
      },
      {
        "name": "Starvation",
        "type": "Modifier",
        "percentage": 40,
        "isAttackModifier": true
      },
      {
        "name": "Suffocation",
        "type": "Modifier",
        "isAttackModifier": true
      },
      {
        "name": "Super Attribute",
        "type": "Modifier",
        "percentage": 25
      },
      {
        "name": "Surge",
        "type": "Modifier",
        "percentage": 20,
        "isAttackModifier": true
      },
      {
        "name": "Surge, Arcing",
        "type": "Modifier",
        "percentage": 100,
        "isAttackModifier": true
      },
      {
        "name": "Surprise Attack",
        "type": "Modifier",
        "percentage": 150,
        "isAttackModifier": true
      },
      {
        "name": "Switchable",
        "type": "Modifier",
        "percentage": 10
      },
      {
        "name": "Thrusting Blade",
        "type": "Modifier",
        "percentage": 15,
        "isAttackModifier": true
      },
      {
        "name": "Time-Spanning, Present plus (past or future)",
        "type": "Modifier",
        "percentage": 50
      },
      {
        "name": "Time-Spanning, Universal",
        "type": "Modifier",
        "percentage": 100
      },
      {
        "name": "Time-Spanning, Past and future only",
        "type": "Modifier",
        "percentage": 50
      },
      {
        "name": "Time-Spanning, Past or future only",
        "type": "Modifier"
      },
      {
        "name": "Underwater",
        "type": "Modifier",
        "percentage": 20,
        "isAttackModifier": true
      },
      {
        "name": "Usually On",
        "type": "Modifier",
        "percentage": 5
      },
      {
        "name": "Variable",
        "type": "Modifier",
        "percentage": 5,
        "isAttackModifier": true
      },
      {
        "name": "Wall, Fixed shape",
        "type": "Modifier",
        "percentage": 30,
        "isAttackModifier": true
      },
      {
        "name": "Wall, Variable shape",
        "type": "Modifier",
        "percentage": 60,
        "isAttackModifier": true
      },
      {
        "name": "World-Spanning, Others only",
        "type": "Modifier",
        "percentage": 50
      },
      {
        "name": "World-Spanning, Others plus current",
        "type": "Modifier",
        "percentage": 100
      }
    ]
}
''';
