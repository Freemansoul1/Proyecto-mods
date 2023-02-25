require "ISUI/ISWorldObjectContextMenu"

function Work_Stations(player, context, worldobjects, test)

	if test and ISWorldObjectContextMenu.Test then return true end
	
	if getCore():getGameMode()=="LastStand" then
		return;
	end
	
	if test then return ISWorldObjectContextMenu.setTest() end

	scavengeZone = nil;
	local playerObj = getSpecificPlayer(player)
	local x1 = getPlayer():getX();
	local y1 = getPlayer():getY();
	local z1 = getPlayer():getZ();
	
	if playerObj:getVehicle() then return; end
	
	local trash_pit

	local gasst

	local copper_mine
	local tin_mine
	local iron_mine
	local galena_mine
	local nickel_mine
	local chromium_mine
	local sulfur_mine
	local lime_mine	
	local coal_mine
	local stone_mine
	local salt_mine

	local entry_lab
	local exit_lab

	local entry_bunker1
	local entry_bunker2
	local entry_bunker3
	local exit_bunker1
	local exit_bunker2
	local exit_bunker3

	local active_comp
	local petrol_bunker
	local weaponparts
	local trainer


	for i, v in ipairs(worldobjects) do
		
		if v:getSprite():getName() == nil then return; end
		local spriteName = v:getSprite():getName()
		x = v:getX();
		y = v:getY();
		if spriteName == "A1 ae_bunker_0"
		or spriteName == "A1 ae_bunker_1" or spriteName == "A1 ae_bunker_2" or spriteName == "A1 ae_bunker_3" or spriteName == "A1 ae_bunker_4" 
		or spriteName == "A1 ae_bunker_5" or spriteName == "A1 ae_bunker_6" or spriteName == "A1 ae_bunker_7" or spriteName == "A1 ae_bunker_8" 
		or spriteName == "A1 ae_bunker_9" or spriteName == "A1 ae_bunker_10" or spriteName == "A1 ae_bunker_11" or spriteName == "A1 ae_bunker_12" 
		or spriteName == "A1 ae_bunker_13" or spriteName == "A1 ae_bunker_14" or spriteName == "A1 ae_bunker_15" or spriteName == "A1 ae_bunker_16" 
		or spriteName == "A1 ae_bunker_17" or spriteName == "A1 ae_bunker_18" or spriteName == "A1 ae_bunker_19" or spriteName == "A1 ae_bunker_20" 
		or spriteName == "A1 ae_bunker_21" or spriteName == "A1 ae_bunker_22" or spriteName == "A1 ae_bunker_23" or spriteName == "A1 ae_bunker_24" 
		or spriteName == "A1 ae_bunker_25" or spriteName == "A1 ae_bunker_26" or spriteName == "A1 ae_bunker_27" or spriteName == "A1 ae_bunker_28" 
		or spriteName == "A1 ae_bunker_29" or spriteName == "A1 ae_bunker_30" or spriteName == "A1 ae_bunker_31" or spriteName == "A1 ae_bunker_32" 
		or spriteName == "A1 ae_bunker_33" or spriteName == "A1 ae_bunker_34" or spriteName == "A1 ae_bunker_35" or spriteName == "A1 ae_bunker_36" 
		or spriteName == "A1 ae_bunker_37" or spriteName == "A1 ae_bunker_38" or spriteName == "A1 ae_bunker_39" or spriteName == "A1 ae_bunker_40" 
		or spriteName == "A1 ae_bunker_41" or spriteName == "A1 ae_bunker_42" or spriteName == "A1 ae_bunker_43" or spriteName == "A1 ae_bunker_44" 
		or spriteName == "A1 ae_bunker_45" or spriteName == "A1 ae_bunker_46" or spriteName == "A1 ae_bunker_47" or spriteName == "A1 ae_bunker_48" 
		or spriteName == "A1 ae_bunker_49" or spriteName == "A1 ae_bunker_50" or spriteName == "A1 ae_bunker_51" or spriteName == "A1 ae_bunker_52" 
		or spriteName == "A1 ae_bunker_57" or spriteName == "A1 ae_bunker_58" or spriteName == "A1 ae_bunker_59" or spriteName == "A1 ae_bunker_60" 
		or spriteName == "A1 ae_bunker_61" or spriteName == "A1 ae_bunker_62" or spriteName == "A1 ae_bunker_63" or spriteName == "A1 ae_bunker_64" 
		or spriteName == "A1 ae_bunker_65" or spriteName == "A1 ae_bunker_66" or spriteName == "A1 ae_bunker_67" or spriteName == "A1 ae_bunker_68" 
		or spriteName == "A1 ae_bunker_69" or spriteName == "A1 ae_bunker_70" or spriteName == "A1 ae_bunker_71" or spriteName == "A1 ae_bunker_72" 
		or spriteName == "A1 ae_bunker_73" or spriteName == "A1 ae_bunker_74" or spriteName == "A1 ae_bunker_75" or spriteName == "A1 ae_bunker_76" 
		or spriteName == "A1 ae_bunker_77" or spriteName == "A1 ae_bunker_78" or spriteName == "A1 ae_bunker_79" or spriteName == "A1 ae_bunker_80" 
		or spriteName == "A1 ae_bunker_81" or spriteName == "A1 ae_bunker_82" or spriteName == "A1 ae_bunker_83" or spriteName == "A1 ae_bunker_84" 
		or spriteName == "A1 ae_bunker_85" or spriteName == "A1 ae_bunker_86" or spriteName == "A1 ae_bunker_87" or spriteName == "A1 ae_bunker_88" 
		or spriteName == "A1 ae_bunker_89" or spriteName == "A1 ae_bunker_90" or spriteName == "A1 ae_bunker_91" or spriteName == "A1 ae_bunker_92" 
		or spriteName == "A1 ae_bunker_93" or spriteName == "A1 ae_bunker_94" or spriteName == "A1 ae_bunker_95" or spriteName == "A1 ae_bunker_96" 
		then
			trash_pit = v;
		elseif spriteName == "NHGasL_0" or spriteName == "NHGasR_0" 
		then
			gasst = v;
		elseif spriteName == "NHCopper_0" 
		then
			copper_mine = v;
		elseif spriteName == "NHTin_0" 
		then
			tin_mine = v;
		elseif spriteName == "NHIron_0" 
		then
			iron_mine = v;
		elseif spriteName == "NHLead_0" 
		then
			galena_mine = v;
		elseif spriteName == "NHNickel_0" 
		then
			nickel_mine = v;
		elseif spriteName == "NHChromium_0" 
		then
			chromium_mine = v;
		elseif spriteName == "NHSulfur_0" 
		then
			sulfur_mine = v;
		elseif spriteName == "NHLimestone_0" 
		then
			lime_mine = v;
		elseif spriteName == "NHCoal_0" 
		then
			coal_mine = v;
		elseif spriteName == "NHStone_1_0" or spriteName == "NHStone_2_0" 
		then
			stone_mine = v;
		elseif spriteName == "NHSalt_1_0" or spriteName == "NHSalt_2_0" 
		then
			salt_mine = v;
		elseif spriteName == "A1 pinkot_0"
		then
			entry_lab = v;
		elseif spriteName == "A1 pinkot_1"
		then
			exit_lab = v;
		elseif spriteName == "A1 pinkot_2"
		then
			entry_bunker1 = v;
		elseif spriteName == "A1 pinkot_8"
		then
			entry_bunker2 = v;
		elseif spriteName == "A1 pinkot_10"
		then
			entry_bunker3 = v;
		elseif spriteName == "A1 pinkot_3"
		then
			exit_bunker1 = v;
		elseif spriteName == "A1 pinkot_9"
		then
			exit_bunker2 = v;
		elseif spriteName == "A1 pinkot_11"
		then
			exit_bunker3 = v;
		elseif spriteName == "A1_CULT_0"
		then
			petrol_bunker = v;
		elseif spriteName == "A1_CULT_24" or spriteName == "A1_CULT_25"
		or spriteName == "A1_CULT_26" or spriteName == "A1_CULT_27"
		then
			weaponparts = v;
		elseif spriteName == "A1 decor_med_3"
		then
			active_comp = v;
		elseif spriteName == "WorkbenchAgility_1_0" or spriteName == "WorkbenchAgility_2_0"
		then
			trainer = v;
		end
	end
	

	local MineEnd = getPlayer():getXp():getXP(Perks.MineEndurance)
	local DocRep = getPlayer():getXp():getXP(Perks.RepDoc)
	local DocTaskTaken = getPlayer():HasTrait('task_start_med')
	local End = getPlayer():getStats():getEndurance()
	local Fatique = getPlayer():getStats():getFatigue()
	local pickaxe = getPlayer():getInventory():getItemCount("Base.PickAxe", true);
	local GreenCard = getPlayer():getInventory():getItemCount("NHM.GreenCard", true);
	local YellowCard = getPlayer():getInventory():getItemCount("NHM.YellowCard", true);
	local RedCard = getPlayer():getInventory():getItemCount("NHM.RedCard", true);
	
--Свалка			
	if trash_pit and getPlayer():DistToSquared(x, y) <= 6 then
		local option_trash_search = context:addOption(getText("ContextMenu_Search_Trash"), worldobjects, Trash_search, player);
		local toolTip = ISToolTip:new();
			toolTip:initialise();
			toolTip:setVisible(false);
			option_trash_search.toolTip = toolTip;
			toolTip:setName(getText("ContextMenu_Search_Trash"));
			toolTip:setTexture("A1 ae_bunker_6");
			toolTip.description = getText("Tooltip_Search_Trash");	
			if MineEnd < 15 then
				toolTip.description = toolTip.description .. "\n<RGB:1,0,0>" .. getText("Tooltip_MineEnd") .. " -15 (" .. MineEnd .. ")" .. "\n";
				option_trash_search.notAvailable = true;
			else
				toolTip.description = toolTip.description .. "\n<RGB:1,1,1>" .. getText("Tooltip_MineEnd") .. " -15 (" .. MineEnd .. ")" .. "\n";
			end
			if End < 0.1 then
				toolTip.description = toolTip.description .. "\n<RGB:1,0,0>" .. getText("Tooltip_End");
				option_trash_search.notAvailable = true;
			end
			if Fatique > 0.8 then
				toolTip.description = toolTip.description .. "\n<RGB:1,0,0>" .. getText("Tooltip_Fatique");
				option_trash_search.notAvailable = true;
			end

