String modifierDataString = '''
{
  "modifiers": [
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
      "percentage": 20,
      "variations": [
        {
          "key": "Selective",
          "value": 30
        }
      ]
    },
    {
      "name": "Affects Others",
      "type": "Leveled",
      "valuePerLevel": 50,
      "levelPrompt": "Number affected",
      "formatter": {
        "type": "Level",
        "template": "%name, %f subject%s"
      }
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
      "name": "AP Ammo",
      "type": "NamedVariant",
      "default": "Piercing",
      "isAttackModifier": true,
      "variations": [
        {
          "key": "Piercing",
          "value": 20
        },
        {
          "key": "Large Piercing",
          "value": 35
        },
        {
          "key": "Huge Piercing",
          "value": 45
        }
      ]
    },
    {
      "name": "Area Effect",
      "type": "Leveled",
      "isAttackModifier": true,
      "valuePerLevel": 50,
      "levelPrompt": "Radius (yards)",
      "formatter": {
        "type": "Exponent",
        "template": "%name, %f yards",
        "a": 1,
        "b": 2
      }
    },
    {
      "name": "Armor Divisor",
      "type": "NamedVariant",
      "default": "(2)",
      "isAttackModifier": true,
      "variations": [
        {
          "key": "(2)",
          "value": 50
        },
        {
          "key": "(3)",
          "value": 100
        },
        {
          "key": "(5)",
          "value": 150
        },
        {
          "key": "(10)",
          "value": 200
        },
        {
          "key": "(0.5)",
          "value": -30
        },
        {
          "key": "(0.2)",
          "value": -50
        },
        {
          "key": "(0.1)",
          "value": -70
        }
      ]
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
      "percentage": 20,
      "defaultDetail": "(Attribute)",
      "formatter": {
        "template": "Based On %detail"
      }
    },
    {
      "name": "Based On, Own Roll",
      "type": "Simple",
      "percentage": 20,
      "defaultDetail": "(Attribute)",
      "formatter": {
        "template": "Based On %detail, Own Roll"
      }
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
      "type": "NamedVariant",
      "default": "No encumbrance",
      "variations": [
        {
          "key": "No encumbrance",
          "value": 10
        },
        {
          "key": "Light",
          "value": 20
        },
        {
          "key": "Medium",
          "value": 50
        },
        {
          "key": "Heavy",
          "value": 100
        },
        {
          "key": "Extra Heavy",
          "value": 150
        }
      ]
    },
    {
      "name": "Cardiac Stress",
      "type": "Variable",
      "levelValues": [
        -50,
        -40,
        -30,
        -20,
        -10
      ]
    },
    {
      "name": "Cerebral Stress",
      "type": "Variable",
      "levelValues": [
        -50,
        -40,
        -30,
        -20,
        -10
      ]
    },
    {
      "name": "Cone",
      "type": "Leveled",
      "baseValue": 50,
      "isAttackModifier": true,
      "valuePerLevel": 10
    },
    {
      "name": "Cosmic",
      "type": "Categorized",
      "defaultDetail": "Adding Utility",
      "categories": [
        {
          "name": "Adding Utility",
          "cost": 50,
          "items": [
            "Avoiding drawbacks",
            "Defensive",
            "No Rule of 16",
            "Privileged attack"
          ]
        },
        {
          "name": "Cheating",
          "cost": 100,
          "items": [
            "Lingering effect",
            "No die roll required",
            "Unhealing damage"
          ]
        },
        {
          "name": "Godlike Tricks",
          "cost": 300,
          "items": [
            "Irresistible attack",
            "No active defense allowed",
            "Unrestricted powers"
          ]
        }
      ]
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
      "name": "Delay",
      "type": "NamedVariant",
      "default": "Fixed",
      "isAttackModifier": true,
      "variations": [
        {
          "key": "Fixed",
          "value": 0
        },
        {
          "key": "Variable, short",
          "value": 10
        },
        {
          "key": "Variable, long",
          "value": 20
        },
        {
          "key": "Supernatural, fixed",
          "value": 50
        },
        {
          "key": "Triggered",
          "value": 50
        },
        {
          "key": "Supernatural, variable",
          "value": 100
        }
      ]
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
      "type": "NamedVariant",
      "default": "3x",
      "variations": [
        {
          "key": "3x",
          "value": 20
        },
        {
          "key": "10x",
          "value": 40
        },
        {
          "key": "30x",
          "value": 60
        },
        {
          "key": "100x",
          "value": 80
        },
        {
          "key": "300x",
          "value": 100
        },
        {
          "key": "1,000x",
          "value": 120
        },
        {
          "key": "Permanent but dispellable",
          "value": 150
        },
        {
          "key": "Permanent",
          "value": 300
        }
      ]
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
      "name": "Follow-Up",
      "type": "NamedVariant",
      "default": "Natural weapon",
      "isAttackModifier": true,
      "variations": [
        {
          "key": "Natural weapon",
          "value": 0
        },
        {
          "key": "Universal",
          "value": 50
        },
        {
          "key": "Passive carrier",
          "value": -50
        }
      ]
    },
    {
      "name": "Force Field",
      "type": "Simple",
      "percentage": 20
    },
    {
      "name": "Fragmentation",
      "type": "Leveled_Named_Variant",
      "isAttackModifier": true,
      "default": "Cutting",
      "variations": [
        {
          "key": "Cutting",
          "value": 15
        },
        {
          "key": "Hot",
          "value": 15
        },
        {
          "key": "Impaling",
          "value": 20
        },
        {
          "key": "Large Piercing",
          "value": 15
        }
      ],
      "formatter": {
        "type": "Alias",
        "template": "%name, %fd %detail",
        "aliases": {
          "Cutting": "cut",
          "Hot": "burn",
          "Impaling": "imp",
          "Large Piercing": "pi+"
        }
      }
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
      "name": "HP Ammo",
      "type": "NamedVariant",
      "default": "Piercing",
      "isAttackModifier": true,
      "variations": [
        {
          "key": "Piercing",
          "value": 20
        },
        {
          "key": "Large Piercing",
          "value": 20
        },
        {
          "key": "Small Piercing",
          "value": 40
        }
      ]
    },
    {
      "name": "Immediate Preparation Required",
      "type": "Variable",
      "levelValues": [
        -30,
        -45,
        -75,
        -90
      ]
    },
    {
      "name": "Inaccurate",
      "type": "Leveled",
      "isAttackModifier": true,
      "valuePerLevel": -5
    },
    {
      "name": "Incendiary",
      "type": "Leveled",
      "isAttackModifier": true,
      "maxLevel": 4,
      "valuePerLevel": 10
    },
    {
      "name": "Increased 1/2D",
      "type": "Leveled",
      "valuePerLevel": 5,
      "formatter": {
        "type": "Pattern",
        "template": "%name, %fx",
        "pattern": [
          2,
          5,
          10
        ]
      }
    },
    {
      "name": "Increased Immunity",
      "type": "Leveled",
      "maxLevel": 4,
      "valuePerLevel": -10
    },
    {
      "name": "Increased Max",
      "type": "Leveled",
      "valuePerLevel": 5,
      "formatter": {
        "type": "Pattern",
        "template": "%name, %fx",
        "pattern": [
          2,
          5,
          10
        ]
      }
    },
    {
      "name": "Increased Range",
      "type": "Leveled",
      "valuePerLevel": 10,
      "formatter": {
        "type": "Pattern",
        "template": "%name, %fx",
        "pattern": [
          2,
          5,
          10
        ]
      }
    },
    {
      "name": "Increased Range, LOS",
      "type": "Variable",
      "levelValues": [
        90,
        80,
        70,
        60,
        50,
        40,
        30,
        20,
        10,
        0
      ]
    },
    {
      "name": "Independent",
      "type": "NamedVariant",
      "percentage": 40,
      "variations": [
        {
          "key": "Simultaneous uses",
          "value": 70
        }
      ]
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
      "name": "Link",
      "type": "NamedVariant",
      "percentage": 10,
      "variations": [
        {
          "key": "Independent",
          "value": 20
        }
      ]
    },
    {
      "name": "Long-Range",
      "type": "Leveled",
      "maxLevel": 4,
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
      "name": "Malediction",
      "type": "Leveled",
      "baseValue": 50,
      "isAttackModifier": true,
      "maxLevel": 3,
      "valuePerLevel": 50
    },
    {
      "name": "Mana-Sensitive",
      "type": "Simple",
      "percentage": -10
    },
    {
      "name": "Maximum Duration",
      "type": "Variable",
      "levelValues": [
        -5,
        -10,
        -25,
        -50,
        -65,
        -75
      ]
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
      "name": "Multi-Ammo",
      "type": "NamedVariant",
      "default": "Piercing",
      "isAttackModifier": true,
      "variations": [
        {
          "key": "Piercing",
          "value": 40
        },
        {
          "key": "Large Piercing",
          "value": 65
        }
      ]
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
      "levelValues": [
        -5,
        -10,
        -20,
        -40,
        -80
      ]
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
      "levelValues": [
        -20,
        -30,
        -50,
        -60
      ]
    },
    {
      "name": "Radiation",
      "type": "NamedVariant",
      "default": "Toxic",
      "isAttackModifier": true,
      "variations": [
        {
          "key": "Toxic",
          "value": 25
        },
        {
          "key": "Burning",
          "value": 100
        }
      ]
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
      "levelValues": [
        40,
        50,
        70,
        100,
        150,
        200,
        250,
        300
      ],
      "isAttackModifier": true
    },
    {
      "name": "Rapid Fire, Selective",
      "type": "Variable",
      "levelValues": [
        80,
        110,
        160,
        210,
        260,
        310
      ],
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
      "type": "NamedVariant",
      "percentage": 20,
      "isAttackModifier": true,
      "variations": [
        {
          "key": "Arcing",
          "value": 100
        }
      ]
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
      "name": "Time-Spanning",
      "type": "NamedVariant",
      "default": "Past or future",
      "variations": [
        {
          "key": "Past or future",
          "value": 50
        },
        {
          "key": "Past or future only",
          "value": 0
        },
        {
          "key": "Universal",
          "value": 100
        },
        {
          "key": "Past and future only",
          "value": 50
        }
      ]
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
      "name": "Wall",
      "type": "NamedVariant",
      "percentage": 30,
      "isAttackModifier": true,
      "variations": [
        {
          "key": "Variable",
          "value": 60
        }
      ]
    },
    {
      "name": "Weakened Without Preparation",
      "type": "Variable",
      "levelValues": [
        -10,
        -15,
        -25,
        -30
      ]
    },
    {
      "name": "World-Spanning",
      "type": "NamedVariant",
      "default": "Others only",
      "variations": [
        {
          "key": "Others only",
          "value": 50
        },
        {
          "key": "Others plus current",
          "value": 100
        }
      ]
    }
  ]
}''';
