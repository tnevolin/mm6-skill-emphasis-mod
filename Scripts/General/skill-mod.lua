-- weapon base recovery bonuses
local weaponBaseRecoveryBonuses = {[const.Skills.Staff] = 0, [const.Skills.Axe] = 0, [const.Skills.Sword] = 10, [const.Skills.Spear] = 20, [const.Skills.Mace] = 20, [const.Skills.Dagger] = 40, }

-- weapon skill recovery bonuses
local weaponSkillRecoveryBonuses = {[const.Skills.Staff] = 0, [const.Skills.Axe] = 1, [const.Skills.Sword] = 1, [const.Skills.Spear] = 0, [const.Skills.Mace] = 0, [const.Skills.Dagger] = 0, }

-- skill effect multipliers
local attackBonusMultiplierByMastery = {[const.Novice] = 6, [const.Expert] = 8, [const.Master] = 10, }
local recoveryBonusMultiplierByMastery = {[const.Novice] = 4, [const.Expert] = 6, [const.Master] = 8, }
local damageBonusMultiplierByMastery = {[const.Novice] = 3, [const.Expert] = 4, [const.Master] = 5, }
local weaponACBonusMultiplierByMastery = {[const.Novice] = 9, [const.Expert] = 12, [const.Master] = 15, }
local weaponResistanceBonusMultiplierByMastery = {[const.Novice] = 3, [const.Expert] = 4, [const.Master] = 5, }

-- special weapon skill chances
local maceChanceToInduceConditionByMastery = {[const.Novice] = 6, [const.Expert] = 8, [const.Master] = 10, }
local staffChanceToInduceConditionByMastery = {[const.Novice] = 12, [const.Expert] = 16, [const.Master] = 20, }
local conditionDurationMultiplier = 1

-- collects relevant itemData
local function getItemData(player, itemNumber)

	local itemData = {item = nil, skill = nil, level = nil, rank = nil, }
	
	if itemNumber ~= 0 then
	
		itemData.item = player.Items[itemNumber]
		
		local itemSkillInc = Game.ItemsTxt[itemData.item.Number].Skill
		
		if itemSkillInc ~= 0 then
		
			itemData.skill = itemSkillInc - 1
			itemData.level, itemData.rank = SplitSkill(player.Skills[itemData.skill])
			
		end
		
	end
	
	return itemData
	
end

-- calculate new dual wield recovery difference
local function newDualWieldRecoveryDifference(itemData1, itemData2)

	local difference = 0
	
	-- remove old skill bonus
	if itemData1.rank >= const.Expert then
		difference = difference + (weaponSkillRecoveryBonuses[itemData1.skill] * itemData1.level)
	end
	
	-- remove half of old base bonus
	difference = difference + (weaponBaseRecoveryBonuses[itemData1.skill]) / 2
	
	-- remove half of old swiftness bonus
	if itemData1.item.Bonus2 == 59 then
		difference = difference + (20) / 2
	end
	
	-- add half of old skill bonus
	if weaponSkillRecoveryBonuses[itemData1.skill] == 1 then
		difference = difference - (recoveryBonusMultiplierByMastery[itemData1.rank] * itemData1.level) / 2
	end
	
	-- add half of new base bonus
	difference = difference - (weaponBaseRecoveryBonuses[itemData2.skill]) / 2
	
	-- add half of new swiftness bonus
	if itemData2.item.Bonus2 == 59 then
		difference = difference - (20) / 2
	end
			
	-- add half of new skill bonus
	if weaponSkillRecoveryBonuses[itemData2.skill] == 1 then
		difference = difference - (recoveryBonusMultiplierByMastery[itemData2.rank] * itemData2.level) / 2
	end
	
	return difference
	
end

