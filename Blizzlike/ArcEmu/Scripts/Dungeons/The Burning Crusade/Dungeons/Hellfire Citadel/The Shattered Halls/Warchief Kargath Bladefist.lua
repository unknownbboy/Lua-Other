--[[Warchief Kargath Bladefist yells: Cowards! You'll never draw me into the shadows!
Warchief Kargath Bladefist yells: For the real Horde!
Warchief Kargath Bladefist yells: I am called Bladefist for a reason. As you will see.
Warchief Kargath Bladefist yells: I am the ONLY warchief!
Warchief Kargath Bladefist yells: I'll carve the meat from your bones!
Warchief Kargath Bladefist yells: Ours is the TRUE Horde! The only Horde!
Warchief Kargath Bladefist yells: The true Horde... will prevail.]]

function BladeFist(Unit, event, miscUnit, misc)
	Unit:RegisterEvent("BladeFist_MobsA", 1000, 1)
	Unit:RegisterEvent("BladeFist_MobsB", 20000, 0)
	Unit:RegisterEvent("BladeFist_Blade_Dance", 33000, 0)
end

function BladeFist_MobsA(Unit)
	Unit:SpawnCreature(17695, 272.9, -90.7, 1.8, 0, 18, 36000000);
	Unit:SpawnCreature(17695, 275.95, -83.3, 2.3, 0, 18, 36000000);
	Unit:SpawnCreature(17695, 274.8, -77.4, 1.7, 0, 18, 36000000);
end

function BladeFist_MobsB(Unit)
	Unit:SpawnCreature(17401, 253, -88.4, 4.9, 0, 18, 36000000);
	Unit:SpawnCreature(17401, 251.8, -79.5, 4.9, 0, 18, 36000000);
end

function BladeFist_Blade_Dance(Unit, event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(30739, Unit:GetClosestPlayer())
end

RegisterUnitEvent(16808, 1, "BladeFist")