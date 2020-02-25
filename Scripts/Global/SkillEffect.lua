function events.GetAttackDelay(t)

	-- correct weapon skill recovery time bonus
	
	-- find recovery time skill
	
	local recoveryTimeSkill = nil
		
	if t.Ranged then
	
		recoveryTimeSkill = const.Skills.Bow
		
	else
	
		local itemMainHandNumber = t.Player.ItemMainHand
		if itemMainHandNumber ~= 0 then
			local itemMainHand = t.Player.Items[itemMainHandNumber]
			local itemMainHandSkillInc = Game.ItemsTxt[itemMainHand.Number].Skill
			
			if itemMainHandSkillInc ~= 0 then
				local itemMainHandSkill = itemMainHandSkillInc - 1
				
				local itemExtraHandNumber = t.Player.ItemExtraHand
				if itemExtraHandNumber == 0 then
					recoveryTimeSkill = itemMainHandSkill
				else
					local itemExtraHand = t.Player.Items[itemExtraHandNumber]
					local itemExtraHandSkillInc = Game.ItemsTxt[itemExtraHand.Number].Skill
					
					if itemExtraHandSkillInc == 0 then
						recoveryTimeSkill = itemMainHandSkill
					else
						
						local itemExtraHandSkill = itemExtraHandSkillInc - 1
						
						if itemMainHandSkill == const.Skills.Axe then
							recoveryTimeSkill = const.Skills.Axe
						elseif itemMainHandSkill == const.Skills.Sword or itemExtraHandSkill == const.Skills.Sword then
							recoveryTimeSkill = const.Skills.Sword
						else
							recoveryTimeSkill = nil
						end
						
					end
					
				end
				
			end
			
		end
		
	end
	
	-- calculate recovery time adjustment
	
	if recoveryTimeSkill ~= nil then
		
		if recoveryTimeSkill == const.Skills.Sword or recoveryTimeSkill == const.Skills.Axe or recoveryTimeSkill == const.Skills.Bow then
			if t.Player.Skills[recoveryTimeSkill] ~= 0 then
				local skill, mastery = SplitSkill(t.Player.Skills[recoveryTimeSkill])
				if mastery >= const.Expert then
					t.Result = t.Result - (skill * 9)
				end
			end
		end
		
	end
	
	-- turn recovery time into a multiplier rather than divisor
	
	local recoveryTimeBonus = 100 - t.Result
	local correctedRecoveryTime = math.floor(100 * 100 / (100 + recoveryTimeBonus))
	t.Result = correctedRecoveryTime
	
end

function events.CalcStatBonusBySkills(t)

	-- calculate attack bonus by skill
	
	if t.Stat == const.Stats.MeleeAttack then
	
		local mainHandItemNumber = t.Player.ItemMainHand
		
		if mainHandItemNumber ~= 0 then
		
			local mainHandItem = t.Player.Items[mainHandItemNumber]
			
			if Game.ItemsTxt[mainHandItem.Number].Skill ~= 0 then
			
				local mainHandItemSkill = Game.ItemsTxt[mainHandItem.Number].Skill - 1

				if t.Player.Skills[mainHandItemSkill] ~= 0 then
				
					local skill, mastery = SplitSkill(t.Player.Skills[mainHandItemSkill])
					
					-- set attack bonus step to 10
					
					t.Result = t.Result + (skill * 9)
					
				end
				
			end
			
		end
		
	end
	
	-- calculate attack damage by skill
	
	if t.Stat == const.Stats.MeleeDamageBase then
	
		local mainHandItemNumber = t.Player.ItemMainHand
		
		if mainHandItemNumber ~= 0 then
		
			local mainHandItem = t.Player.Items[mainHandItemNumber]
			
			if Game.ItemsTxt[mainHandItem.Number].Skill ~= 0 then
			
				local mainHandItemSkill = Game.ItemsTxt[mainHandItem.Number].Skill - 1
				
				if t.Player.Skills[mainHandItemSkill] ~= 0 then
				
					local skill, mastery = SplitSkill(t.Player.Skills[mainHandItemSkill])
					
					-- set attack bonus step to 10 for Axe, Spear, Mace
					
					if
						(mainHandItemSkill == const.Skills.Axe and mastery >= const.Master)
						or
						(mainHandItemSkill == const.Skills.Spear and mastery >= const.Master)
						or
						(mainHandItemSkill == const.Skills.Mace and mastery >= const.Expert)
					then
					
						t.Result = t.Result + (skill * 4)
						
					end
					
				end
				
			end
			
		end
		
	end
	
end

