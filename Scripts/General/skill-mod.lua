----------------------------------------------------------------------------------------------------
-- global constants and lists
----------------------------------------------------------------------------------------------------

-- red distance

local meleeRangeDistance = 307.2

-- masteries text

local masteries =
{
	[const.Novice] = "n",
	[const.Expert] = "e",
	[const.Master] = "m",
}

-- attack types text

local attackTypes =
{
	[const.Damage.Phys] = "Phys",
	[const.Damage.Magic] = "Magic",
	[const.Damage.Fire] = "Fire",
	[const.Damage.Elec] = "Elec",
	[const.Damage.Cold] = "Cold",
	[const.Damage.Poison] = "Poison",
	[const.Damage.Energy] = "Energy",
}

-- missiles

local missiles =
{
	["Arrow"] = 1,
	["FireArrow"] = 2,
	["Fire"] = 3,
	["Elec"] = 4,
	["Cold"] = 5,
	["Poison"] = 6,
	["Energy"] = 7,
	["Magic"] = 8,
	["Rock"] = 9,
}

-- spellTxt id resolver

local spellTxtIds = {}

----------------------------------------------------------------------------------------------------
-- configuration
----------------------------------------------------------------------------------------------------

-- melee recovery cap

local meleeRecoveryCap = 10

--[[
-- attribute breakpoints

local attributeBreakpoints =
{
500,
400,
350,
300,
280,
260,
240,
220,
200,
180,
160,
140,
120,
100,
90,
80,
70,
60,
50,
45,
40,
35,
30,
25,
20,
15,
10,
5,
0,
}
local attributeEffects =
{
100,
80,
70,
60,
56,
52,
48,
44,
40,
36,
32,
28,
24,
20,
18,
16,
14,
12,
10,
9,
8,
7,
6,
5,
4,
3,
2,
1,
0,
}
--]]

-- weapon base recovery bonuses

local oldWeaponBaseRecoveryBonuses =
{
	[const.Skills.Bow] = 0,
	[const.Skills.Blaster] = 70,
	[const.Skills.Staff] = 0,
	[const.Skills.Axe] = 0,
	[const.Skills.Sword] = 10,
	[const.Skills.Spear] = 20,
	[const.Skills.Mace] = 20,
	[const.Skills.Dagger] = 40,
}
local newWeaponBaseRecoveryBonuses =
{
	[const.Skills.Bow] = 0,
	[const.Skills.Blaster] = 100,
	[const.Skills.Staff] = 0,
	[const.Skills.Axe] = 0,
	[const.Skills.Sword] = 10,
	[const.Skills.Spear] = 20,
	[const.Skills.Mace] = 20,
	[const.Skills.Dagger] = 40,
}

-- weapon skill attack bonuses (by rank)

local oldWeaponSkillAttackBonuses =
{
	[const.Skills.Staff]	= {1, 1, 1, },
	[const.Skills.Sword]	= {1, 1, 1, },
	[const.Skills.Dagger]	= {1, 1, 1, },
	[const.Skills.Axe]		= {1, 1, 1, },
	[const.Skills.Spear]	= {1, 1, 1, },
	[const.Skills.Bow]		= {1, 1, 1, },
	[const.Skills.Mace]		= {1, 1, 1, },
	[const.Skills.Blaster]	= {1, 2, 3, },
}
local newWeaponSkillAttackBonuses =
{
	[const.Skills.Staff]	= {2, 3, 4, },
	[const.Skills.Sword]	= {2, 3, 4, },
	[const.Skills.Dagger]	= {2, 3, 4, },
	[const.Skills.Axe]		= {2, 3, 4, },
	[const.Skills.Spear]	= {4, 6, 8, },
	[const.Skills.Bow]		= {2, 3, 4, },
	[const.Skills.Mace]		= {2, 3, 4, },
	[const.Skills.Blaster]	= {2, 4, 6, },
}

-- weapon skill recovery bonuses (by rank)

local oldWeaponSkillRecoveryBonuses =
{
	[const.Skills.Staff]	= {0, 0, 0, },
	[const.Skills.Sword]	= {0, 1, 1, },
	[const.Skills.Dagger]	= {0, 0, 0, },
	[const.Skills.Axe]		= {0, 1, 1, },
	[const.Skills.Spear]	= {0, 0, 0, },
	[const.Skills.Bow]		= {1, 2, 2, },
	[const.Skills.Blaster]	= {0, 0, 0, },
	[const.Skills.Mace]		= {0, 0, 0, },
}
local newWeaponSkillRecoveryBonuses =
{
	[const.Skills.Staff]	= {0, 0, 0, },
	[const.Skills.Sword]	= {0, 4, 4, },
	[const.Skills.Dagger]	= {0, 0, 0, },
	[const.Skills.Axe]		= {0, 2, 2, },
	[const.Skills.Spear]	= {0, 0, 0, },
	[const.Skills.Bow]		= {2, 2, 2, },
	[const.Skills.Mace]		= {0, 0, 0, },
	[const.Skills.Blaster]	= {0, 0, 0, },
}

-- weapon skill damage bonuses (by rank)

local oldWeaponSkillDamageBonuses =
{
	[const.Skills.Staff]	= {0, 0, 0, },
	[const.Skills.Sword]	= {0, 0, 0, },
	[const.Skills.Dagger]	= {0, 0, 0, },
	[const.Skills.Axe]		= {0, 0, 1, },
	[const.Skills.Spear]	= {0, 0, 1, },
	[const.Skills.Bow]		= {0, 0, 0, },
	[const.Skills.Mace]		= {0, 1, 1, },
	[const.Skills.Blaster]	= {0, 0, 0, },
}
local newWeaponSkillDamageBonuses =
{
	[const.Skills.Staff]	= {0, 0, 0, },
	[const.Skills.Sword]	= {0, 0, 1, },
	[const.Skills.Dagger]	= {0, 0, 0, },
	[const.Skills.Axe]		= {1, 2, 3, },
	[const.Skills.Spear]	= {1, 2, 3, },
	[const.Skills.Bow]		= {0, 1, 1, },
	[const.Skills.Mace]		= {1, 2, 3, },
	[const.Skills.Blaster]	= {0, 0, 0, },
}

-- weapon skill AC bonuses (by rank)

local oldWeaponSkillACBonuses =
{
	[const.Skills.Staff]	= {0, 1, 1, },
	[const.Skills.Sword]	= {0, 0, 0, },
	[const.Skills.Dagger]	= {0, 0, 0, },
	[const.Skills.Axe]		= {0, 0, 0, },
	[const.Skills.Spear]	= {0, 1, 1, },
	[const.Skills.Bow]		= {0, 0, 0, },
	[const.Skills.Mace]		= {0, 0, 0, },
	[const.Skills.Blaster]	= {0, 0, 0, },
}
local newWeaponSkillACBonuses =
{
	[const.Skills.Staff]	= {4, 6, 8, },
	[const.Skills.Sword]	= {0, 0, 0, },
	[const.Skills.Dagger]	= {0, 0, 0, },
	[const.Skills.Axe]		= {0, 0, 0, },
	[const.Skills.Spear]	= {0, 0, 0, },
	[const.Skills.Bow]		= {0, 0, 0, },
	[const.Skills.Mace]		= {0, 0, 0, },
	[const.Skills.Blaster]	= {0, 0, 0, },
}

-- weapon skill resistance bonuses (by rank)

local newWeaponSkillResistanceBonuses =
{
	[const.Skills.Staff]	= {0, 1, 2, },
	[const.Skills.Sword]	= {0, 0, 0, },
	[const.Skills.Dagger]	= {0, 0, 0, },
	[const.Skills.Axe]		= {0, 0, 0, },
	[const.Skills.Spear]	= {0, 0, 0, },
	[const.Skills.Bow]		= {0, 0, 0, },
	[const.Skills.Mace]		= {0, 0, 0, },
	[const.Skills.Blaster]	= {0, 0, 0, },
}

-- armor skill AC bonuses (by rank)

local newArmorSkillACBonuses =
{
	[const.Skills.Shield]	= {4, 6, 8, },
	[const.Skills.Leather]	= {2, 3, 4, },
	[const.Skills.Chain]	= {4, 6, 8, },
	[const.Skills.Plate]	= {6, 9,12, },
}

-- armor skill resistance bonuses (by rank)

local newArmorSkillResistanceBonuses =
{
	[const.Skills.Leather]	= {4, 6, 8, },
	[const.Skills.Chain]	= {2, 3, 4, },
	[const.Skills.Plate]	= {0, 0, 0, },
}

-- local recoveryBonusByMastery = {[const.Novice] = 4, [const.Expert] = 5, [const.Master] = 6, }
-- local damageBonusByMastery = {[const.Novice] = 2, [const.Expert] = 3, [const.Master] = 4, }
-- local weaponACBonusByMastery = {[const.Novice] = 4, [const.Expert] = 6, [const.Master] = 8, }
-- local weaponResistanceBonusByMastery = {[const.Novice] = 0, [const.Expert] = 1, [const.Master] = 2, }
local twoHandedWeaponDamageBonus = 2
local twoHandedWeaponDamageBonusByMastery = {[const.Novice] = twoHandedWeaponDamageBonus, [const.Expert] = twoHandedWeaponDamageBonus, [const.Master] = twoHandedWeaponDamageBonus, }
local learningSkillExtraMultiplier = 2
local learningSkillMultiplierByMastery = {[const.Novice] = 1 + learningSkillExtraMultiplier, [const.Expert] = 2 + learningSkillExtraMultiplier, [const.Master] = 3 + learningSkillExtraMultiplier, }

-- special modifiers
local daggerCrowdDamageMultiplier = 0.5

-- special weapon skill chances
local staffEffect = {["base"] = 10, ["multiplier"] = 2, ["duration"] = 5, }
local maceEffect = {["base"] = 5, ["multiplier"] = 1, ["duration"] = 5, }

-- class weapon skill damage bonus
local classMeleeWeaponSkillDamageBonus =
{
	[const.Class.Knight] = 1,
	[const.Class.Cavalier] = 2,
	[const.Class.Champion] = 4,
	[const.Class.Paladin] = 0,
	[const.Class.Crusader] = 1,
	[const.Class.Hero] = 2,
}
local classRangedWeaponSkillAttackBonusMultiplier =
{
	[const.Class.Archer] = 2,
	[const.Class.BattleMage] = 2,
	[const.Class.WarriorMage] = 2,
}
local classRangedWeaponSkillSpeedBonusMultiplier =
{
	[const.Class.Archer] = 0,
	[const.Class.BattleMage] = 0,
	[const.Class.WarriorMage] = 0,
}
local classRangedWeaponSkillDamageBonus =
{
	[const.Class.Archer] = 1,
	[const.Class.BattleMage] = 1,
	[const.Class.WarriorMage] = 1,
}

-- plate cover chances by mastery
local plateCoverChanceByMastery = {[const.Novice] = 0.1, [const.Expert] = 0.2, [const.Master] = 0.3, }

-- shield projectile damage multiplier by mastery
local shieldProjectileDamageReductionPerLevel = 0.02

-- monster settings

local monsterHitPointsMultiplier = 2.5
local monsterDamageMultiplier = 2
local monsterArmorClassMultiplier = 2
local monsterLevelMultiplier = 1
local monsterExperienceMultiplier = 1

-- skill set groups advancing together within a group for a single character

local characterLinkedSkillGroups =
{
	["meleeMain"] =
		{
			[const.Skills.Staff] = true,
			[const.Skills.Axe] = true,
			[const.Skills.Spear] = true,
			[const.Skills.Mace] = true,
		},
	["meleeExtra"] =
		{
			[const.Skills.Sword] = true,
			[const.Skills.Dagger] = true,
		},
	["ranged"] =
		{
			[const.Skills.Bow] = true,
			[const.Skills.Blaster] = true,
		},
	["armor"] =
		{
			[const.Skills.Leather] = true,
			[const.Skills.Chain] = true,
			[const.Skills.Plate] = true,
		},
}

-- skills advancing together across whole party

local partyLinkedSkills =
{
	[const.Skills.IdentifyItem] = true,
	[const.Skills.Merchant] = true,
	[const.Skills.Repair] = true,
	[const.Skills.Perception] = true,
	[const.Skills.DisarmTraps] = true,
}

-- spell powers

local protectionSpellExtraMultiplier = 2

local spellPowers =
{
-- Fire Bolt
[4] =
{
[const.Novice] = {fixedMin = 0, fixedMax = 0, variableMin = 1, variableMax = 5, },
[const.Expert] = {fixedMin = 0, fixedMax = 0, variableMin = 1, variableMax = 5, },
[const.Master] = {fixedMin = 0, fixedMax = 0, variableMin = 1, variableMax = 5, },
},
-- Ring of Fire
[7] =
{
[const.Novice] = {fixedMin = 10, fixedMax = 10, variableMin = 1, variableMax = 4, },
[const.Expert] = {fixedMin = 10, fixedMax = 10, variableMin = 1, variableMax = 4, },
[const.Master] = {fixedMin = 10, fixedMax = 10, variableMin = 1, variableMax = 4, },
},
-- Fire Blast
[8] =
{
[const.Novice] = {fixedMin = 4, fixedMax = 4, variableMin = 1, variableMax = 4, },
[const.Expert] = {fixedMin = 4, fixedMax = 4, variableMin = 1, variableMax = 4, },
[const.Master] = {fixedMin = 2, fixedMax = 2, variableMin = 1, variableMax = 5, },
},
-- Meteor Shower
[9] =
{
[const.Novice] = {fixedMin = 0, fixedMax = 0, variableMin = 1, variableMax = 3, },
[const.Expert] = {fixedMin = 0, fixedMax = 0, variableMin = 1, variableMax = 3, },
[const.Master] = {fixedMin = 0, fixedMax = 0, variableMin = 1, variableMax = 3, },
},
-- Inferno
[10] =
{
[const.Novice] = {fixedMin = 0, fixedMax = 0, variableMin = 1, variableMax = 4, },
[const.Expert] = {fixedMin = 0, fixedMax = 0, variableMin = 1, variableMax = 4, },
[const.Master] = {fixedMin = 0, fixedMax = 0, variableMin = 1, variableMax = 4, },
},
-- Incinerate
[11] =
{
[const.Novice] = {fixedMin = 0, fixedMax = 0, variableMin = 1, variableMax = 21, },
[const.Expert] = {fixedMin = 0, fixedMax = 0, variableMin = 1, variableMax = 21, },
[const.Master] = {fixedMin = 0, fixedMax = 0, variableMin = 1, variableMax = 21, },
},
-- Sparks
[15] =
{
[const.Novice] = {fixedMin = 1, fixedMax = 5, variableMin = 1, variableMax = 2, },
[const.Expert] = {fixedMin = 1, fixedMax = 5, variableMin = 1, variableMax = 2, },
[const.Master] = {fixedMin = 1, fixedMax = 5, variableMin = 1, variableMax = 2, },
},
--[[
-- Lightning Bolt
[18] =
{
[const.Novice] = {fixedMin = 12, fixedMax = 12, variableMin = 1, variableMax = 8, },
[const.Expert] = {fixedMin = 12, fixedMax = 12, variableMin = 1, variableMax = 8, },
[const.Master] = {fixedMin = 12, fixedMax = 12, variableMin = 1, variableMax = 8, },
},
--]]
--[[
-- Implosion
[20] =
{
[const.Novice] = {fixedMin = 17, fixedMax = 17, variableMin = 1, variableMax = 10, },
[const.Expert] = {fixedMin = 17, fixedMax = 17, variableMin = 1, variableMax = 10, },
[const.Master] = {fixedMin = 17, fixedMax = 17, variableMin = 1, variableMax = 10, },
},
--]]
-- Starburst
[22] =
{
[const.Novice] = {fixedMin = 0, fixedMax = 0, variableMin = 1, variableMax = 6, },
[const.Expert] = {fixedMin = 0, fixedMax = 0, variableMin = 1, variableMax = 6, },
[const.Master] = {fixedMin = 0, fixedMax = 0, variableMin = 1, variableMax = 6, },
},
-- Poison Spray
[26] =
{
[const.Novice] = {fixedMin = 5, fixedMax = 5, variableMin = 1, variableMax = 2, },
[const.Expert] = {fixedMin = 5, fixedMax = 5, variableMin = 1, variableMax = 2, },
[const.Master] = {fixedMin = 5, fixedMax = 5, variableMin = 1, variableMax = 2, },
},
--[[
-- Ice Bolt
[28] =
{
[const.Novice] = {fixedMin = 0, fixedMax = 0, variableMin = 1, variableMax = 70, },
[const.Expert] = {fixedMin = 0, fixedMax = 0, variableMin = 1, variableMax = 70, },
[const.Master] = {fixedMin = 0, fixedMax = 0, variableMin = 1, variableMax = 70, },
},
--]]
--[[
-- Acid Burst
[30] =
{
[const.Novice] = {fixedMin = 9, fixedMax = 9, variableMin = 1, variableMax = 9, },
[const.Expert] = {fixedMin = 9, fixedMax = 9, variableMin = 1, variableMax = 9, },
[const.Master] = {fixedMin = 9, fixedMax = 9, variableMin = 1, variableMax = 9, },
},
--]]
-- Ice Blast
[32] =
{
[const.Novice] = {fixedMin = 6, fixedMax = 6, variableMin = 1, variableMax = 3, },
[const.Expert] = {fixedMin = 6, fixedMax = 6, variableMin = 1, variableMax = 3, },
[const.Master] = {fixedMin = 6, fixedMax = 6, variableMin = 1, variableMax = 3, },
},
--[[
--]]
-- Deadly Swarm
[37] =
{
[const.Novice] = {fixedMin = 10, fixedMax = 10, variableMin = 1, variableMax = 3, },
[const.Expert] = {fixedMin = 10, fixedMax = 10, variableMin = 1, variableMax = 3, },
[const.Master] = {fixedMin = 10, fixedMax = 10, variableMin = 1, variableMax = 3, },
},
--]]
-- Blades
[39] =
{
[const.Novice] = {fixedMin = 0, fixedMax = 0, variableMin = 1, variableMax = 7, },
[const.Expert] = {fixedMin = 0, fixedMax = 0, variableMin = 1, variableMax = 7, },
[const.Master] = {fixedMin = 0, fixedMax = 0, variableMin = 1, variableMax = 7, },
},
-- Death Blossom
[43] =
{
[const.Novice] = {fixedMin = 0, fixedMax = 0, variableMin = 1, variableMax = 10, },
[const.Expert] = {fixedMin = 0, fixedMax = 0, variableMin = 1, variableMax = 10, },
[const.Master] = {fixedMin = 0, fixedMax = 0, variableMin = 1, variableMax = 10, },
},
-- Mind Blast
[58] =
{
[const.Novice] = {fixedMin = 0, fixedMax = 0, variableMin = 1, variableMax = 5, },
[const.Expert] = {fixedMin = 0, fixedMax = 0, variableMin = 1, variableMax = 5, },
[const.Master] = {fixedMin = 0, fixedMax = 0, variableMin = 1, variableMax = 5, },
},
-- Psychic Shock
[65] =
{
[const.Novice] = {fixedMin = 19, fixedMax = 19, variableMin = 1, variableMax = 24, },
[const.Expert] = {fixedMin = 19, fixedMax = 19, variableMin = 1, variableMax = 24, },
[const.Master] = {fixedMin = 19, fixedMax = 19, variableMin = 1, variableMax = 24, },
},
--[[
-- Harm
[70] =
{
[const.Novice] = {fixedMin = 50, fixedMax = 50, variableMin = 1, variableMax = 20, },
[const.Expert] = {fixedMin = 50, fixedMax = 50, variableMin = 1, variableMax = 20, },
[const.Master] = {fixedMin = 50, fixedMax = 50, variableMin = 1, variableMax = 20, },
},
--]]