--Газовая колонка
		--наполнить горелку
		elseif gasst and getPlayer():DistToSquared(x, y) <= 6 then
		local EBlowTorch = getPlayer():getPrimaryHandItem() and getPlayer():getPrimaryHandItem():getType() == "EmptyBlowTorch"; --ыыыы ебло торч
		local option_gasstation = context:addOption(getText("ContextMenu_Extract_Gas"), worldobjects, Gas_Station, player);
		local toolTip = ISToolTip:new();
			toolTip:initialise();
			toolTip:setVisible(false);
			option_gasstation.toolTip = toolTip;
			toolTip:setName(getText("ContextMenu_Extract_Gas"));
			toolTip.description = getText("Tooltip_Extract_Gas") .. " <CENTRE>" ..  "\n<IMAGE:media/textures/Item_BlowTorch.png>";	
		if MineEnd < 30 then
			toolTip.description = toolTip.description .. "\n<RGB:1,0,0>" .. getText("Tooltip_MineEnd") .. " -30 (" .. MineEnd .. ")" .. "\n";
			option_gasstation.notAvailable = true;
		else
			toolTip.description = toolTip.description .. "\n<RGB:1,1,1>" .. getText("Tooltip_MineEnd") .. " -30 (" .. MineEnd .. ")" .. "\n";
		end
		if not EBlowTorch then
			toolTip.description = toolTip.description .. " <RGB:1,0,0>" .. getText("Tooltip_EmptyBlowTorch") .. "\n";
			option_gasstation.notAvailable = true;
		end
		if End < 0.1 then
			toolTip.description = toolTip.description .. "\n<RGB:1,0,0>" .. getText("Tooltip_End");
			option_gasstation.notAvailable = true;
		end
		if Fatique > 0.8 then
			toolTip.description = toolTip.description .. "\n<RGB:1,0,0>" .. getText("Tooltip_Fatique");
			option_gasstation.notAvailable = true;
		end

	--наполнить баллон
	
	local EPropaneTank = getPlayer():getPrimaryHandItem() and getPlayer():getPrimaryHandItem():getType() == "EmptyPropaneTank";
	local option_muchgas = context:addOption(getText("ContextMenu_Extract_MuchGas"), worldobjects, Much_Gas, player);
	local toolTip = ISToolTip:new();
	toolTip:initialise();
	toolTip:setVisible(false);
	option_muchgas.toolTip = toolTip;
	toolTip:setName(getText("ContextMenu_Extract_MuchGas"));
	toolTip.description = getText("Tooltip_Extract_Gas") .. " <CENTRE>" ..  "\n<IMAGE:media/textures/Item_PropaneTank.png>";	
	if MineEnd < 120 then
		toolTip.description = toolTip.description .. "\n<RGB:1,0,0>" .. getText("Tooltip_MineEnd") .. " -120 (" .. MineEnd .. ")" .. "\n";
		option_muchgas.notAvailable = true;
	else
		toolTip.description = toolTip.description .. "\n<RGB:1,1,1>" .. getText("Tooltip_MineEnd") .. " -120 (" .. MineEnd .. ")" .. "\n";
	end
	if not EPropaneTank then
		toolTip.description = toolTip.description .. " <RGB:1,0,0>" .. getText("Tooltip_EmptyPropaneTank") .. "\n";
		option_muchgas.notAvailable = true;
	end
	if End < 0.1 then
		toolTip.description = toolTip.description .. "\n<RGB:1,0,0>" .. getText("Tooltip_End");
		option_muchgas.notAvailable = true;
	end
	if Fatique > 0.8 then
		toolTip.description = toolTip.description .. "\n<RGB:1,0,0>" .. getText("Tooltip_Fatique");
		option_muchgas.notAvailable = true;
	end

--МЕДНАЯ ЖИЛА
	elseif copper_mine and getPlayer():DistToSquared(x, y) <= 6 then
		local option_mine_copper = context:addOption(getText("ContextMenu_Mine_Copper"), worldobjects, MineCopper, player);
		local toolTip = ISToolTip:new();
		toolTip:initialise();
		toolTip:setVisible(false);
		option_mine_copper.toolTip = toolTip;
		toolTip:setName(getText("ContextMenu_Mine_Copper"));
		toolTip:setTexture("NHCopper_0");
		toolTip.description = getText("Tooltip_Mine_Copper");	
		if MineEnd < 30 then
			toolTip.description = toolTip.description .. "\n<RGB:1,0,0>" .. getText("Tooltip_MineEnd") .. " -30 (" .. MineEnd .. ")" .. "\n";
			option_mine_copper.notAvailable = true;
		else
			toolTip.description = toolTip.description .. "\n<RGB:1,1,1>" .. getText("Tooltip_MineEnd") .. " -30 (" .. MineEnd .. ")" .. "\n";
		end
		if pickaxe < 1 then
			toolTip.description = toolTip.description .. "\n<RGB:1,0,0>" .. getText("Tooltip_pickaxe");
			option_mine_copper.notAvailable = true;
		end
		if End < 0.1 then
			toolTip.description = toolTip.description .. "\n<RGB:1,0,0>" .. getText("Tooltip_End");
			option_mine_copper.notAvailable = true;
		end
		if Fatique > 0.8 then
			toolTip.description = toolTip.description .. "\n<RGB:1,0,0>" .. getText("Tooltip_Fatique");
			option_mine_copper.notAvailable = true;
		end

--ОЛОВЯННАЯ ЖИЛА
	elseif tin_mine and getPlayer():DistToSquared(x, y) <= 6 then
		local option_mine_tin = context:addOption(getText("ContextMenu_Mine_Tin"), worldobjects, MineTin, player);
		local toolTip = ISToolTip:new();
		toolTip:initialise();
		toolTip:setVisible(false);
		option_mine_tin.toolTip = toolTip;
		toolTip:setName(getText("ContextMenu_Mine_Tin"));
		toolTip:setTexture("NHTin_0");
		toolTip.description = getText("Tooltip_Mine_Tin");	
		if MineEnd < 30 then
			toolTip.description = toolTip.description .. "\n<RGB:1,0,0>" .. getText("Tooltip_MineEnd") .. " -30 (" .. MineEnd .. ")" .. "\n";
			option_mine_tin.notAvailable = true;
		else
			toolTip.description = toolTip.description .. "\n<RGB:1,1,1>" .. getText("Tooltip_MineEnd") .. " -30 (" .. MineEnd .. ")" .. "\n";
		end
		if pickaxe < 1 then
			toolTip.description = toolTip.description .. "\n<RGB:1,0,0>" .. getText("Tooltip_pickaxe");
			option_mine_tin.notAvailable = true;
		end
		if End < 0.1 then
			toolTip.description = toolTip.description .. "\n<RGB:1,0,0>" .. getText("Tooltip_End");
			option_mine_tin.notAvailable = true;
		end
		if Fatique > 0.8 then
			toolTip.description = toolTip.description .. "\n<RGB:1,0,0>" .. getText("Tooltip_Fatique");
			option_mine_tin.notAvailable = true;
		end

--ЖЕЛЕЗНАЯ ЖИЛА
elseif iron_mine and getPlayer():DistToSquared(x, y) <= 6 then
	local option_mine_iron = context:addOption(getText("ContextMenu_Mine_Iron"), worldobjects, MineIron, player);
	local toolTip = ISToolTip:new();
	toolTip:initialise();
	toolTip:setVisible(false);
	option_mine_iron.toolTip = toolTip;
	toolTip:setName(getText("ContextMenu_Mine_Iron"));
	toolTip:setTexture("NHIron_0");
	toolTip.description = getText("Tooltip_Mine_Iron");	
	if MineEnd < 45 then
		toolTip.description = toolTip.description .. "\n<RGB:1,0,0>" .. getText("Tooltip_MineEnd") .. " -45 (" .. MineEnd .. ")" .. "\n";
		option_mine_iron.notAvailable = true;
	else
		toolTip.description = toolTip.description .. "\n<RGB:1,1,1>" .. getText("Tooltip_MineEnd") .. " -45 (" .. MineEnd .. ")" .. "\n";
	end
	if pickaxe < 1 then
		toolTip.description = toolTip.description .. "\n<RGB:1,0,0>" .. getText("Tooltip_pickaxe");
		option_mine_iron.notAvailable = true;
	end
	if End < 0.1 then
		toolTip.description = toolTip.description .. "\n<RGB:1,0,0>" .. getText("Tooltip_End");
		option_mine_iron.notAvailable = true;
	end
	if Fatique > 0.8 then
		toolTip.description = toolTip.description .. "\n<RGB:1,0,0>" .. getText("Tooltip_Fatique");
		option_mine_iron.notAvailable = true;
	end

--СВИНЦОВАЯ ЖИЛА
elseif galena_mine and getPlayer():DistToSquared(x, y) <= 6 then
	local option_mine_lead = context:addOption(getText("ContextMenu_Mine_Lead"), worldobjects, MineLead, player);
	local toolTip = ISToolTip:new();
	toolTip:initialise();
	toolTip:setVisible(false);
	option_mine_lead.toolTip = toolTip;
	toolTip:setName(getText("ContextMenu_Mine_Lead"));
	toolTip:setTexture("NHLead_0");
	toolTip.description = getText("Tooltip_Mine_Lead");		
	if MineEnd < 45 then
		toolTip.description = toolTip.description .. "\n<RGB:1,0,0>" .. getText("Tooltip_MineEnd") .. " -45 (" .. MineEnd .. ")" .. "\n";
		option_mine_lead.notAvailable = true;
	else
		toolTip.description = toolTip.description .. "\n<RGB:1,1,1>" .. getText("Tooltip_MineEnd") .. " -45 (" .. MineEnd .. ")" .. "\n";
	end
	if pickaxe < 1 then
		toolTip.description = toolTip.description .. "\n<RGB:1,0,0>" .. getText("Tooltip_pickaxe");
		option_mine_lead.notAvailable = true;
	end
	if End < 0.1 then
		toolTip.description = toolTip.description .. "\n<RGB:1,0,0>" .. getText("Tooltip_End");
		option_mine_lead.notAvailable = true;
	end
	if Fatique > 0.8 then
		toolTip.description = toolTip.description .. "\n<RGB:1,0,0>" .. getText("Tooltip_Fatique");
		option_mine_lead.notAvailable = true;
	end

