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

local weaponOldBaseRecoveryBonuses =
{
	[const.Skills.Bow] = 0,
	[const.Skills.Staff] = 0,
	[const.Skills.Axe] = 0,
	[const.Skills.Sword] = 10,
	[const.Skills.Spear] = 20,
	[const.Skills.Mace] = 20,
	[const.Skills.Dagger] = 40,
}
local weaponNewBaseRecoveryBonuses =
{
	[const.Skills.Bow] = 0,
	[const.Skills.Staff] = 0,
	[const.Skills.Axe] = -20,
	[const.Skills.Sword] = -10,
	[const.Skills.Spear] = 20,
	[const.Skills.Mace] = 20,
	[const.Skills.Dagger] = 40,
}

local armorAdditionalRecoveryPenalties =
{
	[const.Skills.Leather] = 0,
	[const.Skills.Chain] = 0,
	[const.Skills.Plate] = 0,
}

local armorSkillNewBonusBySkillAndRank =
{
	[const.Skills.Shield] =
	{
		[const.Novice] = 4,
		[const.Expert] = 6,
		[const.Master] = 8,
	},
	[const.Skills.Leather] =
	{
		[const.Novice] = 2,
		[const.Expert] = 3,
		[const.Master] = 4,
	},
	[const.Skills.Chain] =
	{
		[const.Novice] = 4,
		[const.Expert] = 6,
		[const.Master] = 8,
	},
	[const.Skills.Plate] =
	{
		[const.Novice] = 6,
		[const.Expert] = 9,
		[const.Master] = 12,
	},
}
local armorSkillResistanceBonusBySkillAndRank =
{
	[const.Skills.Leather] =
	{
		[const.Novice] = 4,
		[const.Expert] = 6,
		[const.Master] = 8,
	},
	[const.Skills.Chain] =
	{
		[const.Novice] = 2,
		[const.Expert] = 3,
		[const.Master] = 4,
	},
}

local weaponSkillRecoveryBonuses =
{
	[const.Skills.Bow] = 1,
	[const.Skills.Staff] = 0,
	[const.Skills.Axe] = 1,
	[const.Skills.Sword] = 1,
	[const.Skills.Spear] = 0,
	[const.Skills.Mace] = 0,
	[const.Skills.Dagger] = 0,
}

local weaponSkillDamageBonuses =
{
	[const.Skills.Bow] = 0,
	[const.Skills.Staff] = 0,
	[const.Skills.Axe] = 1,
	[const.Skills.Sword] = 0,
	[const.Skills.Spear] = 1,
	[const.Skills.Mace] = 1,
	[const.Skills.Dagger] = 0,
}

local weaponSkillResistanceBonuses =
{
	[const.Skills.Bow] = 0,
	[const.Skills.Staff] = 1,
	[const.Skills.Axe] = 0,
	[const.Skills.Sword] = 0,
	[const.Skills.Spear] = 0,
	[const.Skills.Mace] = 0,
	[const.Skills.Dagger] = 0,
}

-- skill effect multipliers
local attackBonusByMastery = {[const.Novice] = 2, [const.Expert] = 3, [const.Master] = 4, }
local recoveryBonusByMastery = {[const.Novice] = 4, [const.Expert] = 5, [const.Master] = 6, }
local damageBonusByMastery = {[const.Novice] = 2, [const.Expert] = 3, [const.Master] = 4, }
local weaponACBonusByMastery = {[const.Novice] = 4, [const.Expert] = 6, [const.Master] = 8, }
local twoHandedWeaponDamageBonusByMastery = {[const.Novice] = 0, [const.Expert] = 0, [const.Master] = 0, }
local weaponResistanceBonusByMastery = {[const.Novice] = 0, [const.Expert] = 1, [const.Master] = 2, }

-- special weapon skill chances
local staffEffect = {["base"] = 10, ["multiplier"] = 2, ["duration"] = 5, }
local maceEffect = {["base"] = 5, ["multiplier"] = 1, ["duration"] = 5, }

-- class weapon skill damage bonus
local classMeleeWeaponSkillDamageBonus =
{
	[const.Class.Knight] = 2,
	[const.Class.Cavalier] = 3,
	[const.Class.Champion] = 4,
	[const.Class.Paladin] = 0,
	[const.Class.Crusader] = 1,
	[const.Class.Hero] = 2,
}
local classRangedWeaponSkillDamageBonus =
{
	[const.Class.Archer] = 2,
	[const.Class.BattleMage] = 3,
	[const.Class.WarriorMage] = 4,
}

