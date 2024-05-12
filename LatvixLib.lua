local UI = {}

-- Define Window Class
local Window = {}
Window.__index = Window

function Window.new(name)
    local self = setmetatable({}, Window)
    self.Name = name
    self.Tabs = {}
    return self
end

function Window:AddTab(name)
    local tab = Tab.new(name)
    table.insert(self.Tabs, tab)
    return tab
end

-- Define Tab Class
local Tab = {}
Tab.__index = Tab

function Tab.new(name)
    local self = setmetatable({}, Tab)
    self.Name = name
    self.UIElements = {}
    return self
end

function Tab:AddSlider(name, minValue, maxValue, callback)
    local slider = Instance.new("TextButton")
    -- Customize slider properties (e.g., size, position, appearance)
    slider.Text = name
    slider.MouseButton1Click:Connect(callback) -- Execute callback when clicked
    -- Add slider to GUI or game world
    table.insert(self.UIElements, slider)
    return slider
end

function Tab:AddButton(name, callback)
    local button = Instance.new("TextButton")
    -- Customize button properties (e.g., size, position, appearance)
    button.Text = name
    button.MouseButton1Click:Connect(callback) -- Execute callback when clicked
    -- Add button to GUI or game world
    table.insert(self.UIElements, button)
    return button
end

-- Define UI Library Functions
function UI:AddWindow(name)
    local window = Window.new(name)
    return window
end

return UI