--НИКЕЛЕВАЯ ЖИЛА
elseif nickel_mine and getPlayer():DistToSquared(x, y) <= 6 then
	local option_mine_nickel = context:addOption(getText("ContextMenu_Mine_Nickel"), worldobjects, MineNickel, player);
	local toolTip = ISToolTip:new();
	toolTip:initialise();
	toolTip:setVisible(false);
	option_mine_nickel.toolTip = toolTip;
	toolTip:setName(getText("ContextMenu_Mine_Nickel"));
	toolTip:setTexture("NHNickel_0");
	toolTip.description = getText("Tooltip_Mine_Nickel");	
	if MineEnd < 60 then
		toolTip.description = toolTip.description .. "\n<RGB:1,0,0>" .. getText("Tooltip_MineEnd") .. " -60 (" .. MineEnd .. ")" .. "\n";
		option_mine_nickel.notAvailable = true;
	else
		toolTip.description = toolTip.description .. "\n<RGB:1,1,1>" .. getText("Tooltip_MineEnd") .. " -60 (" .. MineEnd .. ")" .. "\n";
	end
	if pickaxe < 1 then
		toolTip.description = toolTip.description .. "\n<RGB:1,0,0>" .. getText("Tooltip_pickaxe");
		option_mine_nickel.notAvailable = true;
	end
	if End < 0.1 then
		toolTip.description = toolTip.description .. "\n<RGB:1,0,0>" .. getText("Tooltip_End");
		option_mine_nickel.notAvailable = true;
	end
	if Fatique > 0.8 then
		toolTip.description = toolTip.description .. "\n<RGB:1,0,0>" .. getText("Tooltip_Fatique");
		option_mine_nickel.notAvailable = true;
	end

--ХРОМОВАЯ ЖИЛА
elseif chromium_mine and getPlayer():DistToSquared(x, y) <= 6 then
	local option_mine_chromium = context:addOption(getText("ContextMenu_Mine_Chromium"), worldobjects, MineChromium, player);
	local toolTip = ISToolTip:new();
	toolTip:initialise();
	toolTip:setVisible(false);
	option_mine_chromium.toolTip = toolTip;
	toolTip:setName(getText("ContextMenu_Mine_Chromium"));
	toolTip:setTexture("NHChromium_0");
	toolTip.description = getText("Tooltip_Mine_Chromium");	
	if MineEnd < 60 then
		toolTip.description = toolTip.description .. "\n<RGB:1,0,0>" .. getText("Tooltip_MineEnd") .. " -60 (" .. MineEnd .. ")" .. "\n";
		option_mine_chromium.notAvailable = true;
	else
		toolTip.description = toolTip.description .. "\n<RGB:1,1,1>" .. getText("Tooltip_MineEnd") .. " -60 (" .. MineEnd .. ")" .. "\n";
	end
	if pickaxe < 1 then
		toolTip.description = toolTip.description .. "\n<RGB:1,0,0>" .. getText("Tooltip_pickaxe");
		option_mine_chromium.notAvailable = true;
	end
	if End < 0.1 then
		toolTip.description = toolTip.description .. "\n<RGB:1,0,0>" .. getText("Tooltip_End");
		option_mine_chromium.notAvailable = true;
	end
	if Fatique > 0.8 then
		toolTip.description = toolTip.description .. "\n<RGB:1,0,0>" .. getText("Tooltip_Fatique");
		option_mine_chromium.notAvailable = true;
	end

--СЕРНАЯ ЖИЛА
elseif sulfur_mine and getPlayer():DistToSquared(x, y) <= 6 then
	local option_mine_sulfur = context:addOption(getText("ContextMenu_Mine_Sulfur"), worldobjects, MineSulfur, player);
	local toolTip = ISToolTip:new();
	toolTip:initialise();
	toolTip:setVisible(false);
	option_mine_sulfur.toolTip = toolTip;
	toolTip:setName(getText("ContextMenu_Mine_Sulfur"));
	toolTip:setTexture("NHSulfur_0");
	toolTip.description = getText("Tooltip_Mine_Sulfur");	
	if MineEnd < 30 then
		toolTip.description = toolTip.description .. "\n<RGB:1,0,0>" .. getText("Tooltip_MineEnd") .. " -30 (" .. MineEnd .. ")" .. "\n";
		option_mine_sulfur.notAvailable = true;
	else
		toolTip.description = toolTip.description .. "\n<RGB:1,1,1>" .. getText("Tooltip_MineEnd") .. " -30 (" .. MineEnd .. ")" .. "\n";
	end
	if pickaxe < 1 then
		toolTip.description = toolTip.description .. "\n<RGB:1,0,0>" .. getText("Tooltip_pickaxe");
		option_mine_sulfur.notAvailable = true;
	end
	if End < 0.1 then
		toolTip.description = toolTip.description .. "\n<RGB:1,0,0>" .. getText("Tooltip_End");
		option_mine_sulfur.notAvailable = true;
	end
	if Fatique > 0.8 then
		toolTip.description = toolTip.description .. "\n<RGB:1,0,0>" .. getText("Tooltip_Fatique");
		option_mine_sulfur.notAvailable = true;
	end

--КАЛЬЦИТОВАЯ ЖИЛА
elseif lime_mine and getPlayer():DistToSquared(x, y) <= 6 then
	local option_mine_lime = context:addOption(getText("ContextMenu_Mine_Limestone"), worldobjects, MineLimestone, player);
	local toolTip = ISToolTip:new();
	toolTip:initialise();
	toolTip:setVisible(false);
	option_mine_lime.toolTip = toolTip;
	toolTip:setName(getText("ContextMenu_Mine_Limestone"));
	toolTip:setTexture("NHLimestone_0");
	toolTip.description = getText("Tooltip_Mine_Limestone");	
	if MineEnd < 45 then
		toolTip.description = toolTip.description .. "\n<RGB:1,0,0>" .. getText("Tooltip_MineEnd") .. " -45 (" .. MineEnd .. ")" .. "\n";
		option_mine_lime.notAvailable = true;
	else
		toolTip.description = toolTip.description .. "\n<RGB:1,1,1>" .. getText("Tooltip_MineEnd") .. " -45 (" .. MineEnd .. ")" .. "\n";
	end
	if pickaxe < 1 then
		toolTip.description = toolTip.description .. "\n<RGB:1,0,0>" .. getText("Tooltip_pickaxe");
		option_mine_lime.notAvailable = true;
	end
	if End < 0.1 then
		toolTip.description = toolTip.description .. "\n<RGB:1,0,0>" .. getText("Tooltip_End");
		option_mine_lime.notAvailable = true;
	end
	if Fatique > 0.8 then
		toolTip.description = toolTip.description .. "\n<RGB:1,0,0>" .. getText("Tooltip_Fatique");
		option_mine_lime.notAvailable = true;
	end

--УГОЛЬНАЯ ЖИЛА
elseif coal_mine and getPlayer():DistToSquared(x, y) <= 6 then
	local option_mine_coal = context:addOption(getText("ContextMenu_Mine_Coal"), worldobjects, MineCoal, player);
	local toolTip = ISToolTip:new();
	toolTip:initialise();
	toolTip:setVisible(false);
	option_mine_coal.toolTip = toolTip;
	toolTip:setName(getText("ContextMenu_Mine_Coal"));
	toolTip:setTexture("NHCoal_0");
	toolTip.description = getText("Tooltip_Mine_Coal");	
	if MineEnd < 15 then
		toolTip.description = toolTip.description .. "\n<RGB:1,0,0>" .. getText("Tooltip_MineEnd") .. " -15 (" .. MineEnd .. ")" .. "\n";
		option_mine_coal.notAvailable = true;
	else
		toolTip.description = toolTip.description .. "\n<RGB:1,1,1>" .. getText("Tooltip_MineEnd") .. " -15 (" .. MineEnd .. ")" .. "\n";
	end
	if pickaxe < 1 then
		toolTip.description = toolTip.description .. "\n<RGB:1,0,0>" .. getText("Tooltip_pickaxe");
		option_mine_coal.notAvailable = true;
	end
	if End < 0.1 then
		toolTip.description = toolTip.description .. "\n<RGB:1,0,0>" .. getText("Tooltip_End");
		option_mine_coal.notAvailable = true;
	end
	if Fatique > 0.8 then
		toolTip.description = toolTip.description .. "\n<RGB:1,0,0>" .. getText("Tooltip_Fatique");
		option_mine_coal.notAvailable = true;
	end

--КАМЕННАЯ ЖИЛА
elseif stone_mine and getPlayer():DistToSquared(x, y) <= 6 then
	local option_mine_stone = context:addOption(getText("ContextMenu_Mine_Stone"), worldobjects, MineStone, player);
	local toolTip = ISToolTip:new();
	toolTip:initialise();
	toolTip:setVisible(false);
	option_mine_stone.toolTip = toolTip;
	toolTip:setName(getText("ContextMenu_Mine_Stone"));
	toolTip:setTexture("NHStone_1_0");
	toolTip.description = getText("Tooltip_Mine_Stone");	
	if MineEnd < 30 then
		toolTip.description = toolTip.description .. "\n<RGB:1,0,0>" .. getText("Tooltip_MineEnd") .. " -30 (" .. MineEnd .. ")" .. "\n";
		option_mine_stone.notAvailable = true;
	else
		toolTip.description = toolTip.description .. "\n<RGB:1,1,1>" .. getText("Tooltip_MineEnd") .. " -30 (" .. MineEnd .. ")" .. "\n";
	end
	if pickaxe < 1 then
		toolTip.description = toolTip.description .. "\n<RGB:1,0,0>" .. getText("Tooltip_pickaxe");
		option_mine_stone.notAvailable = true;
	end
	if End < 0.1 then
		toolTip.description = toolTip.description .. "\n<RGB:1,0,0>" .. getText("Tooltip_End");
		option_mine_stone.notAvailable = true;
	end
	if Fatique > 0.8 then
		toolTip.description = toolTip.description .. "\n<RGB:1,0,0>" .. getText("Tooltip_Fatique");
		option_mine_stone.notAvailable = true;
	end