-- plate wearer attack attraction chances by mastery
local plateWearerAttackAttractionChanceByMastery = {[const.Novice] = 0.1, [const.Expert] = 0.2, [const.Master] = 0.3, }

-- spell powers
local spellPowers =
{
	-- Ring of Fire
	[7] =
	{
		[const.Novice] = {fixedMin = 3, fixedMax = 3, variableMin = 1, variableMax = 3, },
		[const.Expert] = {fixedMin = 3, fixedMax = 3, variableMin = 1, variableMax = 3, },
		[const.Master] = {fixedMin = 3, fixedMax = 3, variableMin = 1, variableMax = 3, },
	},
	-- Meteor Shower
	[9] =
	{
		[const.Novice] = {fixedMin = 4, fixedMax = 4, variableMin = 1, variableMax = 4, },
		[const.Expert] = {fixedMin = 4, fixedMax = 4, variableMin = 1, variableMax = 4, },
		[const.Master] = {fixedMin = 4, fixedMax = 4, variableMin = 1, variableMax = 4, },
	},
	-- Inferno
	[10] =
	{
		[const.Novice] = {fixedMin = 5, fixedMax = 5, variableMin = 1, variableMax = 5, },
		[const.Expert] = {fixedMin = 5, fixedMax = 5, variableMin = 1, variableMax = 5, },
		[const.Master] = {fixedMin = 5, fixedMax = 5, variableMin = 1, variableMax = 5, },
	},
	-- Starburst
	[22] =
	{
		[const.Novice] = {fixedMin = 8, fixedMax = 8, variableMin = 1, variableMax = 8, },
		[const.Expert] = {fixedMin = 8, fixedMax = 8, variableMin = 1, variableMax = 8, },
		[const.Master] = {fixedMin = 8, fixedMax = 8, variableMin = 1, variableMax = 8, },
	},
	-- Ice Blast
	[32] =
	{
		[const.Novice] = {fixedMin = 10, fixedMax = 10, variableMin = 1, variableMax = 10, },
		[const.Expert] = {fixedMin = 10, fixedMax = 10, variableMin = 1, variableMax = 10, },
		[const.Master] = {fixedMin = 10, fixedMax = 10, variableMin = 1, variableMax = 10, },
	},
	-- Death Blossom
	[43] =
	{
		[const.Novice] = {fixedMin = 8, fixedMax = 8, variableMin = 1, variableMax = 8, },
		[const.Expert] = {fixedMin = 8, fixedMax = 8, variableMin = 1, variableMax = 8, },
		[const.Master] = {fixedMin = 8, fixedMax = 8, variableMin = 1, variableMax = 8, },
	},
	-- Mind Blast
	[58] =
	{
		[const.Novice] = {fixedMin = 4, fixedMax = 4, variableMin = 1, variableMax = 4, },
		[const.Expert] = {fixedMin = 4, fixedMax = 4, variableMin = 1, variableMax = 4, },
		[const.Master] = {fixedMin = 4, fixedMax = 4, variableMin = 1, variableMax = 4, },
	},
	-- Harm
	[70] =
	{
		[const.Novice] = {fixedMin = 5, fixedMax = 5, variableMin = 1, variableMax = 5, },
		[const.Expert] = {fixedMin = 5, fixedMax = 5, variableMin = 1, variableMax = 5, },
		[const.Master] = {fixedMin = 5, fixedMax = 5, variableMin = 1, variableMax = 5, },
	},
	-- Flying Fist
	[76] =
	{
		[const.Novice] = {fixedMin = 14, fixedMax = 14, variableMin = 1, variableMax = 14, },
		[const.Expert] = {fixedMin = 14, fixedMax = 14, variableMin = 1, variableMax = 14, },
		[const.Master] = {fixedMin = 14, fixedMax = 14, variableMin = 1, variableMax = 14, },
	},
	-- Prismatic Light
	[84] =
	{
		[const.Novice] = {fixedMin = 10, fixedMax = 10, variableMin = 1, variableMax = 10, },
		[const.Expert] = {fixedMin = 10, fixedMax = 10, variableMin = 1, variableMax = 10, },
		[const.Master] = {fixedMin = 10, fixedMax = 10, variableMin = 1, variableMax = 10, },
	},
}
local spellBuffPowers =
{
	-- StoneSkin
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
		["proportional"] = 2,
	},
}

