local UI = {}

-- Define the tab class, window class, and other UI components...

-- Define the key system
local KeySystem = {}
KeySystem.__index = KeySystem

function KeySystem.new()
    local self = setmetatable({}, KeySystem)
    self.currentKey = ""
    self.discordGuild = nil
    self.keyChannel = nil -- Add a field to store the channel for sending key messages
    return self
end

function KeySystem:setKey(newKey)
    self.currentKey = newKey
    if self.keyChannel then
        self:keyChannelMessage("New key set: " .. newKey) -- Send message to the key channel
    end
end

-- Function to send a message to the key channel
function KeySystem:keyChannelMessage(message)
    if self.keyChannel then
        self.keyChannel:send(message)
    end
end

-- Export the classes
UI.KeySystem = KeySystem

return UI