--СОЛЯНАЯ ЖИЛА
elseif salt_mine and getPlayer():DistToSquared(x, y) <= 6 then
	local option_mine_salt = context:addOption(getText("ContextMenu_Mine_Salt"), worldobjects, MineSalt, player);
	local toolTip = ISToolTip:new();
	toolTip:initialise();
	toolTip:setVisible(false);
	option_mine_salt.toolTip = toolTip;
	toolTip:setName(getText("ContextMenu_Mine_Salt"));
	toolTip:setTexture("NHSalt_1_0");
	toolTip.description = getText("Tooltip_Mine_Salt");	
	if MineEnd < 45 then
		toolTip.description = toolTip.description .. "\n<RGB:1,0,0>" .. getText("Tooltip_MineEnd") .. " -45 (" .. MineEnd .. ")" .. "\n";
		option_mine_salt.notAvailable = true;
	else
		toolTip.description = toolTip.description .. "\n<RGB:1,1,1>" .. getText("Tooltip_MineEnd") .. " -45 (" .. MineEnd .. ")" .. "\n";
	end
	if pickaxe < 1 then
		toolTip.description = toolTip.description .. "\n<RGB:1,0,0>" .. getText("Tooltip_pickaxe");
		option_mine_salt.notAvailable = true;
	end
	if End < 0.1 then
		toolTip.description = toolTip.description .. "\n<RGB:1,0,0>" .. getText("Tooltip_End");
		option_mine_salt.notAvailable = true;
	end
	if Fatique > 0.8 then
		toolTip.description = toolTip.description .. "\n<RGB:1,0,0>" .. getText("Tooltip_Fatique");
		option_mine_salt.notAvailable = true;
	end

	--вход в лабу
elseif entry_lab and getPlayer():DistToSquared(x, y) <= 2 then
	local option_entry_lab = context:addOption(getText("ContextMenu_Entry_Lab"), worldobjects, EntryLab, player);
	local toolTip = ISToolTip:new();
	toolTip:initialise();
	toolTip:setVisible(false);
	option_entry_lab.toolTip = toolTip;
	toolTip:setName(getText("ContextMenu_Entry_Lab"));
	toolTip:setTexture("A1 pinkot_0");
	toolTip.description = getText("Tooltip_Entry_Lab");	
	if GreenCard < 1 then
		toolTip.description = toolTip.description .. "\n<RGB:1,0,0>" .. getText("Tooltip_GreenCard");
		option_entry_lab.notAvailable = true;
	end	
--[[ 	if (x1 > 6058 and x1 < 6058) or (y1 > 10909 and y1 < 10909) or (z1 > 1 and z1 < 1) then
		subMenu:removeLastOption();
	end ]]

	--выход из лабы
elseif exit_lab and getPlayer():DistToSquared(x, y) <= 2 then
	local option_exit_lab = context:addOption(getText("ContextMenu_Exit_Lab"), worldobjects, ExitLab, player);
	local toolTip = ISToolTip:new();
	toolTip:initialise();
	toolTip:setVisible(false);
	option_exit_lab.toolTip = toolTip;
	toolTip:setName(getText("ContextMenu_Exit_Lab"));
	toolTip:setTexture("A1 pinkot_1");
	toolTip.description = getText("Tooltip_Exit_Lab");
	if GreenCard < 1 then
		toolTip.description = toolTip.description .. "\n<RGB:1,0,0>" .. getText("Tooltip_GreenCard");
		option_exit_lab.notAvailable = true;
	end	
--[[ 	if (x1 > 6059 and x1 < 6059) or (y1 > 10906 and y1 < 10906) or (z1 > 1 and z1 < 1) then
		subMenu:removeLastOption();
	end ]]
-- вход и выход из бункера 1
elseif entry_bunker1 and getPlayer():DistToSquared(x, y) <= 2 then
	local option_entry_bunker1 = context:addOption(getText("ContextMenu_Entry_Bunker"), worldobjects, EntryBunker1, player);
	local toolTip = ISToolTip:new();
	toolTip:initialise();
	toolTip:setVisible(false);
	option_entry_bunker1.toolTip = toolTip;
	toolTip:setName(getText("ContextMenu_Entry_Bunker"));
	toolTip:setTexture("A1 pinkot_2");
	toolTip.description = getText("Tooltip_Entry_Bunker");
	if YellowCard < 1 then
		toolTip.description = toolTip.description .. "\n<RGB:1,0,0>" .. getText("Tooltip_YellowCard");
		option_entry_bunker1.notAvailable = true;
	end	
elseif exit_bunker1 and getPlayer():DistToSquared(x, y) <= 2 then
	local option_exit_bunker1 = context:addOption(getText("ContextMenu_Exit_Bunker"), worldobjects, ExitBunker1, player);
	local toolTip = ISToolTip:new();
	toolTip:initialise();
	toolTip:setVisible(false);
	option_exit_bunker1.toolTip = toolTip;
	toolTip:setName(getText("ContextMenu_Exit_Bunker"));
	toolTip:setTexture("A1 pinkot_3");
	toolTip.description = getText("Tooltip_Exit_Bunker");
	if YellowCard < 1 then
		toolTip.description = toolTip.description .. "\n<RGB:1,0,0>" .. getText("Tooltip_YellowCard");
		option_exit_bunker1.notAvailable = true;
	end	

	-- вход и выход из бункера 2
elseif entry_bunker2 and getPlayer():DistToSquared(x, y) <= 2 then
	local option_entry_bunker2 = context:addOption(getText("ContextMenu_Entry_Bunker"), worldobjects, EntryBunker2, player);
	local toolTip = ISToolTip:new();
	toolTip:initialise();
	toolTip:setVisible(false);
	option_entry_bunker2.toolTip = toolTip;
	toolTip:setName(getText("ContextMenu_Entry_Bunker"));
	toolTip:setTexture("A1 pinkot_8");
	toolTip.description = getText("Tooltip_Entry_Bunker");
	if YellowCard < 1 then
		toolTip.description = toolTip.description .. "\n<RGB:1,0,0>" .. getText("Tooltip_YellowCard");
		option_entry_bunker2.notAvailable = true;
	end	
elseif exit_bunker2 and getPlayer():DistToSquared(x, y) <= 2 then
	local option_exit_bunker2 = context:addOption(getText("ContextMenu_Exit_Bunker"), worldobjects, ExitBunker2, player);
	local toolTip = ISToolTip:new();
	toolTip:initialise();
	toolTip:setVisible(false);
	option_exit_bunker2.toolTip = toolTip;
	toolTip:setName(getText("ContextMenu_Exit_Bunker"));
	toolTip:setTexture("A1 pinkot_9");
	toolTip.description = getText("Tooltip_Exit_Bunker");
	if YellowCard < 1 then
		toolTip.description = toolTip.description .. "\n<RGB:1,0,0>" .. getText("Tooltip_YellowCard");
		option_exit_bunker2.notAvailable = true;
	end	

	-- вход и выход из бункера 3
elseif entry_bunker3 and getPlayer():DistToSquared(x, y) <= 2 then
	local option_entry_bunker3 = context:addOption(getText("ContextMenu_Entry_Bunker"), worldobjects, EntryBunker3, player);
	local toolTip = ISToolTip:new();
	toolTip:initialise();
	toolTip:setVisible(false);
	option_entry_bunker3.toolTip = toolTip;
	toolTip:setName(getText("ContextMenu_Entry_Bunker"));
	toolTip:setTexture("A1 pinkot_10");
	toolTip.description = getText("Tooltip_Entry_Bunker");
	if YellowCard < 1 then
		toolTip.description = toolTip.description .. "\n<RGB:1,0,0>" .. getText("Tooltip_YellowCard");
		option_entry_bunker3.notAvailable = true;
	end	

elseif exit_bunker3 and getPlayer():DistToSquared(x, y) <= 2 then
	local option_exit_bunker3 = context:addOption(getText("ContextMenu_Exit_Bunker"), worldobjects, ExitBunker3, player);
	local toolTip = ISToolTip:new();
	toolTip:initialise();
	toolTip:setVisible(false);
	option_exit_bunker3.toolTip = toolTip;
	toolTip:setName(getText("ContextMenu_Exit_Bunker"));
	toolTip:setTexture("A1 pinkot_11");
	toolTip.description = getText("Tooltip_Exit_Bunker");
	if YellowCard < 1 then
		toolTip.description = toolTip.description .. "\n<RGB:1,0,0>" .. getText("Tooltip_YellowCard");
		option_exit_bunker3.notAvailable = true;
	end	

-- бензин в бункере
elseif petrol_bunker and getPlayer():DistToSquared(x, y) <= 6 then
	local option_get_petrol = context:addOption(getText("ContextMenu_Get_Petrol"), worldobjects, GetPetrol, player);
	local toolTip = ISToolTip:new();
	toolTip:initialise();
	toolTip:setVisible(false);
	option_get_petrol.toolTip = toolTip;
	toolTip:setName(getText("ContextMenu_Get_Petrol"));
	toolTip:setTexture("A1_CULT_0");
	toolTip.description = getText("Tooltip_Get_Petrol");	
	local EPetrolCan = getPlayer():getPrimaryHandItem() and getPlayer():getPrimaryHandItem():getType() == "EmptyPetrolCan";
	if MineEnd < 90 then
		toolTip.description = toolTip.description .. "\n<RGB:1,0,0>" .. getText("Tooltip_MineEnd") .. " -90 (" .. MineEnd .. ")" .. "\n";
		option_get_petrol.notAvailable = true;
	else
		toolTip.description = toolTip.description .. "\n<RGB:1,1,1>" .. getText("Tooltip_MineEnd") .. " -90 (" .. MineEnd .. ")" .. "\n";
	end
	if not EPetrolCan then
		toolTip.description = toolTip.description .. " <RGB:1,0,0>" .. getText("Tooltip_EmptyPetrolCan") .. "\n";
		option_get_petrol.notAvailable = true;
	end
	if End < 0.1 then
		toolTip.description = toolTip.description .. "\n<RGB:1,0,0>" .. getText("Tooltip_End");
		option_get_petrol.notAvailable = true;
	end
	if Fatique > 0.8 then
		toolTip.description = toolTip.description .. "\n<RGB:1,0,0>" .. getText("Tooltip_Fatique");
		option_get_petrol.notAvailable = true;
	end