-- monster engagement distance

local standardEngagementDistance = 0x1600
local extendedEngagementDistance = 0x1E00

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

-- ======================================= --
-- Helper functions --
-- ======================================= --

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
		
		if equipmentData.bow.skill == const.Skills.Bow then
		
			equipmentData.bow.weapon = true
			equipmentData.bow.level, equipmentData.bow.rank = SplitSkill(player.Skills[equipmentData.bow.skill])
			
		end
		
	end
	
	-- get main hand weapon data
			
	if player.ItemMainHand ~= 0 then
		
		equipmentData.main.equipped = true
		
		equipmentData.main.item = player.Items[player.ItemMainHand]
		equipmentData.main.itemTxt = Game.ItemsTxt[equipmentData.main.item.Number]
		equipmentData.main.equipStat = equipmentData.main.itemTxt.EquipStat + 1
		equipmentData.main.skill = equipmentData.main.itemTxt.Skill - 1
		
		if
			equipmentData.main.skill == const.Skills.Staff
			or
			equipmentData.main.skill == const.Skills.Axe
			or
			equipmentData.main.skill == const.Skills.Sword
			or
			equipmentData.main.skill == const.Skills.Spear
			or
			equipmentData.main.skill == const.Skills.Mace
			or
			equipmentData.main.skill == const.Skills.Dagger
		then
		
			equipmentData.main.weapon = true
			equipmentData.main.level, equipmentData.main.rank = SplitSkill(player.Skills[equipmentData.main.skill])
			
		end
		
	end
	
	-- get extra hand weapon data
			
	if player.ItemExtraHand ~= 0 then
		
		equipmentData.extra.equipped = true
		
		equipmentData.extra.item = player.Items[player.ItemExtraHand]
		equipmentData.extra.itemTxt = Game.ItemsTxt[equipmentData.extra.item.Number]
		equipmentData.extra.equipStat = equipmentData.extra.itemTxt.EquipStat + 1
		equipmentData.extra.skill = equipmentData.extra.itemTxt.Skill - 1
		
		if
			equipmentData.extra.skill == const.Skills.Staff
			or
			equipmentData.extra.skill == const.Skills.Axe
			or
			equipmentData.extra.skill == const.Skills.Sword
			or
			equipmentData.extra.skill == const.Skills.Spear
			or
			equipmentData.extra.skill == const.Skills.Mace
			or
			equipmentData.extra.skill == const.Skills.Dagger
		then
		
			equipmentData.extra.weapon = true
			equipmentData.extra.level, equipmentData.extra.rank = SplitSkill(player.Skills[equipmentData.extra.skill])
			
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
	
		-- remove old base bonus
		correction = correction + weaponOldBaseRecoveryBonuses[equipmentData1.skill]
		
		-- add new base bonus
		correction = correction - weaponNewBaseRecoveryBonuses[equipmentData1.skill]
		
		-- remove old skill bonus
		if equipmentData1.rank >= const.Expert then
			correction = correction + (weaponSkillRecoveryBonuses[equipmentData1.skill] * equipmentData1.level)
		end
		
		-- add new skill bonus
		correction = correction - (weaponSkillRecoveryBonuses[equipmentData1.skill] * recoveryBonusByMastery[equipmentData1.rank] * equipmentData1.level)
		
	-- dual wield
	else
	
		-- weapon 1
		
		-- remove old base bonus
		correction = correction + weaponOldBaseRecoveryBonuses[equipmentData1.skill]
		
		-- add new base bonus
		correction = correction - weaponNewBaseRecoveryBonuses[equipmentData1.skill]
		
		--[[
		-- remove half of old swiftness bonus
		if equipmentData1.item.Bonus2 == 59 then
			correction = correction + (20) / 2
		end
		--]]
		
		-- remove old skill bonus
		if equipmentData1.rank >= const.Expert then
			correction = correction + (weaponSkillRecoveryBonuses[equipmentData1.skill] * equipmentData1.level)
		end
		
		-- add new skill bonus
		correction =
			correction
			-
			(weaponSkillRecoveryBonuses[equipmentData1.skill] * recoveryBonusByMastery[equipmentData1.rank] * equipmentData1.level)
			
		-- weapon 2
		
		-- add new base bonus
		correction = correction - weaponNewBaseRecoveryBonuses[equipmentData2.skill]
		
		-- add new swiftness bonus
		if equipmentData2.item.Bonus2 == 59 then
			correction = correction - 20
		end
				
		-- add new skill bonus
		correction =
			correction
			-
			(weaponSkillRecoveryBonuses[equipmentData2.skill] * recoveryBonusByMastery[equipmentData2.rank] * equipmentData2.level)
			
	end
	
	return correction
	
