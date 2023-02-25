require "BuildingObjects/ISDestroyCursor"
require "BuildingObjects/ISMoveableCursor"
require "BuildingObjects/ISBuildingObject"

local function isNeutralZone(x, y)
    if not ISBuildMenu.cheat then
        if ((x > 11508 and x < 11637 and y > 7530 and y < 7756) -- госпиталь + оазис
        or (x > 5985 and x < 6269 and y > 10727 and y < 11119) -- гора
        or (x > 9003 and x < 9236 and y > 4802 and y < 4987) -- бункер
        or (x >= 12162 and x <= 12216 and y >= 1363 and y <= 1417)) -- здание для квеста на оружие
        then
            return true;
        end
    end
	return false;
end

local ISMoveableCursor_isValid = ISMoveableCursor.isValid;
function ISMoveableCursor:isValid(square)
    if square then
        if isNeutralZone(square:getX(), square:getY()) then
            self:setInfoPanel( square, nil, nil );
            self.cursorFacing = nil;
            self.joypadFacing = nil;
            return false;
        end
    end
    return ISMoveableCursor_isValid(self, square);
end

local ISDestroyCursor_isValid = ISDestroyCursor.isValid;
function ISDestroyCursor:isValid(square)
    if square then
        if isNeutralZone(square:getX(), square:getY()) then
            self.renderX = square:getX()
            self.renderY = square:getY()
            self.renderZ = square:getZ()
            return false;
        end
    end
	return ISDestroyCursor_isValid(self, square);
end

local ISBuildingObject_isValid = ISBuildingObject.isValid;
function ISBuildingObject:isValid(square)
    if square then
        if isNeutralZone(square:getX(), square:getY()) then
            return false;
        end
    end
    return ISBuildingObject_isValid(self, square);
end