-- Flying Fist
[76] =
{
[const.Novice] = {fixedMin = 30, fixedMax = 30, variableMin = 1, variableMax = 15, },
[const.Expert] = {fixedMin = 30, fixedMax = 30, variableMin = 1, variableMax = 15, },
[const.Master] = {fixedMin = 30, fixedMax = 30, variableMin = 1, variableMax = 15, },
},
-- Destroy Undead
[82] =
{
[const.Novice] = {fixedMin = 20, fixedMax = 80, variableMin = 1, variableMax = 40, },
[const.Expert] = {fixedMin = 20, fixedMax = 80, variableMin = 1, variableMax = 40, },
[const.Master] = {fixedMin = 20, fixedMax = 80, variableMin = 1, variableMax = 40, },
},
-- Prismatic Light
[84] =
{
[const.Novice] = {fixedMin = 0, fixedMax = 0, variableMin = 1, variableMax = 8, },
[const.Expert] = {fixedMin = 0, fixedMax = 0, variableMin = 1, variableMax = 8, },
[const.Master] = {fixedMin = 0, fixedMax = 0, variableMin = 1, variableMax = 8, },
},
-- Sun Ray
[87] =
{
[const.Novice] = {fixedMin = 30, fixedMax = 70, variableMin = 1, variableMax = 30, },
[const.Expert] = {fixedMin = 30, fixedMax = 70, variableMin = 1, variableMax = 30, },
[const.Master] = {fixedMin = 30, fixedMax = 70, variableMin = 1, variableMax = 30, },
},
-- Toxic Cloud
[90] =
{
[const.Novice] = {fixedMin = 20, fixedMax = 30, variableMin = 1, variableMax = 15, },
[const.Expert] = {fixedMin = 20, fixedMax = 30, variableMin = 1, variableMax = 15, },
[const.Master] = {fixedMin = 20, fixedMax = 30, variableMin = 1, variableMax = 15, },
},
-- Shrapmetal
[92] =
{
[const.Novice] = {fixedMin = 4, fixedMax = 4, variableMin = 1, variableMax = 9, },
[const.Expert] = {fixedMin = 4, fixedMax = 4, variableMin = 1, variableMax = 9, },
[const.Master] = {fixedMin = 4, fixedMax = 4, variableMin = 1, variableMax = 9, },
},
-- Flame Arrow
[2] =
{
[const.Novice] = {fixedMin = 1, fixedMax = 6, variableMin = 1, variableMax = 2, },
[const.Expert] = {fixedMin = 1, fixedMax = 6, variableMin = 1, variableMax = 2, },
[const.Master] = {fixedMin = 1, fixedMax = 6, variableMin = 1, variableMax = 2, },
},
-- Magic Arrow
[35] =
{
[const.Novice] = {fixedMin = 1, fixedMax = 6, variableMin = 1, variableMax = 3, },
[const.Expert] = {fixedMin = 1, fixedMax = 6, variableMin = 1, variableMax = 3, },
[const.Master] = {fixedMin = 1, fixedMax = 6, variableMin = 1, variableMax = 3, },
},
-- Spirit Arrow
[45] =
{
[const.Novice] = {fixedMin = 0, fixedMax = 0, variableMin = 1, variableMax = 3, },
[const.Expert] = {fixedMin = 0, fixedMax = 0, variableMin = 1, variableMax = 3, },
[const.Master] = {fixedMin = 0, fixedMax = 0, variableMin = 1, variableMax = 3, },
},
-- Cold Beam
[24] =
{
[const.Novice] = {fixedMin = 0, fixedMax = 0, variableMin = 1, variableMax = 2, },
[const.Expert] = {fixedMin = 0, fixedMax = 0, variableMin = 1, variableMax = 3, },
[const.Master] = {fixedMin = 0, fixedMax = 0, variableMin = 1, variableMax = 3, },
},
-- Static Charge
[13] =
{
[const.Novice] = {fixedMin = 0, fixedMax = 0, variableMin = 1, variableMax = 2, },
[const.Expert] = {fixedMin = 0, fixedMax = 0, variableMin = 1, variableMax = 3, },
[const.Master] = {fixedMin = 0, fixedMax = 0, variableMin = 1, variableMax = 3, },
},
}
local spellBuffPowers =
{
	-- Stone Skin
	["StoneSkin"] =
	{
		["fixed"] = 20,
		["proportional"] = 4,
	},
	-- Bless
	["Bless"] =
	{
		["fixed"] = 5,
		["proportional"] = 1,
	},
	-- Heroism
	["Heroism"] =
	{
		["fixed"] = 5,
		["proportional"] = 1,
	},
}
local spellStatsBuffPowers =
{
	["StatsBuff"] =
	{
		["fixed"] = 10,
		["proportional"] = 5,
	},
}

-- monster engagement distance

local standardEngagementDistance = 0x1600
--local extendedEngagementDistance = 0x2C00
local extendedEngagementDistance = 0x1600
-- house prices

local templeHealingPrice = 10
local innRoomPrice = 10
local innFoodQuantity = 10
local innFoodPrice = 100
local housePrices =
{
	-- training grounds
	["New Sorpigal Training Grounds"] = 5,
	["Training-by-the-Sea"] = 10,
	["Island Testing Center"] = 15,
	["Abdul's Discount Training Center"] = 20,
	["Riverside Academy"] = 25,
	["Free Haven Academy"] = 30,
	["Lone Tree Training"] = 40,
	["Wolf's Den"] = 50,
	["Royal Gymnasium"] = 100,
	["The Sparring Ground"] = 150,
}

-- modified book values

local modifiedBookValues =
{
	[0] = 100,
	[1] = 200,
	[2] = 300,
	[3] = 500,
	[4] = 1000,
	[5] = 2000,
	[6] = 5000,
	[7] = 10000,
	[8] = 20000,
	[9] = 50000,
	[10] = 100000,
}

-- monster ranged attacks

local monsterRangedAttacks =
{
	-- Follower of Baa
	[139] = {["SpellChance"] = 10, ["SpellName"] = "Mind Blast", ["SpellSkill"] = JoinSkill(1, const.Novice), },
	-- Mystic of Baa
	[140] = {["SpellChance"] = 30, ["SpellName"] = "Mind Blast", ["SpellSkill"] = JoinSkill(2, const.Novice), },
	-- Fanatic of Baa
	[141] = {["SpellChance"] = 50, ["SpellName"] = "Mind Blast", ["SpellSkill"] = JoinSkill(3, const.Novice), },
	-- Cutpurse
	[127] = {["Attack2Chance"] = 10, ["Attack2"] = {["Type"] = const.Damage.Phys, ["DamageDiceCount"] = 1, ["DamageDiceSides"] = 6, ["DamageAdd"] = 0, ["Missile"] = missiles["Arrow"], }, },
	-- Bounty Hunter
	[128] = {["Attack2Chance"] = 20, ["Attack2"] = {["Type"] = const.Damage.Phys, ["DamageDiceCount"] = 1, ["DamageDiceSides"] = 6, ["DamageAdd"] = 2, ["Missile"] = missiles["Arrow"], }, },
	-- Assassin
	[129] = {["Attack2Chance"] = 30, ["Attack2"] = {["Type"] = const.Damage.Phys, ["DamageDiceCount"] = 1, ["DamageDiceSides"] = 6, ["DamageAdd"] = 4, ["Missile"] = missiles["Arrow"], }, },
	-- Cannibal (female)
	[130] = {["SpellChance"] = 10, ["SpellName"] = "Deadly Swarm", ["SpellSkill"] = JoinSkill(1, const.Novice), },
	-- Head Hunter (female)
	[131] = {["SpellChance"] = 20, ["SpellName"] = "Deadly Swarm", ["SpellSkill"] = JoinSkill(2, const.Novice), },
	-- Witch Doctor (female)
	[132] = {["SpellChance"] = 30, ["SpellName"] = "Deadly Swarm", ["SpellSkill"] = JoinSkill(3, const.Novice), },
	-- Cannibal (male)
	[142] = {["SpellChance"] = 10, ["SpellName"] = "Fire Bolt", ["SpellSkill"] = JoinSkill(1, const.Novice), },
	-- Head Hunter (male)
	[143] = {["SpellChance"] = 20, ["SpellName"] = "Fire Bolt", ["SpellSkill"] = JoinSkill(2, const.Novice), },
	-- Witch Doctor (male)
	[144] = {["SpellChance"] = 30, ["SpellName"] = "Fire Bolt", ["SpellSkill"] = JoinSkill(3, const.Novice), },
	-- Magyar
	[  4] = {["Attack2Chance"] = 10, ["Attack2"] = {["Type"] = const.Damage.Elec, ["DamageDiceCount"] = 3, ["DamageDiceSides"] = 8, ["DamageAdd"] = 0, ["Missile"] = missiles["Elec"], }, },
	-- Magyar Soldier
	[  5] = {["Attack2Chance"] = 20, ["Attack2"] = {["Type"] = const.Damage.Elec, ["DamageDiceCount"] = 5, ["DamageDiceSides"] = 8, ["DamageAdd"] = 0, ["Missile"] = missiles["Elec"], }, },
	-- Magyar Matron
	[  6] = {["Attack2Chance"] = 30, ["Attack2"] = {["Type"] = const.Damage.Elec, ["DamageDiceCount"] = 7, ["DamageDiceSides"] = 8, ["DamageAdd"] = 0, ["Missile"] = missiles["Elec"], }, },
	-- Goblin
	[ 76] = {["SpellChance"] = 10, ["SpellName"] = "Fire Bolt", ["SpellSkill"] = JoinSkill(1, const.Novice), },
	-- Goblin Shaman
	[ 77] = {["SpellChance"] = 20, ["SpellName"] = "Fire Bolt", ["SpellSkill"] = JoinSkill(2, const.Novice), },
	-- Goblin King
	[ 78] = {["SpellChance"] = 30, ["SpellName"] = "Fire Bolt", ["SpellSkill"] = JoinSkill(3, const.Novice), },
	-- Skeleton
	[154] = {["Attack2Chance"] = 10, ["Attack2"] = {["Type"] = const.Damage.Phys, ["DamageDiceCount"] = 1, ["DamageDiceSides"] = 6, ["DamageAdd"] = 0, ["Missile"] = missiles["Arrow"], }, },
	-- Skeleton Knight
	[155] = {["Attack2Chance"] = 20, ["Attack2"] = {["Type"] = const.Damage.Phys, ["DamageDiceCount"] = 1, ["DamageDiceSides"] = 6, ["DamageAdd"] = 2, ["Missile"] = missiles["Arrow"], }, },
	-- Skeleton Lord
	[156] = {["Attack2Chance"] = 30, ["Attack2"] = {["Type"] = const.Damage.Phys, ["DamageDiceCount"] = 1, ["DamageDiceSides"] = 6, ["DamageAdd"] = 6, ["Missile"] = missiles["Arrow"], }, },
	-- Ghost
	[ 73] = {["SpellChance"] = 10, ["SpellName"] = "Spirit Arrow", ["SpellSkill"] = JoinSkill(1, const.Novice), },
	-- Evil Spirit
	[ 74] = {["SpellChance"] = 20, ["SpellName"] = "Spirit Arrow", ["SpellSkill"] = JoinSkill(2, const.Novice), },
	-- Specter
	[ 75] = {["SpellChance"] = 30, ["SpellName"] = "Spirit Arrow", ["SpellSkill"] = JoinSkill(3, const.Novice), },
	-- Hydra
	[ 85] = {["Attack2Chance"] = 30, ["Attack2"] = {["Type"] = const.Damage.Fire, ["DamageDiceCount"] = 8, ["DamageDiceSides"] = 5, ["DamageAdd"] = 0, ["Missile"] = missiles["Fire"], }, },
	-- Venomous Hydra
	[ 86] = {["Attack2Chance"] = 35, ["Attack2"] = {["Type"] = const.Damage.Cold, ["DamageDiceCount"] = 9, ["DamageDiceSides"] = 5, ["DamageAdd"] = 0, ["Missile"] = missiles["Cold"], }, },
	-- Colossal Hydra
	[ 87] = {["Attack2Chance"] = 40, ["Attack2"] = {["Type"] = const.Damage.Energy, ["DamageDiceCount"] = 10, ["DamageDiceSides"] = 5, ["DamageAdd"] = 0, ["Missile"] = missiles["Energy"], }, },
}

-- ======================================= --
-- Additional structures
-- ======================================= --

function structs.f.GameExtraStructure(define)
	define
	[0x0056B76C].array(31).EditPChar  'SkillDescriptionsNormal'
	[0x0056F29C].array(31).EditPChar  'SkillDescriptionsExpert'
	[0x0056F318].array(31).EditPChar  'SkillDescriptionsMaster'
end
GameExtra = structs.GameExtraStructure:new(0)
local SkillDescriptionsRanks =
{
	[const.Novice] = GameExtra.SkillDescriptionsNormal,
	[const.Expert] = GameExtra.SkillDescriptionsExpert,
	[const.Master] = GameExtra.SkillDescriptionsMaster,
}

-- ======================================= --
-- Helper functions --
-- ======================================= --

-- converts float int bytes representation to float
local function convertIntToFloat(x)

  local sign = 1
  if bit.band(x, 0x80000000) ~= 0 then sign = -1 end
	
  local mantissa = bit.band(x, 0x007FFFFF)
	
  local exponent = bit.band(bit.rshift(x, 23), 0xFF)
  if exponent == 0 then return 0 end
	
  mantissa = (math.ldexp(mantissa, -23) + 1) * sign
	
  return math.ldexp(mantissa, exponent - 127)
	
end

-- formats number for skill rank description
local function formatSkillRankNumber(number, rightPosition)

	if rightPosition == nil then
		return "--"
	end

	local formattedString = ""

	local numberString = string.format("%d", number)
	local valueNumberShift = 8
	local position = rightPosition - valueNumberShift * string.len(numberString)

	for c in string.gmatch(numberString, ".") do
		local adjustedPosition = position
		--[[
		if c == "4" then
			adjustedPosition = adjustedPosition + 1
		end
		--]]
		formattedString = formattedString .. string.format("\t%03d%s", adjustedPosition, c)
		position = position + valueNumberShift
	end
	
	return formattedString
	
end

-- Player hooks

local function GetPlayer(p)
	local i = (p - Party.PlayersArray["?ptr"]) / Party.PlayersArray[0]["?size"]
	return i, Party.PlayersArray[i]
end

local function GetMonster(p)
	if p == 0 then
		return
	end
	local i = (p - Map.Monsters["?ptr"]) / Map.Monsters[0]["?size"]
	return i, Map.Monsters[i]
end

local function GetMonsterTxt(p)
	if p == 0 then
		return
	end
	local i = (p - Game.MonstersTxt["?ptr"]) / Game.MonstersTxt[0]["?size"]
	return i, Game.MonstersTxt[i]
end

