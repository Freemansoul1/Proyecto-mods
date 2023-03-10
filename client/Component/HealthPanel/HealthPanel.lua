local healthPanel = {}

healthPanel.handlers = {
    'AntizinHandler',
    'BloodHandler',
    'VaccineHandler',
    'VirusTesterHandler',
}

healthPanel.dropItemsOnBodyPart = ISHealthPanel.dropItemsOnBodyPart
healthPanel.doBodyPartContextMenu = ISHealthPanel.doBodyPartContextMenu

function ISHealthPanel:dropItemsOnBodyPart(bodyPart, items)
    healthPanel.dropItemsOnBodyPart(self, bodyPart, items)

    local handlers = {}
    for _, handler in pairs(healthPanel.handlers) do
        table.insert(handlers, require('Component/HealthPanel/Handler/' .. handler):new(self, bodyPart))
    end

    for _, handler in ipairs(handlers) do
        for _, item in ipairs(items) do
            handler:checkItem(item)
        end

        if handler:dropItems(items) then
            break
        end
    end
end

function ISHealthPanel:doBodyPartContextMenu(bodyPart, x, y)
    local handlers = {}
    local playerNum = self.otherPlayer and self.otherPlayer:getPlayerNum() or self.character:getPlayerNum()
    healthPanel.doBodyPartContextMenu(self, bodyPart, x, y)
    local context = getPlayerContextMenu(playerNum)

    for _, handler in pairs(healthPanel.handlers) do
        table.insert(handlers, require('Component/HealthPanel/Handler/' .. handler):new(self, bodyPart))
    end

    self:checkItems(handlers)

    for _, handler in ipairs(handlers) do
        handler:addToMenu(context)
    end

    context:setVisible(not self.blockingMessage and not context:isEmpty())

    if JoypadState.players[playerNum + 1] and context:getIsVisible() then
        context.mouseOver = 1
        context.origin = self
        JoypadState.players[playerNum + 1].focus = context
        updateJoypadFocus(JoypadState.players[playerNum + 1])
    end
end