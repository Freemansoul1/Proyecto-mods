--***********************************************************
--**                    THE INDIE STONE                    **
--***********************************************************

-- Locations must be declared in render-order.
-- Location IDs must match BodyLocation= and CanBeEquipped= values in items.txt.
local group = BodyLocations.getGroup("Human")

group:getOrCreateLocation("KnifeSheathLeg")

group:setExclusive("KnifeSheathLeg", "KnifeSheathLeg")

group:getOrCreateLocation("SwordSheath")

group:setExclusive("SwordSheath", "SwordSheath")

group:getOrCreateLocation("SwordSheath")
group:getOrCreateLocation("TorsoRig")
group:getOrCreateLocation("TorsoRig2")
group:getOrCreateLocation("waistbags")
group:getOrCreateLocation("UpperArmLeft")
group:getOrCreateLocation("UpperArmRight")
group:getOrCreateLocation("ThighLeft")
group:getOrCreateLocation("ThighRight")
group:getOrCreateLocation("LowerBody")
group:getOrCreateLocation("Pauldrons")
group:getOrCreateLocation("HandPlateLeft")
group:getOrCreateLocation("HandPlateRight")
group:getOrCreateLocation("ShinPlateLeft")
group:getOrCreateLocation("ShinPlateRight")
group:getOrCreateLocation("UpperArms")
group:getOrCreateLocation("UpperLegs")
group:getOrCreateLocation("LowerLegs")
group:getOrCreateLocation("LowerArms")