-- collects relevant player weapon data
local function getPlayerEquipmentData(player)

	local equipmentData =
	{
		twoHanded = false,
		dualWield = false,
		bow =
		{
			equipped = false,
			item = nil,
			equipStat = nil,
			weapon = false,
			skill = nil,
			rank = nil,
			level = nil,
		},
		main =
		{
			equipped = false,
			item = nil,
			equipStat = nil,
			weapon = false,
			skill = nil,
			rank = nil,
			level = nil,
		},
		extra =
		{
			equipped = false,
			item = nil,
			equipStat = nil,
			weapon = false,
			skill = nil,
			rank = nil,
			level = nil,
		},
		shield =
		{
			equipped = false,
			item = nil,
			skill = nil,
			rank = nil,
			level = nil,
		},
		armor =
		{
			equipped = false,
			item = nil,
			skill = nil,
			rank = nil,
			level = nil,
		},
	}
	
	-- get ranged weapon data
	
	if player.ItemBow ~= 0 then
		
		equipmentData.bow.equipped = true
		
		equipmentData.bow.item = player.Items[player.ItemBow]
		local itemBowTxt = Game.ItemsTxt[equipmentData.bow.item.Number]
		equipmentData.bow.equipStat = itemBowTxt.EquipStat + 1
		equipmentData.bow.skill = itemBowTxt.Skill - 1
		
		if equipmentData.bow.skill >= 0 then
			equipmentData.bow.level, equipmentData.bow.rank = SplitSkill(player.Skills[equipmentData.bow.skill])
		end
		
		if equipmentData.bow.skill >= 0 and equipmentData.bow.skill <= 7 then
			equipmentData.bow.weapon = true
		end
		
	end
	
	-- get main hand weapon data
			
	if player.ItemMainHand ~= 0 then
		
		equipmentData.main.equipped = true
		
		equipmentData.main.item = player.Items[player.ItemMainHand]
		equipmentData.main.itemTxt = Game.ItemsTxt[equipmentData.main.item.Number]
		equipmentData.main.equipStat = equipmentData.main.itemTxt.EquipStat + 1
		equipmentData.main.skill = equipmentData.main.itemTxt.Skill - 1
		
		if equipmentData.main.skill >= 0 then
			equipmentData.main.level, equipmentData.main.rank = SplitSkill(player.Skills[equipmentData.main.skill])
		end
		
		if equipmentData.main.skill >= 0 and equipmentData.main.skill <= 7 then
			equipmentData.main.weapon = true
		end
		
	end
	
	-- get extra hand weapon data only if not holding blaster in main hand
			
	if (player.ItemMainHand == 0 or equipmentData.main.skill ~= const.Skills.Blaster) and player.ItemExtraHand ~= 0 then
		
		equipmentData.extra.equipped = true
		
		equipmentData.extra.item = player.Items[player.ItemExtraHand]
		equipmentData.extra.itemTxt = Game.ItemsTxt[equipmentData.extra.item.Number]
		equipmentData.extra.equipStat = equipmentData.extra.itemTxt.EquipStat + 1
		equipmentData.extra.skill = equipmentData.extra.itemTxt.Skill - 1
		
		if equipmentData.extra.skill >= 0 then
			equipmentData.extra.level, equipmentData.extra.rank = SplitSkill(player.Skills[equipmentData.extra.skill])
		end
		
		if equipmentData.extra.skill >= 0 and equipmentData.extra.skill <= 7 then
			equipmentData.extra.weapon = true
		end
		
	end
	
	-- populate other info
	
	if equipmentData.main.weapon and equipmentData.main.equipStat == const.ItemType.Weapon2H then
		equipmentData.twoHanded = true
	elseif equipmentData.main.skill == const.Skills.Spear and not equipmentData.extra.equipped then
		equipmentData.twoHanded = true
	elseif equipmentData.main.weapon and equipmentData.extra.weapon then
		equipmentData.dualWield = true
	end
	
	-- get shield data
	
	if player.ItemExtraHand ~= 0 then
		
		equipmentData.extra.item = player.Items[player.ItemExtraHand]
		local itemExtraHandTxt = Game.ItemsTxt[equipmentData.extra.item.Number]
		equipmentData.extra.equipStat = itemExtraHandTxt.EquipStat + 1
		equipmentData.extra.skill = itemExtraHandTxt.Skill - 1
		
		if equipmentData.extra.skill == const.Skills.Shield then
			equipmentData.shield.equipped = true
			equipmentData.shield.skill = equipmentData.extra.skill
			equipmentData.shield.level, equipmentData.shield.rank = SplitSkill(player.Skills[equipmentData.shield.skill])
		end
		
	end
	
	-- get armor data
	
	if player.ItemArmor ~= 0 then
		
		equipmentData.armor.equipped = true
		
		equipmentData.armor.item = player.Items[player.ItemArmor]
		local itemArmorTxt = Game.ItemsTxt[equipmentData.armor.item.Number]
		equipmentData.armor.skill = itemArmorTxt.Skill - 1
		equipmentData.armor.level, equipmentData.armor.rank = SplitSkill(player.Skills[equipmentData.armor.skill])
		
	end
	
	-- account for hirelings skill boost
	
	local hiredNPC = Game.Party.HiredNPC
	if
		(hiredNPC[1] ~= nil and hiredNPC[1].Profession == const.NPCProfession.ArmsMaster)
		or
		(hiredNPC[2] ~= nil and hiredNPC[2].Profession == const.NPCProfession.ArmsMaster)
	then
		if equipmentData.bow.level ~= nil then
			equipmentData.bow.level = equipmentData.bow.level + 2
		end
		if equipmentData.main.level ~= nil then
			equipmentData.main.level = equipmentData.main.level + 2
		end
		if equipmentData.extra.level ~= nil then
			equipmentData.extra.level = equipmentData.extra.level + 2
		end
	end
	if
		(hiredNPC[1] ~= nil and hiredNPC[1].Profession == const.NPCProfession.WeaponsMaster)
		or
		(hiredNPC[2] ~= nil and hiredNPC[2].Profession == const.NPCProfession.WeaponsMaster)
	then
		if equipmentData.bow.level ~= nil then
			equipmentData.bow.level = equipmentData.bow.level + 3
		end
		if equipmentData.main.level ~= nil then
			equipmentData.main.level = equipmentData.main.level + 3
		end
		if equipmentData.extra.level ~= nil then
			equipmentData.extra.level = equipmentData.extra.level + 3
		end
	end
	if
		(hiredNPC[1] ~= nil and hiredNPC[1].Profession == const.NPCProfession.Squire)
		or
		(hiredNPC[2] ~= nil and hiredNPC[2].Profession == const.NPCProfession.Squire)
	then
		if equipmentData.bow.level ~= nil then
			equipmentData.bow.level = equipmentData.bow.level + 2
		end
		if equipmentData.main.level ~= nil then
			equipmentData.main.level = equipmentData.main.level + 2
		end
		if equipmentData.extra.level ~= nil then
			equipmentData.extra.level = equipmentData.extra.level + 2
		end
		if equipmentData.shield.level ~= nil then
			equipmentData.shield.level = equipmentData.shield.level + 2
		end
		if equipmentData.armor.level ~= nil then
			equipmentData.armor.level = equipmentData.armor.level + 2
		end
	end
	
	return equipmentData
	
end

-- calculate new and old recovery difference
local function getWeaponRecoveryCorrection(equipmentData1, equipmentData2)

	local correction = 0
	
	-- single wield
	if equipmentData2 == nil then
	
		-- calculate old and new recovery bonuses
	
		local oldRecoveryBonus = 0
		local newRecoveryBonus = 0
	
		-- base bonuses
		
		oldRecoveryBonus = oldRecoveryBonus + oldWeaponBaseRecoveryBonuses[equipmentData1.skill]
		newRecoveryBonus = newRecoveryBonus + newWeaponBaseRecoveryBonuses[equipmentData1.skill]
		
		-- skill bonuses
		
		if equipmentData1.rank >= const.Expert then
			oldRecoveryBonus = oldRecoveryBonus + (oldWeaponSkillRecoveryBonuses[equipmentData1.skill][equipmentData1.rank] * equipmentData1.level)
		end
		newRecoveryBonus = newRecoveryBonus + (newWeaponSkillRecoveryBonuses[equipmentData1.skill][equipmentData1.rank] * equipmentData1.level)
		
		-- class bonus
		
		if equipmentData1.Skill == const.Skills.Bow or equipmentData1.Skill == const.Skills.Blaster then
			local rangedWeaponSkillAttackBonusMultiplier = classRangedWeaponSkillAttackBonusMultiplier[t.Player.Class]
			if rangedWeaponSkillAttackBonusMultiplier ~= nil then
				newRecoveryBonus = newRecoveryBonus * rangedWeaponSkillAttackBonusMultiplier
			end
		end
		
		-- replace old with new bonus

		correction = correction 
			+ oldRecoveryBonus
			- newRecoveryBonus
		
	-- dual wield
	else
	
		-- calculate effective skill levels
		
		local meleeWeapon1EffectiveSkillLevel
		local meleeWeapon2EffectiveSkillLevel
		
		if equipmentData1.skill == equipmentData2.skill then
			meleeWeapon1EffectiveSkillLevel = equipmentData1.level
			meleeWeapon2EffectiveSkillLevel = equipmentData2.level
		else
			-- effective skill level is not divided by sqrt(2) anymore
			meleeWeapon1EffectiveSkillLevel = equipmentData1.level
			meleeWeapon2EffectiveSkillLevel = equipmentData2.level
		end
	
		-- calculate old and new recovery bonuses
	
		local oldRecoveryBonus1 = 0
		local newRecoveryBonus1 = 0
		local newRecoveryBonus2 = 0
	
		-- weapon 1
		
		-- base bonuses
		
		oldRecoveryBonus1 = oldRecoveryBonus1 + oldWeaponBaseRecoveryBonuses[equipmentData1.skill]
		newRecoveryBonus1 = newRecoveryBonus1 + newWeaponBaseRecoveryBonuses[equipmentData1.skill]
		newRecoveryBonus2 = newRecoveryBonus2 + newWeaponBaseRecoveryBonuses[equipmentData2.skill]
		
		-- swiftness
		
		if equipmentData1.item.Bonus2 == 59 then
			oldRecoveryBonus1 = oldRecoveryBonus1 + 20
			newRecoveryBonus1 = newRecoveryBonus1 + 20
		end
		if equipmentData2.item.Bonus2 == 59 then
			newRecoveryBonus2 = newRecoveryBonus2 + 20
		end
		
		-- skill bonuses
		
		if equipmentData1.rank >= const.Expert then
			oldRecoveryBonus1 = oldRecoveryBonus1 + (oldWeaponSkillRecoveryBonuses[equipmentData1.skill][equipmentData1.rank] * equipmentData1.level)
		end
		newRecoveryBonus1 = (newRecoveryBonus1 + (newWeaponSkillRecoveryBonuses[equipmentData1.skill][equipmentData1.rank] * meleeWeapon1EffectiveSkillLevel))
		newRecoveryBonus2 = (newRecoveryBonus2 + (newWeaponSkillRecoveryBonuses[equipmentData2.skill][equipmentData2.rank] * meleeWeapon2EffectiveSkillLevel))
		
		-- replace old with new bonus
		
		correction = correction
			+ oldRecoveryBonus1
			- (newRecoveryBonus1 + newRecoveryBonus2)
		
	end
	
	return correction
	
end

-- generate random spell power
local function randomSpellPower(spellPower, level)
	local r = math.random(spellPower.fixedMin, spellPower.fixedMax)
	for i = 1, level do
		r = r + math.random(spellPower.variableMin, spellPower.variableMax)
	end
	return r
end

-- calculate distance from party to monster side
local function getDistanceToMonster(monster)
	return math.sqrt((Party.X - monster.X) * (Party.X - monster.X) + (Party.Y - monster.Y) * (Party.Y - monster.Y)) - monster.BodyRadius
end

-- set melee recovery cap

mem.asmpatch(0x00406886, string.format("cmp    eax,%d", meleeRecoveryCap), 3)
-- originally 0x0040688B then moved to MM6patch.dll
-- .text:00406889     call    near ptr address + 2
mem.asmpatch(0x03322D6A, string.format("mov    eax,%d", meleeRecoveryCap), 5)

mem.asmpatch(0x0042A237, string.format("cmp    eax,%d", meleeRecoveryCap), 3)
mem.asmpatch(0x0042A240, string.format("mov    DWORD [esp+0x28],%d", meleeRecoveryCap), 8)

-- buried in the MM6patch.dll
mem.asmpatch(0x03322951, string.format("cmp    edi,%d", meleeRecoveryCap), 3)
mem.asmpatch(0x03322960, string.format("mov    edi,%d", meleeRecoveryCap), 5)

-- corrects attack delay

function events.GetAttackDelay(t)

	local equipmentData = getPlayerEquipmentData(t.Player)
	
	-- weapon
	
	if t.Ranged then
	
		local bow = equipmentData.bow
	
		if bow.weapon then
		
			t.Result = t.Result + getWeaponRecoveryCorrection(bow)
			
		end
		
	else
	
		local main = equipmentData.main
		local extra = equipmentData.extra
		
		if main.weapon then
			
			-- single wield
			if not equipmentData.dualWield then
				
				t.Result = t.Result + getWeaponRecoveryCorrection(main)
				
			-- dual wield
			else
			
				-- no axe and no sword in main hand and sword in extra hand = extra hand skill defines recovery
				if main.skill ~= const.Skills.Axe and main.skill ~= const.Skills.Sword and extra.skill == const.Skills.Sword then
					t.Result = t.Result + getWeaponRecoveryCorrection(extra, main)
				-- everything else = main hand skill defines recovery
				else
					t.Result = t.Result + getWeaponRecoveryCorrection(main, extra)
				end
				
			end
			
		end
		
	end
	
	-- turn recovery time into a multiplier rather than divisor
	
	local recoveryBonus = 100 - t.Result
	local correctedRecoveryTime = math.floor(100 / (1 + recoveryBonus / 100))
	
	t.Result = correctedRecoveryTime
	
	-- cap melee recovery
	
	if not t.Ranged then
		t.Result = math.max(meleeRecoveryCap, t.Result)
	end
	
end

-- fast flat distance from party to monster

local function fastDistance(monsterX, monsterY)

	local dx = Party.X - monsterX
	local dy = Party.Y - monsterY

	local a = math.max(dx, dy)
	local b = math.min(dx, dy)
	
	return a + 11 / 32 * b
	
end

-- get party experience level

local function getPartyExperienceLevel()

	local partyExperience = 0
	
	for i = 0, 3 do
		partyExperience = partyExperience + Party.Players[i].Experience
	end
	
	local averagePlayerExperience = partyExperience / 4
	
	local partyExperienceLevel = math.floor((1 + math.sqrt(1 + (4 * averagePlayerExperience / 500))) / 2)
	
	return partyExperienceLevel

end

-- profession functions

local professionsRandomTotalAddress = 0x006BA538
local professionStructureSize = 0x4C
local professionChanceAddress = 0x006B5DC8
local professionCostAddress = 0x006B5DCC
local professionJoinTextAddress = 0x006B5DD8

local function setProfessionChance(professionIndex, chance)

	local oldChance = mem.u4[professionChanceAddress + professionStructureSize * professionIndex]
	mem.u4[professionChanceAddress + professionStructureSize * professionIndex] = chance
	mem.u4[professionsRandomTotalAddress] = mem.u4[professionsRandomTotalAddress] - oldChance + chance
	
end

local function setProfessionCost(professionIndex, cost)

	-- get join text byte array address
	
	local joinTextPointer = mem.u4[professionJoinTextAddress + professionStructureSize * professionIndex]
	
	-- read bytes to string
	
	local joinText = ""
	
	local memoryBytePointer = joinTextPointer
	while mem.u1[memoryBytePointer] ~= 0 do
		joinText = joinText .. string.char(mem.u1[memoryBytePointer])
		memoryBytePointer = memoryBytePointer + 1
	end
	
	-- get old cost
	
	local oldCost = mem.u4[professionCostAddress + professionStructureSize * professionIndex]
	
	-- replace cost text
	
	joinText = string.gsub(joinText, string.format("%d", oldCost), string.format("%d", cost))
	
	-- write bytes to memory
	
	for i = 1, string.len(joinText) do
		mem.u1[joinTextPointer + (i - 1)] = string.byte(joinText, i)
	end
	mem.u1[joinTextPointer + string.len(joinText)] = 0
	
	-- modify numeric cost value
	
	mem.u4[professionCostAddress + professionStructureSize * professionIndex] = cost
	
end

-- ======================================= --
-- Modifications --
-- ======================================= --

function events.CalcStatBonusByItems(t)

	local equipmentData = getPlayerEquipmentData(t.Player)
	
	local main = equipmentData.main
	local extra = equipmentData.extra
	local armor = equipmentData.armor
	
	-- calculate resistance
	
	if
		t.Stat == const.Stats.FireResistance
		or
		t.Stat == const.Stats.ElecResistance
		or
		t.Stat == const.Stats.ColdResistance
		or
		t.Stat == const.Stats.PoisonResistance
		or
		t.Stat == const.Stats.MagicResistance
	then
	
		-- resistance bonus from weapon
		
		for playerIndex = 0,3 do
		
			local weaponResistancePlayer = Party.Players[playerIndex]
			local weaponResistancePlayerEquipmentData = getPlayerEquipmentData(weaponResistancePlayer)
			local weaponResistancePlayerMain = weaponResistancePlayerEquipmentData.main
			local weaponResistancePlayerExtra = weaponResistancePlayerEquipmentData.extra
		
			if weaponResistancePlayerMain.equipped and weaponResistancePlayerMain.weapon then
				t.Result = t.Result + (newWeaponSkillResistanceBonuses[weaponResistancePlayerMain.skill][weaponResistancePlayerMain.rank] * weaponResistancePlayerMain.level)
			end
			
			if weaponResistancePlayerExtra.equipped and weaponResistancePlayerExtra.weapon then
				t.Result = t.Result + (newWeaponSkillResistanceBonuses[weaponResistancePlayerExtra.skill][weaponResistancePlayerExtra.rank] * weaponResistancePlayerExtra.level)
			end
			
		end
		
		-- resistance bonus from armor
		
		if armor.equipped then
			t.Result = t.Result + (newArmorSkillResistanceBonuses[armor.skill][armor.rank] * armor.level)
		end
		
	end
	
end