end

local function randomSpellPower(spellPower, level)
	local r = math.random(spellPower.fixedMin, spellPower.fixedMax)
	for i = 1, level do
		r = r + math.random(spellPower.variableMin, spellPower.variableMax)
	end
	return r
end

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
			
				-- no axe and no sword in main hand and sword in extra hand = extra hand skill defines recover
				if main.skill ~= const.Skills.Axe and main.skill ~= const.Skills.Sword and extra.skill == const.Skills.Sword then
					t.Result = t.Result + getWeaponRecoveryCorrection(extra, main)
				-- everything else = main hand skill defines recovery
				else
					t.Result = t.Result + getWeaponRecoveryCorrection(main, extra)
				end
				
			end
			
		end
		
	end
	
	-- armor
	local itemArmorNumber = t.Player.ItemArmor
	if itemArmorNumber ~= 0 then
	
		local itemArmor = t.Player.Items[itemArmorNumber]
		local itemArmorTxt = Game.ItemsTxt[itemArmor.Number]
		local itemArmorSkill = itemArmorTxt.Skill - 1
		local armorRecivertPenalty = armorAdditionalRecoveryPenalties[itemArmorSkill]
		local level, rank = SplitSkill(t.Player.Skills[itemArmorSkill])
		
		if rank == const.Expert then
			armorRecivertPenalty = armorRecivertPenalty / 2
		elseif rank == const.Master then
			armorRecivertPenalty = 0
		end
		
		t.Result = t.Result + armorRecivertPenalty
		
	end
	
	-- turn recovery time into a multiplier rather than divisor
	local recoveryBonus = 100 - t.Result
	local correctedRecoveryTime = math.floor(100 * 100 / (100 + recoveryBonus))
	t.Result = correctedRecoveryTime
	
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

-- ======================================= --
-- Modifications --
-- ======================================= --

function events.CalcStatBonusByItems(t)

	local equipmentData = getPlayerEquipmentData(t.Player)
	
	local main = equipmentData.main
	local extra = equipmentData.extra
	local armor = equipmentData.armor
	
	-- calculate two handed weapon damage
	
	if main.weapon and equipmentData.twoHanded then
	
		if t.Stat == const.Stats.MeleeDamageMin then
			
			t.Result = 2 * t.Result
			
		elseif t.Stat == const.Stats.MeleeDamageMax then
			
			t.Result = 2 * t.Result
			
		end
		
	end
	
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
			
				if weaponSkillResistanceBonuses[weaponResistancePlayerMain.skill] ~= 0 then
					t.Result = t.Result + (weaponResistanceBonusByMastery[weaponResistancePlayerMain.rank] * weaponResistancePlayerMain.level)
				end
				
			end
			
			if weaponResistancePlayerExtra.equipped and weaponResistancePlayerExtra.weapon then
			
				if weaponSkillResistanceBonuses[weaponResistancePlayerExtra.skill] ~= 0 then
					t.Result = t.Result + (weaponResistanceBonusByMastery[weaponResistancePlayerExtra.rank] * weaponResistancePlayerExtra.level)
				end
				
			end
			
		end
		
		-- resistance bonus from armor
		
		if armor.equipped then
		
			if armorSkillResistanceBonusBySkillAndRank[armor.skill] ~= nil then
				t.Result = t.Result + (armorSkillResistanceBonusBySkillAndRank[armor.skill][armor.rank] * armor.level)
			end
			
		end
		
	end
	
end

