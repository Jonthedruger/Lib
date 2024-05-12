-- UI Library

local UI = {}

-- Window Class
UI.Window = {}
function UI.Window.new(title, width, height, position)
    local self = {}
    self.title = title or "Window"
    self.width = width or 400
    self.height = height or 300
    self.position = position or UDim2.new(0.5, -self.width/2, 0.5, -self.height/2)
    self.tabs = {}
    self.minimized = false

    function self:AddTab(tab)
        table.insert(self.tabs, tab)
    end

    function self:Minimize()
        self.minimized = true
        -- Code to minimize the window
    end

    function self:Close()
        -- Code to close the window
    end

    return self
end

-- Tab Class
UI.Tab = {}
function UI.Tab.new(title)
    local self = {}
    self.title = title or "Tab"
    self.elements = {}

    function self:AddElement(element)
        table.insert(self.elements, element)
    end

    return self
end

-- Button Class
UI.Button = {}
function UI.Button.new(text, onClick)
    local self = {}
    self.text = text or "Button"
    self.onClick = onClick or function() end
    self.size = UDim2.new(0, 100, 0, 40)
    self.position = UDim2.new(0.5, -50, 0.5, -20)
    self.backgroundColor = Color3.fromRGB(30, 144, 255)
    self.textColor = Color3.fromRGB(255, 255, 255)
    self.textSize = 18
    self.font = Enum.Font.GothamBold

    return self
end

-- Label Class
UI.Label = {}
function UI.Label.new(text)
    local self = {}
    self.text = text or "Label"
    self.size = UDim2.new(0, 200, 0, 40)
    self.position = UDim2.new(0.5, -100, 0.5, -20)
    self.textColor = Color3.fromRGB(255, 255, 255)
    self.textSize = 18
    self.font = Enum.Font.GothamBold

    return self
end

-- Input Class
UI.Input = {}
function UI.Input.new(placeholderText)
    local self = {}
    self.placeholderText = placeholderText or ""
    self.size = UDim2.new(0, 200, 0, 40)
    self.position = UDim2.new(0.5, -100, 0.5, -20)
    self.textColor = Color3.fromRGB(255, 255, 255)
    self.textSize = 18
    self.font = Enum.Font.Gotham
    self.textChangedCallback = function() end

    return self
end

-- Slider Class
UI.Slider = {}
function UI.Slider.new(minValue, maxValue, defaultValue, onChange)
    local self = {}
    self.minValue = minValue or 0
    self.maxValue = maxValue or 100
    self.value = defaultValue or 50
    self.onChange = onChange or function() end
    self.size = UDim2.new(0, 200, 0, 20)
    self.position = UDim2.new(0.5, -100, 0.5, -10)
    self.backgroundColor = Color3.fromRGB(192, 192, 192)
    self.fillColor = Color3.fromRGB(30, 144, 255)

    return self
end

return UI