function events.CalcStatBonusBySkills(t)

	local equipmentData = getPlayerEquipmentData(t.Player)
	
	-- calculate ranged attack bonus by skill
	
	if t.Stat == const.Stats.RangedAttack then
	
		local bow = equipmentData.bow
	
		if bow.weapon then
		
			-- calculate old bonus
			
			local oldBonus = (oldWeaponSkillAttackBonuses[bow.skill][bow.rank] * bow.level)
			
			-- calculate new bonus
			
			local newBonus = (newWeaponSkillAttackBonuses[bow.skill][bow.rank] * bow.level)
			
			if bow.skill == const.Skills.Bow then
				local rangedWeaponSkillAttackBonusMultiplier = classRangedWeaponSkillAttackBonusMultiplier[t.Player.Class]
				if rangedWeaponSkillAttackBonusMultiplier ~= nil then
					newBonus = newBonus * rangedWeaponSkillAttackBonusMultiplier
				end
			end
			
			-- recalculate bonus
			
			t.Result = t.Result - oldBonus + newBonus
			
		end
		
	-- calculate ranged damage bonus by skill
	
	elseif t.Stat == const.Stats.RangedDamageBase then
	
		local bow = equipmentData.bow
	
		if bow.weapon then
		
			-- calculate old bonus
			
			local oldBonus = 0
			
			-- calculate new bonus
			
			local newBonus = 0
			
			-- add class bonus for ranged weapon
			
			if classRangedWeaponSkillDamageBonus[t.Player.Class] ~= nil then
				t.Result = t.Result + (classRangedWeaponSkillDamageBonus[t.Player.Class] * bow.level)
			end
			
			-- recalculate bonus
			
			t.Result = t.Result - oldBonus + newBonus
			
		end
		
	-- calculate melee attack bonus by skill
	
	elseif t.Stat == const.Stats.MeleeAttack then
	
		local main = equipmentData.main
		local extra = equipmentData.extra
		
		if main.weapon then
			
			-- single wield
			if not equipmentData.dualWield then
				
				-- calculate old bonus
				
				local oldBonus = (oldWeaponSkillAttackBonuses[main.skill][main.rank] * main.level)
				
				-- calculate new bonus
				
				local newBonus = (newWeaponSkillAttackBonuses[main.skill][main.rank] * main.level)
				
				-- class bonus
			
				if main.skill == const.Skills.Blaster then
					local rangedWeaponSkillAttackBonusMultiplier = classRangedWeaponSkillAttackBonusMultiplier[t.Player.Class]
					if rangedWeaponSkillAttackBonusMultiplier ~= nil then
						newBonus = newBonus * rangedWeaponSkillAttackBonusMultiplier
					end
				end
				
				-- recalculate bonus
				
				t.Result = t.Result - oldBonus + newBonus
				
			-- dual wield
			else
						
				-- calculate effective skill levels
				
				local mainEffectiveSkillLevel
				local extraEffectiveSkillLevel
				
				if main.skill == extra.skill then
					mainEffectiveSkillLevel = main.level
					extraEffectiveSkillLevel = extra.level
				else
					-- effective skill level is not divided by sqrt(2) anymore
					mainEffectiveSkillLevel = main.level
					extraEffectiveSkillLevel = extra.level
				end
			
				-- calculate old bonus
				
				local oldBonus = (oldWeaponSkillAttackBonuses[extra.skill][extra.rank] * main.level)
				
				-- calculate new bonus
				
				local newBonus = ((newWeaponSkillAttackBonuses[main.skill][main.rank] * mainEffectiveSkillLevel) + (newWeaponSkillAttackBonuses[extra.skill][extra.rank] * extraEffectiveSkillLevel))
			
				-- recalculate bonus
				
				t.Result = t.Result - oldBonus + newBonus
				
			end
			
		end
		
	-- calculate melee damage bonus by skill
	
	elseif t.Stat == const.Stats.MeleeDamageBase then
	
		local main = equipmentData.main
		local extra = equipmentData.extra
		
		if main.weapon then
			
			-- single wield
			
			if not equipmentData.dualWield then
				
				-- subtract old bonus
				
				if
					(main.skill == const.Skills.Axe and main.rank >= const.Master)
					or
					(main.skill == const.Skills.Spear and main.rank >= const.Master)
					or
					(main.skill == const.Skills.Mace and main.rank >= const.Expert)
				then
					t.Result = t.Result - main.level
				end
				
				-- add new bonus for main weapon
				
				t.Result = t.Result + newWeaponSkillDamageBonuses[main.skill][main.rank] * main.level
				
				-- add class bonus for main hand weapon
				
				if classMeleeWeaponSkillDamageBonus[t.Player.Class] ~= nil then
					t.Result = t.Result + (classMeleeWeaponSkillDamageBonus[t.Player.Class] * main.level)
				end
				
				-- add bonus for two handed weapon
				
				if equipmentData.twoHanded and equipmentData.main.skill ~= const.Skills.Staff then
					t.Result = t.Result + twoHandedWeaponDamageBonusByMastery[main.rank] * main.level
				end
				
			-- dual wield
			
			else
				
				-- calculate effective skill levels
				
				local mainEffectiveSkillLevel
				local extraEffectiveSkillLevel
				
				if main.skill == extra.skill then
					mainEffectiveSkillLevel = main.level
					extraEffectiveSkillLevel = extra.level
				else
					-- effective skill level is not divided by sqrt(2) anymore
					mainEffectiveSkillLevel = main.level
					extraEffectiveSkillLevel = extra.level
				end
			
				-- subtract old bonus
				
				if
					(main.skill == const.Skills.Axe and main.rank >= const.Master)
					or
					(main.skill == const.Skills.Spear and main.rank >= const.Master)
					or
					(main.skill == const.Skills.Mace and main.rank >= const.Expert)
				then
					t.Result = t.Result - main.level
				end
				
				-- add new bonus for main weapon
				
				t.Result = t.Result + (newWeaponSkillDamageBonuses[main.skill][main.rank] * mainEffectiveSkillLevel)
				
				-- add new bonus for extra weapon if any
				
				if extra.weapon then
					t.Result = t.Result + math.round(newWeaponSkillDamageBonuses[extra.skill][extra.rank] * extraEffectiveSkillLevel)
				end
				
				-- add class bonus for main hand weapon
				
				if classMeleeWeaponSkillDamageBonus[t.Player.Class] ~= nil then
					t.Result = t.Result + (classMeleeWeaponSkillDamageBonus[t.Player.Class] * mainEffectiveSkillLevel)
				end
				
				-- add class bonus for extra hand weapon if any and different from main weapon
				
				if extra.weapon and extra.skill ~= main.skill then
					if classMeleeWeaponSkillDamageBonus[t.Player.Class] ~= nil then
						t.Result = t.Result + math.round(classMeleeWeaponSkillDamageBonus[t.Player.Class] * extraEffectiveSkillLevel)
					end
				end
				
			end
			
			-- dagger crowd damage
			
			if main.skill == const.Skills.Dagger or extra.skill == const.Skills.Dagger then
			
				local meleeRangeMonsterCount = 0
				
				for monsterIndex = 0, Map.Monsters.high do
					local monster = Map.Monsters[monsterIndex]
					local distanceToMonster = getDistanceToMonster(monster)
					if distanceToMonster < meleeRangeDistance then
						meleeRangeMonsterCount = meleeRangeMonsterCount + 1
					end
				end
				
				if main.skill == const.Skills.Dagger then
					t.Result = t.Result + math.floor(daggerCrowdDamageMultiplier * meleeRangeMonsterCount * main.level)
				end
				if extra.skill == const.Skills.Dagger then
					t.Result = t.Result + math.floor(daggerCrowdDamageMultiplier * meleeRangeMonsterCount * extra.level)
				end
				
			end
			
		end
		
	-- calculate AC bonus by skill
	
	elseif t.Stat == const.Stats.ArmorClass then
	
		-- AC bonus from weapon skill
		
		local main = equipmentData.main
		
		if main.weapon then
		
			if main.skill == const.Skills.Staff then
			
				-- subtract old bonus
				
				if main.skill == const.Skills.Staff and main.rank >= const.Expert then
					t.Result = t.Result - main.level
				end
				
				-- add new bonus
				
				t.Result = t.Result + (newWeaponSkillACBonuses[const.Skills.Staff][main.rank] * main.level)
				
			-- spear do not grant AC anymore
			
			elseif main.skill == const.Skills.Spear then
			
				-- subtract old bonus
				
				if main.skill == const.Skills.Spear and main.rank >= const.Expert then
					t.Result = t.Result - main.level
				end
				
				-- no new bonus for spear
				--[[
				-- add new bonus
				t.Result = t.Result + (newWeaponSkillACBonuses[const.Skills.Spear][main.rank] * main.level)
				--]]
				
			end
			
		end
		
		-- AC bonus from shield skill
		
		local shield = equipmentData.shield
		
		if shield.equipped then
		
			-- subtract old bonus
			
			t.Result = t.Result - shield.rank * shield.level
			
			-- add new bonus
			
			t.Result = t.Result + (newArmorSkillACBonuses[shield.skill][shield.rank] * shield.level)
			
		end
		
		-- AC bonus from armor skill
		
		local armor = equipmentData.armor
		
		if armor.equipped then
		
			-- subtract old bonus
			
			t.Result = t.Result - armor.level
			
			-- add new bonus
			
			t.Result = t.Result + (newArmorSkillACBonuses[armor.skill][armor.rank] * armor.level)
			
		end
		
	end
	
end

-- applySpecialWeaponSkill

local function applySpecialWeaponSkill(d, def, TextBuffer, delay)

	local player = Party.Players[Game.CurrentPlayer]
	local monster = Map.Monsters[(d.esi - Map.Monsters["?ptr"]) / Map.Monsters[0]["?size"]]

	-- player holds weapon in main hand
	
	if	player.ItemMainHand ~= 0 then
		
		-- Staff in main hand
		
		if	(Game.ItemsTxt[player.Items[player.ItemMainHand].Number].Skill - 1) == const.Skills.Staff then
			
			-- Staff skill
			
			if player.Skills[const.Skills.Staff] ~= 0 then
			
				local level, rank = SplitSkill(player.Skills[const.Skills.Staff])
				
				local chance = staffEffect["base"] + staffEffect["multiplier"] * level
				local duration = staffEffect["duration"]
				
				-- roll dice
				
				if math.random(1, 100) <= chance then
				
					-- roll dice for an effect
					
					if math.random() < 0.5 then
						
						-- apply buff
						
						local spellBuff = monster.SpellBuffs[const.MonsterBuff.ShrinkingRay]
						spellBuff:Set(Game.Time + const.Minute * duration, rank, rank + 1, 0, 0)
						
						-- append to message
						
						Game.TextBuffer = Game.TextBuffer .. " /Shrunk"
						
					else
					
						-- apply buff
						
						local spellBuff = monster.SpellBuffs[const.MonsterBuff.Feeblemind]
						spellBuff:Set(Game.Time + const.Minute * duration, rank, 0, 0, 0)
						
						-- append to message
						
						Game.TextBuffer = Game.TextBuffer .. " /Feebleminded"
						
					end
					
				end
				
			end
			
		end
		
		-- Mace in main hand
		
		if	(Game.ItemsTxt[player.Items[player.ItemMainHand].Number].Skill - 1) == const.Skills.Mace then
			
			-- Mace skill
			
			if player.Skills[const.Skills.Mace] ~= 0 then
			
				local level, rank = SplitSkill(player.Skills[const.Skills.Mace])
				
				local chance = maceEffect["base"] + maceEffect["multiplier"] * level
				local duration = maceEffect["duration"]
				
				-- roll dice
				
				if math.random(1, 100) <= chance then
				
					-- apply buff
					
					local spellBuff = monster.SpellBuffs[const.MonsterBuff.Paralyze]
					spellBuff:Set(Game.Time + const.Minute * duration, rank, 0, 0, 0)
					
					-- append to message
					
					Game.TextBuffer = Game.TextBuffer .. " /Paralyzed"
				
				end
				
			end
			
		end
		
	end
	
	-- show message
	
	def(TextBuffer, delay)
	
end
mem.hookcall(0x00431358, 2, 0, applySpecialWeaponSkill)

-- all spells always hit

mem.asmpatch(0x0043188D, "jmp     0x23", 2)

-- spell damage modification

function events.CalcSpellDamage(t)

	if spellPowers[t.Spell] ~= nil then
		local spellPower = spellPowers[t.Spell][t.Mastery]
		t.Result = randomSpellPower(spellPower, t.Skill)
	end
	
end

-- spell buffs

local function calculateSpellBuffPower(spellBuffName, level)
	return spellBuffPowers[spellBuffName]["fixed"] + level * spellBuffPowers[spellBuffName]["proportional"]
end

-- StoneSkin

local function setStoneSkinPowerNovice(d)
	d.eax = calculateSpellBuffPower("StoneSkin", d.eax - 5)
end
mem.autohook(0x00426284, setStoneSkinPowerNovice, 0x8)
local function setStoneSkinPowerExpert(d)
	d.ecx = calculateSpellBuffPower("StoneSkin", d.ecx - 5)
end
mem.autohook(0x0042617F, setStoneSkinPowerExpert, 0x8)

-- Bless
local function setBlessPowerNovice(d)
	d.eax = calculateSpellBuffPower("Bless", d.eax - 5)
end
mem.autohook(0x0042680C, setBlessPowerNovice, 0x8)
local function setBlessPowerExpert(d)
	d.ecx = calculateSpellBuffPower("Bless", d.ecx - 5)
end
mem.autohook(0x00426712, setBlessPowerExpert, 0x8)

-- Heroism
local function setHeroismPowerNovice(d)
	d.ecx = calculateSpellBuffPower("Heroism", d.ecx - 5)
end
mem.autohook(0x00426D4C, setHeroismPowerNovice, 0x8)
local function setHeroismPowerExpert(d)
	d.ecx = calculateSpellBuffPower("Heroism", d.ecx - 5)
end
mem.autohook(0x00426C4F, setHeroismPowerExpert, 0x8)

-- Healing Touch
mem.asmpatch(0x00426917, "mov     edx, 5", 5)
mem.asmpatch(0x00426926, "add     eax, 4", 3)
mem.asmpatch(0x00426903, "mov     edx, 11", 5)
mem.asmpatch(0x00426912, "add     eax, 13", 3)

-- First Aid
mem.bytecodepatch(0x00427E46, "\005", 1)
mem.bytecodepatch(0x00427E3C, "\010", 1)
mem.bytecodepatch(0x00427E32, "\025", 1)

-- Cure Wounds
mem.asmpatch(0x00427FA2, "lea     edx, [ecx+ecx*4]", 4)
mem.asmpatch(0x00427F94, "lea     eax, [edx+edx*4]", 4)
mem.asmpatch(0x00427F86, "lea     ecx, [eax+eax*4]", 4)

-- Power Cure
mem.asmpatch(0x00428596, "lea     ecx, [eax+eax*4]", 4)

-- Protection from Fire
mem.asmpatch(
	0x004236E3,
	"mov    eax, DWORD [esp+0x10]\n" ..
	"mov    ecx, esi\n" ..
	string.format("add    ecx,%d\n", protectionSpellExtraMultiplier) ..
	"imul   ecx, eax\n" ..
	"mov    DWORD [esp+0x14], ecx\n",
	0x2D
)

-- Protection from Electricity
mem.asmpatch(
	0x0042439D,
	"mov    eax, DWORD[esp+0x10]\n" ..
	"mov    ecx, esi\n" ..
	"inc    ecx\n" ..
	"inc    ecx\n" ..
	"imul   ecx, eax\n" ..
	"mov    DWORD [esp+0x14], ecx\n",
	0x2D
)

-- Protection from Cold
mem.asmpatch(
	0x00424F99,
	"mov    eax, DWORD[esp+0x10]\n" ..
	"mov    ecx, esi\n" ..
	string.format("add    ecx,%d\n", protectionSpellExtraMultiplier) ..
	"imul   ecx, eax\n" ..
	"mov    DWORD [esp+0x14], ecx\n",
	0x2D
)

-- Protection from Magic
mem.asmpatch(
	0x00426087,
	"mov    eax, DWORD[esp+0x10]\n" ..
	"mov    ecx, esi\n" ..
	string.format("add    ecx,%d\n", protectionSpellExtraMultiplier) ..
	"imul   ecx, eax\n" ..
	"mov    DWORD [esp+0x14], ecx\n",
	0x2D
)

-- Protection from Poison
mem.asmpatch(
	0x00427EBB,
	"mov    eax, DWORD[esp+0x10]\n" ..
	"mov    ecx, esi\n" ..
	string.format("add    ecx,%d\n", protectionSpellExtraMultiplier) ..
	"imul   ecx, eax\n" ..
	"mov    DWORD [esp+0x14], ecx\n",
	0x2D
)

-- game initialization