function events.CalcStatBonusBySkills(t)

	local equipmentData = getPlayerEquipmentData(t.Player)
	
	-- calculate ranged attack bonus by skill
	if t.Stat == const.Stats.RangedAttack then
	
		local bow = equipmentData.bow
	
		if bow.weapon then
		
			-- subtract old bonus
			t.Result = t.Result - bow.level
			
			-- add new bonus
			t.Result = t.Result + (attackBonusByMastery[bow.rank] * bow.level)
			
		end
		
	-- calculate melee attack bonus by skill
	elseif t.Stat == const.Stats.MeleeAttack then
	
		local main = equipmentData.main
		local extra = equipmentData.extra
		
		if main.weapon then
			
			local attackBonusMultiplier = 1
			
			--[[
			-- double attack bonus for blade in main hand
			if main.skill == const.Skills.Sword or main.skill == const.Skills.Dagger then
				attackBonusMultiplier = 2
			end
			--]]
			
			-- single wield
			if not equipmentData.dualWield then
				
				-- subtract old bonus
				t.Result = t.Result - main.level
				
				-- add new bonus from main hand
				t.Result = t.Result + attackBonusMultiplier * (attackBonusByMastery[main.rank] * main.level)
			
			-- dual wield
			else
						
				-- subtract old bonus
				t.Result = t.Result - extra.level
				
				-- add new bonus from main hand
				t.Result = t.Result + attackBonusMultiplier * (attackBonusByMastery[main.rank] * main.level)
			
				-- add new bonus from extra hand
				t.Result = t.Result + (attackBonusByMastery[extra.rank] * extra.level)
			
			end
			
		end
		
	-- calculate ranged damage bonus by skill
	elseif t.Stat == const.Stats.RangedDamageBase then
	
		local bow = equipmentData.bow
	
		if bow.weapon then
		
			-- add class bonus
			if classRangedWeaponSkillDamageBonus[t.Player.Class] ~= nil then
				t.Result = t.Result + classRangedWeaponSkillDamageBonus[t.Player.Class] * bow.level
			end
			
		end
		
	-- calculate melee damage bonus by skill
	elseif t.Stat == const.Stats.MeleeDamageBase then
	
		local main = equipmentData.main
		local extra = equipmentData.extra
		
		if main.weapon then
			
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
			t.Result = t.Result + weaponSkillDamageBonuses[main.skill] * (damageBonusByMastery[main.rank] * main.level)
			
			-- add new bonus for extra weapon if any
			if extra.weapon then
				t.Result = t.Result + weaponSkillDamageBonuses[extra.skill] * (damageBonusByMastery[extra.rank] * extra.level)
			end
			
			-- add class bonus for main hand weapon
			if classMeleeWeaponSkillDamageBonus[t.Player.Class] ~= nil then
				t.Result = t.Result + (classMeleeWeaponSkillDamageBonus[t.Player.Class] * main.level)
			end
			
			-- add class bonus for extra hand weapon if any
			if extra.weapon then
				if classMeleeWeaponSkillDamageBonus[t.Player.Class] ~= nil then
					t.Result = t.Result + (classMeleeWeaponSkillDamageBonus[t.Player.Class] * extra.level)
				end
			end
			
			-- add bonus for two handed weapon
			if equipmentData.twoHanded and equipmentData.main.skill ~= const.Skills.Staff then
				t.Result = t.Result + twoHandedWeaponDamageBonusByMastery[main.rank] * main.level
			end
			
		end
		
	-- calculate AC bonus by skill
	elseif t.Stat == const.Stats.ArmorClass then
	
		-- AC bonus from weapon skill
		local main = equipmentData.main
		if main.weapon then
		
			if
				(main.skill == const.Skills.Staff)
				or
				(main.skill == const.Skills.Spear)
			then
			
				-- subtract old bonus
				if
					(mainHandItemSkill == const.Skills.Staff and mastery >= const.Expert)
					or
					(mainHandItemSkill == const.Skills.Spear and mastery >= const.Expert)
				then
					t.Result = t.Result - main.level
				end
				
				-- add new bonus
				t.Result = t.Result + (weaponACBonusByMastery[main.rank] * main.level)
				
			end
			
		end
		
		-- AC bonus from shield skill
		local shield = equipmentData.shield
		if shield.equipped then
		
			-- subtract old bonus
			t.Result = t.Result - shield.rank * shield.level
			
			-- add new bonus
			t.Result = t.Result + (armorSkillNewBonusBySkillAndRank[shield.skill][shield.rank] * shield.level)
			
		end
		
		-- AC bonus from armor skill
		local armor = equipmentData.armor
		if armor.equipped then
		
			-- subtract old bonus
			t.Result = t.Result - armor.level
			
			-- add new bonus
			t.Result = t.Result + (armorSkillNewBonusBySkillAndRank[armor.skill][armor.rank] * armor.level)
			
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
mem.asmpatch(0x004236E3, [[
mov    eax, DWORD [esp+0x10]
mov    ecx, esi
inc    ecx
inc    ecx
imul   ecx, eax
mov    DWORD [esp+0x14], ecx
]], 0x2D)