--ДЕТАЛИ ОРУЖИЯ
elseif weaponparts and getPlayer():DistToSquared(x, y) <= 6 then
	local option_get_weaponparts = context:addOption(getText("ContextMenu_Get_Weaponparts"), worldobjects, GetWeaponparts, player);
	local toolTip = ISToolTip:new();
	toolTip:initialise();
	toolTip:setVisible(false);
	option_get_weaponparts.toolTip = toolTip;
	toolTip:setName(getText("ContextMenu_Get_Weaponparts"));
	toolTip:setTexture("A1_CULT_0");
	toolTip.description = getText("Tooltip_Get_Weaponparts");	
	if MineEnd < 45 then
		toolTip.description = toolTip.description .. "\n<RGB:1,0,0>" .. getText("Tooltip_MineEnd") .. " -45 (" .. MineEnd .. ")" .. "\n";
		option_get_weaponparts.notAvailable = true;
	else
		toolTip.description = toolTip.description .. "\n<RGB:1,1,1>" .. getText("Tooltip_MineEnd") .. " -45 (" .. MineEnd .. ")" .. "\n";
	end
	if End < 0.1 then
		toolTip.description = toolTip.description .. "\n<RGB:1,0,0>" .. getText("Tooltip_End");
		option_get_weaponparts.notAvailable = true;
	end
	if Fatique > 0.8 then
		toolTip.description = toolTip.description .. "\n<RGB:1,0,0>" .. getText("Tooltip_Fatique");
		option_get_weaponparts.notAvailable = true;
	end


--АКТИВНОЕ ВЕЩЕСТВО
elseif active_comp and getPlayer():DistToSquared(x, y) <= 4 then
	local option_active_comp = context:addOption(getText("ContextMenu_Active_Comp"), worldobjects, ActiveComp, player);
	local toolTip = ISToolTip:new();
	toolTip:initialise();
	toolTip:setVisible(false);
	option_active_comp.toolTip = toolTip;
	toolTip:setName(getText("ContextMenu_Active_Comp"));
	toolTip:setTexture("A1 decor_med_3");
	toolTip.description = getText("Tooltip_Active_Comp");
	local Flask = getPlayer():getPrimaryHandItem() and getPlayer():getPrimaryHandItem():getType() == "ChemicalFlask";
	if not Flask  then
		toolTip.description = toolTip.description .. "\n<RGB:1,0,0>" .. getText("Tooltip_Flask");
		option_active_comp.notAvailable = true;
	end	
	if MineEnd < 60 then
		toolTip.description = toolTip.description .. "\n<RGB:1,0,0>" .. getText("Tooltip_MineEnd") .. " -60 (" .. MineEnd .. ")" .. "\n";
		option_active_comp.notAvailable = true;
	else
		toolTip.description = toolTip.description .. "\n<RGB:1,1,1>" .. getText("Tooltip_MineEnd") .. " -60 (" .. MineEnd .. ")" .. "\n";
	end

	--ТРЕНАЖЕР
elseif trainer and trainer:getSquare():haveElectricity() and getPlayer():DistToSquared(x, y) <= 4 then
	
	local option_train = context:addOption(getText("ContextMenu_Train"), worldobjects, nil)
	local subMenu = ISContextMenu:getNew(context);
	context:addSubMenu(option_train, subMenu);

	local option_train_run = subMenu:addOption(getText("ContextMenu_TrainRun"), worldobjects, TrainRun, player)
		local toolTip = ISToolTip:new();
		toolTip:initialise();
		toolTip:setVisible(false);
		option_train_run.toolTip = toolTip;
		toolTip:setName(getText("ContextMenu_TrainRun"));
		toolTip:setTexture("WorkbenchAgility_1_0");
		toolTip.description = getText("Tooltip_TrainRun");
		if MineEnd < 15 then
			toolTip.description = toolTip.description .. "\n<RGB:1,0,0>" .. getText("Tooltip_MineEnd") .. " -15 (" .. MineEnd .. ")" .. "\n";
			option_train_run.notAvailable = true;
		else
			toolTip.description = toolTip.description .. "\n<RGB:1,1,1>" .. getText("Tooltip_MineEnd") .. " -15 (" .. MineEnd .. ")" .. "\n";
		end
		if End < 0.1 then
			toolTip.description = toolTip.description .. "\n<RGB:1,0,0>" .. getText("Tooltip_End");
			option_train_run.notAvailable = true;
		end
		if Fatique > 0.8 then
			toolTip.description = toolTip.description .. "\n<RGB:1,0,0>" .. getText("Tooltip_Fatique");
			option_train_run.notAvailable = true;
		end

		local option_train_lightfoot = subMenu:addOption(getText("ContextMenu_TrainLightfoot"), worldobjects, TrainLightfoot, player)
		local toolTip = ISToolTip:new();
		toolTip:initialise();
		toolTip:setVisible(false);
		option_train_lightfoot.toolTip = toolTip;
		toolTip:setName(getText("ContextMenu_TrainLightfoot"));
		toolTip:setTexture("WorkbenchAgility_1_0");
		toolTip.description = getText("Tooltip_TrainLightfoot");
		if MineEnd < 15 then
			toolTip.description = toolTip.description .. "\n<RGB:1,0,0>" .. getText("Tooltip_MineEnd") .. " -15 (" .. MineEnd .. ")" .. "\n";
			option_train_lightfoot.notAvailable = true;
		else
			toolTip.description = toolTip.description .. "\n<RGB:1,1,1>" .. getText("Tooltip_MineEnd") .. " -15 (" .. MineEnd .. ")" .. "\n";
		end
		if End < 0.1 then
			toolTip.description = toolTip.description .. "\n<RGB:1,0,0>" .. getText("Tooltip_End");
			option_train_lightfoot.notAvailable = true;
		end
		if Fatique > 0.8 then
			toolTip.description = toolTip.description .. "\n<RGB:1,0,0>" .. getText("Tooltip_Fatique");
			option_train_lightfoot.notAvailable = true;
		end

		local option_train_nimble = subMenu:addOption(getText("ContextMenu_TrainNimble"), worldobjects, TrainNimble, player)
		local toolTip = ISToolTip:new();
		toolTip:initialise();
		toolTip:setVisible(false);
		option_train_nimble.toolTip = toolTip;
		toolTip:setName(getText("ContextMenu_TrainNimble"));
		toolTip:setTexture("WorkbenchAgility_1_0");
		toolTip.description = getText("Tooltip_TrainNimble");
		if MineEnd < 15 then
			toolTip.description = toolTip.description .. "\n<RGB:1,0,0>" .. getText("Tooltip_MineEnd") .. " -15 (" .. MineEnd .. ")" .. "\n";
			option_train_nimble.notAvailable = true;
		else
			toolTip.description = toolTip.description .. "\n<RGB:1,1,1>" .. getText("Tooltip_MineEnd") .. " -15 (" .. MineEnd .. ")" .. "\n";
		end
		if End < 0.1 then
			toolTip.description = toolTip.description .. "\n<RGB:1,0,0>" .. getText("Tooltip_End");
			option_train_nimble.notAvailable = true;
		end
		if Fatique > 0.8 then
			toolTip.description = toolTip.description .. "\n<RGB:1,0,0>" .. getText("Tooltip_Fatique");
			option_train_nimble.notAvailable = true;
		end

		local option_train_sneak = subMenu:addOption(getText("ContextMenu_TrainSneak"), worldobjects, TrainSneak, player)
		local toolTip = ISToolTip:new();
		toolTip:initialise();
		toolTip:setVisible(false);
		option_train_sneak.toolTip = toolTip;
		toolTip:setName(getText("ContextMenu_TrainSneak"));
		toolTip:setTexture("WorkbenchAgility_1_0");
		toolTip.description = getText("Tooltip_TrainSneak");
		if MineEnd < 15 then
			toolTip.description = toolTip.description .. "\n<RGB:1,0,0>" .. getText("Tooltip_MineEnd") .. " -15 (" .. MineEnd .. ")" .. "\n";
			option_train_sneak.notAvailable = true;
		else
			toolTip.description = toolTip.description .. "\n<RGB:1,1,1>" .. getText("Tooltip_MineEnd") .. " -15 (" .. MineEnd .. ")" .. "\n";
		end
		if End < 0.1 then
			toolTip.description = toolTip.description .. "\n<RGB:1,0,0>" .. getText("Tooltip_End");
			option_train_sneak.notAvailable = true;
		end
		if Fatique > 0.8 then
			toolTip.description = toolTip.description .. "\n<RGB:1,0,0>" .. getText("Tooltip_Fatique");
			option_train_sneak.notAvailable = true;
		end


end
end

Trash_search = function(worldobjects, player, item)
	local playerObj = getSpecificPlayer(player)
	ISTimedActionQueue.add(ISSearchTrash:new(playerObj, item, 900));
	--getPlayer():getBodyDamage():setUnhappynessLevel(player:getBodyDamage():getUnhappynessLevel() + 0.5);
	--getPlayer():getStats():setHunger(player:getStats():getHunger() + 0.005);
	--getPlayer():getStats():setThirst(player:getStats():getThirst() + 0.005);
    --	getPlayer():getStats():setFatigue(player:getStats():getFatigue() + 0.01);
	getPlayer():getStats():setEndurance(playerObj:getStats():getEndurance() - 0.15);
	--getSoundManager():PlayWorldSound("TrashSearch", false, getPlayer():getCurrentSquare(), 0.2, 60, 0.2, false);
	playerObj:LoseLevel(Perks.MineEndurance);
		if playerObj:HasTrait("FastLearner") then
		playerObj:getXp():AddXP(Perks.MineEndurance, (-60 / 1.3));
		elseif playerObj:HasTrait("SlowLearner") then
		playerObj:getXp():AddXP(Perks.MineEndurance, (-60 / 0.7));
		else
		playerObj:getXp():AddXP(Perks.MineEndurance, -60);
		end
end