function events.GameInitialized2()

	----------------------------------------------------------------------------------------------------
	-- populate global references
	----------------------------------------------------------------------------------------------------
	
	-- spellTxt id resolver
	
	for spellTxtId = 1, Game.SpellsTxt.high do
		spellTxtIds[Game.SpellsTxt[spellTxtId].Name] = spellTxtId
	end
	
	----------------------------------------------------------------------------------------------------
	-- monster ranged attacks
	----------------------------------------------------------------------------------------------------

	for monsterTxtId, monsterRangedAttack in pairs(monsterRangedAttacks) do
	
		local monsterTxt = Game.MonstersTxt[monsterTxtId]
		
		if monsterRangedAttack.Attack2Chance ~= nil then
			monsterTxt.Attack2Chance = monsterRangedAttack.Attack2Chance
			monsterTxt.Attack2.Type = monsterRangedAttack.Attack2.Type
			monsterTxt.Attack2.DamageDiceCount = monsterRangedAttack.Attack2.DamageDiceCount
			monsterTxt.Attack2.DamageDiceSides = monsterRangedAttack.Attack2.DamageDiceSides
			monsterTxt.Attack2.DamageAdd = monsterRangedAttack.Attack2.DamageAdd
			monsterTxt.Attack2.Missile = monsterRangedAttack.Attack2.Missile
		end
		
		if monsterRangedAttack.SpellChance ~= nil then
			monsterTxt.SpellChance = monsterRangedAttack.SpellChance
			monsterTxt.Spell = spellTxtIds[monsterRangedAttack.SpellName]
			monsterTxt.SpellSkill = monsterRangedAttack.SpellSkill
		end
		
	end
	
	----------------------------------------------------------------------------------------------------
	-- modify monster statistics
	----------------------------------------------------------------------------------------------------
	
	for monsterTxtIndex = 1,Game.MonstersTxt.high do
	
		local monsterTxt = Game.MonstersTxt[monsterTxtIndex]
	
		-- multiply monster hit points
		
		monsterTxt.FullHitPoints = monsterTxt.FullHitPoints * monsterHitPointsMultiplier
		
		-- multiply monster damage
				local monsterLevel = Game.MonstersTxt[monsterTxtIndex].Level
		monsterTxt.Attack1.DamageDiceSides = math.round(monsterTxt.Attack1.DamageDiceSides * ((monsterLevel+5)/20 +1))
		monsterTxt.Attack1.DamageAdd = math.round(monsterTxt.Attack1.DamageAdd * ((monsterLevel+5)/20 +1))

		monsterTxt.Attack2.DamageDiceSides = math.round(monsterTxt.Attack2.DamageDiceSides * ((monsterLevel+5)/20 +1))
		monsterTxt.Attack2.DamageAdd = math.round(monsterTxt.Attack2.DamageAdd * ((monsterLevel+5)/20 +1))

		local skillLevel, skillMastery = SplitSkill(monsterTxt.SpellSkill)
		monsterTxt.SpellSkill = math.round(JoinSkill(skillLevel * ((monsterLevel+5)/30 +1)), skillMastery)
		
		-- modify multiply monster armor class
		
		local monsterArmorClass = Game.MonstersTxt[monsterTxtIndex].ArmorClass
		monsterArmorClass = math.round(monsterArmorClass * (1 + (100 - monsterArmorClass) / 100)) * monsterArmorClassMultiplier
		Game.MonstersTxt[monsterTxtIndex].ArmorClass = monsterArmorClass
		
		-- modify and multiply monster level
		
		local monsterLevel = Game.MonstersTxt[monsterTxtIndex].Level
		monsterLevel = math.round(monsterLevel * (1 + (100 - monsterLevel) / 100)) * monsterLevelMultiplier
		Game.MonstersTxt[monsterTxtIndex].Level = monsterLevel
		
		-- monster movement speed is increased
		
		local monsterMoveSpeed = Game.MonstersTxt[monsterTxtIndex].MoveSpeed
		monsterMoveSpeed = monsterMoveSpeed + (400 - monsterMoveSpeed) / 2 + 40
		Game.MonstersTxt[monsterTxtIndex].MoveSpeed = monsterMoveSpeed
		
		-- monster experience
		
		Game.MonstersTxt[monsterTxtIndex].Experience = Game.MonstersTxt[monsterTxtIndex].Experience * monsterExperienceMultiplier
		
	end
	
	----------------------------------------------------------------------------------------------------
	-- house prices
	----------------------------------------------------------------------------------------------------

	for houseIndex = 0, Game.Houses.high do
	
		house = Game.Houses[houseIndex]

		local housePrice = housePrices[house.Name]
		if housePrice ~= nil then
			house.Val = housePrice
		end
		
	end

	----------------------------------------------------------------------------------------------------
	-- book values
	----------------------------------------------------------------------------------------------------
	
	-- normal books
	
	local normalBookBaseIndex = 300
	for itemTxtIndex = normalBookBaseIndex, Game.ItemsTxt.high do

		local itemTxt = Game.ItemsTxt[itemTxtIndex]
		local bookLevel = math.fmod((itemTxtIndex - normalBookBaseIndex), 11)
		
		itemTxt.Value = modifiedBookValues[bookLevel]
			
	end

	-- mirror books
	
	local mirrorBookBaseIndex = 377
	for itemTxtIndex = mirrorBookBaseIndex, Game.ItemsTxt.high do

		local itemTxt = Game.ItemsTxt[itemTxtIndex]
		local bookLevel = math.fmod((itemTxtIndex - mirrorBookBaseIndex), 11)
		
		itemTxt.Value = modifiedBookValues[bookLevel] * 10
			
	end

	----------------------------------------------------------------------------------------------------
	-- class descriptions
	----------------------------------------------------------------------------------------------------
	
	-- melee damage bonus

	for classIndex, value in pairs(classMeleeWeaponSkillDamageBonus) do
	
		Game.ClassDescriptions[classIndex] = Game.ClassDescriptions[classIndex] ..
			string.format(
				"\n\n%s - %s - %s adds %d - %d - %d additional damage per skill level to each distinct melee weapon type in hands.",
				Game.ClassNames[math.floor(classIndex / 3) * 3 + 0],
				Game.ClassNames[math.floor(classIndex / 3) * 3 + 1],
				Game.ClassNames[math.floor(classIndex / 3) * 3 + 2],
				classMeleeWeaponSkillDamageBonus[math.floor(classIndex / 3) * 3 + 0],
				classMeleeWeaponSkillDamageBonus[math.floor(classIndex / 3) * 3 + 1],
				classMeleeWeaponSkillDamageBonus[math.floor(classIndex / 3) * 3 + 2]
			)
			
	end
	
	----------------------------------------------------------------------------------------------------
	-- skill descriptions
	----------------------------------------------------------------------------------------------------
	
	Game.SkillDescriptions[const.Skills.Bow] = Game.SkillDescriptions[const.Skills.Bow] ..
		string.format(
			"\n\nBase recovery: %d\n\nBonus increment per skill level\n------------------------------------------------------------\n          attack | speed |",
			100 - newWeaponBaseRecoveryBonuses[const.Skills.Bow]
		)
	for rank = const.Novice, const.Master do
		SkillDescriptionsRanks[rank][const.Skills.Bow] =
			string.format(
				"     %s |     %s | %s",
				formatSkillRankNumber(newWeaponSkillAttackBonuses[const.Skills.Bow][rank], 101),
				formatSkillRankNumber(newWeaponSkillRecoveryBonuses[const.Skills.Bow][rank], 158),
				(rank == const.Master and "two arrows per shot" or "")
			)
	end

	Game.SkillDescriptions[const.Skills.Blaster] = Game.SkillDescriptions[const.Skills.Blaster] ..
		string.format(
			"\n\nBase recovery: %d\n\nBonus increment per skill level\n------------------------------------------------------------\n          attack |",
			100 - newWeaponBaseRecoveryBonuses[const.Skills.Blaster]
		)
	for rank = const.Novice, const.Master do
		SkillDescriptionsRanks[rank][const.Skills.Blaster] =
			string.format(
				"     %s |",
				formatSkillRankNumber(newWeaponSkillAttackBonuses[const.Skills.Blaster][rank], 101)
			)
	end
	
	Game.SkillDescriptions[const.Skills.Staff] = Game.SkillDescriptions[const.Skills.Staff] ..
		string.format(
			"\n\nBase recovery: %d\n\nSpecial effects: Shrink and Feeblemind\nchance = %d%% + %d%% * level, duration = %d minutes\n\nBonus increment per skill level\n------------------------------------------------------------\n          attack | AC | resistance to all |",
			100 - newWeaponBaseRecoveryBonuses[const.Skills.Staff],
			staffEffect["base"],
			staffEffect["multiplier"],
			staffEffect["duration"]
		)
	for rank = const.Novice, const.Master do
		SkillDescriptionsRanks[rank][const.Skills.Staff] =
			string.format(
				"     %s | %s |                  %s |",
				formatSkillRankNumber(newWeaponSkillAttackBonuses[const.Skills.Staff][rank], 101),
				formatSkillRankNumber(newWeaponSkillACBonuses[const.Skills.Staff][rank], 136),
				formatSkillRankNumber(newWeaponSkillResistanceBonuses[const.Skills.Staff][rank], 263)
			)
	end
	
	Game.SkillDescriptions[const.Skills.Sword] = Game.SkillDescriptions[const.Skills.Sword] ..
		string.format(
			"\n\nBase recovery: %d\n\nCan be held in left hand as an auxiliary weapon.\n\nHolding by two hands adds %d damage per skill level.\n\nBonus increment per skill level\n------------------------------------------------------------\n          attack | speed |",
			100 - newWeaponBaseRecoveryBonuses[const.Skills.Sword],
			twoHandedWeaponDamageBonus
		)
	for rank = const.Novice, const.Master do
		SkillDescriptionsRanks[rank][const.Skills.Sword] =
			string.format(
				"     %s |     %s |",
				formatSkillRankNumber(newWeaponSkillAttackBonuses[const.Skills.Sword][rank], 101),
				formatSkillRankNumber(newWeaponSkillRecoveryBonuses[const.Skills.Sword][rank], 158)
			)
	end
	
	Game.SkillDescriptions[const.Skills.Dagger] = Game.SkillDescriptions[const.Skills.Dagger]:gsub( "slower opponents'.", "slower opponents'. The dagger can also do more damage when you're fighting multiple enemies at once.")
	Game.SkillDescriptions[const.Skills.Dagger] = Game.SkillDescriptions[const.Skills.Dagger]:gsub( "Expert dagger fighters can wield a dagger in their left hand while using another weapon in their right.", "\nCan be held in left hand as an auxiliary weapon.")
	Game.SkillDescriptions[const.Skills.Dagger] = Game.SkillDescriptions[const.Skills.Dagger]:gsub( "Master dagger fighters have a chance of doing a triple damage attack.", "\nChance to deliver triple damage per attack.")
	Game.SkillDescriptions[const.Skills.Dagger] = Game.SkillDescriptions[const.Skills.Dagger] ..
		string.format(
			"\n\nBase recovery: %d\n\n+ %2.1f damage per close enemy per skill level.\n\nBonus increment per skill level\n------------------------------------------------------------\n          attack |",
			100 - newWeaponBaseRecoveryBonuses[const.Skills.Dagger],
			daggerCrowdDamageMultiplier
		)
	for rank = const.Novice, const.Master do
		SkillDescriptionsRanks[rank][const.Skills.Dagger] =
			string.format(
				"     %s |",
				formatSkillRankNumber(newWeaponSkillAttackBonuses[const.Skills.Dagger][rank], 101)
			)
	end
	
	Game.SkillDescriptions[const.Skills.Axe] = Game.SkillDescriptions[const.Skills.Axe] ..
		string.format(
			"\n\nBase recovery: %d\n\nHolding by two hands adds %d damage per skill level.\n\nBonus increment per skill level\n------------------------------------------------------------\n          attack | speed | damage |",
			100 - newWeaponBaseRecoveryBonuses[const.Skills.Axe],
			twoHandedWeaponDamageBonus
		)
	for rank = const.Novice, const.Master do
		SkillDescriptionsRanks[rank][const.Skills.Axe] =
			string.format(
				"     %s |     %s |       %s |",
				formatSkillRankNumber(newWeaponSkillAttackBonuses[const.Skills.Axe][rank], 101),
				formatSkillRankNumber(newWeaponSkillRecoveryBonuses[const.Skills.Axe][rank], 158),
				formatSkillRankNumber(newWeaponSkillDamageBonuses[const.Skills.Axe][rank], 228)
			)
	end
	
	Game.SkillDescriptions[const.Skills.Spear] = Game.SkillDescriptions[const.Skills.Spear] ..
		string.format(
			"\n\nBase recovery: %d\n\nHolding by two hands adds %d damage per skill level.\n\nBonus increment per skill level\n------------------------------------------------------------\n          attack | damage |",
			100 - newWeaponBaseRecoveryBonuses[const.Skills.Spear],
			twoHandedWeaponDamageBonus
		)
	for rank = const.Novice, const.Master do
		SkillDescriptionsRanks[rank][const.Skills.Spear] =
			string.format(
				"     %s |       %s |",
				formatSkillRankNumber(newWeaponSkillAttackBonuses[const.Skills.Spear][rank], 101),
				formatSkillRankNumber(newWeaponSkillDamageBonuses[const.Skills.Spear][rank], 171)
			)
	end
	
	Game.SkillDescriptions[const.Skills.Mace] = Game.SkillDescriptions[const.Skills.Mace] ..
		string.format(
			"\n\nBase recovery: %d\n\nSpecial effects: Paralyze\nchance = %d%% + %d%% * level, duration = %d minutes\n\nBonus increment per skill level\n------------------------------------------------------------\n          attack | damage |",
			100 - newWeaponBaseRecoveryBonuses[const.Skills.Mace],
			maceEffect["base"],
			maceEffect["multiplier"],
			maceEffect["duration"]
		)
	for rank = const.Novice, const.Master do
		SkillDescriptionsRanks[rank][const.Skills.Mace] =
			string.format(
				"     %s |       %s |",
				formatSkillRankNumber(newWeaponSkillAttackBonuses[const.Skills.Mace][rank], 101),
				formatSkillRankNumber(newWeaponSkillDamageBonuses[const.Skills.Mace][rank], 171)
			)
	end
	
	Game.SkillDescriptions[const.Skills.Shield] = Game.SkillDescriptions[const.Skills.Shield] ..
		string.format(
			"\n\nExperienced shield users can effectively cover the team from all kind of physical and magical projectiles reducing their impact damage. Each shield wearer in the party reduces damage by =%d%%= per each skill level multiplicatively.\n\nBonus increment per skill level and recovery penalty\n------------------------------------------------------------\n          AC | recovery penalty |",
			math.round(shieldProjectileDamageReductionPerLevel * 100)
		)
	for rank = const.Novice, const.Master do
		SkillDescriptionsRanks[rank][const.Skills.Shield] =
			string.format(
				" %s |                 %s |",
				formatSkillRankNumber(newArmorSkillACBonuses[const.Skills.Shield][rank], 77),
				formatSkillRankNumber(Game.SkillRecoveryTimes[const.Skills.Shield + 1], 209)
			)
	end
	
	Game.SkillDescriptions[const.Skills.Leather] = Game.SkillDescriptions[const.Skills.Leather] ..
		string.format(
			"\n\nLeather armor is the weakest but grants best resistance.\n\nBonus increment per skill level and recovery penalty\n------------------------------------------------------------\n          AC | recovery penalty | resistance |"
		)
	for rank = const.Novice, const.Master do
		SkillDescriptionsRanks[rank][const.Skills.Leather] =
			string.format(
				" %s |                 %s |          %s |",
				formatSkillRankNumber(newArmorSkillACBonuses[const.Skills.Leather][rank], 77),
				formatSkillRankNumber(Game.SkillRecoveryTimes[const.Skills.Leather + 1] * (rank == const.Novice and 1 or (rank == const.Expert and 0.5 or 0)), 209),
				formatSkillRankNumber(newArmorSkillResistanceBonuses[const.Skills.Leather][rank], 295)
			)
	end
	
	Game.SkillDescriptions[const.Skills.Chain] = Game.SkillDescriptions[const.Skills.Chain] ..
		string.format(
			"\n\nChain armor grants medium protection and mild resistance.\n\nBonus increment per skill level and recovery penalty\n------------------------------------------------------------\n          AC | recovery penalty | resistance |"
		)
	for rank = const.Novice, const.Master do
		SkillDescriptionsRanks[rank][const.Skills.Chain] =
			string.format(
				" %s |                 %s |          %s |",
				formatSkillRankNumber(newArmorSkillACBonuses[const.Skills.Chain][rank], 77),
				formatSkillRankNumber(Game.SkillRecoveryTimes[const.Skills.Chain + 1] * (rank == const.Novice and 1 or (rank == const.Expert and 0.5 or 0)), 209),
				formatSkillRankNumber(newArmorSkillResistanceBonuses[const.Skills.Chain][rank], 295)
			)
	end
	
	Game.SkillDescriptions[const.Skills.Plate] = Game.SkillDescriptions[const.Skills.Plate] ..
		string.format(
			"\n\nPlate armor is the strongest one.\n\nPlate wearer is percieved as a true battle hero who can learn swift maneuvering on a battlefield shielding the rest of the team from melee attackers.\n\nBonus increment per skill level and recovery penalty and cover chance\n------------------------------------------------------------\n          AC | recovery penalty | cover chance |"
		)
	for rank = const.Novice, const.Master do
		SkillDescriptionsRanks[rank][const.Skills.Plate] =
			string.format(
				" %s |                 %s |              %s |",
				formatSkillRankNumber(newArmorSkillACBonuses[const.Skills.Plate][rank], 77),
				formatSkillRankNumber(Game.SkillRecoveryTimes[const.Skills.Plate + 1] * (rank == const.Novice and 1 or (rank == const.Expert and 0.5 or 0)), 209),
				formatSkillRankNumber(plateCoverChanceByMastery[rank] * 100, 316)
			)
	end
	
	Game.SkillDescriptions[const.Skills.Learning] =
		string.format(
			"Learning skill directly increases the experience your character receives from killed monsters with 9%% starting bonus."
		)
	for rank = const.Novice, const.Master do
		SkillDescriptionsRanks[rank][const.Skills.Learning] =
			string.format(
				"Experience increase = %d * level",
				learningSkillMultiplierByMastery[rank]
			)
	end
	
	----------------------------------------------------------------------------------------------------
	-- spell descriptions
	----------------------------------------------------------------------------------------------------
	
	-- protections

	Game.SpellsTxt[3].Description = "Increases all your characters' resistance to Fire. Lasts one hour per point of skill in Fire Magic."
	Game.SpellsTxt[3].Normal = string.format("resistance = %d * level", (const.Novice + protectionSpellExtraMultiplier))
	Game.SpellsTxt[3].Expert = string.format("resistance = %d * level", (const.Expert + protectionSpellExtraMultiplier))
	Game.SpellsTxt[3].Master = string.format("resistance = %d * level", (const.Master + protectionSpellExtraMultiplier))
	
	Game.SpellsTxt[14].Description = "Increases all your characters' resistance to Electricity. Lasts one hour per point of skill in Air Magic."
	Game.SpellsTxt[14].Normal = string.format("resistance = %d * level", (const.Novice + protectionSpellExtraMultiplier))
	Game.SpellsTxt[14].Expert = string.format("resistance = %d * level", (const.Expert + protectionSpellExtraMultiplier))
	Game.SpellsTxt[14].Master = string.format("resistance = %d * level", (const.Master + protectionSpellExtraMultiplier))
	
	Game.SpellsTxt[25].Description = "Increases all your characters' resistance to Cold. Lasts one hour per point of skill in Water Magic."
	Game.SpellsTxt[25].Normal = string.format("resistance = %d * level", (const.Novice + protectionSpellExtraMultiplier))
	Game.SpellsTxt[25].Expert = string.format("resistance = %d * level", (const.Expert + protectionSpellExtraMultiplier))
	Game.SpellsTxt[25].Master = string.format("resistance = %d * level", (const.Master + protectionSpellExtraMultiplier))
	
	Game.SpellsTxt[36].Description = "Increases all your characters' resistance to Magic. Lasts one hour per point of skill in Earth Magic."
	Game.SpellsTxt[36].Normal = string.format("resistance = %d * level", (const.Novice + protectionSpellExtraMultiplier))
	Game.SpellsTxt[36].Expert = string.format("resistance = %d * level", (const.Expert + protectionSpellExtraMultiplier))
	Game.SpellsTxt[36].Master = string.format("resistance = %d * level", (const.Master + protectionSpellExtraMultiplier))
	
	Game.SpellsTxt[69].Description = "Increases all your characters' resistance to Poison. Lasts one hour per point of skill in Body Magic."
	Game.SpellsTxt[69].Normal = string.format("resistance = %d * level", (const.Novice + protectionSpellExtraMultiplier))
	Game.SpellsTxt[69].Expert = string.format("resistance = %d * level", (const.Expert + protectionSpellExtraMultiplier))
	Game.SpellsTxt[69].Master = string.format("resistance = %d * level", (const.Master + protectionSpellExtraMultiplier))
	
	-- stats buffs
	
	-- Lucky day
	Game.SpellsTxt[48].Description = string.format("Temporarily increases all party characters' Luck statistic by 10 points plus %d per point of skill in Spirit Magic.", spellStatsBuffPowers["StatsBuff"]["proportional"])
	Game.SpellsTxt[48].Normal = "same"
	Game.SpellsTxt[48].Expert = "same"
	Game.SpellsTxt[48].Master = "same"
	
	-- Meditation
	Game.SpellsTxt[56].Description = string.format("Temporarily increases all party characters' Intellect and Personality statistics by 10 points plus %d per point of skill in Mind Magic.", spellStatsBuffPowers["StatsBuff"]["proportional"])
	Game.SpellsTxt[56].Normal = "same"
	Game.SpellsTxt[56].Expert = "same"
	Game.SpellsTxt[56].Master = "same"
	
	-- Precision
	Game.SpellsTxt[59].Description = string.format("Temporarily increases all party characters' Accuracy statistic by 10 points plus %d per point of skill in Mind Magic.", spellStatsBuffPowers["StatsBuff"]["proportional"])
	Game.SpellsTxt[59].Normal = "same"
	Game.SpellsTxt[59].Expert = "same"
	Game.SpellsTxt[59].Master = "same"
	
	-- Speed
	Game.SpellsTxt[73].Description = string.format("Temporarily increases all party characters' Speed statistic by 10 points plus %d per point of skill in Body Magic.", spellStatsBuffPowers["StatsBuff"]["proportional"])
	Game.SpellsTxt[73].Normal = "same"
	Game.SpellsTxt[73].Expert = "same"
	Game.SpellsTxt[73].Master = "same"
	
	-- Power day
	Game.SpellsTxt[75].Description = string.format("Temporarily increases all party characters' Might and Endurance by 10 points plus %d per point of skill in Body Magic.", spellStatsBuffPowers["StatsBuff"]["proportional"])
	Game.SpellsTxt[75].Normal = "same"
	Game.SpellsTxt[75].Expert = "same"
	Game.SpellsTxt[75].Master = "same"
	
	-- direct buffs
	
	-- Stone Skin
	Game.SpellsTxt[38].Description = string.format("Increases the armor class of a character by %d + %d point per point of skill in Earth Magic.", spellBuffPowers["StoneSkin"]["fixed"], spellBuffPowers["StoneSkin"]["proportional"])
	
	-- Bless
	Game.SpellsTxt[46].Description = string.format("Increases the attack/shoot of a character by %d + %d per point of skill in Spirit Magic.", spellBuffPowers["Bless"]["fixed"], spellBuffPowers["Bless"]["proportional"])
	
	-- Heroism
	Game.SpellsTxt[51].Description = string.format("Increases the damage a character does on a successful attack by %d + %d point per point of skill in Spirit Magic.", spellBuffPowers["Heroism"]["fixed"], spellBuffPowers["Heroism"]["proportional"])
	
	-- healing spells
	
	-- Healing Touch
	Game.SpellsTxt[47].Description = string.format("Cheaply heals a single character. Skill increases the recovery rate of this spell.")
	Game.SpellsTxt[47].Normal = string.format("Heals 3-7 points of damage")
	Game.SpellsTxt[47].Expert = string.format("Heals 6-14 points of damage")
	Game.SpellsTxt[47].Master = string.format("Heals 15-35 points of damage")

	-- First Aid
	Game.SpellsTxt[68].Description = string.format("Cures single character. Recovery is reduced by an amount equal to the caster's skill in Body Magic.")
	Game.SpellsTxt[68].Normal = string.format("Cures 5 hit points")
	Game.SpellsTxt[68].Expert = string.format("Cures 10 hit points")
	Game.SpellsTxt[68].Master = string.format("Cures 25 hit points")

	-- Cure Wounds
	Game.SpellsTxt[71].Description = string.format("Cures hit points on a single target when cast. The number cured is equal to 5 per point of skill in Body Magic.")

	-- Power Cure
	Game.SpellsTxt[77].Description = string.format("Cures hit points of all characters in your party at once. The number cured is equal to 5 per point of skill in Body Magic.")

	-- direct damage spells
	
	for spellIndex, spellPower in pairs(spellPowers) do
		Game.SpellsTxt[spellIndex].Description = Game.SpellsTxt[spellIndex].Description .. string.format("\n\nmodified damage = %d + %d-%d per point of skill", spellPowers[spellIndex][const.Novice].fixedMin, spellPowers[spellIndex][const.Novice].variableMin, spellPowers[spellIndex][const.Novice].variableMax)
	end
	
	-- guardian angel
	
	Game.SpellsTxt[spellTxtIds["Guardian Angel"]].Description = string.replace(Game.SpellsTxt[spellTxtIds["Guardian Angel"]].Description, "Guardian Angel lasts for 1 hour per point of skill in Spirit Magic", "Guardian Angel lasts for 1 hour plus 5 minutes per point of skill in Spirit Magic") .. string.format("\n\nWhile active Guardian Angel lowers the death HP threshold by 10 per point of skill in Spirit Magic for all characters.")
	
	----------------------------------------------------------------------------------------------------
	-- professions
	----------------------------------------------------------------------------------------------------
	
	setProfessionChance(const.NPCProfession.Smith, 0)
	setProfessionChance(const.NPCProfession.Armorer, 0)
	setProfessionChance(const.NPCProfession.Alchemist, 0)
	setProfessionChance(const.NPCProfession.Guide, 0)
	setProfessionChance(const.NPCProfession.Counselor, 0)
	setProfessionChance(const.NPCProfession.Barrister, 0)
	setProfessionChance(const.NPCProfession.QuarterMaster, 0)
	setProfessionChance(const.NPCProfession.Cook, 0)
	setProfessionChance(const.NPCProfession.Negotiator, 0)
	setProfessionChance(const.NPCProfession.Peasant, 0)
	setProfessionChance(const.NPCProfession.Serf, 0)
	setProfessionChance(const.NPCProfession.Tailor, 0)
	setProfessionChance(const.NPCProfession.Laborer, 0)
	setProfessionChance(const.NPCProfession.Farmer, 0)
	setProfessionChance(const.NPCProfession.Cooper, 0)
	setProfessionChance(const.NPCProfession.Potter, 0)
	setProfessionChance(const.NPCProfession.Weaver, 0)
	setProfessionChance(const.NPCProfession.Cobbler, 0)
	setProfessionChance(const.NPCProfession.DitchDigger, 0)
	setProfessionChance(const.NPCProfession.Miller, 0)
	setProfessionChance(const.NPCProfession.Carpenter, 0)
	setProfessionChance(const.NPCProfession.StoneCutter, 0)
	setProfessionChance(const.NPCProfession.Jester, 0)
	setProfessionChance(const.NPCProfession.Trapper, 0)
	setProfessionChance(const.NPCProfession.Beggar, 0)
	setProfessionChance(const.NPCProfession.Rustler, 0)
	setProfessionChance(const.NPCProfession.Hunter, 0)
	setProfessionChance(const.NPCProfession.Scribe, 0)
	setProfessionChance(const.NPCProfession.Missionary, 0)
	setProfessionChance(const.NPCProfession.Clerk, 0)
	setProfessionChance(const.NPCProfession.Guard, 0)
	setProfessionChance(const.NPCProfession.FollowerofBaa, 0)
	setProfessionChance(const.NPCProfession.Noble, 0)
	setProfessionChance(const.NPCProfession.Gambler, 0)
	
	setProfessionCost(const.NPCProfession.ArmsMaster, 1000)
	setProfessionCost(const.NPCProfession.WeaponsMaster, 1500)
	setProfessionCost(const.NPCProfession.Apprentice, 200)
	setProfessionCost(const.NPCProfession.Squire, 2000)
	setProfessionCost(const.NPCProfession.Burglar, 500)
	setProfessionCost(const.NPCProfession.Factor, 100)
	setProfessionCost(const.NPCProfession.Banker, 200)
	
	----------------------------------------------------------------------------------------------------
	-- class starting skills
	----------------------------------------------------------------------------------------------------
	
	-- knight
	Game.ClassKinds.StartingSkills[0][const.Skills.Spear] = 1
	Game.ClassKinds.StartingSkills[0][const.Skills.Sword] = 2
	-- cleric
	-- sorcerer
	-- paladin
	Game.ClassKinds.StartingSkills[3][const.Skills.Spear] = 1
	Game.ClassKinds.StartingSkills[3][const.Skills.Sword] = 2
	Game.ClassKinds.StartingSkills[3][const.Skills.Leather] = 1
	Game.ClassKinds.StartingSkills[3][const.Skills.Spirit] = 2
	Game.ClassKinds.StartingSkills[3][const.Skills.Mind] = 2
	Game.ClassKinds.StartingSkills[3][const.Skills.Body] = 2
	Game.ClassKinds.StartingSkills[3][const.Skills.Chain] = 3
	Game.ClassKinds.StartingSkills[3][const.Skills.Diplomacy] = 3
	-- archer
	Game.ClassKinds.StartingSkills[4][const.Skills.Spear] = 2
	Game.ClassKinds.StartingSkills[4][const.Skills.Leather] = 1
	Game.ClassKinds.StartingSkills[4][const.Skills.Bow] = 1
	Game.ClassKinds.StartingSkills[4][const.Skills.Air] = 2
	Game.ClassKinds.StartingSkills[4][const.Skills.Water] = 2
	Game.ClassKinds.StartingSkills[4][const.Skills.Earth] = 2
	Game.ClassKinds.StartingSkills[4][const.Skills.Axe] = 3
	Game.ClassKinds.StartingSkills[4][const.Skills.Dagger] = 3
	Game.ClassKinds.StartingSkills[4][const.Skills.Diplomacy] = 3
	Game.ClassKinds.StartingSkills[4][const.Skills.IdentifyItem] = 2
	-- druid
	Game.ClassKinds.StartingSkills[5][const.Skills.Fire] = 2
	Game.ClassKinds.StartingSkills[5][const.Skills.Air] = 2
	Game.ClassKinds.StartingSkills[5][const.Skills.Mind] = 3
	Game.ClassKinds.StartingSkills[5][const.Skills.Repair] = 3
	Game.ClassKinds.StartingSkills[5][const.Skills.Learning] = 3
	Game.ClassKinds.StartingSkills[5][const.Skills.Meditation] = 2
	
	----------------------------------------------------------------------------------------------------
	-- item stats
	----------------------------------------------------------------------------------------------------
	
	for itemId = 1, Game.ItemsTxt.high do
	
		local itemTxt = Game.ItemsTxt[itemId]
		
		-- 2h staffs
		if itemTxt.Skill - 1 == const.Skills.Staff and itemTxt.Mod1DiceCount == 2 and itemTxt.Mod1DiceSides == 4 and itemTxt.Mod2 == 3 then
			itemTxt.Mod2 = 5
		elseif itemTxt.Skill - 1 == const.Skills.Staff and itemTxt.Mod1DiceCount == 2 and itemTxt.Mod1DiceSides == 4 and itemTxt.Mod2 == 7 then
			itemTxt.Mod2 = 10
		-- 2h swords
		elseif itemTxt.Skill - 1 == const.Skills.Sword and itemTxt.Mod1DiceCount == 4 and itemTxt.Mod1DiceSides == 5 and itemTxt.Mod2 == 2 then
			itemTxt.Mod2 = 12
		elseif itemTxt.Skill - 1 == const.Skills.Sword and itemTxt.Mod1DiceCount == 4 and itemTxt.Mod1DiceSides == 5 and itemTxt.Mod2 == 8 then
			itemTxt.Mod2 = 24
		-- 2h axes
		elseif itemTxt.Skill - 1 == const.Skills.Axe and itemTxt.Mod1DiceCount == 3 and itemTxt.Mod1DiceSides == 7 and itemTxt.Mod2 == 3 then
			itemTxt.Mod2 = 12
		elseif itemTxt.Skill - 1 == const.Skills.Axe and itemTxt.Mod1DiceCount == 3 and itemTxt.Mod1DiceSides == 7 and itemTxt.Mod2 == 9 then
			itemTxt.Mod2 = 24
		-- 1h/2h spears
		elseif itemTxt.Skill - 1 == const.Skills.Spear and itemTxt.Mod1DiceCount == 1 and itemTxt.Mod1DiceSides == 9 and itemTxt.Mod2 == 1 then
			itemTxt.Mod2 = 3
		elseif itemTxt.Skill - 1 == const.Skills.Spear and itemTxt.Mod1DiceCount == 1 and itemTxt.Mod1DiceSides == 9 and itemTxt.Mod2 == 5 then
			itemTxt.Mod2 = 6
		elseif itemTxt.Skill - 1 == const.Skills.Spear and itemTxt.Mod1DiceCount == 1 and itemTxt.Mod1DiceSides == 9 and itemTxt.Mod2 == 9 then
			itemTxt.Mod2 = 9
		elseif itemTxt.Skill - 1 == const.Skills.Spear and itemTxt.Mod1DiceCount == 1 and itemTxt.Mod1DiceSides == 9 and itemTxt.Mod2 == 13 then
			itemTxt.Mod2 = 12
		elseif itemTxt.Skill - 1 == const.Skills.Spear and itemTxt.Mod1DiceCount == 2 and itemTxt.Mod1DiceSides == 6 and itemTxt.Mod2 == 4 then
			itemTxt.Mod2 = 6
		elseif itemTxt.Skill - 1 == const.Skills.Spear and itemTxt.Mod1DiceCount == 3 and itemTxt.Mod1DiceSides == 6 and itemTxt.Mod2 == 4 then
			itemTxt.Mod2 = 6
		elseif itemTxt.Skill - 1 == const.Skills.Spear and itemTxt.Mod1DiceCount == 3 and itemTxt.Mod1DiceSides == 6 and itemTxt.Mod2 == 10 then
			itemTxt.Mod2 = 12
		end
			
	end
	
	for itemId = 1, Game.ItemsTxt.high do

		local itemTxt = Game.ItemsTxt[itemId]
		
		-- spear base damage
		if itemTxt.Skill - 1 == const.Skills.Spear and itemTxt.Mod1DiceCount == 1 and itemTxt.Mod1DiceSides == 9 then
			itemTxt.Mod1DiceCount = 1
			itemTxt.Mod1DiceSides = 11
			itemTxt.Notes = string.gsub(itemTxt.Notes, "+1D9", "extra dice roll")
		-- trident base damage
		elseif itemTxt.Skill - 1 == const.Skills.Spear and itemTxt.Mod1DiceCount == 2 and itemTxt.Mod1DiceSides == 6 then
			itemTxt.Mod1DiceCount = 2
			itemTxt.Mod1DiceSides = 6
			itemTxt.Notes = string.gsub(itemTxt.Notes, "+1D6", "extra dice roll")
		-- halberd base damage
		elseif itemTxt.Skill - 1 == const.Skills.Spear and itemTxt.Mod1DiceCount == 3 and itemTxt.Mod1DiceSides == 6 then
			itemTxt.Mod1DiceCount = 4
			itemTxt.Mod1DiceSides = 3
			itemTxt.Notes = string.gsub(itemTxt.Notes, "+1D6", "extra dice roll")
		end
		
	end
	