-- corrects attack delay
function events.GetAttackDelay(t)

	if t.Ranged then
	
		local itemData = getItemData(t.Player, t.Player.ItemBow)
	
		if itemData.skill == const.Skills.Bow and itemData.level ~= 0 then
		
			-- subtract old bonus
			if itemData.rank >= const.Expert then
				t.Result = t.Result + (itemData.level)
			end
			
			-- add new bonus
			local recoveryBonusMultiplier = recoveryBonusMultiplierByMastery[itemData.rank]
			t.Result = t.Result - (recoveryBonusMultiplier * itemData.level)
			
		end
		
	else
	
		local itemDataMainHand = getItemData(t.Player, t.Player.ItemMainHand)
		local itemDataExtraHand = getItemData(t.Player, t.Player.ItemExtraHand)
		
		-- axe or sword in main hand and no item in extra hand
		if
			(itemDataMainHand.skill == const.Skills.Axe or itemDataMainHand.skill == const.Skills.Sword)
			and
			itemDataExtraHand.item == nil
		then
		
			-- subtract old bonus
			if itemDataMainHand.rank >= const.Expert then
				t.Result = t.Result + (itemDataMainHand.level)
			end
			
			-- add new bonus
			t.Result = t.Result - (recoveryBonusMultiplierByMastery[itemDataMainHand.rank] * itemDataMainHand.level)

		-- axe in main hand, sword in extra hand
		elseif itemDataMainHand.skill == const.Skills.Axe and itemDataExtraHand.skill == const.Skills.Sword then
			t.Result = t.Result + newDualWieldRecoveryDifference(itemDataMainHand, itemDataExtraHand)
		-- sword in main hand, sword in extra hand
		elseif itemDataMainHand.skill == const.Skills.Sword and itemDataExtraHand.skill == const.Skills.Sword then
			t.Result = t.Result + newDualWieldRecoveryDifference(itemDataMainHand, itemDataExtraHand)
		-- spear/mace in main hand, sword in extra hand
		elseif (itemDataMainHand.skill == const.Skills.Spear or itemDataMainHand.skill == const.Skills.Mace) and itemDataExtraHand.skill == const.Skills.Sword then
			t.Result = t.Result + newDualWieldRecoveryDifference(itemDataExtraHand, itemDataMainHand)
		-- dagger in main hand, sword in extra hand
		elseif itemDataMainHand.skill == const.Skills.Dagger and itemDataExtraHand.skill == const.Skills.Sword then
			t.Result = t.Result + newDualWieldRecoveryDifference(itemDataExtraHand, itemDataMainHand)
		-- axe in main hand, dagger in extra hand
		elseif itemDataMainHand.skill == const.Skills.Axe and itemDataExtraHand.skill == const.Skills.Dagger then
			t.Result = t.Result + newDualWieldRecoveryDifference(itemDataMainHand, itemDataExtraHand)
		-- sword in main hand, dagger in extra hand
		elseif itemDataMainHand.skill == const.Skills.Sword and itemDataExtraHand.skill == const.Skills.Dagger then
			t.Result = t.Result + newDualWieldRecoveryDifference(itemDataMainHand, itemDataExtraHand)
		-- spear/mace in main hand, dagger in extra hand
		elseif (itemDataMainHand.skill == const.Skills.Spear or itemDataMainHand.skill == const.Skills.Mace) and itemDataExtraHand.skill == const.Skills.Dagger then
			t.Result = t.Result + newDualWieldRecoveryDifference(itemDataMainHand, itemDataExtraHand)
		-- dagger in main hand, dagger in extra hand
		elseif itemDataMainHand.skill == const.Skills.Dagger and itemDataExtraHand.skill == const.Skills.Dagger then
			t.Result = t.Result + newDualWieldRecoveryDifference(itemDataMainHand, itemDataExtraHand)
		end
		
	end
	
	-- turn recovery time into a multiplier rather than divisor
	local recoveryBonus = 100 - t.Result
	local correctedRecoveryTime = math.floor(100 * 100 / (100 + recoveryBonus))
	t.Result = correctedRecoveryTime
	
end

