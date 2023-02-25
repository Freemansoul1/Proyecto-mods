require "Hotbar/ISHotbarAttachDefinition"
if not ISHotbarAttachDefinition then
    return
end

local KnifeSheathLeg = {
	type = "KnifeSheathLeg",
	name = "KnifeSheathLeg",
	animset = "belt right",
	attachments = {
		Knife = "Knife in Sheath (Leg)",
	},
}
table.insert(ISHotbarAttachDefinition, KnifeSheathLeg);

local SwordSheath = {
	type = "SwordSheath",
	name = "SwordSheath",
	animset = "back",
	attachments = {
		Sword = "Sword in Sheath",
	},
}
table.insert(ISHotbarAttachDefinition, SwordSheath);