function Footprints()
    local player = getPlayer();
    local items = player:getInventory():getItems();
    if player:getInventory():containsTypeRecurse("WolfFootprints") 
    or player:getInventory():containsTypeRecurse("BoarFootprints") 
    or player:getInventory():containsTypeRecurse("BearFootprints") 
    or player:getInventory():containsTypeRecurse("GoatFootprints") 
    or player:getInventory():containsTypeRecurse("CowFootprints") 
    or player:getInventory():containsTypeRecurse("FoxFootprints") 
    or player:getInventory():containsTypeRecurse("ODeerFootprints") 
    or player:getInventory():containsTypeRecurse("YDeerFootprints") 
    or player:getInventory():containsTypeRecurse("DogFootprints") 
    or player:getInventory():containsTypeRecurse("MooseFootprints") 
    or player:getInventory():containsTypeRecurse("CoyoteFootprints") 
    or player:getInventory():containsTypeRecurse("HareFootprints") 
    or player:getInventory():containsTypeRecurse("ChickenFootprints") 
    or player:getInventory():containsTypeRecurse("CrowFootprints") 
    then
        for i = 0, items:size()-1 do
        local item = items:get(i);
            if item:getType() == "WolfFootprints" 
            or item:getType() == "BoarFootprints" 
            or item:getType() == "BearFootprints" 
            or item:getType() == "GoatFootprints" 
            or item:getType() == "CowFootprints" 
            or item:getType() == "FoxFootprints" 
            or item:getType() == "ODeerFootprints" 
            or item:getType() == "YDeerFootprints" 
            or item:getType() == "DogFootprints" 
            or item:getType() == "MooseFootprints" 
            or item:getType() == "CoyoteFootprints" 
            or item:getType() == "HareFootprints" 
            or item:getType() == "ChickenFootprints" 
            or item:getType() == "CrowFootprints"     
            then
                if item:getUsedDelta() <= 0.01 then
                player:getInventory():Remove(item);
                break
                else
                item:setUsedDelta(item:getUsedDelta() - 0.000125);
                break
                end
            end
        end
    end
end

function DieFromFakeInfection()
    local player = getPlayer();
    local bodyParts = player:getBodyDamage():getBodyParts()
    local items = player:getInventory():getItems();
    local x1 = getPlayer():getX();
    local y1 = getPlayer():getY();  
    if ((x1 <= 9064 and x1 >= 9025) and (y1 <= 7200 and y1 >= 7170)) 
    or ((x1 <= 9104 and x1 >= 9078) and (y1 <= 6990 and y1 >= 6919)) 
    or ((x1 <= 9188 and x1 >= 9116) and (y1 <= 7199 and y1 >= 7181))
    or ((x1 <= 14535 and x1 >= 11900) and (y1 <= 3450 and y1 >= 1000)) then
    elseif player:getBodyDamage():getFakeInfectionLevel() >= 25 and player:getBodyDamage():getFakeInfectionLevel() < 50 then
        local bodyParts = player:getBodyDamage():getBodyParts()
        for i=1,bodyParts:size() do
        local bodyPart = bodyParts:get(i-1)
        bodyPart:AddDamage(1.0)
        end
    elseif player:getBodyDamage():getFakeInfectionLevel() >= 50 and player:getBodyDamage():getFakeInfectionLevel() < 75 then
        local bodyParts = player:getBodyDamage():getBodyParts()
        for i=1,bodyParts:size() do
        local bodyPart = bodyParts:get(i-1)
        bodyPart:AddDamage(2.0)
        end
    elseif player:getBodyDamage():getFakeInfectionLevel() >= 75 then
        local bodyParts = player:getBodyDamage():getBodyParts()
        for i=1,bodyParts:size() do
        local bodyPart = bodyParts:get(i-1)
        bodyPart:AddDamage(3.0)
        end
    end
end

