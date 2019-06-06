String modifierDataString = '''
  {
  "modifiers":
    [
            {
        "name": "Accessibility, Only at day",
        "type": "Simple",
        "value": -20
      },
      {
        "name": "Accessibility, Only at night",
        "type": "Simple",
        "value": -20
      },
      {
        "name": "Accessibility, Only by one side of split personality",
        "type": "Simple",
        "value": -40
      },
      {
        "name": "Accessibility, Only during full moon",
        "type": "Simple",
        "value": -40
      },
      {
        "name": "Accessibility, Only during new moon",
        "type": "Simple",
        "value": -40
      },
      {
        "name": "Accessibility, Only in altered body form",
        "type": "Simple",
        "value": -10
      },
      {
        "name": "Accessibility, Only in direct sunlight",
        "type": "Simple",
        "value": -30
      },
      {
        "name": "Accessibility, Only on those who share a language with me",
        "type": "Simple",
        "value": -10
      },
      {
        "name": "Accessibility, Only while flying",
        "type": "Simple",
        "value": -30
      },
      {
        "name": "Accessibility, Only while in hypnotic trance",
        "type": "Simple",
        "value": -30
      },
      {
        "name": "Accessibility, Only while moving (1 step/turn)",
        "type": "Simple",
        "value": -10
      },
      {
        "name": "Accessibility, Only while moving (full Move)",
        "type": "Simple",
        "value": -30
      },
      {
        "name": "Accessibility, Only while moving (half Move)",
        "type": "Simple",
        "value": -20
      },
      {
        "name": "Accessibility, Only while playing musical instrument",
        "type": "Simple",
        "value": -20
      },
      {
        "name": "Accessibility, Only while swimming",
        "type": "Simple",
        "value": -30
      },
      {
        "name": "Accessibility, Requires (item)",
        "type": "Simple",
        "value": -10
      },
      {
        "name": "Accessibility, Requires complex ritual",
        "type": "Simple",
        "value": -20
      },
      {
        "name": "Accessibility, Requires gestures",
        "type": "Simple",
        "value": -10
      },
      {
        "name": "Accessibility, Requires magic words",
        "type": "Simple",
        "value": -10
      },
      {
        "name": "Accessibility, Requires material component",
        "type": "Simple",
        "value": -10
      },
      {
        "name": "Accessibility, Requires material component (extremely rare)",
        "type": "Simple",
        "value": -15
      },
      {
        "name": "Accessibility, Requires simple ritual",
        "type": "Simple",
        "value": -5
      },
      {
        "name": "Accessibility, Requires typical ritual",
        "type": "Simple",
        "value": -10
      },
      {
        "name": "Accessibility, Useless under stress",
        "type": "Simple",
        "value": -60
      },
      {
        "name": "Accessibility, While conscious",
        "type": "Simple",
        "value": -5
      },
      {
        "name": "Accurate",
        "type": "Leveled",
        "isAttackModifier": true,
        "valuePerLevel": 5
      },
      {
        "name": "Active Defense",
        "type": "Simple",
        "value": -40
      },
      {
        "name": "Active Defense, Independent",
        "type": "Simple",
        "value": -20
      },
      {
        "name": "Affects Insubstantial",
        "type": "Simple",
        "value": 20
      },
      {
        "name": "Affects Insubstantial, Selective",
        "type": "Simple",
        "value": 30
      },
      {
        "name": "Affects Others",
        "type": "Leveled",
        "valuePerLevel": 50
      },
      {
        "name": "Affects Substantial",
        "type": "Simple",
        "value": 40
      },
      {
        "name": "Affects Substantial, Selective",
        "type": "Simple",
        "value": 50
      },
      {
        "name": "All-Out",
        "type": "Simple",
        "value": -25
      },
      {
        "name": "All-Out Concentrate",
        "type": "Simple",
        "value": -25
      },
      {
        "name": "Always On, Dangerous",
        "type": "Simple",
        "value": -40
      },
      {
        "name": "Always On, Physically Inconvenient",
        "type": "Simple",
        "value": -20
      },
      {
        "name": "Always On, Social or Cosmetic",
        "type": "Simple",
        "value": -10
      },
      {
        "name": "AP Ammo, Huge piercing",
        "type": "Simple",
        "value": 35,
        "isAttackModifier": true
      },
      {
        "name": "AP Ammo, Large piercing",
        "type": "Simple",
        "value": 45,
        "isAttackModifier": true
      },
      {
        "name": "AP Ammo, Piercing",
        "type": "Simple",
        "value": 20,
        "isAttackModifier": true
      },
      {
        "name": "Area Effect",
        "type": "Leveled",
        "isAttackModifier": true,
        "valuePerLevel": 50
      },
      {
        "name": "Armor Divisor",
        "type": "Variable",
        "levelValues": [-70, -50, -30, 50, 100, 150, 200],
        "isAttackModifier": true
      },
      {
        "name": "Aspected",
        "type": "Simple",
        "value": -20
      },
      {
        "name": "Attracts Threats, 6 or less",
        "type": "Simple",
        "value": -5
      },
      {
        "name": "Attracts Threats, 9 or less",
        "type": "Simple",
        "value": -10
      },
      {
        "name": "Aura",
        "type": "Simple",
        "value": 80,
        "isAttackModifier": true
      },
      {
        "name": "Based On",
        "type": "Simple",
        "value": 20
      },
      {
        "name": "Based On, Own Roll",
        "type": "Simple",
        "value": 20
      },
      {
        "name": "Blockable",
        "type": "Simple",
        "value": -5
      },
      {
        "name": "Blood Agent, Reversed",
        "type": "Simple",
        "value": -40
      },
      {
        "name": "Bombardment, Effective skill 10",
        "type": "Simple",
        "value": -15,
        "isAttackModifier": true
      },
      {
        "name": "Bombardment, Effective skill 12",
        "type": "Simple",
        "value": -10,
        "isAttackModifier": true
      },
      {
        "name": "Bombardment, Effective skill 14",
        "type": "Simple",
        "value": -5,
        "isAttackModifier": true
      },
      {
        "name": "Bombardment, Effective skill 8",
        "type": "Simple",
        "value": -20,
        "isAttackModifier": true
      },
      {
        "name": "Can Be Blocked or Parried",
        "type": "Simple",
        "value": -10
      },
      {
        "name": "Can Be Parried",
        "type": "Simple",
        "value": -5
      },
      {
        "name": "Can Be Stolen, Easily snatched",
        "type": "Simple",
        "value": -40
      },
      {
        "name": "Can Be Stolen, Forcefully removed",
        "type": "Simple",
        "value": -10
      },
      {
        "name": "Can Be Stolen, Quick Contest",
        "type": "Simple",
        "value": -30
      },
      {
        "name": "Can Be Stolen, Stealth or trickery",
        "type": "Simple",
        "value": -20
      },
      {
        "name": "Can Carry Objects",
        "type": "Variable",
        "levelValues": [10, 20, 50, 100, 150]
      },
      {
        "name": "Cardiac Stress",
        "type": "Variable",
        "levelValues": [-50, -40, -30, -20, -10]
      },
      {
        "name": "Cerebral Stress",
        "type": "Variable",
        "levelValues": [-50, -40, -30, -20, -10]
      },
      {
        "name": "Cone",
        "type": "Leveled",
        "baseValue": 50,
        "isAttackModifier": true,
        "valuePerLevel": 10
      },
      {
        "name": "Cosmic, Avoiding drawbacks",
        "type": "Simple",
        "value": 50
      },
      {
        "name": "Cosmic, Defensive",
        "type": "Simple",
        "value": 50
      },
      {
        "name": "Cosmic, Irresistible attack",
        "type": "Simple",
        "value": 300
      },
      {
        "name": "Cosmic, Lingering effect",
        "type": "Simple",
        "value": 100
      },
      {
        "name": "Cosmic, No active defense allowed",
        "type": "Simple",
        "value": 300
      },
      {
        "name": "Cosmic, No die roll required",
        "type": "Simple",
        "value": 100
      },
      {
        "name": "Cosmic, No Rule of 16",
        "type": "Simple",
        "value": 50
      },
      {
        "name": "Cosmic, Privileged attack",
        "type": "Simple",
        "value": 50
      },
      {
        "name": "Cosmic, Unhealing damage",
        "type": "Simple",
        "value": 100
      },
      {
        "name": "Cosmic, Unrestricted powers",
        "type": "Simple",
        "value": 300
      },
      {
        "name": "Costs Fatigue",
        "type": "Leveled",
        "valuePerLevel": -5
      },
      {
        "name": "Costs Fatigue, Per second",
        "type": "Leveled",
        "valuePerLevel": -10
      },
      {
        "name": "Costs Hit Points",
        "type": "Leveled",
        "valuePerLevel": -10
      },
      {
        "name": "Costs Hit Points, Instead of Fatigue",
        "type": "Leveled",
        "valuePerLevel": -5
      },
      {
        "name": "Costs Hit Points, Per second",
        "type": "Leveled",
        "valuePerLevel": -20
      },
      {
        "name": "Costs Hit Points, Per second instead of Fatigue",
        "type": "Leveled",
        "valuePerLevel": -10
      },
      {
        "name": "Cyclic",
        "type": "Variable",
        "levelValues": [10, 20, 40, 50, 100],
        "isAttackModifier": true
      },
      {
        "name": "Decreased Immunity",
        "type": "Leveled",
        "maxLevel": 4,
        "valuePerLevel": 50
      },
      {
        "name": "Decreased Immunity 0",
        "type": "Simple",
        "value": 20
      },
      {
        "name": "Dehydration",
        "type": "Simple",
        "value": 20,
        "isAttackModifier": true
      },
      {
        "name": "Delay, Fixed",
        "type": "Simple",
        "value": 0,
        "isAttackModifier": true
      },
      {
        "name": "Delay, Supernatural (fixed)",
        "type": "Simple",
        "value": 50,
        "isAttackModifier": true
      },
      {
        "name": "Delay, Supernatural (variable)",
        "type": "Simple",
        "value": 100,
        "isAttackModifier": true
      },
      {
        "name": "Delay, Triggered",
        "type": "Simple",
        "value": 50,
        "isAttackModifier": true
      },
      {
        "name": "Delay, Variable (long)",
        "type": "Simple",
        "value": 20,
        "isAttackModifier": true
      },
      {
        "name": "Delay, Variable (short)",
        "type": "Simple",
        "value": 10,
        "isAttackModifier": true
      },
      {
        "name": "Destructive Parry",
        "type": "Simple",
        "value": 10,
        "isAttackModifier": true
      },
      {
        "name": "Dissipation",
        "type": "Simple",
        "value": -50,
        "isAttackModifier": true
      },
      {
        "name": "Double Blunt Trauma",
        "type": "Simple",
        "value": 20,
        "isAttackModifier": true
      },
      {
        "name": "Double Knockback",
        "type": "Simple",
        "value": 20,
        "isAttackModifier": true
      },
      {
        "name": "Drifting",
        "type": "Simple",
        "value": 20,
        "isAttackModifier": true
      },
      {
        "name": "Drowning",
        "type": "Simple",
        "value": 0,
        "isAttackModifier": true
      },
      {
        "name": "Dual",
        "type": "Simple",
        "value": 10,
        "isAttackModifier": true
      },
      {
        "name": "Easily Resisted",
        "type": "Leveled",
        "valuePerLevel": -5
      },
      {
        "name": "Emanation",
        "type": "Simple",
        "value": -20,
        "isAttackModifier": true
      },
      {
        "name": "Emergencies Only",
        "type": "Simple",
        "value": -30
      },
      {
        "name": "Environmental, Common",
        "type": "Simple",
        "value": -10
      },
      {
        "name": "Environmental, Occasional",
        "type": "Simple",
        "value": -20
      },
      {
        "name": "Environmental, Rare",
        "type": "Simple",
        "value": -40
      },
      {
        "name": "Environmental, Very common",
        "type": "Simple",
        "value": -5
      },
      {
        "name": "Environmental, Very rare",
        "type": "Simple",
        "value": -80
      },
      {
        "name": "Erosive",
        "type": "Simple",
        "value": 10,
        "isAttackModifier": true
      },
      {
        "name": "Explosion",
        "type": "Leveled",
        "isAttackModifier": true,
        "valuePerLevel": 50
      },
      {
        "name": "Extended Duration",
        "type": "Leveled",
        "maxLevel": 14,
        "valuePerLevel": 20
      },
      {
        "name": "Extended Duration, Permanent",
        "type": "Simple",
        "value": 300
      },
      {
        "name": "Extended Duration, Permanent, dispellable",
        "type": "Simple",
        "value": 150
      },
      {
        "name": "Extra Passes",
        "type": "Leveled",
        "isAttackModifier": true,
        "valuePerLevel": 10
      },
      {
        "name": "Fickle",
        "type": "Simple",
        "value": -20
      },
      {
        "name": "Fixed Duration",
        "type": "Simple",
        "value": 0
      },
      {
        "name": "Follow-Up, Natural weapon",
        "type": "Simple",
        "value": 0
      },
      {
        "name": "Follow-Up, Universal",
        "type": "Simple",
        "value": 50
      },
      {
        "name": "Force Field",
        "type": "Simple",
        "value": 20
      },
      {
        "name": "Fragmentation, Cutting",
        "type": "Leveled",
        "isAttackModifier": true,
        "valuePerLevel": 15
      },
      {
        "name": "Fragmentation, Hot",
        "type": "Leveled",
        "isAttackModifier": true,
        "valuePerLevel": 15
      },
      {
        "name": "Fragmentation, Impaling",
        "type": "Leveled",
        "isAttackModifier": true,
        "valuePerLevel": 20
      },
      {
        "name": "Fragmentation, Large Piercing",
        "type": "Leveled",
        "isAttackModifier": true,
        "valuePerLevel": 15
      },
      {
        "name": "Freezing",
        "type": "Simple",
        "value": 20,
        "isAttackModifier": true
      },
      {
        "name": "Full Power in Emergencies Only",
        "type": "Simple",
        "value": -20
      },
      {
        "name": "Game Time",
        "type": "Simple",
        "value": 0
      },
      {
        "name": "Granted by (Other)",
        "type": "Simple",
        "value": -40
      },
      {
        "name": "Guided",
        "type": "Simple",
        "value": 50,
        "isAttackModifier": true
      },
      {
        "name": "Heat",
        "type": "Simple",
        "value": 20,
        "isAttackModifier": true
      },
      {
        "name": "HP Ammo, Large piercing",
        "type": "Simple",
        "value": 20,
        "isAttackModifier": true
      },
      {
        "name": "HP Ammo, Piercing",
        "type": "Simple",
        "value": 20,
        "isAttackModifier": true
      },
      {
        "name": "HP Ammo, Small piercing",
        "type": "Simple",
        "value": 40,
        "isAttackModifier": true
      },
      {
        "name": "Incendiary (non-burn)",
        "type": "Simple",
        "value": 10,
        "isAttackModifier": true
      },
      {
        "name": "Incendiary, Burning",
        "type": "Leveled",
        "isAttackModifier": true,
        "valuePerLevel": 10
      },
      {
        "name": "Increased Range",
        "type": "Leveled",
        "valuePerLevel": 10
      },
      {
        "name": "Increased Range, LOS",
        "type": "Variable",
        "levelValues": [90, 80, 70, 60, 50, 40, 30, 20, 10, 0]
      },
      {
        "name": "Independent",
        "type": "Simple",
        "value": 40
      },
      {
        "name": "Independent, Simultaneous uses",
        "type": "Simple",
        "value": 70
      },
      {
        "name": "Informal",
        "type": "Simple",
        "value": -50
      },
      {
        "name": "Insubstantial Only",
        "type": "Simple",
        "value": -30
      },
      {
        "name": "Jet",
        "type": "Simple",
        "value": 0,
        "isAttackModifier": true
      },
      {
        "name": "Link, Independent",
        "type": "Simple",
        "value": 20
      },
      {
        "name": "Link, Permanent",
        "type": "Simple",
        "value": 10
      },
      {
        "name": "Long-Range",
        "type": "Leveled",
        "maxLevel": 3,
        "valuePerLevel": 50
      },
      {
        "name": "Low Psychic Signature",
        "type": "Leveled",
        "maxLevel": 5,
        "valuePerLevel": 5
      },
      {
        "name": "Low Signature",
        "type": "Simple",
        "value": 10,
        "isAttackModifier": true
      },
      {
        "name": "Low Signature, Variable",
        "type": "Leveled",
        "maxLevel": 5,
        "valuePerLevel": 5
      },
      {
        "name": "Magnetic",
        "type": "Simple",
        "value": -50
      },
      {
        "name": "Malediction, -1 per yard",
        "type": "Simple",
        "value": 100,
        "isAttackModifier": true
      },
      {
        "name": "Malediction, Long-Distance Modifiers",
        "type": "Simple",
        "value": 200,
        "isAttackModifier": true
      },
      {
        "name": "Malediction, Size and Speed/Range Table",
        "type": "Simple",
        "value": 150,
        "isAttackModifier": true
      },
      {
        "name": "Mana-Sensitive",
        "type": "Simple",
        "value": -10
      },
      {
        "name": "Mental Defense Only",
        "type": "Simple",
        "value": 250,
        "isAttackModifier": true
      },
      {
        "name": "Minimum Range, 1% Max",
        "type": "Simple",
        "value": -5
      },
      {
        "name": "Minimum Range, 5% Max",
        "type": "Simple",
        "value": -10
      },
      {
        "name": "Missed Sleep",
        "type": "Simple",
        "value": 50,
        "isAttackModifier": true
      },
      {
        "name": "Mobile",
        "type": "Leveled",
        "isAttackModifier": true,
        "valuePerLevel": 40
      },
      {
        "name": "Multi-Ammo, Large piercing",
        "type": "Simple",
        "value": 65,
        "isAttackModifier": true
      },
      {
        "name": "Multi-Ammo, Piercing",
        "type": "Simple",
        "value": 40,
        "isAttackModifier": true
      },
      {
        "name": "No Blunt Trauma",
        "type": "Simple",
        "value": -20,
        "isAttackModifier": true
      },
      {
        "name": "No DR Reduction",
        "type": "Simple",
        "value": -20,
        "isAttackModifier": true
      },
      {
        "name": "No Incendiary Effect",
        "type": "Simple",
        "value": -10,
        "isAttackModifier": true
      },
      {
        "name": "No Knockback",
        "type": "Simple",
        "value": -10,
        "isAttackModifier": true
      },
      {
        "name": "No Signature",
        "type": "Simple",
        "value": 20,
        "isAttackModifier": true
      },
      {
        "name": "No Wounding",
        "type": "Simple",
        "value": -10,
        "isAttackModifier": true
      },
      {
        "name": "Once On, Stays On",
        "type": "Simple",
        "value": 50
      },
      {
        "name": "Only When Berserk",
        "type": "Simple",
        "value": -20
      },
      {
        "name": "Overhead",
        "type": "Simple",
        "value": 30,
        "isAttackModifier": true
      },
      {
        "name": "Persistent",
        "type": "Simple",
        "value": 40,
        "isAttackModifier": true
      },
      {
        "name": "Radiation, Burning",
        "type": "Simple",
        "value": 100,
        "isAttackModifier": true
      },
      {
        "name": "Radiation, Toxic",
        "type": "Simple",
        "value": 25,
        "isAttackModifier": true
      },
      {
        "name": "Ranged",
        "type": "Simple",
        "value": 40
      },
      {
        "name": "Rapid Fire",
        "type": "Variable",
        "levelValues": [40, 50, 70, 100, 150, 200, 250, 300],
        "isAttackModifier": true
      },
      {
        "name": "Rapid Fire, Selective",
        "type": "Variable",
        "levelValues": [80, 110, 160, 210, 260, 310],
        "isAttackModifier": true
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
        "value": 40
      },
      {
        "name": "Reliable",
        "type": "Leveled",
        "maxLevel": 10,
        "valuePerLevel": 5
      },
      {
        "name": "Requires Concentrate",
        "type": "Simple",
        "value": -15
      },
      {
        "name": "Requires Reaction Roll",
        "type": "Simple",
        "value": -5
      },
      {
        "name": "Requires Ready",
        "type": "Simple",
        "value": -10
      },
      {
        "name": "Respiratory Agent",
        "type": "Simple",
        "value": 50,
        "isAttackModifier": true
      },
      {
        "name": "Ricochet",
        "type": "Simple",
        "value": 10,
        "isAttackModifier": true
      },
      {
        "name": "Selective Area",
        "type": "Simple",
        "value": 20,
        "isAttackModifier": true
      },
      {
        "name": "Selective Effect",
        "type": "Simple",
        "value": 20
      },
      {
        "name": "Selectivity",
        "type": "Simple",
        "value": 10
      },
      {
        "name": "Skill Enhancement Only",
        "type": "Simple",
        "value": -60
      },
      {
        "name": "ST-Based",
        "type": "Simple",
        "value": 100,
        "isAttackModifier": true
      },
      {
        "name": "ST-Based, Limited",
        "type": "Simple",
        "value": 30,
        "isAttackModifier": true
      },
      {
        "name": "Starvation",
        "type": "Simple",
        "value": 40,
        "isAttackModifier": true
      },
      {
        "name": "Substantial Only",
        "type": "Simple",
        "value": -10
      },
      {
        "name": "Suffocation",
        "type": "Simple",
        "value": 0,
        "isAttackModifier": true
      },
      {
        "name": "Super Attribute",
        "type": "Simple",
        "value": 25
      },
      {
        "name": "Surge",
        "type": "Simple",
        "value": 20,
        "isAttackModifier": true
      },
      {
        "name": "Surge, Arcing",
        "type": "Simple",
        "value": 100,
        "isAttackModifier": true
      },
      {
        "name": "Surprise Attack",
        "type": "Simple",
        "value": 150,
        "isAttackModifier": true
      },
      {
        "name": "Switchable",
        "type": "Simple",
        "value": 10
      },
      {
        "name": "Thrusting Blade",
        "type": "Simple",
        "value": 15,
        "isAttackModifier": true
      },
      {
        "name": "Time-Spanning, Past and future only",
        "type": "Simple",
        "value": 50
      },
      {
        "name": "Time-Spanning, Past or future only",
        "type": "Simple",
        "value": 0
      },
      {
        "name": "Time-Spanning, Present plus (past or future)",
        "type": "Simple",
        "value": 50
      },
      {
        "name": "Time-Spanning, Universal",
        "type": "Simple",
        "value": 100
      },
      {
        "name": "Unconscious Only",
        "type": "Simple",
        "value": -20
      },
      {
        "name": "Uncontrollable, Dangerous",
        "type": "Simple",
        "value": -30
      },
      {
        "name": "Uncontrollable, Inconvenient",
        "type": "Simple",
        "value": -10
      },
      {
        "name": "Underwater",
        "type": "Simple",
        "value": 20,
        "isAttackModifier": true
      },
      {
        "name": "Unique",
        "type": "Simple",
        "value": -25
      },
      {
        "name": "Unsupported",
        "type": "Simple",
        "value": -25
      },
      {
        "name": "Untrainable",
        "type": "Simple",
        "value": -40
      },
      {
        "name": "Usually On",
        "type": "Simple",
        "value": 5
      },
      {
        "name": "Variable",
        "type": "Simple",
        "value": 5,
        "isAttackModifier": true
      },
      {
        "name": "Visible, Attack",
        "type": "Simple",
        "value": -20
      },
      {
        "name": "Visible, Non-Attack",
        "type": "Simple",
        "value": -10
      },
      {
        "name": "Wall, Fixed shape",
        "type": "Simple",
        "value": 30,
        "isAttackModifier": true
      },
      {
        "name": "Wall, Variable shape",
        "type": "Simple",
        "value": 60,
        "isAttackModifier": true
      },
      {
        "name": "World-Spanning, Others only",
        "type": "Simple",
        "value": 50
      },
      {
        "name": "World-Spanning, Others plus current",
        "type": "Simple",
        "value": 100
      }
    ]
}
''';
