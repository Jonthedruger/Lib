    Button.MouseButton1Down:Connect(callback or function() print("No callback specified") end)

    ButtonUICorner.CornerRadius = UDim.new(0, 5)
    ButtonUICorner.Parent = Button

    ButtonIcon.Name = "ButtonIcon"
    ButtonIcon.Parent = Button
    ButtonIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ButtonIcon.BackgroundTransparency = 1.000
    ButtonIcon.BorderSizePixel = 0
    ButtonIcon.Position = UDim2.new(0.927924275, 0, 0.137931034, 0)
    ButtonIcon.Size = UDim2.new(0, 19, 0, 20)
    ButtonIcon.Image = "rbxassetid://7072719587"
end

TabLib.createText = function(text)
    local Text = Instance.new("TextLabel")
    local TextUICorner = Instance.new("UICorner")

    Text.Name = text
    Text.Parent = Section
    Text.BackgroundColor3 = Color3.fromRGB(50, 44, 53)
    Text.BorderSizePixel = 0
    Text.Size = UDim2.new(0, 349, 0, 29)
    Text.Font = Enum.Font.Gotham
    Text.Text = text
    Text.TextColor3 = Color3.fromRGB(255, 255, 255)
    Text.TextSize = 14.000

    TextUICorner.CornerRadius = UDim.new(0, 5)
    TextUICorner.Parent = Text

    local TextIcon = Instance.new("ImageLabel")
    TextIcon.Name = "TextIcon"
    TextIcon.Parent = Text
    TextIcon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextIcon.BackgroundTransparency = 1.000
    TextIcon.BorderSizePixel = 0
    TextIcon.Position = UDim2.new(0.924277246, 0, 0.137931034, 0)
    TextIcon.Size = UDim2.new(0, 21, 0, 20)
    TextIcon.Image = "rbxassetid://7072716382"
end

return TabLib
end

TabButton.MouseButton1Down:Connect(function()
    for _, tab in pairs(TabHolder:GetChildren()) do
        if tab:IsA("ScrollingFrame") then
            tab.Visible = false
        end
    end
    for _, button in pairs(TabList:GetChildren()) do
        if button:IsA("TextButton") then
            button.TextColor3 = Color3.fromRGB(245, 247, 244)
        end
    end
    TabMain.Visible = true
    TabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
end)

if defualt_tab == TabButton.Name then
    TabMain.Visible = true
    TabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
else
    TabMain.Visible = false
    TabButton.TextColor3 = Color3.fromRGB(245, 247, 244)
end

return TabLib
end

WindowLib.show = function()
    MainGui.Enabled = true
end

WindowLib.hide = function()
    MainGui.Enabled = false
end

if draggable then
    local dragging
    local dragInput
    local dragStart
    local startPos

    local function update(input)
        local delta = input.Position - dragStart
        MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end

    MainFrame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = MainFrame.Position

            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    MainFrame.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            update(input)
        end
    end)
end

return WindowLib
end

return lib
t