function Radiation1()
    local player = getPlayer();
    local bodyParts = player:getBodyDamage():getBodyParts()
    local items = player:getInventory():getItems();
    local x1 = getPlayer():getX();
    local y1 = getPlayer():getY();
    if ((x1 <= 9064 and x1 >= 9025) and (y1 <= 7200 and y1 >= 7170)) or ((x1 <= 14535 and x1 >= 11900) and (y1 <= 3450 and y1 >= 1000)) then
        if player:getInventory():contains("HandmadeGasMaskFilter") and player:getInventory():contains("Hat_Gasmask2") then
        --player:getBodyDamage():setFakeInfectionLevel(player:getBodyDamage():getFakeInfectionLevel() + 0.001);
                for i = 0, items:size()-1 do
                local item = items:get(i);
                    if item:getType() == "HandmadeGasMaskFilter" then
                        if item:getUsedDelta() <= 0.01 then
                        player:getInventory():Remove(item);
                        break
                        else
                        item:setUsedDelta(item:getUsedDelta() - 0.0001);
                        break
                        end
                    end
                end
        elseif player:getInventory():contains("RegularGasMaskFilter") and player:getInventory():contains("Hat_Gasmask2") then
        --player:getBodyDamage():setFakeInfectionLevel(player:getBodyDamage():getFakeInfectionLevel() + 0.0005);
                for i = 0, items:size()-1 do
                local item = items:get(i);
                    if item:getType() == "RegularGasMaskFilter" then
                        if item:getUsedDelta() <= 0.01 then
                        player:getInventory():Remove(item);
                        break
                        else
                        item:setUsedDelta(item:getUsedDelta() - 0.00005);
                        break
                        end
                    end
                end
        elseif player:getInventory():contains("AdvancedGasMaskFilter") and player:getInventory():contains("Hat_Gasmask2") then
            --player:getBodyDamage():setFakeInfectionLevel(player:getBodyDamage():getFakeInfectionLevel() + 0.00025);
                for i = 0, items:size()-1 do
                local item = items:get(i);
                    if item:getType() == "AdvancedGasMaskFilter" then
                        if item:getUsedDelta() <= 0.01 then
                        player:getInventory():Remove(item);
                        break
                        else
                        item:setUsedDelta(item:getUsedDelta() - 0.000025);
                        break
                        end
                    end
                end
        else
            if player:getBodyDamage():getFakeInfectionLevel() <= 99 then
            player:getBodyDamage():setFakeInfectionLevel(player:getBodyDamage():getFakeInfectionLevel() + 0.01);
            end
        end
            if player:getBodyDamage():getFakeInfectionLevel() > 25 then
            local bodyParts = player:getBodyDamage():getBodyParts()
                for i=1,bodyParts:size() do
                local bodyPart = bodyParts:get(i-1)
                bodyPart:AddDamage(0.001)
                end
            end
            if ZombRand(16) == 0 and player:getInventory():contains("GeigerCounter") then
                getSoundManager():PlaySound("Radiation", true, 0.8);
            end
    end
end

function Radiation2()
    local player = getPlayer();
    local bodyParts = player:getBodyDamage():getBodyParts()
    local items = player:getInventory():getItems();
    local x1 = getPlayer():getX();
    local y1 = getPlayer():getY();
    if ((x1 <= 9104 and x1 >= 9078) and (y1 <= 6990 and y1 >= 6919)) then
        if player:getInventory():contains("RegularGasMaskFilter") and player:getInventory():contains("Hat_Gasmask2") then
        --player:getBodyDamage():setFakeInfectionLevel(player:getBodyDamage():getFakeInfectionLevel() + 0.001);
                for i = 0, items:size()-1 do
                local item = items:get(i);
                    if item:getType() == "RegularGasMaskFilter" then
                        if item:getUsedDelta() <= 0.01 then
                        player:getInventory():Remove(item);
                        break
                        else
                        item:setUsedDelta(item:getUsedDelta() - 0.0001);
                        break
                        end
                    end
                end
        elseif player:getInventory():contains("AdvancedGasMaskFilter") and player:getInventory():contains("Hat_Gasmask2") then
            --player:getBodyDamage():setFakeInfectionLevel(player:getBodyDamage():getFakeInfectionLevel() + 0.0005);
                for i = 0, items:size()-1 do
                local item = items:get(i);
                    if item:getType() == "AdvancedGasMaskFilter" then
                        if item:getUsedDelta() <= 0.01 then
                        player:getInventory():Remove(item);
                        break
                        else
                        item:setUsedDelta(item:getUsedDelta() - 0.00005);
                        break
                        end
                end
            end
        else
            if player:getBodyDamage():getFakeInfectionLevel() <= 99 then
            player:getBodyDamage():setFakeInfectionLevel(player:getBodyDamage():getFakeInfectionLevel() + 0.03);
            end
        end
            if player:getBodyDamage():getFakeInfectionLevel() > 25 then
            local bodyParts = player:getBodyDamage():getBodyParts()
            for i=1,bodyParts:size() do
            local bodyPart = bodyParts:get(i-1)
            bodyPart:AddDamage(0.002)
            end
        end
        if ZombRand(16) == 0 and player:getInventory():contains("GeigerCounter") then
            getSoundManager():PlaySound("Radiation", true, 0.8);
        end
    end
