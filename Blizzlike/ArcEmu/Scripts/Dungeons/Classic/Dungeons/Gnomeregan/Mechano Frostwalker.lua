--[[=========================================
 _     _    _
| |   | |  | |  /\                  /\
| |   | |  | | /  \   _ __  _ __   /  \   _ __ ___
| |   | |  | |/ /\ \ | '_ \| '_ \ / /\ \ | '__/ __|
| |___| |__| / ____ \| |_) | |_) / ____ \| | | (__
|______\____/_/    \_\ .__/| .__/_/    \_\_|  \___|
  Scripting Project  | |   | | Improved LUA Engine
                     |_|   |_|
   SVN: http://svn.burning-azzinoth.de/LUAppArc
   LOG: http://luapparc.burning-azzinoth.de/trac/timeline
   TRAC: http://luapparc.burning-azzinoth.de/trac
   ----------------------
   Original Code by DARKI
   Version 1
========================================]]--

function Radioactive_frostwalker_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("Ice_Blast", 7000, 0)
	pUnit:RegisterEvent("Ice_Nova", 14000, 0)
end

function Ice_Blast(pUnit, Event)
	pUnit:FullCastSpellOnTarget(11264, pUnit:GetRandomPlayer(1))
end

function Ice_Nova(pUnit, Event)
	pUnit:FullCastSpellOnTarget(22519, pUnit:GetClosestPlayer(1))
end

function Radioactive_frostwalker_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
end

function Radioactive_frostwalker_OnDied(pUnit, Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(6227, 1, "Radioactive_frostwalker_OnCombat")
RegisterUnitEvent(6227, 2, "Radioactive_frostwalker_OnLeaveCombat")
RegisterUnitEvent(6227, 4, "Radioactive_frostwalker_OnDied")