end

--[[
----------------------------------------------------------------------------------------------------
-- primary statistics effect
----------------------------------------------------------------------------------------------------

for index,value in ipairs(attributeBreakpoints) do
	mem.bytecodepatch(0x004C2860 + 2 * (index - 1), string.char(bit.band(value, 0xFF), bit.band(bit.rshift(value, 8), 0xFF)), 2)
end
for index,value in ipairs(attributeEffects) do
	mem.bytecodepatch(0x004C289C + 1 * (index - 1), string.char(bit.band(value, 0xFF)), 1)
end
--]]

--[[
-- skill advancement
local function calculateSkillAdvancementCost(level)
	return math.min(10, level + 1)
end
local function calculateSkillAdvancementCostToCheck(d, def)
	local level = bit.band(d.eax, 0x3F)
	local cost = calculateSkillAdvancementCost(level)
	d.edx = cost
end
mem.hook(0x0042D0E2, calculateSkillAdvancementCostToCheck, 0x6)
local function calculateRemainedSkillPointsAfterAdvancement(d, def)
	local level = bit.band(d.eax, 0x3F) - 1
	local cost = calculateSkillAdvancementCost(level)
	d.edi = d.edi - cost
end
mem.hook(0x0042D109, calculateRemainedSkillPointsAfterAdvancement, 0x5)
local function calculateSkillAdvancementCostToDisplay(d, def)
	local level = bit.band(d.eax, 0x3F) - 1
	local cost = calculateSkillAdvancementCost(level)
	d.eax = cost
end
mem.autohook2(0x0041F8E5, calculateSkillAdvancementCostToDisplay, 0xE)
local function adjustSkillPointsForSkillHighlight(d, def)
	local level = d.esi
	local cost = calculateSkillAdvancementCost(level)
	if d.ecx >= cost then
		d.ecx = level + 1
	else
		d.ecx = level
	end
end
mem.autohook2(0x00415A0B, adjustSkillPointsForSkillHighlight, 0x7)
--]]

-- allow to hold sword in left hand at novice rank
mem.asmpatch(0x0045A4AB, "test   BYTE [ebp+0x61],0xFF", 0x4)