end

function Radiation3()
    local player = getPlayer();
    local bodyParts = player:getBodyDamage():getBodyParts()
    local items = player:getInventory():getItems();
    local x1 = getPlayer():getX();
    local y1 = getPlayer():getY();
    if ((x1 <= 9188 and x1 >= 9116) and (y1 <= 7199 and y1 >= 7181)) then
        if player:getInventory():contains("AdvancedGasMaskFilter") and player:getInventory():contains("Hat_Gasmask2") then
            --player:getBodyDamage():setFakeInfectionLevel(player:getBodyDamage():getFakeInfectionLevel() + 0.001);
                for i = 0, items:size()-1 do
                local item = items:get(i);
                    if item:getType() == "AdvancedGasMaskFilter" then
                        if item:getUsedDelta() <= 0.01 then
                        player:getInventory():Remove(item);
                        break
                        else
                        item:setUsedDelta(item:getUsedDelta() - 0.0001);
                        break
                        end
                end
            end
        else
            if player:getBodyDamage():getFakeInfectionLevel() <= 99 then
            player:getBodyDamage():setFakeInfectionLevel(player:getBodyDamage():getFakeInfectionLevel() + 0.05);
            end
        end
            if player:getBodyDamage():getFakeInfectionLevel() > 25 then
            local bodyParts = player:getBodyDamage():getBodyParts()
            for i=1,bodyParts:size() do
            local bodyPart = bodyParts:get(i-1)
            bodyPart:AddDamage(0.003)
            end
        end
        if ZombRand(16) == 0 and player:getInventory():contains("GeigerCounter") then
            getSoundManager():PlaySound("Radiation", true, 0.8);
        end
    end
end


function AbelQuests()
    local player = getPlayer();
    local items = player:getInventory():getItems();
    local x1 = getPlayer():getX();
    local y1 = getPlayer():getY();
    if ((x1 <= 14535 and x1 >= 11900) and (y1 <= 3450 and y1 >= 1000)) then
        if player:getInventory():contains("QuestAAirAnalyzer")  then
            player:getInventory():Remove("QuestAAirAnalyzer");
            player:getInventory():AddItem("NHM.QuestAFullAirAnalyzer");
        end
    end
end

function AbelQuests2()
    local player = getPlayer();
    local items = player:getInventory():getItems();
    local x1 = getPlayer():getX();
    local y1 = getPlayer():getY();
    if ((x1 <= 9188 and x1 >= 9116) and (y1 <= 7199 and y1 >= 7181)) then
        if player:getInventory():contains("QuestARadAnalyzer")  then
            player:getInventory():Remove("QuestARadAnalyzer");
            player:getInventory():AddItem("NHM.QuestAFullRadAnalyzer");
        end
    end
end


Events.OnPlayerUpdate.Add(Footprints);
Events.OnPlayerUpdate.Add(Radiation1);
Events.OnPlayerUpdate.Add(Radiation2);
Events.OnPlayerUpdate.Add(Radiation3);
Events.EveryTenMinutes.Add(DieFromFakeInfection);
Events.EveryHours.Add(AbelQuests);
Events.EveryTenMinutes.Add(AbelQuests2);