Gas_Station = function(worldobjects, player, item)
	local playerObj = getSpecificPlayer(player)
	ISTimedActionQueue.add(ISExtractGas:new(playerObj, item, 800));
	--getPlayer():getBodyDamage():setUnhappynessLevel(player:getBodyDamage():getUnhappynessLevel() + 0.5);
	--getPlayer():getStats():setHunger(player:getStats():getHunger() + 0.005);
	--getPlayer():getStats():setThirst(player:getStats():getThirst() + 0.005);
    --	getPlayer():getStats():setFatigue(player:getStats():getFatigue() + 0.01);
	getPlayer():getStats():setEndurance(playerObj:getStats():getEndurance() - 0.2);
	--getSoundManager():PlayWorldSound("TrashSearch", false, getPlayer():getCurrentSquare(), 0.2, 60, 0.2, false);
	playerObj:LoseLevel(Perks.MineEndurance);
	playerObj:LoseLevel(Perks.MineEndurance);
		if playerObj:HasTrait("FastLearner") then
		playerObj:getXp():AddXP(Perks.MineEndurance, (-120 / 1.3));
		elseif playerObj:HasTrait("SlowLearner") then
		playerObj:getXp():AddXP(Perks.MineEndurance, (-120 / 0.7));
		else
		playerObj:getXp():AddXP(Perks.MineEndurance, -120);
		end
end

Much_Gas = function(worldobjects, player, item)
	local playerObj = getSpecificPlayer(player)
	ISTimedActionQueue.add(ISExtractMuchGas:new(playerObj, item, 2000));
	--getPlayer():getBodyDamage():setUnhappynessLevel(player:getBodyDamage():getUnhappynessLevel() + 0.5);
	--getPlayer():getStats():setHunger(player:getStats():getHunger() + 0.005);
	--getPlayer():getStats():setThirst(player:getStats():getThirst() + 0.005);
    --	getPlayer():getStats():setFatigue(player:getStats():getFatigue() + 0.01);
	getPlayer():getStats():setEndurance(playerObj:getStats():getEndurance() - 0.5);
	--getSoundManager():PlayWorldSound("TrashSearch", false, getPlayer():getCurrentSquare(), 0.2, 60, 0.2, false);
	playerObj:LoseLevel(Perks.MineEndurance);
	playerObj:LoseLevel(Perks.MineEndurance);
	playerObj:LoseLevel(Perks.MineEndurance);
	playerObj:LoseLevel(Perks.MineEndurance);
	playerObj:LoseLevel(Perks.MineEndurance);
	playerObj:LoseLevel(Perks.MineEndurance);
	playerObj:LoseLevel(Perks.MineEndurance);
	playerObj:LoseLevel(Perks.MineEndurance);
		if playerObj:HasTrait("FastLearner") then
		playerObj:getXp():AddXP(Perks.MineEndurance, (-480 / 1.3));
		elseif playerObj:HasTrait("SlowLearner") then
		playerObj:getXp():AddXP(Perks.MineEndurance, (-480 / 0.7));
		else
		playerObj:getXp():AddXP(Perks.MineEndurance, -480);
		end
end

MineCopper = function(worldobjects, player, item)
	local playerObj = getSpecificPlayer(player)
	ISTimedActionQueue.add(ISMineCopper:new(playerObj, item, 500));
	--getPlayer():getBodyDamage():setUnhappynessLevel(player:getBodyDamage():getUnhappynessLevel() + 0.5);
	--getPlayer():getStats():setHunger(player:getStats():getHunger() + 0.005);
	--getPlayer():getStats():setThirst(player:getStats():getThirst() + 0.005);
    --	getPlayer():getStats():setFatigue(player:getStats():getFatigue() + 0.01);
	getPlayer():getStats():setEndurance(playerObj:getStats():getEndurance() - 0.1);
	--getSoundManager():PlayWorldSound("TrashSearch", false, getPlayer():getCurrentSquare(), 0.2, 60, 0.2, false);
	playerObj:LoseLevel(Perks.MineEndurance);
	playerObj:LoseLevel(Perks.MineEndurance);
		if playerObj:HasTrait("FastLearner") then
		playerObj:getXp():AddXP(Perks.MineEndurance, (-120 / 1.3));
		elseif playerObj:HasTrait("SlowLearner") then
		playerObj:getXp():AddXP(Perks.MineEndurance, (-120 / 0.7));
		else
		playerObj:getXp():AddXP(Perks.MineEndurance, -120);
		end
end

MineTin = function(worldobjects, player, item)
	local playerObj = getSpecificPlayer(player)
	ISTimedActionQueue.add(ISMineTin:new(playerObj, item, 500));
	--getPlayer():getBodyDamage():setUnhappynessLevel(player:getBodyDamage():getUnhappynessLevel() + 0.5);
	--getPlayer():getStats():setHunger(player:getStats():getHunger() + 0.005);
	--getPlayer():getStats():setThirst(player:getStats():getThirst() + 0.005);
    --	getPlayer():getStats():setFatigue(player:getStats():getFatigue() + 0.01);
	getPlayer():getStats():setEndurance(playerObj:getStats():getEndurance() - 0.1);
	--getSoundManager():PlayWorldSound("TrashSearch", false, getPlayer():getCurrentSquare(), 0.2, 60, 0.2, false);
	playerObj:LoseLevel(Perks.MineEndurance);
	playerObj:LoseLevel(Perks.MineEndurance);
		if playerObj:HasTrait("FastLearner") then
		playerObj:getXp():AddXP(Perks.MineEndurance, (-120 / 1.3));
		elseif playerObj:HasTrait("SlowLearner") then
		playerObj:getXp():AddXP(Perks.MineEndurance, (-120 / 0.7));
		else
		playerObj:getXp():AddXP(Perks.MineEndurance, -120);
		end
end

MineIron = function(worldobjects, player, item)
	local playerObj = getSpecificPlayer(player)
	ISTimedActionQueue.add(ISMineIron:new(playerObj, item, 500));
	--getPlayer():getBodyDamage():setUnhappynessLevel(player:getBodyDamage():getUnhappynessLevel() + 0.5);
	--getPlayer():getStats():setHunger(player:getStats():getHunger() + 0.005);
	--getPlayer():getStats():setThirst(player:getStats():getThirst() + 0.005);
    --	getPlayer():getStats():setFatigue(player:getStats():getFatigue() + 0.01);
	getPlayer():getStats():setEndurance(playerObj:getStats():getEndurance() - 0.15);
	--getSoundManager():PlayWorldSound("TrashSearch", false, getPlayer():getCurrentSquare(), 0.2, 60, 0.2, false);
	playerObj:LoseLevel(Perks.MineEndurance);
	playerObj:LoseLevel(Perks.MineEndurance);
	playerObj:LoseLevel(Perks.MineEndurance);
		if playerObj:HasTrait("FastLearner") then
		playerObj:getXp():AddXP(Perks.MineEndurance, (-180 / 1.3));
		elseif playerObj:HasTrait("SlowLearner") then
		playerObj:getXp():AddXP(Perks.MineEndurance, (-180 / 0.7));
		else
		playerObj:getXp():AddXP(Perks.MineEndurance, -180);
		end
end

MineLead = function(worldobjects, player, item)
	local playerObj = getSpecificPlayer(player)
	ISTimedActionQueue.add(ISMineLead:new(playerObj, item, 500));
	--getPlayer():getBodyDamage():setUnhappynessLevel(player:getBodyDamage():getUnhappynessLevel() + 0.5);
	--getPlayer():getStats():setHunger(player:getStats():getHunger() + 0.005);
	--getPlayer():getStats():setThirst(player:getStats():getThirst() + 0.005);
    --	getPlayer():getStats():setFatigue(player:getStats():getFatigue() + 0.01);
	getPlayer():getStats():setEndurance(playerObj:getStats():getEndurance() - 0.15);
	--getSoundManager():PlayWorldSound("TrashSearch", false, getPlayer():getCurrentSquare(), 0.2, 60, 0.2, false);
	playerObj:LoseLevel(Perks.MineEndurance);
	playerObj:LoseLevel(Perks.MineEndurance);
	playerObj:LoseLevel(Perks.MineEndurance);
		if playerObj:HasTrait("FastLearner") then
		playerObj:getXp():AddXP(Perks.MineEndurance, (-180 / 1.3));
		elseif playerObj:HasTrait("SlowLearner") then
		playerObj:getXp():AddXP(Perks.MineEndurance, (-180 / 0.7));
		else
		playerObj:getXp():AddXP(Perks.MineEndurance, -180);
		end
end

MineNickel = function(worldobjects, player, item)
	local playerObj = getSpecificPlayer(player)
	ISTimedActionQueue.add(ISMineNickel:new(playerObj, item, 500));
	--getPlayer():getBodyDamage():setUnhappynessLevel(player:getBodyDamage():getUnhappynessLevel() + 0.5);
	--getPlayer():getStats():setHunger(player:getStats():getHunger() + 0.005);
	--getPlayer():getStats():setThirst(player:getStats():getThirst() + 0.005);
    --	getPlayer():getStats():setFatigue(player:getStats():getFatigue() + 0.01);
	getPlayer():getStats():setEndurance(playerObj:getStats():getEndurance() - 0.2);
	--getSoundManager():PlayWorldSound("TrashSearch", false, getPlayer():getCurrentSquare(), 0.2, 60, 0.2, false);
	playerObj:LoseLevel(Perks.MineEndurance);
	playerObj:LoseLevel(Perks.MineEndurance);
	playerObj:LoseLevel(Perks.MineEndurance);
	playerObj:LoseLevel(Perks.MineEndurance);
		if playerObj:HasTrait("FastLearner") then
		playerObj:getXp():AddXP(Perks.MineEndurance, (-240 / 1.3));
		elseif playerObj:HasTrait("SlowLearner") then
		playerObj:getXp():AddXP(Perks.MineEndurance, (-240 / 0.7));
		else
		playerObj:getXp():AddXP(Perks.MineEndurance, -240);
		end
end

MineChromium = function(worldobjects, player, item)
	local playerObj = getSpecificPlayer(player)
	ISTimedActionQueue.add(ISMineChromium:new(playerObj, item, 500));
	--getPlayer():getBodyDamage():setUnhappynessLevel(player:getBodyDamage():getUnhappynessLevel() + 0.5);
	--getPlayer():getStats():setHunger(player:getStats():getHunger() + 0.005);
	--getPlayer():getStats():setThirst(player:getStats():getThirst() + 0.005);
    --	getPlayer():getStats():setFatigue(player:getStats():getFatigue() + 0.01);
	getPlayer():getStats():setEndurance(playerObj:getStats():getEndurance() - 0.2);
	--getSoundManager():PlayWorldSound("TrashSearch", false, getPlayer():getCurrentSquare(), 0.2, 60, 0.2, false);
	playerObj:LoseLevel(Perks.MineEndurance);
	playerObj:LoseLevel(Perks.MineEndurance);
	playerObj:LoseLevel(Perks.MineEndurance);
	playerObj:LoseLevel(Perks.MineEndurance);
		if playerObj:HasTrait("FastLearner") then
		playerObj:getXp():AddXP(Perks.MineEndurance, (-240 / 1.3));
		elseif playerObj:HasTrait("SlowLearner") then
		playerObj:getXp():AddXP(Perks.MineEndurance, (-240 / 0.7));
		else
		playerObj:getXp():AddXP(Perks.MineEndurance, -240);
		end