-- allow to hold dagger in left hand at novice rank
mem.asmpatch(0x0045A3E8, "test   BYTE [ebp+0x62],0xFF", 0x4)

-- stat boosts
-- Lucky day does not create pointer
mem.asmpatch(0x004220D5, "test   BYTE [eax+0x70],0xFF", 0x4)
-- Lucky day affects whole party
mem.asmpatch(0x004269CD, "cmp    esi,esi", 0x3)
-- Lucky day multiplier = 5
mem.asmpatch(0x004269B4, "lea     ecx, [eax+eax*" .. (spellStatsBuffPowers["StatsBuff"]["proportional"] - 1) .. "+0Ah]", 0x4)
mem.asmpatch(0x004269A6, "lea     edx, [eax+eax*" .. (spellStatsBuffPowers["StatsBuff"]["proportional"] - 1) .. "+0Ah]", 0x4)
mem.asmpatch(0x0042699C, "lea     ecx, [eax+eax*" .. (spellStatsBuffPowers["StatsBuff"]["proportional"] - 1) .. "+0Ah]", 0x4)
-- Meditation/Precision does not create pointer
mem.asmpatch(0x004220E3, "test   BYTE [eax+0x71],0xFF", 0x4)
-- Meditation affects whole party
mem.asmpatch(0x00427399, "cmp    esi,esi", 0x3)
-- Meditation multiplier = 5
mem.asmpatch(0x00427380, "lea     ecx, [eax+eax*" .. (spellStatsBuffPowers["StatsBuff"]["proportional"] - 1) .. "+0Ah]", 0x4)
mem.asmpatch(0x00427372, "lea     edx, [eax+eax*" .. (spellStatsBuffPowers["StatsBuff"]["proportional"] - 1) .. "+0Ah]", 0x4)
mem.asmpatch(0x00427368, "lea     ecx, [eax+eax*" .. (spellStatsBuffPowers["StatsBuff"]["proportional"] - 1) .. "+0Ah]", 0x4)
-- Precision affects whole party
mem.asmpatch(0x0042760D, "cmp    esi,esi", 0x3)
-- Precision multiplier = 5
mem.asmpatch(0x004275F4, "lea     ecx, [eax+eax*" .. (spellStatsBuffPowers["StatsBuff"]["proportional"] - 1) .. "+0Ah]", 0x4)
mem.asmpatch(0x004275E6, "lea     edx, [eax+eax*" .. (spellStatsBuffPowers["StatsBuff"]["proportional"] - 1) .. "+0Ah]", 0x4)
mem.asmpatch(0x004275DC, "lea     ecx, [eax+eax*" .. (spellStatsBuffPowers["StatsBuff"]["proportional"] - 1) .. "+0Ah]", 0x4)
-- Speed/Power does not create pointer
mem.asmpatch(0x004220F6, "test   BYTE [eax+0x72],0xFF", 0x4)
-- Speed affects whole party
mem.asmpatch(0x00428154, "cmp    esi,esi", 0x3)
-- Speed multiplier = 5
mem.asmpatch(0x0042813B, "lea     ecx, [eax+eax*" .. (spellStatsBuffPowers["StatsBuff"]["proportional"] - 1) .. "+0Ah]", 0x4)
mem.asmpatch(0x0042812D, "lea     edx, [eax+eax*" .. (spellStatsBuffPowers["StatsBuff"]["proportional"] - 1) .. "+0Ah]", 0x4)
mem.asmpatch(0x00428123, "lea     ecx, [eax+eax*" .. (spellStatsBuffPowers["StatsBuff"]["proportional"] - 1) .. "+0Ah]", 0x4)
-- Power affects whole party
mem.asmpatch(0x004283F8, "cmp    esi,esi", 0x3)
-- Power multiplier = 5
mem.asmpatch(0x004283DF, "lea     ecx, [eax+eax*" .. (spellStatsBuffPowers["StatsBuff"]["proportional"] - 1) .. "+0Ah]", 0x4)
mem.asmpatch(0x004283D1, "lea     edx, [eax+eax*" .. (spellStatsBuffPowers["StatsBuff"]["proportional"] - 1) .. "+0Ah]", 0x4)
mem.asmpatch(0x004283C7, "lea     ecx, [eax+eax*" .. (spellStatsBuffPowers["StatsBuff"]["proportional"] - 1) .. "+0Ah]", 0x4)

-- learning skill bonus multiplier
local function setLearningSkillBonusMultiplier(d, def)
	d.ecx = d.ecx + learningSkillExtraMultiplier
end
mem.autohook(0x004215E5, setLearningSkillBonusMultiplier, 5)

-- navigateMissile
local function navigateMissile(object)

	-- exclude some special non targeting spells
	if
		-- Fire Blast
		object.SpellType == 8
		or
		-- Meteor Shower
		object.SpellType == 9
		or
		-- Sparks
		object.SpellType == 15
		or
		-- Starburst
		object.SpellType == 22
		or
		-- Poison Spray
		object.SpellType == 26
		or
		-- Shrapmetal
		object.SpellType == 92
	then
		return
	end
	
	-- object parameters
	local ownerKind = bit.band(object.Owner, 7)
	local targetKind = bit.band(object.Target, 7)
	local targetIndex = bit.rshift(object.Target, 3)
	
	if targetIndex > Map.Monsters.high then
		return
	end
	
	-- current position
	local currentPosition = {["X"] = object.X, ["Y"] = object.Y, ["Z"] = object.Z, }
	
	-- process only missiles between party and monster
	-- target position
	local targetPosition
	if ownerKind == const.ObjectRefKind.Party and targetKind == const.ObjectRefKind.Monster then
		local mapMonster = Map.Monsters[targetIndex]
		-- target only alive monster
		if mapMonster.HitPoints > 0 then
			targetPosition = {["X"] = mapMonster.X, ["Y"] = mapMonster.Y, ["Z"] = mapMonster.Z + mapMonster.BodyHeight * 0.75, }
		else
			return
		end
	-- assume all objects not owned by party and without target are targetting party
	elseif ownerKind ~= const.ObjectRefKind.Party and targetKind == const.ObjectRefKind.Nothing  then
		targetPosition = {["X"] = Party.X, ["Y"] = Party.Y, ["Z"] = Party.Z + 120, }
	else
		-- ignore other missiles targetting
		return
	end
	
	-- speed
	local speed = math.sqrt(object.VelocityX * object.VelocityX + object.VelocityY * object.VelocityY + object.VelocityZ * object.VelocityZ)
	
	-- process only objects with non zero speed
	if speed == 0 then
		return
	end
	
	-- direction
	local direction = {["X"] = targetPosition.X - currentPosition.X, ["Y"] = targetPosition.Y - currentPosition.Y, ["Z"] = targetPosition.Z - currentPosition.Z, }
	-- directionLength
	local directionLength = math.sqrt(direction.X * direction.X + direction.Y * direction.Y + direction.Z * direction.Z)
	
	-- normalization koefficient
	local koefficient = speed / directionLength
	
	-- new velocity
	local newVelocity = {["X"] = koefficient * direction.X, ["Y"] = koefficient * direction.Y, ["Z"] = koefficient * direction.Z, }
	
	-- set new velocity
	object.VelocityX = newVelocity.X
	object.VelocityY = newVelocity.Y
	object.VelocityZ = newVelocity.Z
	
end

-- game tick related functionality

function events.Tick()

	-- navigateMissiles
	
	for objectIndex = 1,Map.Objects.high do
		local object =  Map.Objects[objectIndex]
		navigateMissile(object)
	end
	
end

-- Feeblemind fix
local function disableFeeblemindedMonsterCasting(d, def)
	-- get default random value
	local randomRoll = def()
	-- get monster
	local monsterIndex, monster = GetMonster(d.esi)
	-- set random to 99 for feebleminded monster
	if monster.SpellBuffs[const.MonsterBuff.Feeblemind].ExpireTime ~= 0 then
		randomRoll = 99
	end
	return randomRoll
end
mem.hookcall(0x00421C5C, 0, 0, disableFeeblemindedMonsterCasting)

-- Summon hirelings
local function bringMonsterToParty(monster)
	monster.X = Party.X
	monster.Y = Party.Y
	monster.Z = Party.Z
end
local function setNPCProfession(npcId, profession)
	-- mem.u4[0x006B74F0 + 0x3C * npcId + 0x18] = profession
	Game.StreetNPC[npcId].Profession = profession
end
local function bringHirelingsToParty(professions)
	if Map.IsIndoor() then
		MessageBox("This feature works outdoor only.")
		return
	end
	local professionIndex = 1
	for monsterIndex = 0, Map.Monsters.high do
		local monster = Map.Monsters[monsterIndex]
		if
			-- outdoor
			monster.Room == 0
			and
			-- peasant
			Game.MonstersTxt[monster.Id].HostileType == 0
			and
			-- not removed
			monster.AIState ~= const.AIState.Removed
		then
			setNPCProfession(monster.NPC_ID - 1, professions[professionIndex])
			bringMonsterToParty(monster)
			professionIndex = professionIndex + 1
			if professionIndex > #professions then
				break
			end
		end
	end
end
function events.KeyDown(t)
	-- Hirelings
	if t.Alt then
		if t.Key == const.Keys["1"] then
			bringHirelingsToParty({const.NPCProfession.WeaponsMaster, const.NPCProfession.Squire, })
		elseif t.Key == const.Keys["2"] then
			bringHirelingsToParty({const.NPCProfession.SpellMaster, const.NPCProfession.Mystic, })
		elseif t.Key == const.Keys["3"] then
			bringHirelingsToParty({const.NPCProfession.Enchanter, })
		elseif t.Key == const.Keys["4"] then
			bringHirelingsToParty({const.NPCProfession.Instructor, const.NPCProfession.Teacher, })
		elseif t.Key == const.Keys["5"] then
			bringHirelingsToParty({const.NPCProfession.Banker, const.NPCProfession.Factor, })
		elseif t.Key == const.Keys["6"] then
			bringHirelingsToParty({const.NPCProfession.Merchant, const.NPCProfession.Trader, })
		elseif t.Key == const.Keys["7"] then
			bringHirelingsToParty({const.NPCProfession.Pathfinder, const.NPCProfession.Tracker, })
		elseif t.Key == const.Keys["8"] then
			bringHirelingsToParty({const.NPCProfession.WindMaster, const.NPCProfession.WaterMaster, })
		end
	end
end

-- on load map

function events.LoadMap()
	
	-- disable stats fountains

	-- Free Haven
	if Game.Map.Name == "outc2.odm" then
		-- Might fountain
		Game.MapEvtLines:RemoveEvent(161)
	-- Bootleg Bay
	elseif Game.Map.Name == "outd2.odm" then
		-- Intellect fountain
		Game.MapEvtLines:RemoveEvent(102)
		-- Personality fountain
		Game.MapEvtLines:RemoveEvent(103)
	-- Mire of the Damned
	elseif Game.Map.Name == "outc3.odm" then
		-- Endurance fountain
		Game.MapEvtLines:RemoveEvent(100)
	-- Silver Cove
	elseif Game.Map.Name == "outd1.odm" then
		-- Accuracy fountain
		Game.MapEvtLines:RemoveEvent(164)
		-- Speed fountain
		Game.MapEvtLines:RemoveEvent(165)
	-- New Sorpigal
	elseif Game.Map.Name == "oute3.odm" then
		-- Luck fountain
		Game.MapEvtLines:RemoveEvent(110)
	end
	
end

-- modify monster engagement distance

mem.asmpatch(0x004021A3, string.format("cmp     esi, %d", extendedEngagementDistance), 6)

local function modifiedFastDistance(d, def, dx, dy, dz)

	-- call original function
	
	local result = def(dx, dy, dz)
	
	-- pretend that distance to the monster is shorter if party is already engaged
	
	if bit.band(Party.StateBits, 0x20) ~= 0 then
	
		if result >= standardEngagementDistance and result < extendedEngagementDistance then
			result = standardEngagementDistance
		end
		
	end
		
	-- return result
	
	return result
	
end
mem.hookcall(0x00401117, 2, 1, modifiedFastDistance)

-- disable monster zig-zag movement

mem.asmpatch(0x00402CF6, string.format("add     edx, 0h"), 6)
mem.asmpatch(0x00402D09, string.format("add     eax, 0h"), 5)

----------------------------------------------------------------------------------------------------
-- temple healing price is scaled with party experience level
----------------------------------------------------------------------------------------------------

local function modifiedTempleHealingPrice(d, def, playerPointer, cost)

	-- call original function
	
	local result = def(playerPointer, cost)
	
	-- overwrite value
	
	result = templeHealingPrice * (result / convertIntToFloat(cost))
	
	-- get party experience level
	
	local partyExperienceLevel = getPartyExperienceLevel()
	
	-- scale price with party experience level
	
	result = math.round(result * partyExperienceLevel)
	
	-- return result
	
	return result
	
end
mem.hookcall(0x0049DD76, 1, 1, modifiedTempleHealingPrice)

----------------------------------------------------------------------------------------------------
-- inn room price is scaled with party experience level
----------------------------------------------------------------------------------------------------

local function modifiedInnRoomPrice(d, def)

	-- call original function
	
	local result = def()
	
	-- overwrite value
	
	result = innRoomPrice
	
	-- get party experience level
	
	local partyExperienceLevel = getPartyExperienceLevel()
	
	-- scale price with party experience level
	
	result = result * partyExperienceLevel
	
	-- return result
	
	return result
	
end
mem.hookcall(0x0049ED16, 0, 0, modifiedInnRoomPrice)

----------------------------------------------------------------------------------------------------
-- inn food quantity is constant
----------------------------------------------------------------------------------------------------

local function modifiedInnFoodQuantity(d, def)

	-- call original function
	
	local result = def()
	
	-- overwrite value
	
	result = innFoodQuantity
	
	-- return result
	
	return result
	
end
mem.hookcall(0x0049EEF9, 0, 0, modifiedInnFoodQuantity)

----------------------------------------------------------------------------------------------------
-- inn food price is scaled with party experience level
----------------------------------------------------------------------------------------------------

local function modifiedInnFoodPrice(d, def)

	-- call original function
	
	local result = def()
	
	-- overwrite value
	
	result = innFoodPrice
	
	-- get party experience level
	
	local partyExperienceLevel = getPartyExperienceLevel()
	
	-- scale price with party experience level
	
	result = result * partyExperienceLevel
	
	-- return result
	
	return result
	
end
mem.hookcall(0x0049ED69, 0, 0, modifiedInnFoodPrice)

----------------------------------------------------------------------------------------------------
-- plate wearer attracts attaks
----------------------------------------------------------------------------------------------------

local function modifiedMonsterChooseTargetMember(d, def, monsterPointer)

	-- execute original code
	
	local targetPlayerIndex = def(monsterPointer)
	
	-- get target player
	
	local targetPlayer = Party.Players[targetPlayerIndex]
	local targetPlayerEquipmentData = getPlayerEquipmentData(targetPlayer)
	
	-- set default substitute player = target player
	
	local substitutePlayerIndex = targetPlayerIndex
	
	-- switch target player only if they do not wear plate
	
	if targetPlayerEquipmentData.armor.skill ~= const.Skills.Plate then
		
		local roll = math.random()
		local substituteProbability = 0
		
		for playerIndex = 0,3 do
		
			local player = Party.Players[playerIndex]
			local playerEquipmentData = getPlayerEquipmentData(player)
		
			if playerIndex ~= targetPlayerIndex then
			
				-- switch to substitute player only if they wear plate
				
				if playerEquipmentData.armor.skill == const.Skills.Plate then
				
					local substituteProbability = substituteProbability + plateCoverChanceByMastery[playerEquipmentData.armor.rank]
					
					if roll < substituteProbability then
						substitutePlayerIndex = playerIndex
						Game.ShowStatusText(string.format("%s covered %s", player.Name, targetPlayer.Name), 10)
						break
					end
					
				end
				
			end
			
		end
		
	end
	
	-- return substitute player index
	
	return substitutePlayerIndex

end
mem.hookcall(0x00430C4B, 0, 1, modifiedMonsterChooseTargetMember)

----------------------------------------------------------------------------------------------------
-- shield holder protects from projectiles
----------------------------------------------------------------------------------------------------

local function modifiedCharacterStrikeWithDamageProjectile(d, def, playerPointer, damage, damageKind)

	-- compute damage reduction
	
	local damageMultiplier = 1.0
	
	for playerIndex = 0, 3 do
	
		local player = Party.Players[playerIndex]
		local playerEquipmentData = getPlayerEquipmentData(player)
		
		if playerEquipmentData.shield.equipped then
			damageMultiplier = damageMultiplier * math.pow(1 - shieldProjectileDamageReductionPerLevel, playerEquipmentData.shield.level)
		end
		
	end
	
	damage = math.ceil(damage * damageMultiplier)

	-- execute original code
	
	def(playerPointer, damage, damageKind)
	
end
mem.hookcall(0x0043203C, 1, 2, modifiedCharacterStrikeWithDamageProjectile)

----------------------------------------------------------------------------------------------------
-- display damage rate
----------------------------------------------------------------------------------------------------

-- shift positions in character stats display and remove mandatory + in attack

mem.bytecodepatch(0x004BD3FB, "\048\056\048\032\037", 5)
mem.bytecodepatch(0x004BD3EF, "\048\056\048\032\037", 5)
mem.bytecodepatch(0x004BD3E3, "\048\056\048\032\037", 5)