-- Protection from Electricity
mem.asmpatch(0x0042439D, [[
mov    eax, DWORD[esp+0x10]
mov    ecx, esi
inc    ecx
inc    ecx
imul   ecx, eax
mov    DWORD [esp+0x14], ecx
]], 0x2D)

-- Protection from Cold
mem.asmpatch(0x00424F99, [[
mov    eax, DWORD[esp+0x10]
mov    ecx, esi
inc    ecx
inc    ecx
imul   ecx, eax
mov    DWORD [esp+0x14], ecx
]], 0x2D)

-- Protection from Magic
mem.asmpatch(0x00426087, [[
mov    eax, DWORD[esp+0x10]
mov    ecx, esi
inc    ecx
inc    ecx
imul   ecx, eax
mov    DWORD [esp+0x14], ecx
]], 0x2D)

-- Protection from Poison
mem.asmpatch(0x00427EBB, [[
mov    eax, DWORD[esp+0x10]
mov    ecx, esi
inc    ecx
inc    ecx
imul   ecx, eax
mov    DWORD [esp+0x14], ecx
]], 0x2D)

-- game initialization

local monsterHitPointsMultiplier = 2
local monsterDamageMultiplier = 2
local monsterArmorClassMultiplier = 2
local monsterLevelMultiplier = 1
local monsterExperienceMultiplier = 2
function events.GameInitialized2()

	-- modify monster statistics
	
	for monsterTxtIndex = 1,Game.MonstersTxt.high do
	
		-- multiply monster hit points
		
		Game.MonstersTxt[monsterTxtIndex].FullHitPoints = Game.MonstersTxt[monsterTxtIndex].FullHitPoints * monsterHitPointsMultiplier
		
		-- multiply monster damage
		
		Game.MonstersTxt[monsterTxtIndex].Attack1.DamageDiceCount = Game.MonstersTxt[monsterTxtIndex].Attack1.DamageDiceCount * monsterDamageMultiplier
		Game.MonstersTxt[monsterTxtIndex].Attack1.DamageAdd = Game.MonstersTxt[monsterTxtIndex].Attack1.DamageAdd * monsterDamageMultiplier
		
		Game.MonstersTxt[monsterTxtIndex].Attack2.DamageDiceCount = Game.MonstersTxt[monsterTxtIndex].Attack2.DamageDiceCount * monsterDamageMultiplier
		Game.MonstersTxt[monsterTxtIndex].Attack2.DamageAdd = Game.MonstersTxt[monsterTxtIndex].Attack2.DamageAdd * monsterDamageMultiplier
		
		Game.MonstersTxt[monsterTxtIndex].SpellSkill = Game.MonstersTxt[monsterTxtIndex].SpellSkill * monsterDamageMultiplier
		
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
		monsterMoveSpeed = monsterMoveSpeed + (400 - monsterMoveSpeed) / 2 + 150
		Game.MonstersTxt[monsterTxtIndex].MoveSpeed = monsterMoveSpeed
		
		-- monster experience
		
		Game.MonstersTxt[monsterTxtIndex].Experience = Game.MonstersTxt[monsterTxtIndex].Experience * monsterExperienceMultiplier
		
	end
	
	-- house prices

	for houseIndex = 0, Game.Houses.high do
	
		house = Game.Houses[houseIndex]

		local housePrice = housePrices[house.Name]
		if housePrice ~= nil then
			house.Val = housePrice
		end
		
	end

end

-- primary statistics effect
for index,value in ipairs(attributeBreakpoints) do
	mem.bytecodepatch(0x004C2860 + 2 * (index - 1), string.char(bit.band(value, 0xFF), bit.band(bit.rshift(value, 8), 0xFF)), 2)
