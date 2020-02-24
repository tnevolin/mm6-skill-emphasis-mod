-- Turns recovery time into a multiplier rather than divisor
function events.GetAttackDelay(t)
	MessageBox(t.Result)
	debug.Message(t.Result)
	debug.ErrorMessage(t.Result)
	ErrorMessage(t.Result)
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

