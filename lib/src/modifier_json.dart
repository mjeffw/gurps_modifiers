String modifierDataString = '''
{
  "modifiers": [
    {
      "name": "Accessibility",
      "type": "NamedVariant",
      "variations": {
        "Only at day": -20,
        "Only at night": -20,
        "Only by one side of split personality": -40,
        "Only during full moon": -40,
        "Only during new moon": -40,
        "Only in altered body form": -10,
        "Only in direct sunlight": -30,
        "Only on those who share a language with me": -10,
        "Only while flying": -30,
        "Only while in hypnotic trance": -30,
        "Only while playing musical instrument": -20,
        "Only while swimming": -30,
        "Only while moving 1 step/turn": -10,
        "Only while moving (half Move)": -20,
        "Only while moving (full Move)": -30,
        "Requires gestures": -10,
        "Requires magic words": -10,
        "Requires material component": -10,
        "Requires extremely rare material component": -15,
        "Requires simple ritual": -5,
        "Requires typical ritual": -10,
        "Requires complex ritual": -20,
        "Requires (item)": -10,
        "Useless under stress": -60,
        "While conscious": -5
      }
    },
    {
      "name": "Accurate",
      "isAttackModifier": true,
      "valuePerLevel": 5,
      "type": "Leveled"
    },
    {
      "name": "Active Defense",
      "type": "NamedVariant",
      "percentage": -40,
      "variations": {
        "Independent": -20
      }
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
      "variations": {
        "Selective": 30
      }
    },
    {
      "name": "Affects Others",
      "valuePerLevel": 50,
      "levelPrompt": "Number affected",
      "type": "Leveled",
      "formatter": {
        "type": "Level",
        "template": "%name, %f subject%s"
      }
    },
    {
      "name": "Affects Substantial",
      "type": "NamedVariant",
      "percentage": 40,
      "variations": {
        "Selective": 50
      }
    },
    {
      "name": "All-Out",
      "type": "NamedVariant",
      "percentage": -25,
      "variations": {
        "Concentrate": -25
      }
    },
    {
      "name": "Always On",
      "type": "NamedVariant",
      "default": "Social or Cosmetic",
      "variations": {
        "Social or Cosmetic": -10,
        "Inconvenient": -20,
        "Dangerous": -40
      }
    },
    {
      "name": "AP Ammo",
      "isAttackModifier": true,
      "type": "NamedVariant",
      "default": "Piercing",
      "variations": {
        "Piercing": 20,
        "Large Piercing": 35,
        "Huge Piercing": 45
      }
    },
    {
      "name": "Area Effect",
      "isAttackModifier": true,
      "valuePerLevel": 50,
      "levelPrompt": "Radius (yards)",
      "type": "Leveled",
      "formatter": {
        "type": "Exponent",
        "template": "%name, %f yards",
        "a": 1,
        "b": 2
      }
    },
    {
      "name": "Armor Divisor",
      "isAttackModifier": true,
      "type": "NamedVariant",
      "default": "(2)",
      "variations": {
        "(2)": 50,
        "(3)": 100,
        "(5)": 150,
        "(10)": 200,
        "(0.5)": -30,
        "(0.2)": -50,
        "(0.1)": -70
      },
      "formatter": {
        "template": "%name %detail"
      }
    },
    {
      "name": "Aspected",
      "type": "Simple",
      "percentage": -20
    },
    {
      "name": "Attracts Threats",
      "type": "NamedVariant",
      "default": "6 or less",
      "variations": {
        "6 or less": -5,
        "9 or less": -10
      }
    },
    {
      "name": "Aura",
      "isAttackModifier": true,
      "type": "Simple",
      "percentage": 80
    },
    {
      "name": "Based On",
      "type": "Simple",
      "percentage": 20,
      "default": "(Attribute)",
      "formatter": {
        "template": "Based On %detail"
      }
    },
    {
      "name": "Based On, Own Roll",
      "type": "Simple",
      "percentage": 20,
      "default": "(Attribute)",
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
      "name": "Bombardment",
      "isAttackModifier": true,
      "type": "NamedVariant",
      "default": "Skill 12",
      "variations": {
        "Skill 8": -20,
        "Skill 10": -15,
        "Skill 12": -10,
        "Skill 14": -5
      }
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
      "name": "Can Be Stolen",
      "type": "NamedVariant",
      "default": "Easily",
      "variations": {
        "Easily": -40,
        "Quick Contest": -30,
        "Stealth/Trickery": -20,
        "Forcefully": -10
      }
    },
    {
      "name": "Can Carry Objects",
      "type": "NamedVariant",
      "default": "No encumbrance",
      "variations": {
        "No encumbrance": 10,
        "Light": 20,
        "Medium": 50,
        "Heavy": 100,
        "Extra Heavy": 150
      }
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
      "isAttackModifier": true,
      "baseValue": 50,
      "valuePerLevel": 10,
      "type": "Leveled"
    },
    {
      "name": "Cosmic",
      "type": "Categorized",
      "default": "Adding Utility",
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
      "valuePerLevel": -5,
      "type": "Leveled"
    },
    {
      "name": "Costs Fatigue, Per second",
      "valuePerLevel": -10,
      "type": "Leveled"
    },
    {
      "name": "Costs Hit Points",
      "valuePerLevel": -10,
      "type": "Leveled"
    },
    {
      "name": "Costs Hit Points, Instead of Fatigue",
      "valuePerLevel": -5,
      "type": "Leveled"
    },
    {
      "name": "Costs Hit Points, Per second",
      "valuePerLevel": -20,
      "type": "Leveled"
    },
    {
      "name": "Costs Hit Points, Per second instead of Fatigue",
      "valuePerLevel": -10,
      "type": "Leveled"
    },
    {
      "name": "Cyclic",
      "isAttackModifier": true,
      "type": "Cyclic"
    },
    {
      "name": "Decreased Immunity",
      "maxLevel": 4,
      "valuePerLevel": 50,
      "type": "Leveled"
    },
    {
      "name": "Decreased Immunity 0",
      "type": "Simple",
      "percentage": 20
    },
    {
      "name": "Dehydration",
      "isAttackModifier": true,
      "type": "Simple",
      "percentage": 20
    },
    {
      "name": "Delay",
      "isAttackModifier": true,
      "type": "NamedVariant",
      "default": "Fixed",
      "variations": {
        "Fixed": 0,
        "Variable, short": 10,
        "Variable, long": 20,
        "Supernatural, fixed": 50,
        "Triggered": 50,
        "Supernatural, variable": 100
      }
    },
    {
      "name": "Destructive Parry",
      "isAttackModifier": true,
      "type": "Simple",
      "percentage": 10
    },
    {
      "name": "Dissipation",
      "isAttackModifier": true,
      "type": "Simple",
      "percentage": -50
    },
    {
      "name": "Double Blunt Trauma",
      "isAttackModifier": true,
      "type": "Simple",
      "percentage": 20
    },
    {
      "name": "Double Knockback",
      "isAttackModifier": true,
      "type": "Simple",
      "percentage": 20
    },
    {
      "name": "Drifting",
      "isAttackModifier": true,
      "type": "Simple",
      "percentage": 20
    },
    {
      "name": "Drowning",
      "isAttackModifier": true,
      "type": "Simple",
      "percentage": 0
    },
    {
      "name": "Dual",
      "isAttackModifier": true,
      "type": "Simple",
      "percentage": 10
    },
    {
      "name": "Easily Resisted",
      "valuePerLevel": -5,
      "type": "Leveled"
    },
    {
      "name": "Emanation",
      "isAttackModifier": true,
      "type": "Simple",
      "percentage": -20
    },
    {
      "name": "Emergencies Only",
      "type": "Simple",
      "percentage": -30
    },
    {
      "name": "Environmental",
      "type": "Categorized",
      "default": "Very Common",
      "categories": [
        {
          "name": "Very Common",
          "cost": -5,
          "items": [
            "In a gravity field",
            "In air",
            "On a planet"
          ]
        },
        {
          "name": "Common",
          "cost": -10,
          "items": [
            "In contact with dust",
            "In the presence of microbes"
          ]
        },
        {
          "name": "Occasional",
          "cost": -20,
          "items": [
            "In a city",
            "In the wilderness",
            "Outdoors",
            "Touching the ground"
          ]
        },
        {
          "name": "Rare",
          "cost": -40,
          "items": [
            "In a storm",
            "In dense vegetation",
            "In the desert",
            "Underground"
          ]
        },
        {
          "name": "Very Rare",
          "cost": -80,
          "items": [
            "In lava",
            "In quicksand",
            "In vacuum"
          ]
        }
      ]
    },
    {
      "name": "Erosive",
      "isAttackModifier": true,
      "type": "Simple",
      "percentage": 10
    },
    {
      "name": "Explosion",
      "isAttackModifier": true,
      "valuePerLevel": 50,
      "type": "Leveled"
    },
    {
      "name": "Exposure Time",
      "isAttackModifier": true,
      "maxLevel": 4,
      "baseValue": -20,
      "valuePerLevel": -10,
      "type": "Leveled"
    },
    {
      "name": "Extended Duration",
      "type": "NamedVariant",
      "default": "3x",
      "variations": {
        "3x": 20,
        "10x": 40,
        "30x": 60,
        "100x": 80,
        "300x": 100,
        "1,000x": 120,
        "Permanent but dispellable": 150,
        "Permanent": 300
      }
    },
    {
      "name": "Extra Passes",
      "isAttackModifier": true,
      "valuePerLevel": 10,
      "type": "Leveled"
    },
    {
      "name": "Extra Recoil",
      "isAttackModifier": true,
      "maxLevel": 4,
      "valuePerLevel": -10,
      "type": "Leveled"
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
      "isAttackModifier": true,
      "type": "NamedVariant",
      "default": "Natural weapon",
      "variations": {
        "Natural weapon": 0,
        "Universal": 50,
        "Passive carrier": -50
      }
    },
    {
      "name": "Force Field",
      "type": "Simple",
      "percentage": 20
    },
    {
      "name": "Fragmentation",
      "isAttackModifier": true,
      "type": "Leveled_Named_Variant",
      "default": "Cutting",
      "variations": {
        "Cutting": 15,
        "Hot": 15,
        "Impaling": 20,
        "Large Piercing": 15
      },
      "formatter": {
        "type": "Level",
        "template": "%name, %fd %detail",
        "detailAlias": {
          "aliases": {
            "Cutting": "cut",
            "Hot": "burn",
            "Impaling": "imp",
            "Large Piercing": "pi+"
          }
        }
      }
    },
    {
      "name": "Freezing",
      "isAttackModifier": true,
      "type": "Simple",
      "percentage": 20
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
      "valuePerLevel": -5,
      "type": "Leveled"
    },
    {
      "name": "Granted by (Other)",
      "type": "Simple",
      "percentage": -40,
      "default": "(Other)",
      "formatter": {
        "template": "Granted by %detail"
      }
    },
    {
      "name": "Guided",
      "isAttackModifier": true,
      "type": "Simple",
      "percentage": 50
    },
    {
      "name": "Hard to Use",
      "maxLevel": 4,
      "valuePerLevel": -5,
      "type": "Leveled"
    },
    {
      "name": "Heat",
      "isAttackModifier": true,
      "type": "Simple",
      "percentage": 20
    },
    {
      "name": "HP Ammo",
      "isAttackModifier": true,
      "type": "NamedVariant",
      "default": "Piercing",
      "variations": {
        "Piercing": 20,
        "Large Piercing": 20,
        "Small Piercing": 40
      }
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
      "isAttackModifier": true,
      "valuePerLevel": -5,
      "type": "Leveled"
    },
    {
      "name": "Incendiary",
      "isAttackModifier": true,
      "maxLevel": 4,
      "valuePerLevel": 10,
      "type": "Leveled"
    },
    {
      "name": "Increased 1/2D",
      "valuePerLevel": 5,
      "type": "Leveled",
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
      "maxLevel": 4,
      "valuePerLevel": -10,
      "type": "Leveled"
    },
    {
      "name": "Increased Max",
      "valuePerLevel": 5,
      "type": "Leveled",
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
      "valuePerLevel": 10,
      "type": "Leveled",
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
      "variations": {
        "Simultaneous uses": 70
      }
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
      "isAttackModifier": true,
      "type": "Simple",
      "percentage": 0
    },
    {
      "name": "Limited Use",
      "maxLevel": 4,
      "valuePerLevel": -10,
      "type": "Leveled"
    },
    {
      "name": "Limited Use, Fast Reload",
      "maxLevel": 4,
      "valuePerLevel": -5,
      "type": "Leveled"
    },
    {
      "name": "Limited Use, Slow Reload",
      "maxLevel": 4,
      "baseValue": 5,
      "valuePerLevel": -10,
      "type": "Leveled"
    },
    {
      "name": "Link",
      "type": "NamedVariant",
      "percentage": 10,
      "variations": {
        "Independent": 20
      }
    },
    {
      "name": "Long-Range",
      "maxLevel": 4,
      "valuePerLevel": 50,
      "type": "Leveled"
    },
    {
      "name": "Low Psychic Signature",
      "maxLevel": 5,
      "valuePerLevel": 5,
      "type": "Leveled"
    },
    {
      "name": "Low Signature",
      "isAttackModifier": true,
      "type": "Simple",
      "percentage": 10
    },
    {
      "name": "Low Signature, Variable",
      "maxLevel": 5,
      "valuePerLevel": 5,
      "type": "Leveled"
    },
    {
      "name": "Magnetic",
      "type": "Simple",
      "percentage": -50
    },
    {
      "name": "Malediction",
      "isAttackModifier": true,
      "maxLevel": 3,
      "baseValue": 50,
      "valuePerLevel": 50,
      "type": "Leveled"
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
      "isAttackModifier": true,
      "type": "Simple",
      "percentage": 250
    },
    {
      "name": "Minimum Duration",
      "maxLevel": 6,
      "valuePerLevel": -5,
      "type": "Leveled"
    },
    {
      "name": "Minimum Range",
      "type": "NamedVariant",
      "default": "5% Max Range",
      "variations": {
        "5% Max Range": -10,
        "1% Max Range": -5
      }
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
      "isAttackModifier": true,
      "type": "Simple",
      "percentage": 50
    },
    {
      "name": "Mitigator",
      "type": "Categorized",
      "default": "Vulnerable",
      "categories": [
        {
          "name": "Vulnerable",
          "cost": -60,
          "items": [
            "Daily Treatment",
            "Horde Intelligence"
          ]
        },
        {
          "name": "Weekly Treatment",
          "cost": -65,
          "items": []
        },
        {
          "name": "Monthly Treatment",
          "cost": -70,
          "items": []
        }
      ]
    },
    {
      "name": "Mobile",
      "isAttackModifier": true,
      "valuePerLevel": 40,
      "type": "Leveled"
    },
    {
      "name": "Multi-Ammo",
      "isAttackModifier": true,
      "type": "NamedVariant",
      "default": "Piercing",
      "variations": {
        "Piercing": 40,
        "Large Piercing": 65
      }
    },
    {
      "name": "No Blunt Trauma",
      "isAttackModifier": true,
      "type": "Simple",
      "percentage": -20
    },
    {
      "name": "No DR Reduction",
      "isAttackModifier": true,
      "type": "Simple",
      "percentage": -20
    },
    {
      "name": "No Incendiary Effect",
      "isAttackModifier": true,
      "type": "Simple",
      "percentage": -10
    },
    {
      "name": "No Knockback",
      "isAttackModifier": true,
      "type": "Simple",
      "percentage": -10
    },
    {
      "name": "No Signature",
      "isAttackModifier": true,
      "type": "Simple",
      "percentage": 20
    },
    {
      "name": "No Wounding",
      "isAttackModifier": true,
      "type": "Simple",
      "percentage": -10
    },
    {
      "name": "Nuisance Effect, Reaction penalty",
      "maxLevel": 4,
      "valuePerLevel": -5,
      "type": "Leveled"
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
      "isAttackModifier": true,
      "maxLevel": 4,
      "valuePerLevel": -10,
      "type": "Leveled"
    },
    {
      "name": "Overhead",
      "isAttackModifier": true,
      "type": "Simple",
      "percentage": 30
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
      "isAttackModifier": true,
      "type": "Simple",
      "percentage": 40
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
      "isAttackModifier": true,
      "type": "NamedVariant",
      "default": "Toxic",
      "variations": {
        "Toxic": 25,
        "Burning": 100
      }
    },
    {
      "name": "Radiation, Burning",
      "isAttackModifier": true,
      "type": "Simple",
      "percentage": 100
    },
    {
      "name": "Radiation, Toxic",
      "isAttackModifier": true,
      "type": "Simple",
      "percentage": 25
    },
    {
      "name": "Ranged",
      "type": "Simple",
      "percentage": 40
    },
    {
      "name": "Rapid Fire",
      "isAttackModifier": true,
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
      ]
    },
    {
      "name": "Rapid Fire, Selective",
      "isAttackModifier": true,
      "type": "Variable",
      "levelValues": [
        80,
        110,
        160,
        210,
        260,
        310
      ]
    },
    {
      "name": "Reduced Duration",
      "maxLevel": 7,
      "valuePerLevel": -5,
      "type": "Leveled"
    },
    {
      "name": "Reduced Fatigue Cost",
      "valuePerLevel": 20,
      "type": "Leveled"
    },
    {
      "name": "Reduced Time",
      "valuePerLevel": 20,
      "type": "Leveled"
    },
    {
      "name": "Reflexive",
      "type": "Simple",
      "percentage": 40
    },
    {
      "name": "Reliable",
      "maxLevel": 10,
      "valuePerLevel": 5,
      "type": "Leveled"
    },
    {
      "name": "Requires (Attribute) Roll",
      "type": "NamedVariant",
      "default": "DX",
      "variations": {
        "DX": -10,
        "DX vs. <Other>": -20,
        "HT": -10,
        "HT vs. <Other>": -20,
        "IQ": -10,
        "IQ vs. <Other>": -20,
        "Will": -5,
        "Will vs. <Other>": -15,
        "Per": -5,
        "Per vs. <Other>": -15
      },
      "formatter": {
        "template": "Requires %detail Roll"
      }
    },
    {
      "name": "Requires (Quick Contest replaces Attribute) Roll",
      "type": "NamedVariant",
      "percentage": -10,
      "default": "DX",
      "variations": {
        "DX": -10,
        "HT": -10,
        "IQ": -10,
        "Will": -10,
        "Per": -10
      },
      "formatter": {
        "template": "Requires %detail vs. <Other> Roll, replaces Attribute roll"
      }
    },
    {
      "name": "Requires (Skill) Roll",
      "type": "Categorized",
      "default": "DX/Average Skill",
      "categories": [
        {
          "name": "DX, IQ, or HT/Easy Skill",
          "cost": -5,
          "items": [
            "DX/Easy Skill",
            "HT/Easy Skill",
            "IQ/Easy Skill"
          ]
        },
        {
          "name": "DX, IQ, or HT/Average Skill",
          "cost": -10,
          "items": [
            "DX/Average Skill",
            "HT/Average Skill",
            "IQ/Average Skill"
          ]
        },
        {
          "name": "DX, IQ, or HT/Hard Skill",
          "cost": -10,
          "items": [
            "DX/Hard Skill",
            "HT/Hard Skill",
            "IQ/Hard Skill"
          ]
        },
        {
          "name": "DX, IQ, or HT/Very Hard Skill",
          "cost": -10,
          "items": [
            "DX/Very Hard Skill",
            "HT/Very Hard Skill",
            "IQ/Very Hard Skill"
          ]
        },
        {
          "name": "Per or Will/Easy Skill",
          "cost": 0,
          "items": [
            "Per/Easy Skill",
            "Will/Easy Skill"
          ]
        },
        {
          "name": "Per or Will/Average Skill",
          "cost": -5,
          "items": [
            "Per/Average Skill",
            "Will/Average Skill"
          ]
        },
        {
          "name": "Per or Will/Hard Skill",
          "cost": -5,
          "items": [
            "Per/Hard Skill",
            "Will/Hard Skill"
          ]
        },
        {
          "name": "Per or Will/Very Hard Skill",
          "cost": -5,
          "items": [
            "Per/Very Hard Skill",
            "Will/Very Hard Skill"
          ]
        }
      ],
      "formatter": {
        "template": "Requires %detail Roll"
      }
    },
    {
      "name": "Requires Concentrate",
      "type": "Simple",
      "percentage": -15
    },
    {
      "name": "Requires Low Gravity",
      "maxLevel": 10,
      "valuePerLevel": -5,
      "type": "Leveled"
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
      "isAttackModifier": true,
      "valuePerLevel": -5,
      "type": "Leveled"
    },
    {
      "name": "Respiratory Agent",
      "isAttackModifier": true,
      "type": "Simple",
      "percentage": 50
    },
    {
      "name": "Ricochet",
      "isAttackModifier": true,
      "type": "Simple",
      "percentage": 10
    },
    {
      "name": "Selective Area",
      "isAttackModifier": true,
      "type": "Simple",
      "percentage": 20
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
      "maxLevel": 3,
      "valuePerLevel": -10,
      "type": "Leveled"
    },
    {
      "name": "Skill Enhancement Only",
      "type": "Simple",
      "percentage": -60
    },
    {
      "name": "ST-Based",
      "isAttackModifier": true,
      "type": "Simple",
      "percentage": 100
    },
    {
      "name": "ST-Based, Limited",
      "isAttackModifier": true,
      "type": "Simple",
      "percentage": 30
    },
    {
      "name": "Starvation",
      "isAttackModifier": true,
      "type": "Simple",
      "percentage": 40
    },
    {
      "name": "Substantial Only",
      "type": "Simple",
      "percentage": -10
    },
    {
      "name": "Suffocation",
      "isAttackModifier": true,
      "type": "Simple",
      "percentage": 0
    },
    {
      "name": "Super Attribute",
      "type": "Simple",
      "percentage": 25
    },
    {
      "name": "Surge",
      "isAttackModifier": true,
      "type": "NamedVariant",
      "percentage": 20,
      "variations": {
        "Arcing": 100
      }
    },
    {
      "name": "Surprise Attack",
      "isAttackModifier": true,
      "type": "Simple",
      "percentage": 150
    },
    {
      "name": "Switchable",
      "type": "Simple",
      "percentage": 10
    },
    {
      "name": "Thrusting Blade",
      "isAttackModifier": true,
      "type": "Simple",
      "percentage": 15
    },
    {
      "name": "Time-Spanning",
      "type": "NamedVariant",
      "default": "Past or future",
      "variations": {
        "Past or future": 50,
        "Past or future only": 0,
        "Universal": 100,
        "Past and future only": 50
      }
    },
    {
      "name": "Unconscious Only",
      "type": "Simple",
      "percentage": -20
    },
    {
      "name": "Uncontrollable",
      "type": "NamedVariant",
      "default": "Inconvenient",
      "variations": {
        "Inconvenient": -10,
        "Dangerous": -30
      }
    },
    {
      "name": "Underwater",
      "isAttackModifier": true,
      "type": "Simple",
      "percentage": 20
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
      "isAttackModifier": true,
      "type": "Simple",
      "percentage": 5
    },
    {
      "name": "Visible",
      "type": "NamedVariant",
      "percentage": -10,
      "variations": {
        "Allows Defense Roll": -20
      }
    },
    {
      "name": "Wall",
      "isAttackModifier": true,
      "type": "NamedVariant",
      "percentage": 30,
      "variations": {
        "Variable": 60
      }
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
      "variations": {
        "Others only": 50,
        "Others plus current": 100
      }
    }
  ]
}''';