end
for index,value in ipairs(attributeEffects) do
	mem.bytecodepatch(0x004C289C + 1 * (index - 1), string.char(bit.band(value, 0xFF)), 1)
end

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
	d.ecx = d.ecx + 2
end
mem.autohook(0x004215E5, setLearningSkillBonusMultiplier, 5)

-- navigateMissile
local function navigateMissile(object)

	-- exclude some special non targetting spells
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
local function disableFeeblemindedMonsterCasting(d)
	local monsterAddress = d.esi
	local monsterIndex = (monsterAddress - 0x0056F478) / 0x224
	local monster = Map.Monsters[monsterIndex]
	-- set cast chance to 0 for feebleminded monster
	if monster.SpellBuffs[const.MonsterBuff.Feeblemind].ExpireTime ~= 0 then
		d.al = 0
	end
end
mem.autohook2(0x00421C51, disableFeeblemindedMonsterCasting, 7)

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
			bringHirelingsToParty({const.NPCProfession.Instructor, const.NPCProfession.Teacher, })
		elseif t.Key == const.Keys["2"] then
			bringHirelingsToParty({const.NPCProfession.Merchant, const.NPCProfession.Trader, })
		elseif t.Key == const.Keys["3"] then
			bringHirelingsToParty({const.NPCProfession.Pathfinder, const.NPCProfession.Tracker, })
		elseif t.Key == const.Keys["4"] then
			bringHirelingsToParty({const.NPCProfession.WindMaster, const.NPCProfession.WaterMaster, })
		end
	-- debug
	elseif t.Key == const.Keys.DIVIDE then
		MessageBox(Party.QBits)
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
	
	-- pretend that distance to the monster is shorter if if party is already engaged
	
	if bit.band(Party.StateBits, 0x20) ~= 0 then
	
		if result >= standardEngagementDistance and result < extendedEngagementDistance then
			result = standardEngagementDistance
		end
		
	end
		
	-- return result
	
	return result
	
end
mem.hookcall(0x00401117, 2, 1, modifiedFastDistance)

----------------------------------------------------------------------------------------------------
-- temple healing price is scaled with party experience level
----------------------------------------------------------------------------------------------------

local function modifiedTempleHealingPrice(d, def, playerPointer, cost)

	-- call original function
	
	local result = def(playerPointer, cost)
	
	-- overwrite value
	
	result = templeHealingPrice
	
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
	
	targetPlayerIndex = def(monsterPointer)
	
	-- get target player
	
	targetPlayer = Party.Players[targetPlayerIndex]
	
	-- set default substitute player = target player
	
	local substitutePlayerIndex = targetPlayerIndex
	
	-- get target player equipment data
	
	targetPlayerEquipmentData = getPlayerEquipmentData(targetPlayer)
	
	-- switch target player only if they do not wear plate
	
	if targetPlayerEquipmentData.armor.skill ~= const.Skills.Plate then
		
		local roll = math.random()
		local usedSubstituteProbablity = 0
		
		for playerIndex = 0,3 do
		
			player = Party.Players[playerIndex]
		
			if playerIndex ~= targetPlayerIndex and substitutePlayerIndex == targetPlayerIndex then
			
				-- get substitute player equipment data
				
				playerEquipmentData = getPlayerEquipmentData(player)
				
				-- switch to substitute player only if they wear plate
				
				if playerEquipmentData.armor.skill == const.Skills.Plate then
				
					local substituteProbability = usedSubstituteProbablity + plateWearerAttackAttractionChanceByMastery[playerEquipmentData.armor.rank]
					
					if roll < substituteProbability then
						substitutePlayerIndex = playerIndex
						Game.ShowStatusText(string.format("%s took a hit for %s", player.Name, targetPlayer.Name), 10)
					end
					
					usedSubstituteProbablity = substituteProbability
					
				end
				
			end
			
		end
		
	end
	
	-- return substitute player index
	
	return substitutePlayerIndex

end
mem.hookfunction(0x004219B0, 0, 1, modifiedMonsterChooseTargetMember)

----------------------------------------------------------------------------------------------------
-- display damage rate
----------------------------------------------------------------------------------------------------