local function getAverageDamageRate(player, ranged, monsterArmorClass)

	-- set default armor class
	
	if monsterArmorClass == nil then
		monsterArmorClass = 100
	end

	-- get combat parameters
	
	local recovery = player:GetAttackDelay(ranged)
	local attack
	local damageRangeText
	if ranged then
		attack = player:GetRangedAttack()
	else
		attack = player:GetMeleeAttack()
	end
	if ranged then
		damageRangeText = player:GetRangedDamageRangeText()
	else
		damageRangeText = player:GetMeleeDamageRangeText()
	end
	
	if attack == nil or type(attack) ~= "number" or recovery == nil  or type(recovery) ~= "number" or damageRangeText == nil or type(damageRangeText) ~= "string" then
		return 0
	end
	
	local damageMinText, damageMaxText = string.match(damageRangeText, "(-?%d+)%s*-%s(-?%d+)")
	local damageMin = tonumber(damageMinText)
	local damageMax = tonumber(damageMaxText)
	
	if damageMin == nil or type(damageMin) ~= "number" or damageMax == nil or type(damageMax) ~= "number" then
		return 0
	end
	
	local averageDamage = (damageMax + damageMin) / 2
	
	-- calculate average damage rate against monster and no physical resistance
	
	local chanceToHit = (15 + 2 * attack) / (15 + 2 * attack + 15 + monsterArmorClass)
	local averageDamageRate = math.round(averageDamage * chanceToHit * (100 / recovery))
	
	-- return value
	
	return averageDamageRate
	
end
local function modifiedDisplayReferenceMeleeAttack(d, def, dlg, font, x, y, color, text, arg_10, arg_14)

	-- get player
	
	local playerIndex, player = GetPlayer(d.ebp)
	
	-- get average damage rate
	
	local averageDamageRate = getAverageDamageRate(player, false)
	
	-- modify text buffer
	
	if averageDamageRate ~= nil then
		local averageDamageRateText = string.format("%d", averageDamageRate)
		averageDamageRateText = StrColor(0x00,0xFF,0x00) .. StrLeft(40) .. "/" .. StrLeft(84 - 12 * string.len(averageDamageRateText)) .. averageDamageRateText .. StrColor(0,0,0)
		Game.TextBuffer = string.gsub(Game.TextBuffer, "^+", "")
		Game.TextBuffer = Game.TextBuffer .. averageDamageRateText
	end
	
	-- execute original code
	
	def(dlg, font, x, y, color, text, arg_10, arg_14)
	
end
mem.hookcall(0x00416F51, 2, 6, modifiedDisplayReferenceMeleeAttack)
local function modifiedDisplayReferenceRangedAttack(d, def, dlg, font, x, y, color, text, arg_10, arg_14)

	-- get player
	
	local playerIndex, player = GetPlayer(d.ebp)
	
	-- get average damage rate
	
	local averageDamageRate = getAverageDamageRate(player, true)
	
	-- append to text buffer
	
	if averageDamageRate ~= nil then
		local averageDamageRateText = string.format("%d", averageDamageRate)
		averageDamageRateText = StrColor(0x00,0xFF,0x00) .. StrLeft(40) .. "/" .. StrLeft(84 - 12 * string.len(averageDamageRateText)) .. averageDamageRateText .. StrColor(0,0,0)
		Game.TextBuffer = string.gsub(Game.TextBuffer, "^+", "")
		Game.TextBuffer = Game.TextBuffer .. averageDamageRateText
	end
	
	-- execute original code
	
	def(dlg, font, x, y, color, text, arg_10, arg_14)
	
end
mem.hookcall(0x00416FF8, 2, 6, modifiedDisplayReferenceRangedAttack)
local function modifiedDisplayStatistictsMeleeAttack(d, def, dlg, font, x, y, color, str)

	-- get player
	
	local player = Party.Players[Game.CurrentPlayer]
	
	-- get average damage rate
	
	local averageDamageRate = getAverageDamageRate(player, false)

	-- append to text buffer

	if averageDamageRate ~= nil then
		local averageDamageRateText = string.format("%d", averageDamageRate)
		averageDamageRateText = StrColor(0x00,0xFF,0x00) .. StrLeft(140) .. "/" .. StrLeft(184 - 12 * string.len(averageDamageRateText)) .. averageDamageRateText .. StrColor(0,0,0)
		Game.TextBuffer = string.sub(Game.TextBuffer, 1, string.len(Game.TextBuffer) - 1) .. averageDamageRateText .. "\n"
	end
	
	-- execute original code
	
	def(dlg, font, x, y, color, str)
	
end
mem.hookcall(0x00414A3B, 2, 4, modifiedDisplayStatistictsMeleeAttack)
local function modifiedDisplayStatisticsRangedAttack(d, def, dlg, font, x, y, color, str)

	-- get player
	
	local player = Party.Players[Game.CurrentPlayer]
	
	-- get average damage rate
	
	local averageDamageRate = getAverageDamageRate(player, true)

	-- append to text buffer

	if averageDamageRate ~= nil then
		local averageDamageRateText = string.format("%d", averageDamageRate)
		averageDamageRateText = StrColor(0x00,0xFF,0x00) .. StrLeft(140) .. "/" .. StrLeft(184 - 12 * string.len(averageDamageRateText)) .. averageDamageRateText .. StrColor(0,0,0)
		Game.TextBuffer = string.sub(Game.TextBuffer, 1, string.len(Game.TextBuffer) - 1) .. averageDamageRateText .. "\n"
	end
	
	-- execute original code
	
	def(dlg, font, x, y, color, str)
	
end
mem.hookcall(0x00414AD5, 2, 4, modifiedDisplayStatisticsRangedAttack)

----------------------------------------------------------------------------------------------------
-- handle game actions
----------------------------------------------------------------------------------------------------

function events.Action(t)
	
	-- clicked on skill in skill screen
	
	if t.Action == 121 then
	
		-- get current player
		
		local currentPlayer = Party.Players[Party.CurrentPlayer]
		
		-- get skill
		
		local skill = t.Param
	
		-- check if skill is advanceable
		
		local skillLevel, skillMastery = SplitSkill(currentPlayer.Skills[skill])
		local skillAdvanceable = (currentPlayer.SkillPoints >= skillLevel + 1)
	
		if skillAdvanceable then
		
			-- character linked skills
			
			for key, characterLinkedSkills in pairs(characterLinkedSkillGroups) do
			
				if characterLinkedSkills[skill] ~= nil then
			
					-- advance all other skills to at least same level
					
					for characterLinkedSkill, value in pairs(characterLinkedSkills) do
					
						if characterLinkedSkill ~= skill then
						
							local characterLinkedSkillLevel, characterLinkedSkillMastery = SplitSkill(currentPlayer.Skills[characterLinkedSkill])
						
							if characterLinkedSkillMastery ~= 0 and characterLinkedSkillLevel <= skillLevel then
									currentPlayer.Skills[characterLinkedSkill] = JoinSkill(skillLevel + 1, characterLinkedSkillMastery)
							end
							
						end
						
					end
					
				end
				
			end
			
			-- party linked skills
			
			if partyLinkedSkills[skill] ~= nil then
		
				-- advance same skill for other party members to at least same level
				
				for i = 0, 3 do
				
					if i ~= Party.CurrentPlayer then
					
						local player = Party.Players[i]
					
						local partyLinkedSkillLevel, partyLinkedSkillMastery = SplitSkill(player.Skills[skill])
					
						if partyLinkedSkillMastery ~= 0 and partyLinkedSkillLevel <= skillLevel then
								player.Skills[skill] = JoinSkill(skillLevel + 1, partyLinkedSkillMastery)
						end
						
					end
					
				end
				
			end
			
		end
		
	end
		
end

----------------------------------------------------------------------------------------------------
-- draw monster info
----------------------------------------------------------------------------------------------------

function modifiedDrawMonsterInfoName(d, def, dialog, font, left, top, color, str, a6)

	-- get monster
	
	local monsterIndex, monster = GetMonster(d.edi)
	local monsterTxt = Game.MonstersTxt[monster.Id]
	
	-- invoke original function
	
	def(dialog, font, left, top, color, str, a6)
	
	-- display monster txt statistics
	
	local textLines = {}
	
	-- player damage rate on monster
	if Game.CurrentPlayer >= 0 and Game.CurrentPlayer <= 3 then
		local player = Party.Players[Game.CurrentPlayer]
		local meleeDamageRate = getAverageDamageRate(player, false, monsterTxt.ArmorClass)
		local rangedDamageRate = getAverageDamageRate(player, true, monsterTxt.ArmorClass)
		table.insert(textLines, {["key"] = "Damage Rate melee", ["value"] = string.format("%d", meleeDamageRate), ["type"] = "damageRate", })
		table.insert(textLines, {["key"] = "Damage Rate ranged", ["value"] = string.format("%d", rangedDamageRate), ["type"] = "damageRate", })
		table.insert(textLines, {["key"] = "", ["value"] = "", })
	else
		table.insert(textLines, {["key"] = "", ["value"] = "", })
		table.insert(textLines, {["key"] = "", ["value"] = "", })
		table.insert(textLines, {["key"] = "", ["value"] = "", })
	end
	
	table.insert(textLines, {["key"] = "Full Hit Points", ["value"] = string.format("%d", monsterTxt.FullHitPoints)})
	table.insert(textLines, {["key"] = "Armor Class", ["value"] = string.format("%d", monsterTxt.ArmorClass)})
	table.insert(textLines, {["key"] = "Level", ["value"] = string.format("%d", monsterTxt.Level)})
	table.insert(textLines, {["key"] = "Recovery", ["value"] = string.format("%d", monsterTxt.AttackRecovery)})
	table.insert(textLines, {["key"] = string.format("Att 1: %s %s", attackTypes[monsterTxt.Attack1.Type], (monsterTxt.Attack1.Missile == 0) and "melee" or "ranged"), ["value"] = string.format("%d-%d", monsterTxt.Attack1.DamageAdd + monsterTxt.Attack1.DamageDiceCount, monsterTxt.Attack1.DamageAdd + monsterTxt.Attack1.DamageDiceCount * monsterTxt.Attack1.DamageDiceSides)})
	if monsterTxt.Attack2Chance == 0 then
		table.insert(textLines, {["key"] = "Att 2:", ["value"] = ""})
	else
		table.insert(textLines, {["key"] = string.format("Att 2: %s %s", attackTypes[monsterTxt.Attack2.Type], (monsterTxt.Attack2.Missile == 0) and "melee" or "ranged"), ["value"] = string.format("%d-%d", monsterTxt.Attack2.DamageAdd + monsterTxt.Attack2.DamageDiceCount, monsterTxt.Attack2.DamageAdd + monsterTxt.Attack2.DamageDiceCount * monsterTxt.Attack2.DamageDiceSides)})
	end
	if monsterTxt.SpellChance == 0 then
		table.insert(textLines, {["key"] = "Spell:", ["value"] = ""})
	else
		local spellLevel, spellMastery = SplitSkill(monsterTxt.SpellSkill)
		table.insert(textLines, {["key"] = string.format("Spell: %s (%s.%d)", string.replace(Game.SpellsTxt[monsterTxt.Spell].ShortName, "\"", ""), masteries[spellMastery], spellLevel), ["value"] = ""})
	end
	table.insert(textLines, {["key"] = "Fire", ["value"] = string.format("%d", monsterTxt.FireResistance), ["type"] = "resistance", })
	table.insert(textLines, {["key"] = "Elec", ["value"] = string.format("%d", monsterTxt.ElecResistance), ["type"] = "resistance", })
	table.insert(textLines, {["key"] = "Cold", ["value"] = string.format("%d", monsterTxt.ColdResistance), ["type"] = "resistance", })
	table.insert(textLines, {["key"] = "Poison", ["value"] = string.format("%d", monsterTxt.PoisonResistance), ["type"] = "resistance", })
	table.insert(textLines, {["key"] = "Magic", ["value"] = string.format("%d", monsterTxt.MagicResistance), ["type"] = "resistance", })
	table.insert(textLines, {["key"] = "Phys", ["value"] = string.format("%d", monsterTxt.PhysResistance), ["type"] = "resistance", })
	
	-- draw info
	
	font = Game.Smallnum_fnt
	local top = 36
	local lineHeight = 11
	local normalKeyMargin = 20
	local normalKeyColor = 0x0000					-- white
	local resistanceKeyMargin = 180
	local resistanceKeyColor = 0xFFC0			-- yellow
	local damageRateKeyMargin = normalKeyMargin
	local damageRateKeyColor = 0x07C0
	local valueRightMargin = 230
	local valueNumberShift = 8
	local normalValueColor = 0x07FE				-- cyan
	local damageRateValueColor = 0xF8C6		-- reddish
	
	for index, tuple in pairs(textLines) do
	
		-- draw key
	
		local keyMargin;
		local keyColor;
	
		if tuple.type == "resistance" then
			keyMargin = resistanceKeyMargin
			keyColor = resistanceKeyColor
		elseif tuple.type == "damageRate" then
			keyMargin = damageRateKeyMargin
			keyColor = damageRateKeyColor
		else
			keyMargin = normalKeyMargin
			keyColor = normalKeyColor
		end
		
		Game.TextBuffer = tuple.key .. string.rep(" ", 100)
		def(dialog, font, keyMargin, top + lineHeight * index, keyColor, str, 0)
		
		-- draw value
		
		local valueColor;
	
		if tuple.type == "damageRate" then
			valueColor = damageRateValueColor
		else
			valueColor = normalValueColor
		end
		
		local valueMargin = valueRightMargin - valueNumberShift * string.len(tuple.value)
		for c in string.gmatch(tuple.value, ".") do
			valueMargin = valueMargin + valueNumberShift
			local adjustedValueMargin = valueMargin
			if c == "-" then
				adjustedValueMargin = adjustedValueMargin + 1
			elseif c == "4" then
				adjustedValueMargin = adjustedValueMargin - 1
			end
			Game.TextBuffer = c .. string.rep(" ", 100)
			def(dialog, font, adjustedValueMargin, top + lineHeight * index, valueColor, str, 0)
		end
		
	end
	
end
mem.hookcall(0x0041D18D, 2, 5, modifiedDrawMonsterInfoName)

----------------------------------------------------------------------------------------------------
-- raise immunity threshold
----------------------------------------------------------------------------------------------------

mem.asmpatch(0x00421DD9, string.format("cmp     eax, %d", 1000), 5)

----------------------------------------------------------------------------------------------------
-- shrine events
----------------------------------------------------------------------------------------------------

function configureShrineEvent(eventId, shrineIndex, statisticsName, hintStringIndex, statusTextNothingIndex, statusText10Index, statusText3Index)

	-- initialize shrine blessings table and value

	if vars.shrineBlessings == nil then
		vars.shrineBlessings = {}
	end
	if vars.shrineBlessings[shrineIndex] == nil then
		vars.shrineBlessings[shrineIndex] = 0
	end

	-- calculate number of blessings available

	local availableBlessings = Game.Year - Game.BaseYear + 1

	-- rewrite event

	Game.MapEvtLines:RemoveEvent(eventId)
	evt.hint[eventId] = evt.str[hintStringIndex]
	evt.map[eventId] = function()
		if availableBlessings > vars.shrineBlessings[shrineIndex] then
			if evt.Cmp("QBits", 207 + shrineIndex) then
				evt.ForPlayer("All")
				evt.Add(statisticsName, 3)
				evt.StatusText(statusText3Index)
			else
				evt.Set("QBits", 207 + shrineIndex)
				evt.ForPlayer("All")
				evt.Add(statisticsName, 10)
				evt.StatusText(statusText10Index)
			end
			vars.shrineBlessings[shrineIndex] = vars.shrineBlessings[shrineIndex] + 1
		else
			--evt.StatusText(statusTextNothingIndex)
			Game.ShowStatusText("Return next year")
		end
	end

end

----------------------------------------------------------------------------------------------------
-- melee damage monster from party hook
----------------------------------------------------------------------------------------------------

local function meleeAttackMonster(d, def, attackStructure, monsterIndex, knockbackParameter)

	local attackType = bit.band(attackStructure, 7)
	local playerIndex = bit.rshift(attackStructure, 2)
	
	-- execute original function
	
	def(attackStructure, monsterIndex, knockbackParameter)
	
	-- non melee attack
	
	if attackType ~= 2 then
		return
	end
	
	-- process extra hits
	
		local attackType = bit.band(attackStructure, 7)
	local playerIndex = bit.rshift(attackStructure, 2)
	

	
end
mem.hookcall(0x0042A228, 2, 1, meleeAttackMonster)

----------------------------------------------------------------------------------------------------
-- guardian angel adds to endurance to preserve character
----------------------------------------------------------------------------------------------------

local guardianAngelPower

--mem.asmpatch(0x00406886, string.format("cmp    eax,%d", meleeRecoveryCap), 3)
--mem.asmpatch(0x00406886, string.format("cmp    eax,%d", meleeRecoveryCap), 3)

local function guardianAngelCharacterTrySubtractSpellPoints(d, def, characterPointer, spellPoints)
	-- get caster
	local playerIndex, player = GetPlayer(d.ebp)
	-- get caster skill
	local level, rank = SplitSkill(player.Skills[const.Skills.Spirit])
	-- store spell power
	guardianAngelPower = level
	-- execute original method
	return def(characterPointer, spellPoints)
end
mem.hookcall(0x00426BB0, 1, 1, guardianAngelCharacterTrySubtractSpellPoints)

local function guardianAngelSetSpellBuff(d, def, spellBuffAddress, expireTimeLow, expireTimeHigh, skill, strength, overlay, caster)
	-- set correct duration
	local duration = guardianAngelPower * 300 + 3600
	expireTimeLow = Game.Time + duration * 128 / 30
	-- set spell buff with correct power
	def(spellBuffAddress, expireTimeLow, expireTimeHigh, skill, guardianAngelPower, overlay, caster)
end
mem.hookcall(0x00426C0F, 1, 6, guardianAngelSetSpellBuff)

local guardianAngelEnduranceBonusPerLevel = 10
local function changedCharacterCalcStatBonusByItems(d, def, characterPointer, statId)
	-- calculate default bonus
	local statBonus = def(characterPointer, statId)
	-- guardian angel buff
	local guardianAngelBuff = Party.SpellBuffs[const.PartyBuff.GuardianAngel]
	-- increase bonus to make it positive so character doesn't die with guardian angel
	if guardianAngelBuff.ExpireTime ~= 0 then
		statBonus = statBonus + guardianAngelEnduranceBonusPerLevel * guardianAngelBuff.Power
	end
	return statBonus
end
mem.hookcall(0x0047FF37, 1, 1, changedCharacterCalcStatBonusByItems)
mem.hookcall(0x0048875B, 1, 1, changedCharacterCalcStatBonusByItems)

