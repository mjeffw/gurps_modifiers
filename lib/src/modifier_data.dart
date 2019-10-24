String modifierDataString = '''
  {
  "modifiers":
    [
      {
        "name": "Accessibility, Only at day",
        "type": "Simple",
        "percentage": -20
      },
      {
        "name": "Accessibility, Only at night",
        "type": "Simple",
        "percentage": -20
      },
      {
        "name": "Accessibility, Only by one side of split personality",
        "type": "Simple",
        "percentage": -40
      },
      {
        "name": "Accessibility, Only during full moon",
        "type": "Simple",
        "percentage": -40
      },
      {
        "name": "Accessibility, Only during new moon",
        "type": "Simple",
        "percentage": -40
      },
      {
        "name": "Accessibility, Only in altered body form",
        "type": "Simple",
        "percentage": -10
      },
      {
        "name": "Accessibility, Only in direct sunlight",
        "type": "Simple",
        "percentage": -30
      },
      {
        "name": "Accessibility, Only on those who share a language with me",
        "type": "Simple",
        "percentage": -10
      },
      {
        "name": "Accessibility, Only while flying",
        "type": "Simple",
        "percentage": -30
      },
      {
        "name": "Accessibility, Only while in hypnotic trance",
        "type": "Simple",
        "percentage": -30
      },
      {
        "name": "Accessibility, Only while moving 1 step/turn",
        "type": "Simple",
        "percentage": -10
      },
      {
        "name": "Accessibility, Only while moving full Move",
        "type": "Simple",
        "percentage": -30
      },
      {
        "name": "Accessibility, Only while moving half Move",
        "type": "Simple",
        "percentage": -20
      },
      {
        "name": "Accessibility, Only while playing musical instrument",
        "type": "Simple",
        "percentage": -20
      },
      {
        "name": "Accessibility, Only while swimming",
        "type": "Simple",
        "percentage": -30
      },
      {
        "name": "Accessibility, Requires (item)",
        "type": "Simple",
        "percentage": -10
      },
      {
        "name": "Accessibility, Requires complex ritual",
        "type": "Simple",
        "percentage": -20
      },
      {
        "name": "Accessibility, Requires gestures",
        "type": "Simple",
        "percentage": -10
      },
      {
        "name": "Accessibility, Requires magic words",
        "type": "Simple",
        "percentage": -10
      },
      {
        "name": "Accessibility, Requires material component",
        "type": "Simple",
        "percentage": -10
      },
      {
        "name": "Accessibility, Requires material component, extremely rare",
        "type": "Simple",
        "percentage": -15
      },
      {
        "name": "Accessibility, Requires simple ritual",
        "type": "Simple",
        "percentage": -5
      },
      {
        "name": "Accessibility, Requires typical ritual",
        "type": "Simple",
        "percentage": -10
      },
      {
        "name": "Accessibility, Useless under stress",
        "type": "Simple",
        "percentage": -60
      },
      {
        "name": "Accessibility, While conscious",
        "type": "Simple",
        "percentage": -5
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
        "percentage": -40
      },
      {
        "name": "Active Defense, Independent",
        "type": "Simple",
        "percentage": -20
      },
      {
        "name": "Affects Insubstantial",
        "type": "NamedVariant",
        "variations": [
          {
            "key": "Selective",
            "value": 30
          }
        ],
        "percentage": 20
      },
      {
        "name": "Affects Others",
        "type": "Leveled",
        "valuePerLevel": 50,
        "levelPrompt": "Number affected"
      },
      {
        "name": "Affects Substantial",
        "type": "NamedVariant",
        "percentage": 40,
        "variations": [
          {
            "key": "Selective",
            "value": 50
          }
        ]
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
        "name": "Always On, Dangerous",
        "type": "Simple",
        "percentage": -40
      },
      {
        "name": "Always On, Physically Inconvenient",
        "type": "Simple",
        "percentage": -20
      },
      {
        "name": "Always On, Social or Cosmetic",
        "type": "Simple",
        "percentage": -10
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
        "isAttackModifier": true,
        "valuePerLevel": 50,
        "levelPrompt": "Radius (yards)",
        "formatter": {
          "type": "Exponential",
          "a": 1,
          "b": 2,
          "template": "%name, %f yards"
        }
      },
      {
        "name": "Armor Divisor",
        "type": "Variable",
        "levelValues": [-70, -50, -30, 50, 100, 150, 200],
        "isAttackModifier": true,
        "formatter": {
          "type": "Array",
          "array": ["(0.1)", "(0.2)", "(0.5)", "(2)", "(3)", "(5)", "(10)"],
          "template": "%name %f",
          "prompt": "Divisor"
        }
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
        "name": "Bombardment, Effective skill 10",
        "type": "Simple",
        "percentage": -15,
        "isAttackModifier": true
      },
      {
        "name": "Bombardment, Effective skill 12",
        "type": "Simple",
        "percentage": -10,
        "isAttackModifier": true
      },
      {
        "name": "Bombardment, Effective skill 14",
        "type": "Simple",
        "percentage": -5,
        "isAttackModifier": true
      },
      {
        "name": "Bombardment, Effective skill 8",
        "type": "Simple",
        "percentage": -20,
        "isAttackModifier": true
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
        "name": "Can Be Stolen, Easily snatched",
        "type": "Simple",
        "percentage": -40
      },
      {
        "name": "Can Be Stolen, Forcefully removed",
        "type": "Simple",
        "percentage": -10
      },
      {
        "name": "Can Be Stolen, Quick Contest",
        "type": "Simple",
        "percentage": -30
      },
      {
        "name": "Can Be Stolen, Stealth or trickery",
        "type": "Simple",
        "percentage": -20
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
        "type": "Cyclic"
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
        "percentage": 20
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
        "percentage": 0,
        "isAttackModifier": true
      },
      {
        "name": "Delay, Supernatural, fixed",
        "type": "Simple",
        "percentage": 50,
        "isAttackModifier": true
      },
      {
        "name": "Delay, Supernatural, variable",
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
        "name": "Delay, Variable, long",
        "type": "Simple",
        "percentage": 20,
        "isAttackModifier": true
      },
      {
        "name": "Delay, Variable, short",
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
        "percentage": 0,
        "isAttackModifier": true
      },
      {
        "name": "Dual",
        "type": "Simple",
        "percentage": 10,
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
        "percentage": -20,
        "isAttackModifier": true
      },
      {
        "name": "Emergencies Only",
        "type": "Simple",
        "percentage": -30
      },
      {
        "name": "Environmental, Common",
        "type": "Simple",
        "percentage": -10
      },
      {
        "name": "Environmental, Occasional",
        "type": "Simple",
        "percentage": -20
      },
      {
        "name": "Environmental, Rare",
        "type": "Simple",
        "percentage": -40
      },
      {
        "name": "Environmental, Very common",
        "type": "Simple",
        "percentage": -5
      },
      {
        "name": "Environmental, Very rare",
        "type": "Simple",
        "percentage": -80
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
        "isAttackModifier": true,
        "valuePerLevel": 50
      },
      {
        "name": "Exposure Time",
        "type": "Leveled",
        "baseValue": -20,
        "isAttackModifier": true,
        "maxLevel": 4,
        "valuePerLevel": -10
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
        "isAttackModifier": true,
        "valuePerLevel": 10
      },
      {
        "name": "Extra Recoil",
        "type": "Leveled",
        "isAttackModifier": true,
        "maxLevel": 4,
        "valuePerLevel": -10
      },
      {
        "name": "Fickle",
        "type": "Simple",
        "percentage": -20
      },
      {
        "name": "Fixed Duration",
        "type": "Simple",
        "percentage": 0
      },
      {
        "name": "Follow-Up, Natural weapon",
        "type": "Simple",
        "percentage": 0
      },
      {
        "name": "Follow-Up, Universal",
        "type": "Simple",
        "percentage": 50
      },
      {
        "name": "Force Field",
        "type": "Simple",
        "percentage": 20
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
        "percentage": 20,
        "isAttackModifier": true
      },
      {
        "name": "Full Power in Emergencies Only",
        "type": "Simple",
        "percentage": -20
      },
      {
        "name": "Game Time",
        "type": "Simple",
        "percentage": 0
      },
      {
        "name": "Glamour",
        "type": "Leveled",
        "valuePerLevel": -5
      },
      {
        "name": "Granted by (Other)",
        "type": "Simple",
        "percentage": -40
      },
      {
        "name": "Guided",
        "type": "Simple",
        "percentage": 50,
        "isAttackModifier": true
      },
      {
        "name": "Hard to Use",
        "type": "Leveled",
        "maxLevel": 4,
        "valuePerLevel": -5
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
        "name": "Immediate Preparation Required",
        "type": "Variable",
        "levelValues": [-30, -45, -75, -90]
      },
      {
        "name": "Inaccurate",
        "type": "Leveled",
        "isAttackModifier": true,
        "valuePerLevel": -5
      },
      {
        "name": "Incendiary, Burning",
        "type": "Leveled",
        "isAttackModifier": true,
        "valuePerLevel": 10
      },
      {
        "name": "Incendiary, Non-burning",
        "type": "Simple",
        "percentage": 10,
        "isAttackModifier": true
      },
      {
        "name": "Increased Immunity",
        "type": "Leveled",
        "maxLevel": 4,
        "valuePerLevel": -10
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
        "percentage": 40
      },
      {
        "name": "Independent, Simultaneous uses",
        "type": "Simple",
        "percentage": 70
      },
      {
        "name": "Informal",
        "type": "Simple",
        "percentage": -50
      },
      {
        "name": "Insubstantial Only",
        "type": "Simple",
        "percentage": -30
      },
      {
        "name": "Jet",
        "type": "Simple",
        "percentage": 0,
        "isAttackModifier": true
      },
      {
        "name": "Limited Use",
        "type": "Leveled",
        "maxLevel": 4,
        "valuePerLevel": -10
      },
      {
        "name": "Limited Use, Fast Reload",
        "type": "Leveled",
        "maxLevel": 4,
        "valuePerLevel": -5
      },
      {
        "name": "Limited Use, Slow Reload",
        "type": "Leveled",
        "baseValue": 5,
        "maxLevel": 4,
        "valuePerLevel": -10
      },
      {
        "name": "Link, Independent",
        "type": "Simple",
        "percentage": 20
      },
      {
        "name": "Link, Permanent",
        "type": "Simple",
        "percentage": 10
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
        "percentage": 10,
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
        "percentage": -50
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
        "name": "Mana-Sensitive",
        "type": "Simple",
        "percentage": -10
      },
      {
        "name": "Maximum Duration",
        "type": "Variable",
        "levelValues": [-5, -10, -25, -50, -65, -75]
      },
      {
        "name": "Mental Defense Only",
        "type": "Simple",
        "percentage": 250,
        "isAttackModifier": true
      },
      {
        "name": "Minimum Duration",
        "type": "Leveled",
        "maxLevel": 6,
        "valuePerLevel": -5
      },
      {
        "name": "Minimum Range, 1% Max",
        "type": "Simple",
        "percentage": -5
      },
      {
        "name": "Minimum Range, 5% Max",
        "type": "Simple",
        "percentage": -10
      },
      {
        "name": "Missed Sleep",
        "type": "Simple",
        "percentage": 50,
        "isAttackModifier": true
      },
      {
        "name": "Mitigator, Daily",
        "type": "Simple",
        "percentage": -60
      },
      {
        "name": "Mitigator, Horde Intelligence",
        "type": "Simple",
        "percentage": -60
      },
      {
        "name": "Mitigator, Monthly",
        "type": "Simple",
        "percentage": -70
      },
      {
        "name": "Mitigator, Vulnerable",
        "type": "Simple",
        "percentage": -60
      },
      {
        "name": "Mitigator, Weekly",
        "type": "Simple",
        "percentage": -65
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
        "name": "No Blunt Trauma",
        "type": "Simple",
        "percentage": -20,
        "isAttackModifier": true
      },
      {
        "name": "No DR Reduction",
        "type": "Simple",
        "percentage": -20,
        "isAttackModifier": true
      },
      {
        "name": "No Incendiary Effect",
        "type": "Simple",
        "percentage": -10,
        "isAttackModifier": true
      },
      {
        "name": "No Knockback",
        "type": "Simple",
        "percentage": -10,
        "isAttackModifier": true
      },
      {
        "name": "No Signature",
        "type": "Simple",
        "percentage": 20,
        "isAttackModifier": true
      },
      {
        "name": "No Wounding",
        "type": "Simple",
        "percentage": -10,
        "isAttackModifier": true
      },
      {
        "name": "Nuisance Effect, Reaction penalty",
        "type": "Leveled",
        "maxLevel": 4,
        "valuePerLevel": -5
      },
      {
        "name": "Once On, Stays On",
        "type": "Simple",
        "percentage": 50
      },
      {
        "name": "Only When Berserk",
        "type": "Simple",
        "percentage": -20
      },
      {
        "name": "Onset",
        "type": "Leveled",
        "isAttackModifier": true,
        "maxLevel": 4,
        "valuePerLevel": -10
      },
      {
        "name": "Overhead",
        "type": "Simple",
        "percentage": 30,
        "isAttackModifier": true
      },
      {
        "name": "Periodic Recharge",
        "type": "Variable",
        "levelValues": [-5, -10, -20, -40, -80]
      },
      {
        "name": "Persistent",
        "type": "Simple",
        "percentage": 40,
        "isAttackModifier": true
      },
      {
        "name": "Preparation Required",
        "type": "Variable",
        "levelValues": [-20, -30, -50, -60]
      },
      {
        "name": "Radiation, Burning",
        "type": "Simple",
        "percentage": 100,
        "isAttackModifier": true
      },
      {
        "name": "Radiation, Toxic",
        "type": "Simple",
        "percentage": 25,
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
        "name": "Reduced Duration",
        "type": "Leveled",
        "maxLevel": 7,
        "valuePerLevel": -5
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
        "maxLevel": 10,
        "valuePerLevel": 5
      },
      {
        "name": "Requires (Attribute) Roll, DX or IQ or HT",
        "type": "Simple",
        "percentage": -10
      },
      {
        "name": "Requires (Attribute) Roll, Per or Will",
        "type": "Simple",
        "percentage": -5
      },
      {
        "name": "Requires (Attribute) Roll, Quick Contest of DX or IQ or HT",
        "type": "Simple",
        "percentage": -20
      },
      {
        "name": "Requires (Attribute) Roll, Quick Contest of Per or Will",
        "type": "Simple",
        "percentage": -15
      },
      {
        "name": "Requires (Attribute) Roll, Quick Contest replaces Attribute roll",
        "type": "Simple",
        "percentage": -10
      },
      {
        "name": "Requires (Skill) Roll, DX- or IQ- or HT-Based Average or harder",
        "type": "Simple",
        "percentage": -10
      },
      {
        "name": "Requires (Skill) Roll, DX- or IQ- or HT-Based Easy",
        "type": "Simple",
        "percentage": -5
      },
      {
        "name": "Requires (Skill) Roll, Per- or Will-Based Average or harder",
        "type": "Simple",
        "percentage": -5
      },
      {
        "name": "Requires Concentrate",
        "type": "Simple",
        "percentage": -15
      },
      {
        "name": "Requires Low Gravity",
        "type": "Leveled",
        "maxLevel": 10,
        "valuePerLevel": -5
      },
      {
        "name": "Requires Reaction Roll",
        "type": "Simple",
        "percentage": -5
      },
      {
        "name": "Requires Ready",
        "type": "Simple",
        "percentage": -10
      },
      {
        "name": "Resistible",
        "type": "Leveled",
        "isAttackModifier": true,
        "valuePerLevel": -5
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
        "name": "Short-Range",
        "type": "Leveled",
        "maxLevel": 3,
        "valuePerLevel": -10
      },
      {
        "name": "Skill Enhancement Only",
        "type": "Simple",
        "percentage": -60
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
        "name": "Substantial Only",
        "type": "Simple",
        "percentage": -10
      },
      {
        "name": "Suffocation",
        "type": "Simple",
        "percentage": 0,
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
        "name": "Time-Spanning, Past and future only",
        "type": "Simple",
        "percentage": 50
      },
      {
        "name": "Time-Spanning, Past or future only",
        "type": "Simple",
        "percentage": 0
      },
      {
        "name": "Time-Spanning, Past or future plus present",
        "type": "Simple",
        "percentage": 50
      },
      {
        "name": "Time-Spanning, Universal",
        "type": "Simple",
        "percentage": 100
      },
      {
        "name": "Unconscious Only",
        "type": "Simple",
        "percentage": -20
      },
      {
        "name": "Uncontrollable, Dangerous",
        "type": "Simple",
        "percentage": -30
      },
      {
        "name": "Uncontrollable, Inconvenient",
        "type": "Simple",
        "percentage": -10
      },
      {
        "name": "Underwater",
        "type": "Simple",
        "percentage": 20,
        "isAttackModifier": true
      },
      {
        "name": "Unique",
        "type": "Simple",
        "percentage": -25
      },
      {
        "name": "Unsupported",
        "type": "Simple",
        "percentage": -25
      },
      {
        "name": "Untrainable",
        "type": "Simple",
        "percentage": -40
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
        "name": "Visible, Attack",
        "type": "Simple",
        "percentage": -20
      },
      {
        "name": "Visible, Non-Attack",
        "type": "Simple",
        "percentage": -10
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
        "name": "Weakened Without Preparation",
        "type": "Variable",
        "levelValues": [-10, -15, -25, -30]
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
