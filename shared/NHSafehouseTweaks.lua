-- Code by Oneline/D.Borovsky
require "Private"

Private.getLimit = function(faction) -- подсчёт доступных очков
	if faction == nil then
		return 0
	end

	local points = 1; -- очко для одиночек
	local members = faction:getPlayers():size() + 1;
	return points + math.floor(members / 2); -- последующие очки для нормальных фракций (за каждые 2 игрока)
end

Private.getCost = function(safehouse, offset) -- подсчёт стоимости территории
	offset = offset or 0;
    --print("safehouse_w="..tostring(safehouse:getW()).."; safehouse_h="..tostring(safehouse:getH()))
    local cost = math.ceil(((safehouse:getH() - offset) * (safehouse:getW() - offset)) / 60);
    if (safehouse:getW() - offset) * (safehouse:getH() - offset) <= 80 then -- не каморка?
        cost = 1; -- минимальная цена, недоступная одиночкам
    end
	return cost;
end

local canBeCaptured = Private.canBeCaptured;
Private.canBeCaptured = function(square)
    local building = square:getBuilding();
	if building then
        local def = building:getDef();
        if (def:getW()*def:getH())>500 then -- ограничение по размерам здания
            return getText("UI_TooBigBuilding");
        end
    end

	return canBeCaptured(square);
end