end

MineSulfur = function(worldobjects, player, item)
	local playerObj = getSpecificPlayer(player)
	ISTimedActionQueue.add(ISMineSulfur:new(playerObj, item, 500));
	--getPlayer():getBodyDamage():setUnhappynessLevel(player:getBodyDamage():getUnhappynessLevel() + 0.5);
	--getPlayer():getStats():setHunger(player:getStats():getHunger() + 0.005);
	--getPlayer():getStats():setThirst(player:getStats():getThirst() + 0.005);
    --	getPlayer():getStats():setFatigue(player:getStats():getFatigue() + 0.01);
	getPlayer():getStats():setEndurance(playerObj:getStats():getEndurance() - 0.1);
	--getSoundManager():PlayWorldSound("TrashSearch", false, getPlayer():getCurrentSquare(), 0.2, 60, 0.2, false);
	playerObj:LoseLevel(Perks.MineEndurance);
	playerObj:LoseLevel(Perks.MineEndurance);
		if playerObj:HasTrait("FastLearner") then
		playerObj:getXp():AddXP(Perks.MineEndurance, (-120 / 1.3));
		elseif playerObj:HasTrait("SlowLearner") then
		playerObj:getXp():AddXP(Perks.MineEndurance, (-120 / 0.7));
		else
		playerObj:getXp():AddXP(Perks.MineEndurance, -120);
		end
end

MineLimestone = function(worldobjects, player, item)
	local playerObj = getSpecificPlayer(player)
	ISTimedActionQueue.add(ISMineLimestone:new(playerObj, item, 500));
	--getPlayer():getBodyDamage():setUnhappynessLevel(player:getBodyDamage():getUnhappynessLevel() + 0.5);
	--getPlayer():getStats():setHunger(player:getStats():getHunger() + 0.005);
	--getPlayer():getStats():setThirst(player:getStats():getThirst() + 0.005);
    --	getPlayer():getStats():setFatigue(player:getStats():getFatigue() + 0.01);
	getPlayer():getStats():setEndurance(playerObj:getStats():getEndurance() - 0.15);
	--getSoundManager():PlayWorldSound("TrashSearch", false, getPlayer():getCurrentSquare(), 0.2, 60, 0.2, false);
	playerObj:LoseLevel(Perks.MineEndurance);
	playerObj:LoseLevel(Perks.MineEndurance);
	playerObj:LoseLevel(Perks.MineEndurance);
		if playerObj:HasTrait("FastLearner") then
		playerObj:getXp():AddXP(Perks.MineEndurance, (-180 / 1.3));
		elseif playerObj:HasTrait("SlowLearner") then
		playerObj:getXp():AddXP(Perks.MineEndurance, (-180 / 0.7));
		else
		playerObj:getXp():AddXP(Perks.MineEndurance, -180);
		end
end

MineCoal = function(worldobjects, player, item)
	local playerObj = getSpecificPlayer(player)
	ISTimedActionQueue.add(ISMineCoal:new(playerObj, item, 500));
	--getPlayer():getBodyDamage():setUnhappynessLevel(player:getBodyDamage():getUnhappynessLevel() + 0.5);
	--getPlayer():getStats():setHunger(player:getStats():getHunger() + 0.005);
	--getPlayer():getStats():setThirst(player:getStats():getThirst() + 0.005);
    --	getPlayer():getStats():setFatigue(player:getStats():getFatigue() + 0.01);
	getPlayer():getStats():setEndurance(playerObj:getStats():getEndurance() - 0.1);
	--getSoundManager():PlayWorldSound("TrashSearch", false, getPlayer():getCurrentSquare(), 0.2, 60, 0.2, false);
	playerObj:LoseLevel(Perks.MineEndurance);
		if playerObj:HasTrait("FastLearner") then
		playerObj:getXp():AddXP(Perks.MineEndurance, (-60 / 1.3));
		elseif playerObj:HasTrait("SlowLearner") then
		playerObj:getXp():AddXP(Perks.MineEndurance, (-60 / 0.7));
		else
		playerObj:getXp():AddXP(Perks.MineEndurance, -60);
		end
end

MineStone = function(worldobjects, player, item)
	local playerObj = getSpecificPlayer(player)
	ISTimedActionQueue.add(ISMineStone:new(playerObj, item, 500));
	--getPlayer():getBodyDamage():setUnhappynessLevel(player:getBodyDamage():getUnhappynessLevel() + 0.5);
	--getPlayer():getStats():setHunger(player:getStats():getHunger() + 0.005);
	--getPlayer():getStats():setThirst(player:getStats():getThirst() + 0.005);
    --	getPlayer():getStats():setFatigue(player:getStats():getFatigue() + 0.01);
	getPlayer():getStats():setEndurance(playerObj:getStats():getEndurance() - 0.1);
	--getSoundManager():PlayWorldSound("TrashSearch", false, getPlayer():getCurrentSquare(), 0.2, 60, 0.2, false);
	playerObj:LoseLevel(Perks.MineEndurance);
	playerObj:LoseLevel(Perks.MineEndurance);
		if playerObj:HasTrait("FastLearner") then
		playerObj:getXp():AddXP(Perks.MineEndurance, (-120 / 1.3));
		elseif playerObj:HasTrait("SlowLearner") then
		playerObj:getXp():AddXP(Perks.MineEndurance, (-120 / 0.7));
		else
		playerObj:getXp():AddXP(Perks.MineEndurance, -120);
		end
end

MineSalt = function(worldobjects, player, item)
	local playerObj = getSpecificPlayer(player)
	ISTimedActionQueue.add(ISMineSalt:new(playerObj, item, 500));
	--getPlayer():getBodyDamage():setUnhappynessLevel(player:getBodyDamage():getUnhappynessLevel() + 0.5);
	--getPlayer():getStats():setHunger(player:getStats():getHunger() + 0.005);
	--getPlayer():getStats():setThirst(player:getStats():getThirst() + 0.005);
    --	getPlayer():getStats():setFatigue(player:getStats():getFatigue() + 0.01);
	getPlayer():getStats():setEndurance(playerObj:getStats():getEndurance() - 0.15);
	--getSoundManager():PlayWorldSound("TrashSearch", false, getPlayer():getCurrentSquare(), 0.2, 60, 0.2, false);
	playerObj:LoseLevel(Perks.MineEndurance);
	playerObj:LoseLevel(Perks.MineEndurance);
	playerObj:LoseLevel(Perks.MineEndurance);
		if playerObj:HasTrait("FastLearner") then
		playerObj:getXp():AddXP(Perks.MineEndurance, (-180 / 1.3));
		elseif playerObj:HasTrait("SlowLearner") then
		playerObj:getXp():AddXP(Perks.MineEndurance, (-180 / 0.7));
		else
		playerObj:getXp():AddXP(Perks.MineEndurance, -180);
		end
end

GetPetrol = function(worldobjects, player, item)
	local playerObj = getSpecificPlayer(player)
	ISTimedActionQueue.add(ISExtractPetrol:new(playerObj, item, 2000));
	--getPlayer():getBodyDamage():setUnhappynessLevel(player:getBodyDamage():getUnhappynessLevel() + 0.5);
	--getPlayer():getStats():setHunger(player:getStats():getHunger() + 0.005);
	--getPlayer():getStats():setThirst(player:getStats():getThirst() + 0.005);
    --	getPlayer():getStats():setFatigue(player:getStats():getFatigue() + 0.01);
	getPlayer():getStats():setEndurance(playerObj:getStats():getEndurance() - 0.5);
	--getSoundManager():PlayWorldSound("TrashSearch", false, getPlayer():getCurrentSquare(), 0.2, 60, 0.2, false);
	playerObj:LoseLevel(Perks.MineEndurance);
	playerObj:LoseLevel(Perks.MineEndurance);
	playerObj:LoseLevel(Perks.MineEndurance);
	playerObj:LoseLevel(Perks.MineEndurance);
	playerObj:LoseLevel(Perks.MineEndurance);
	playerObj:LoseLevel(Perks.MineEndurance);
		if playerObj:HasTrait("FastLearner") then
		playerObj:getXp():AddXP(Perks.MineEndurance, (-360 / 1.3));
		elseif playerObj:HasTrait("SlowLearner") then
		playerObj:getXp():AddXP(Perks.MineEndurance, (-360 / 0.7));
		else
		playerObj:getXp():AddXP(Perks.MineEndurance, -360);
		end
end

GetWeaponparts = function(worldobjects, player, item)
	local playerObj = getSpecificPlayer(player)
	ISTimedActionQueue.add(ISExtractWeaponpart:new(playerObj, item, 1000));
	--getPlayer():getBodyDamage():setUnhappynessLevel(player:getBodyDamage():getUnhappynessLevel() + 0.5);
	--getPlayer():getStats():setHunger(player:getStats():getHunger() + 0.005);
	--getPlayer():getStats():setThirst(player:getStats():getThirst() + 0.005);
    --	getPlayer():getStats():setFatigue(player:getStats():getFatigue() + 0.01);
	getPlayer():getStats():setEndurance(playerObj:getStats():getEndurance() - 0.5);
	--getSoundManager():PlayWorldSound("TrashSearch", false, getPlayer():getCurrentSquare(), 0.2, 60, 0.2, false);
	playerObj:LoseLevel(Perks.MineEndurance);
	playerObj:LoseLevel(Perks.MineEndurance);
	playerObj:LoseLevel(Perks.MineEndurance);
		if playerObj:HasTrait("FastLearner") then
		playerObj:getXp():AddXP(Perks.MineEndurance, (-180 / 1.3));
		elseif playerObj:HasTrait("SlowLearner") then
		playerObj:getXp():AddXP(Perks.MineEndurance, (-180 / 0.7));
		else
		playerObj:getXp():AddXP(Perks.MineEndurance, -180);
		end
end

