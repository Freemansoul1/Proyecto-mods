require "ISUI/ISEquippedItem"
require "ISUI/ISContextMenu"

function ISMoveablesIconPopup:render()
 
    local playerID = self.owner.chr:getPlayerNum()
    local mode = nil
    if getCell():getDrag(playerID) and getCell():getDrag(playerID).isMoveableCursor then
        mode = getCell():getDrag(playerID):getMoveableMode()
    end
 
    local fontHgt = getTextManager():getFontFromEnum(UIFont.Small):getLineHeight()
    self:drawRect(0, 0, self.width, self.height + fontHgt + 2 * 2, 0.80, 0, 0, 0)
 
    local index = math.floor(self:getMouseX() / 50)
    if index > 0 or mode then
        self:drawRect(index * 50, 0, 50, self.height, 0.15, 1, 1, 1)
    end
    
    --local texts = { getText("IGUI_Exit"), getText("IGUI_Pickup"), getText("IGUI_Place"), getText("IGUI_Rotate"), getText("IGUI_Scrap") }
    local texts = { getText("IGUI_Exit"), getText("IGUI_Pickup"), getText("IGUI_Place"), getText("IGUI_Rotate") }
    if not mode then
        texts[1] = ""
    end
    local text = texts[index+1]
    self:drawText(text, 2, self.height + 2, 1.0, 0.85, 0.05, 1.0, UIFont.Small)
 
    local x = 0
    local y = 0
    local tex = self.owner.movableIcon
    self:drawTexture(tex, x, y, 1, 1, 1, 1)
 
    if mode == "pickup" then
        self:drawRectBorder(x + 50, 0, 50, self.height, 0.5, 1, 1, 1)
    end
    tex = self.owner.movableIconPickup
    self:drawTexture(tex, x + 50, y, 1, 1, 1, 1)
 
    if mode == "place" then
        self:drawRectBorder(x + 50 * 2, 0, 50, self.height, 0.5, 1, 1, 1)
    end
    tex = self.owner.movableIconPlace
    self:drawTexture(tex, x + 50 * 2, y, 1, 1, 1, 1)
 
    if mode == "rotate" then
        self:drawRectBorder(x + 50 * 3, 0, 50, self.height, 0.5, 1, 1, 1)
    end
    tex = self.owner.movableIconRotate
    self:drawTexture(tex, x + 50 * 3, y, 1, 1, 1, 1)
 
    --[[if mode == "scrap" then
        self:drawRectBorder(x + 50 * 4, 0, 50, self.height, 0.5, 1, 1, 1)
    end
    tex = self.owner.movableIconScrap
    self:drawTexture(tex, x + 50 * 4, y, 1, 1, 1, 1)--]]
end
 
function ISMoveablesIconPopup:new (x, y, width, height)
    local o = ISPanel:new(x, y, width-50, height);
    setmetatable(o, self)
    self.__index = self
    return o
end
 
local _addOption = ISContextMenu.addOption;
function ISContextMenu:addOption(name, target, onSelect, param1, param2, param3, param4, param5, param6, param7, param8, param9, param10)
    if name == getText("ContextMenu_Dismantle") or name == getText("ContextMenu_Disassemble") then
        local arr = {};
        return arr;
    end  
    if (name == getText("ContextMenu_Build") or name == getText("ContextMenu_MetalWelding")) and not ISBuildMenu.cheat then
        local player = getPlayer();
        if player then
            local x = player:getX();
            local y = player:getY();
            if (x < 9305 and x > 8891) and (y < 7500 and y > 5000) -- Хоуптаун запрет строить
            then
                local arr = {};
                return arr;
            end
        end
    end
    return _addOption(self, name, target, onSelect, param1, param2, param3, param4, param5, param6, param7, param8, param9, param10);
end