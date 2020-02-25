function events.GetAttackDelay(t)

	-- get recovery time bonus
	local recoveryTimeBonus = 100 - t.Result
	
	-- correct weapon skill recovery time bonus
	
	
	-- turn recovery time into a multiplier rather than divisor
	local correctedRecoveryTime = math.floor(100 * 100 / (100 + recoveryTimeBonus))
	t.Result = correctedRecoveryTime
	
end

function events.CalcStatBonusBySkills(t)
	-- calculate axe damage by skill
	if t.Stat == const.Stats.MeleeDamageBase then
		local mainHandItemNumber = t.Player.ItemMainHand
		if mainHandItemNumber ~= 0 then
			local mainHandItem = t.Player.Items[mainHandItemNumber]
			if (Game.ItemsTxt[mainHandItem.Number].Skill - 1) == const.Skills.Axe and not mainHandItem.Broken then
				if t.Player.Skills[const.Skills.Axe] ~= 0 then
					local skill, mastery = SplitSkill(t.Player.Skills[const.Skills.Axe])
					if mastery >= const.Master then
						t.Result = skill * 10
					end
				end
			end
		end
	end
end