function events.CalcStatBonusBySkills(t)

	-- calculate melee attack bonus by skill
	
	if t.Stat == const.Stats.MeleeAttack then
	
		local mainHandItemNumber = t.Player.ItemMainHand
		local extraHandItemNumber = t.Player.ItemExtraHand
		
		-- subtract old bonus
		
		if extraHandItemNumber ~= 0 then
			
			local extraHandItem = t.Player.Items[extraHandItemNumber]
			
			if Game.ItemsTxt[extraHandItem.Number].Skill ~= 0 then
			
				local extraHandItemSkill = Game.ItemsTxt[extraHandItem.Number].Skill - 1

				if t.Player.Skills[extraHandItemSkill] ~= 0 then
				
					local skill, mastery = SplitSkill(t.Player.Skills[extraHandItemSkill])
					
					-- subtract old bonus
					
					t.Result = t.Result - skill
					
				end
				
			end
			
		elseif mainHandItemNumber ~= 0 then
					
			local mainHandItem = t.Player.Items[mainHandItemNumber]
			
			if Game.ItemsTxt[mainHandItem.Number].Skill ~= 0 then
			
				local mainHandItemSkill = Game.ItemsTxt[mainHandItem.Number].Skill - 1

				if t.Player.Skills[mainHandItemSkill] ~= 0 then
				
					local skill, mastery = SplitSkill(t.Player.Skills[mainHandItemSkill])
					
					-- subtract old bonus
					
					t.Result = t.Result - skill
					
				end
				
			end
			
		end
		
		-- add new bonus from main hand
					
		if mainHandItemNumber ~= 0 then
		
			local mainHandItem = t.Player.Items[mainHandItemNumber]
			
			if Game.ItemsTxt[mainHandItem.Number].Skill ~= 0 then
			
				local mainHandItemSkill = Game.ItemsTxt[mainHandItem.Number].Skill - 1

				if t.Player.Skills[mainHandItemSkill] ~= 0 then
				
					local skill, mastery = SplitSkill(t.Player.Skills[mainHandItemSkill])
					
					-- add new bonus
					
					local attackBonusMultiplier = attackBonusMultiplierByMastery[mastery]
					t.Result = t.Result + (skill * attackBonusMultiplier)
					
				end
				
			end
			
		end
		
		-- add new bonus from extra hand
		
		if extraHandItemNumber ~= 0 then
		
			local extraHandItem = t.Player.Items[extraHandItemNumber]
			
			if Game.ItemsTxt[extraHandItem.Number].Skill ~= 0 then
			
				local extraHandItemSkill = Game.ItemsTxt[extraHandItem.Number].Skill - 1

				if t.Player.Skills[extraHandItemSkill] ~= 0 then
				
					local skill, mastery = SplitSkill(t.Player.Skills[extraHandItemSkill])
					
					-- add new bonus
					
					local attackBonusMultiplier = attackBonusMultiplierByMastery[mastery]
					t.Result = t.Result + (skill * attackBonusMultiplier)
					
				end
				
			end
			
		end
		
	end
	
	-- calculate ranged attack bonus by skill
	
	if t.Stat == const.Stats.RangedAttack then
	
		local itemBowNumber = t.Player.ItemBow
		
		if itemBowNumber ~= 0 then
		
			local itemBow = t.Player.Items[itemBowNumber]
			
			if Game.ItemsTxt[itemBow.Number].Skill ~= 0 then
			
				local itemBowSkill = Game.ItemsTxt[itemBow.Number].Skill - 1

				if t.Player.Skills[itemBowSkill] ~= 0 then
				
					local skill, mastery = SplitSkill(t.Player.Skills[itemBowSkill])
					
					-- subtract old bonus
					
					t.Result = t.Result - skill
					
					-- add new bonus
					
					local attackBonusMultiplier = attackBonusMultiplierByMastery[mastery]
					t.Result = t.Result + (skill * attackBonusMultiplier)
					
				end
				
			end
			
		end
		
	end
	
	-- calculate melee damage bonus by skill
	
	if t.Stat == const.Stats.MeleeDamageBase then
	
		local mainHandItemNumber = t.Player.ItemMainHand
		
		if mainHandItemNumber ~= 0 then
		
			local mainHandItem = t.Player.Items[mainHandItemNumber]
			
			if Game.ItemsTxt[mainHandItem.Number].Skill ~= 0 then
			
				local mainHandItemSkill = Game.ItemsTxt[mainHandItem.Number].Skill - 1
				
				if
					(mainHandItemSkill == const.Skills.Axe)
					or
					(mainHandItemSkill == const.Skills.Spear)
					or
					(mainHandItemSkill == const.Skills.Mace)
				then
				
					if t.Player.Skills[mainHandItemSkill] ~= 0 then
					
						local skill, mastery = SplitSkill(t.Player.Skills[mainHandItemSkill])
						
						-- subtract old bonus
						
						if
							(mainHandItemSkill == const.Skills.Axe and mastery >= const.Master)
							or
							(mainHandItemSkill == const.Skills.Spear and mastery >= const.Master)
							or
							(mainHandItemSkill == const.Skills.Mace and mastery >= const.Expert)
						then
							t.Result = t.Result - skill
						end
						
						-- add new bonus
						
						local damageBonusMultiplier = damageBonusMultiplierByMastery[mastery]
						t.Result = t.Result + (skill * damageBonusMultiplier)
						
					end
					
				end
				
			end
			
		end
		
	end
	
	-- calculate AC bonus by skill
	
	if t.Stat == const.Stats.ArmorClass then
	
		local mainHandItemNumber = t.Player.ItemMainHand
		
		if mainHandItemNumber ~= 0 then
		
			local mainHandItem = t.Player.Items[mainHandItemNumber]
			
			if Game.ItemsTxt[mainHandItem.Number].Skill ~= 0 then
			
				local mainHandItemSkill = Game.ItemsTxt[mainHandItem.Number].Skill - 1
				
				if
					(mainHandItemSkill == const.Skills.Staff)
					or
					(mainHandItemSkill == const.Skills.Spear)
				then
				
					if t.Player.Skills[mainHandItemSkill] ~= 0 then
					
						local skill, mastery = SplitSkill(t.Player.Skills[mainHandItemSkill])
						
						-- subtract old bonus
						
						if
							(mainHandItemSkill == const.Skills.Staff and mastery >= const.Expert)
							or
							(mainHandItemSkill == const.Skills.Spear and mastery >= const.Expert)
						then
							t.Result = t.Result - skill
						end
						
						-- add new bonus
						
						local weaponACBonusMultiplier = weaponACBonusMultiplierByMastery[mastery]
						t.Result = t.Result + (skill * weaponACBonusMultiplier)
						
					end
					
				end
				
			end
			
		end
		
	end
	
end

function events.CalcStatBonusByMagic(t)

	-- calculate resistance bonus by skill
	
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
	
		local mainHandItemNumber = t.Player.ItemMainHand
		
		if mainHandItemNumber ~= 0 then
		
			local mainHandItem = t.Player.Items[mainHandItemNumber]
			
			if Game.ItemsTxt[mainHandItem.Number].Skill ~= 0 then
			
				local mainHandItemSkill = Game.ItemsTxt[mainHandItem.Number].Skill - 1
				
				if
					(mainHandItemSkill == const.Skills.Staff)
				then
				
					if t.Player.Skills[mainHandItemSkill] ~= 0 then
					
						local skill, mastery = SplitSkill(t.Player.Skills[mainHandItemSkill])
						
						-- add new bonus
						
						local weaponResistanceBonusMultiplier = weaponResistanceBonusMultiplierByMastery[mastery]
						t.Result = t.Result + (skill * weaponResistanceBonusMultiplier)
						
					end
					
				end
				
			end
			
		end
		
	end
	
end

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