EntryLab = function(worldobjects, player, item)
	local playerObj = getSpecificPlayer(player)
	playerObj:setX(6059);
	playerObj:setY(10906);
	playerObj:setZ(1);
	playerObj:setLx(playerObj:getX());
	playerObj:setLy(playerObj:getY());
	playerObj:setLz(playerObj:getZ());
end

ExitLab = function(worldobjects, player, item)
	local playerObj = getSpecificPlayer(player)
	playerObj:setX(6058);
	playerObj:setY(10909);
	playerObj:setZ(1);
	playerObj:setLx(playerObj:getX());
	playerObj:setLy(playerObj:getY());
	playerObj:setLz(playerObj:getZ());
end

EntryBunker1 = function(worldobjects, player, item)
	local playerObj = getSpecificPlayer(player)
	playerObj:setX(9148);
	playerObj:setY(4898);
	playerObj:setZ(3);
	playerObj:setLx(playerObj:getX());
	playerObj:setLy(playerObj:getY());
	playerObj:setLz(playerObj:getZ());
end

EntryBunker2 = function(worldobjects, player, item)
	local playerObj = getSpecificPlayer(player)
	playerObj:setX(9166);
	playerObj:setY(4929);
	playerObj:setZ(2);
	playerObj:setLx(playerObj:getX());
	playerObj:setLy(playerObj:getY());
	playerObj:setLz(playerObj:getZ());
end

EntryBunker3 = function(worldobjects, player, item)
	local playerObj = getSpecificPlayer(player)
	playerObj:setX(9226);
	playerObj:setY(4897);
	playerObj:setZ(2);
	playerObj:setLx(playerObj:getX());
	playerObj:setLy(playerObj:getY());
	playerObj:setLz(playerObj:getZ());
end

ExitBunker1 = function(worldobjects, player, item)
	local playerObj = getSpecificPlayer(player)
	playerObj:setX(6043);
	playerObj:setY(10875);
	playerObj:setZ(0);
	playerObj:setLx(playerObj:getX());
	playerObj:setLy(playerObj:getY());
	playerObj:setLz(playerObj:getZ());
end

ExitBunker2 = function(worldobjects, player, item)
	local playerObj = getSpecificPlayer(player)
	playerObj:setX(6087);
	playerObj:setY(10951);
	playerObj:setZ(0);
	playerObj:setLx(playerObj:getX());
	playerObj:setLy(playerObj:getY());
	playerObj:setLz(playerObj:getZ());
end

ExitBunker3 = function(worldobjects, player, item)
	local playerObj = getSpecificPlayer(player)
	playerObj:setX(6145);
	playerObj:setY(10866);
	playerObj:setZ(0);
	playerObj:setLx(playerObj:getX());
	playerObj:setLy(playerObj:getY());
	playerObj:setLz(playerObj:getZ());
end


ActiveComp = function(worldobjects, player, item)
	local playerObj = getSpecificPlayer(player)
	ISTimedActionQueue.add(ISActiveComp:new(playerObj, item, 500));
	--getPlayer():getBodyDamage():setUnhappynessLevel(player:getBodyDamage():getUnhappynessLevel() + 0.5);
	--getPlayer():getStats():setHunger(player:getStats():getHunger() + 0.005);
	--getPlayer():getStats():setThirst(player:getStats():getThirst() + 0.005);
    --	getPlayer():getStats():setFatigue(player:getStats():getFatigue() + 0.01);
	getPlayer():getStats():setEndurance(playerObj:getStats():getEndurance() - 0.2);
	--getSoundManager():PlayWorldSound("TrashSearch", false, getPlayer():getCurrentSquare(), 0.2, 60, 0.2, false);
	playerObj:LoseLevel(Perks.MineEndurance);
	playerObj:LoseLevel(Perks.MineEndurance);
	playerObj:LoseLevel(Perks.MineEndurance);
	playerObj:LoseLevel(Perks.MineEndurance);
		if playerObj:HasTrait("FastLearner") then
		playerObj:getXp():AddXP(Perks.MineEndurance, (-240 / 1.3));
		elseif playerObj:HasTrait("SlowLearner") then
		playerObj:getXp():AddXP(Perks.MineEndurance, (-240 / 0.7));
		else
		playerObj:getXp():AddXP(Perks.MineEndurance, -240);
		end
end

TrainRun = function(worldobjects, player, item)
	local playerObj = getSpecificPlayer(player)
	ISTimedActionQueue.add(ISTrainRun:new(playerObj, item, 2000));
	--getPlayer():getBodyDamage():setUnhappynessLevel(player:getBodyDamage():getUnhappynessLevel() + 0.5);
	--getPlayer():getStats():setHunger(player:getStats():getHunger() + 0.005);
	getPlayer():getStats():setThirst(playerObj:getStats():getThirst() + 0.05);
    getPlayer():getStats():setFatigue(playerObj:getStats():getFatigue() + 0.05);
	getPlayer():getStats():setEndurance(playerObj:getStats():getEndurance() - 0.1);
	--getSoundManager():PlayWorldSound("TrashSearch", false, getPlayer():getCurrentSquare(), 0.2, 60, 0.2, false);
	playerObj:LoseLevel(Perks.MineEndurance);
		if playerObj:HasTrait("FastLearner") then
		playerObj:getXp():AddXP(Perks.MineEndurance, (-60 / 1.3));
		elseif playerObj:HasTrait("SlowLearner") then
		playerObj:getXp():AddXP(Perks.MineEndurance, (-60 / 0.7));
		else
		playerObj:getXp():AddXP(Perks.MineEndurance, -60);
		end
end

TrainLightfoot = function(worldobjects, player, item)
	local playerObj = getSpecificPlayer(player)
	ISTimedActionQueue.add(ISTrainLightfoot:new(playerObj, item, 2000));
	--getPlayer():getBodyDamage():setUnhappynessLevel(player:getBodyDamage():getUnhappynessLevel() + 0.5);
	--getPlayer():getStats():setHunger(player:getStats():getHunger() + 0.005);
	getPlayer():getStats():setThirst(playerObj:getStats():getThirst() + 0.05);
    getPlayer():getStats():setFatigue(playerObj:getStats():getFatigue() + 0.05);
	getPlayer():getStats():setEndurance(playerObj:getStats():getEndurance() - 0.1);
	--getSoundManager():PlayWorldSound("TrashSearch", false, getPlayer():getCurrentSquare(), 0.2, 60, 0.2, false);
	playerObj:LoseLevel(Perks.MineEndurance);
		if playerObj:HasTrait("FastLearner") then
		playerObj:getXp():AddXP(Perks.MineEndurance, (-60 / 1.3));
		elseif playerObj:HasTrait("SlowLearner") then
		playerObj:getXp():AddXP(Perks.MineEndurance, (-60 / 0.7));
		else
		playerObj:getXp():AddXP(Perks.MineEndurance, -60);
		end
end

TrainNimble = function(worldobjects, player, item)
	local playerObj = getSpecificPlayer(player)
	ISTimedActionQueue.add(ISTrainNimble:new(playerObj, item, 2000));
	--getPlayer():getBodyDamage():setUnhappynessLevel(player:getBodyDamage():getUnhappynessLevel() + 0.5);
	--getPlayer():getStats():setHunger(player:getStats():getHunger() + 0.005);
	getPlayer():getStats():setThirst(playerObj:getStats():getThirst() + 0.05);
    getPlayer():getStats():setFatigue(playerObj:getStats():getFatigue() + 0.05);
	getPlayer():getStats():setEndurance(playerObj:getStats():getEndurance() - 0.1);
	--getSoundManager():PlayWorldSound("TrashSearch", false, getPlayer():getCurrentSquare(), 0.2, 60, 0.2, false);
	playerObj:LoseLevel(Perks.MineEndurance);
		if playerObj:HasTrait("FastLearner") then
		playerObj:getXp():AddXP(Perks.MineEndurance, (-60 / 1.3));
		elseif playerObj:HasTrait("SlowLearner") then
		playerObj:getXp():AddXP(Perks.MineEndurance, (-60 / 0.7));
		else
		playerObj:getXp():AddXP(Perks.MineEndurance, -60);
		end
end

TrainSneak = function(worldobjects, player, item)
	local playerObj = getSpecificPlayer(player)
	ISTimedActionQueue.add(ISTrainSneak:new(playerObj, item, 2000));
	--getPlayer():getBodyDamage():setUnhappynessLevel(player:getBodyDamage():getUnhappynessLevel() + 0.5);
	--getPlayer():getStats():setHunger(player:getStats():getHunger() + 0.005);
	getPlayer():getStats():setThirst(playerObj:getStats():getThirst() + 0.05);
    getPlayer():getStats():setFatigue(playerObj:getStats():getFatigue() + 0.05);
	getPlayer():getStats():setEndurance(playerObj:getStats():getEndurance() - 0.1);
	--getSoundManager():PlayWorldSound("TrashSearch", false, getPlayer():getCurrentSquare(), 0.2, 60, 0.2, false);
	playerObj:LoseLevel(Perks.MineEndurance);
		if playerObj:HasTrait("FastLearner") then
		playerObj:getXp():AddXP(Perks.MineEndurance, (-60 / 1.3));
		elseif playerObj:HasTrait("SlowLearner") then
		playerObj:getXp():AddXP(Perks.MineEndurance, (-60 / 0.7));
		else
		playerObj:getXp():AddXP(Perks.MineEndurance, -60);
		end
end

function miner_power()
	player = getPlayer();
	if player:getPerkLevel(Perks.MineEndurance) < 10 then
		if player:HasTrait("inert") then
			if player:HasTrait("FastLearner") then
				player:getXp():AddXP(Perks.MineEndurance, (30 / 1.3))
			elseif player:HasTrait("SlowLearner") then
				player:getXp():AddXP(Perks.MineEndurance, (30 / 0.7))
			else
				player:getXp():AddXP(Perks.MineEndurance, 30);
			end
		else
			if player:HasTrait("FastLearner") then
				player:getXp():AddXP(Perks.MineEndurance, (40 / 1.3))
			elseif player:HasTrait("SlowLearner") then
				player:getXp():AddXP(Perks.MineEndurance, (40 / 0.7))
			else
				player:getXp():AddXP(Perks.MineEndurance, 40);
			end
		end
	end
end

Events.OnFillWorldObjectContextMenu.Add(Work_Stations);
Events.EveryHours.Add(miner_power);