-- shift positions in character stats display
mem.bytecodepatch(0x004BD3FB, "\048\056\048", 3)
mem.bytecodepatch(0x004BD3EF, "\048\056\048", 3)
mem.bytecodepatch(0x004BD3E3, "\048\056\048", 3)
local function getAverageDamageRate(player, ranged)

	-- get combat parameters
	
	local attack = (ranged and player:GetRangedAttack() or player:GetMeleeAttack())
	local recovery = player:GetAttackDelay(ranged)
	local damageRangeText = (ranged and player:GetRangedDamageRangeText() or player:GetMeleeDamageRangeText())
	
	-- error
	
	if attack == nil or type(attack) ~= "number" or recovery == nil  or type(recovery) ~= "number" or damageRangeText == nil or type(damageRangeText) ~= "string" then
		return nil
	end
	
	local damageMinText, damageMaxText = string.match(damageRangeText, "(-?%d+)%s*-%s(-?%d+)")
	local damageMin = tonumber(damageMinText)
	local damageMax = tonumber(damageMaxText)
	
	-- error
	
	if damageMin == nil or type(damageMin) ~= "number" or damageMax == nil or type(damageMax) ~= "number" then
		return nil
	end
	
	-- calculate average damage rate against monster with AC = 100 and no physical resistance
	
	local chanceToHit = (15 + 2 * attack) / (15 + 2 * attack + 15 + 100)
	
	local averageDamageRate = math.round((damageMax + damageMin) / 2 * chanceToHit * (100 / recovery))
	
	-- return value
	
	return averageDamageRate
	
end
local function modifiedDisplayMeleeAttackReference(d, def, dlg, font, x, y, color, text, arg_10, arg_14)

	-- get player
	
	local playerIndex, player = GetPlayer(d.ebp)
	
	-- get average damage rate
	
	local averageDamageRate = getAverageDamageRate(player, false)
	
	-- append to text buffer
	
	if averageDamageRate ~= nil then
		Game.TextBuffer = Game.TextBuffer .. string.format(" [%d]", averageDamageRate)
	end
	
	-- execute original code
	
	def(dlg, font, x, y, color, text, arg_10, arg_14)
	
end
mem.hookcall(0x00416F51, 2, 6, modifiedDisplayMeleeAttackReference)
local function modifiedDisplayRangedAttackReference(d, def, dlg, font, x, y, color, text, arg_10, arg_14)

	-- get player
	
	local playerIndex, player = GetPlayer(d.ebp)
	
	-- get average damage rate
	
	local averageDamageRate = getAverageDamageRate(player, true)
	
	-- append to text buffer
	
	if averageDamageRate ~= nil then
		Game.TextBuffer = Game.TextBuffer .. string.format(" [%d]", averageDamageRate)
	end
	
	-- execute original code
	
	def(dlg, font, x, y, color, text, arg_10, arg_14)
	
end
mem.hookcall(0x00416FF8, 2, 6, modifiedDisplayRangedAttackReference)
local function modifiedDisplayMeleeAttackStats(d, def, dlg, font, x, y, color, str)

	-- get player
	
	local player = Party.Players[Game.CurrentPlayer]
	
	-- get average damage rate
	
	local averageDamageRate = getAverageDamageRate(player, false)

	-- append to text buffer

	if averageDamageRate ~= nil then
		Game.TextBuffer = string.sub(Game.TextBuffer, 1, string.len(Game.TextBuffer) - 1) .. "\t130" .. string.format("[%d]", averageDamageRate) .. "\n"
	end
	
	-- execute original code
	
	def(dlg, font, x, y, color, str)
	
end
mem.hookcall(0x00414A3B, 2, 4, modifiedDisplayMeleeAttackStats)
local function modifiedDisplayRangedAttackStats(d, def, dlg, font, x, y, color, str)

	-- get player
	
	local player = Party.Players[Game.CurrentPlayer]
	
	-- get average damage rate
	
	local averageDamageRate = getAverageDamageRate(player, true)

	-- append to text buffer

	if averageDamageRate ~= nil then
		Game.TextBuffer = string.sub(Game.TextBuffer, 1, string.len(Game.TextBuffer) - 1) .. "\t130" .. string.format("[%d]", averageDamageRate) .. "\n"
	end
	
	-- execute original code
	
	def(dlg, font, x, y, color, str)
	
end
mem.hookcall(0x00414AD5, 2, 4, modifiedDisplayRangedAttackStats)

