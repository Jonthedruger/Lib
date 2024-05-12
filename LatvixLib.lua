local Orientation = {
    Vertical = "Vertical",
    Horizontal = "Horizontal"
}

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
    self.visible = true

    function self:AddTab(tab)
        table.insert(self.tabs, tab)
    end

    function self:ToggleVisibility()
        self.visible = not self.visible
        for _, tab in ipairs(self.tabs) do
            tab.visible = self.visible
        end
    end

    return self
end

-- Tab Class
UI.Tab = {}
function UI.Tab.new(title)
    local self = {}
    self.title = title or "Tab"
    self.elements = {}
    self.visible = true

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

-- KeyBind Class
UI.KeyBind = {}
function UI.KeyBind.new(defaultKey, onChange)
    local self = {}
    self.key = defaultKey or Enum.KeyCode.F
    self.onChange = onChange or function() end
    self.size = UDim2.new(0, 200, 0, 40)
    self.position = UDim2.new(0.5, -100, 0.5, -20)
    self.textColor = Color3.fromRGB(255, 255, 255)
    self.textSize = 18
    self.font = Enum.Font.GothamBold

    return self
end

-- Image Class
UI.Image = {}
function UI.Image.new(imageId)
    local self = {}
    self.imageId = imageId or ""
    self.size = UDim2.new(0, 100, 0, 100)
    self.position = UDim2.new(0.5, -50, 0.5, -50)

    return self
end

-- Progress Bar Class
UI.ProgressBar = {}
function UI.ProgressBar.new(value, maxValue)
    local self = {}
    self.value = value or 0
    self.maxValue = maxValue or 100
    self.size = UDim2.new(0, 200, 0, 20)
    self.position = UDim2.new(0.5, -100, 0.5, -10)
    self.backgroundColor = Color3.fromRGB(192, 192, 192)
    self.fillColor = Color3.fromRGB(30, 144, 255)

    return self
end

-- Scroll Bar Class
UI.ScrollBar = {}
function UI.ScrollBar.new()
    local self = {}
    self.size = UDim2.new(0, 20, 0, 200)
    self.position = UDim2.new(1, -20, 0, 0)
    self.backgroundColor = Color3.fromRGB(192, 192, 192)
    self.thumbColor = Color3.fromRGB(30, 144, 255)
    self.thumbSize = UDim2.new(0, 20, 0, 50)
    self.thumbPosition = UDim2.new(0, 0, 0, 0)

    return self
end

-- Separator Class
UI.Separator = {}
function UI.Separator.new(thickness, length, orientation)
    local self = {}
    self.thickness = thickness or 2
    self.length = length or 100
    self.orientation = orientation or Orientation.Vertical
    self.color = Color3.fromRGB(200, 200, 200)

    return self
end

return UI
