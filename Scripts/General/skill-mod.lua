local attributeBreakpoints =
{
	500,
	400,
	300,
	200,
	190,
	180,
	170,
	160,
	150,
	140,
	130,
	120,
	110,
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
	194,
	154,
	114,
	74,
	70,
	66,
	62,
	58,
	54,
	50,
	46,
	42,
	38,
	34,
	30,
	26,
	22,
	18,
	14,
	12,
	10,
	8,
	6,
	4,
	2,
	0,
	-2,
	-4,
	-6,
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
local weaponNewBaseSpeedBonuses =
{
	[const.Skills.Bow] = 0,
	[const.Skills.Staff] = 0,
	[const.Skills.Axe] = 0,
	[const.Skills.Sword] = 20,
	[const.Skills.Spear] = 40,
	[const.Skills.Mace] = 40,
	[const.Skills.Dagger] = 80,
}

local armorAdditionalSpeedPenalties =
{
	[const.Skills.Leather] = 10,
	[const.Skills.Chain] = 20,
	[const.Skills.Plate] = 30,
}

local armorSkillNewBonusBySkillAndRank =
{
	[const.Skills.Shield] =
	{
		[const.Novice] = 10,
		[const.Expert] = 15,
		[const.Master] = 20,
	},
	[const.Skills.Leather] =
	{
		[const.Novice] = 3,
		[const.Expert] = 4,
		[const.Master] = 5,
	},
	[const.Skills.Chain] =
	{
		[const.Novice] = 6,
		[const.Expert] = 8,
		[const.Master] = 10,
	},
	[const.Skills.Plate] =
	{
		[const.Novice] = 9,
		[const.Expert] = 12,
		[const.Master] = 15,
	},
}
local armorSkillResistanceBonusBySkillAndRank =
{
	[const.Skills.Leather] =
	{
		[const.Novice] = 6,
		[const.Expert] = 8,
		[const.Master] = 10,
	},
	[const.Skills.Chain] =
	{
		[const.Novice] = 3,
		[const.Expert] = 4,
		[const.Master] = 5,
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

-- skill effect multipliers
local attackBonusByMastery = {[const.Novice] = 2, [const.Expert] = 3, [const.Master] = 4, }
local recoveryBonusByMastery = {[const.Novice] = 4, [const.Expert] = 5, [const.Master] = 6, }
local damageBonusByMastery = {[const.Novice] = 2, [const.Expert] = 3, [const.Master] = 4, }
local weaponACBonusByMastery = {[const.Novice] = 4, [const.Expert] = 6, [const.Master] = 8, }
local twoHandedWeaponDamageBonusByMastery = {[const.Novice] = 0, [const.Expert] = 1, [const.Master] = 2, }

-- special weapon skill chances
local maceChanceToInduceConditionByMastery = {[const.Novice] = 6, [const.Expert] = 8, [const.Master] = 10, }
local staffChanceToInduceConditionByMastery = {[const.Novice] = 12, [const.Expert] = 16, [const.Master] = 20, }
local conditionDurationMultiplier = 1

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
	[const.Class.Archer] = 0,
	[const.Class.BattleMage] = 1,
	[const.Class.WarriorMage] = 2,
}

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
		armor =
		{
			equipped = false,
			item = nil,
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
		local itemMainHandTxt = Game.ItemsTxt[equipmentData.main.item.Number]
		equipmentData.main.equipStat = itemMainHandTxt.EquipStat + 1
		equipmentData.main.skill = itemMainHandTxt.Skill - 1
		
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
		local itemExtraHandTxt = Game.ItemsTxt[equipmentData.extra.item.Number]
		equipmentData.extra.equipStat = itemExtraHandTxt.EquipStat + 1
		equipmentData.extra.skill = itemExtraHandTxt.Skill - 1
		
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
	
	-- get armor data
	
	if player.ItemArmor ~= 0 then
		
		equipmentData.armor.equipped = true
		
		equipmentData.armor.item = player.Items[player.ItemArmor]
		local itemArmorTxt = Game.ItemsTxt[equipmentData.armor.item.Number]
		equipmentData.armor.skill = itemArmorTxt.Skill - 1
		equipmentData.armor.level, equipmentData.armor.rank = SplitSkill(player.Skills[equipmentData.armor.skill])
		
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
	
	return equipmentData
	
end

-- calculate new and old recovery difference
local function getWeaponRecoveryCorrection(equipmentData1, equipmentData2)

	local correction = 0
	
	-- single wield
	if equipmentData2 == nil then
	
		-- remove old base bonus
		correction = correction + (weaponOldBaseRecoveryBonuses[equipmentData1.skill])
		
		-- add new base bonus
		correction = correction - (weaponNewBaseSpeedBonuses[equipmentData1.skill])
		
		-- remove old skill bonus
		if equipmentData1.rank >= const.Expert then
			correction = correction + (weaponSkillRecoveryBonuses[equipmentData1.skill] * equipmentData1.level)
		end
		
		-- add new skill bonus
		correction =
			correction
			-
			(weaponSkillRecoveryBonuses[equipmentData1.skill] * recoveryBonusByMastery[equipmentData1.rank] * equipmentData1.level)
		
	-- dual wield
	else
	
		-- weapon 1
		
		-- remove old base bonus
		correction = correction + (weaponOldBaseRecoveryBonuses[equipmentData1.skill])
		
		-- add half of new base bonus
		correction = correction - (weaponNewBaseSpeedBonuses[equipmentData1.skill]) / 2
		
		-- remove half of old swiftness bonus
		if equipmentData1.item.Bonus2 == 59 then
			correction = correction + (20) / 2
		end
		
		-- remove old skill bonus
		if equipmentData1.rank >= const.Expert then
			correction = correction + (weaponSkillRecoveryBonuses[equipmentData1.skill] * equipmentData1.level)
		end
		
		-- add half of new skill bonus
		correction =
			correction
			-
			(weaponSkillRecoveryBonuses[equipmentData1.skill] * (recoveryBonusByMastery[equipmentData1.rank] * equipmentData1.level) / 2)
			
		-- weapon 2
		
		-- add half of new base bonus
		correction = correction - (weaponNewBaseSpeedBonuses[equipmentData2.skill]) / 2
		
		-- add half of new swiftness bonus
		if equipmentData2.item.Bonus2 == 59 then
			correction = correction - (20) / 2
		end
				
		-- add half of new skill bonus
		correction =
			correction
			-
			(weaponSkillRecoveryBonuses[equipmentData2.skill] * (recoveryBonusByMastery[equipmentData2.rank] * equipmentData2.level) / 2)
			
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
		local armorSpeedPenalty = armorAdditionalSpeedPenalties[itemArmorSkill]
		local level, rank = SplitSkill(t.Player.Skills[itemArmorSkill])
		
		if rank == const.Expert then
			armorSpeedPenalty = armorSpeedPenalty / 2
		elseif rank == const.Master then
			armorSpeedPenalty = 0
		end
		
		t.Result = t.Result + armorSpeedPenalty
		
	end
	
	-- turn recovery time into a multiplier rather than divisor
	local recoveryBonus = 100 - t.Result
	local correctedRecoveryTime = math.floor(100 * 100 / (100 + recoveryBonus))
	t.Result = correctedRecoveryTime
	
end

-- character to hit chance formula
mem.asmpatch(0x00421CDA, "lea     ecx, [esi+edi+14h]", 4)
-- monster to hit chance formula
mem.asmpatch(0x00421D66, "lea     esi, [eax+ecx*2+14h]", 4)

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
			
			-- single wield
			if not equipmentData.dualWield then
				
				-- subtract old bonus
				t.Result = t.Result - main.level
				
				-- add new bonus from main hand
				t.Result = t.Result + (attackBonusByMastery[main.rank] * main.level)
			
			-- dual wield
			else
						
				-- subtract old bonus
				t.Result = t.Result - extra.level
				
				-- add new bonus from main hand
				t.Result = t.Result + (attackBonusByMastery[main.rank] * main.level)
			
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
			if equipmentData.twoHanded then
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

function events.CalcStatBonusByMagic(t)

	local equipmentData = getPlayerEquipmentData(t.Player)
	
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
	
		-- resistance bonus from armor
		local armor = equipmentData.armor
		if armor.equipped then
		
			if armorSkillResistanceBonusBySkillAndRank[armor.skill] ~= nil then
				t.Result = t.Result + (armorSkillResistanceBonusBySkillAndRank[armor.skill][armor.rank] * armor.level)
			end
			
		end

	end
	
end

-- applySpecialWeaponSkill
local function applySpecialWeaponSkill(d, def, TextBuffer, delay)

	local player = Party.Players[Game.CurrentPlayer]
	local monster = Map.Monsters[(d.esi - Map.Monsters["?ptr"]) / Map.Monsters[0]["?size"]]

	-- player holds weapon in main hand
	if	player.ItemMainHand ~= 0 then
		
		-- Mace in main hand
		if	(Game.ItemsTxt[player.Items[player.ItemMainHand].Number].Skill - 1) == const.Skills.Mace then
			
			-- Mace skill
			if player.Skills[const.Skills.Mace] ~= 0 then
			
				local skill, mastery = SplitSkill(player.Skills[const.Skills.Mace])
				
				local chanceToInduceCondition = maceChanceToInduceConditionByMastery[mastery]
				
				-- roll dice
				if math.random(1, 100) <= chanceToInduceCondition then
				
					-- apply buff
					local spellBuff = monster.SpellBuffs[const.MonsterBuff.Paralyze]
					spellBuff:Set(Game.Time + const.Minute * conditionDurationMultiplier * skill, mastery, 0, 0, 0)
					
					-- append to message
					Game.TextBuffer = Game.TextBuffer .. " /Paralyzed"
				
				end
				
			end
			
		end
		
		-- Staff in main hand
		if	(Game.ItemsTxt[player.Items[player.ItemMainHand].Number].Skill - 1) == const.Skills.Staff then
			
			-- Staff skill
			if player.Skills[const.Skills.Staff] ~= 0 then
			
				local skill, mastery = SplitSkill(player.Skills[const.Skills.Staff])
				
				local chanceToInduceCondition = maceChanceToInduceConditionByMastery[mastery]
				
				-- roll dice
				if math.random(1, 100) <= chanceToInduceCondition then
				
					-- apply buff
					local spellBuff = monster.SpellBuffs[const.MonsterBuff.Slow]
					spellBuff:Set(Game.Time + const.Minute * conditionDurationMultiplier * skill, mastery, 0, 0, 0)
					
					-- append to message
					Game.TextBuffer = Game.TextBuffer .. " /Slowed"
				
				end
				
				-- roll dice
				if math.random(1, 100) <= chanceToInduceCondition then
				
					-- apply buff
					local spellBuff = monster.SpellBuffs[const.MonsterBuff.Feeblemind]
					spellBuff:Set(Game.Time + const.Minute * conditionDurationMultiplier * skill, mastery, 0, 0, 0)
					
					-- append to message
					
					Game.TextBuffer = Game.TextBuffer .. " /Feebleminded"
				
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

-- Stone Skin
mem.asmpatch(0x00426281, "imul    ecx, 5", 3)
mem.asmpatch(0x0042617C, "imul    ecx, 5", 3)

-- Bless
mem.asmpatch(0x00426809, "imul    eax, 2", 3)
mem.asmpatch(0x0042670F, "imul    ecx, 2", 3)

-- Heroism
mem.asmpatch(0x00426D49, "imul    ecx, 2", 3)
mem.asmpatch(0x00426C4C, "imul    ecx, 2", 3)

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

-- monster damage to player
function events.CalcDamageToPlayer(t)

	-- monster damage to player x2
	t.Result = t.Result * 2
	
end
-- monster HP
-- monster XP
function events.GameInitialized2()
	
	for monsterTxtIndex = 1,Game.MonstersTxt.high do
		-- monster HP x2
		Game.MonstersTxt[monsterTxtIndex].FullHitPoints = Game.MonstersTxt[monsterTxtIndex].FullHitPoints * 2
		-- monster XP x2
		Game.MonstersTxt[monsterTxtIndex].Experience = Game.MonstersTxt[monsterTxtIndex].Experience * 2
	end
	
end

-- primary statistics effect
for index,value in ipairs(attributeBreakpoints) do
	mem.bytecodepatch(0x004C2860 + 2 * (index - 1), string.char(bit.band(value, 0xFF), bit.band(bit.rshift(value, 8), 0xFF)), 2)
end
for index,value in ipairs(attributeEffects) do
	mem.bytecodepatch(0x004C289C + 1 * (index - 1), string.char(bit.band(value, 0xFF)), 1)
end

-- skill advancement
local function calculateSkillAdvancementCost(level)
	return 5 + math.floor((level - 1) / 3)
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

