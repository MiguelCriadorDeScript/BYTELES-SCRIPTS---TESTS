--[[
    ╔════════════════════════════════════════════════════╗
    ║     TESTE SCRIPT #Verified                         ║
    ║     Created by: ByteBandit_ofici                   ║
    ║     Version: 2.0.0 - Advanced Features             ║
    ╚════════════════════════════════════════════════════╝
]]

print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━")
print("✓ Loading TESTE SCRIPT #Verified v2.0...")
print("✓ Created by: ByteBandit_ofici")
print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━")

-- Services
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")

local Player = Players.LocalPlayer
local Mouse = Player:GetMouse()

-- Global State Management
_G.BYTELES_State = _G.BYTELES_State or {
    ThemeColor = Color3.fromRGB(60, 130, 220),
    TogglesState = {},
    DropdownsState = {},
    SlidersState = {},
    ColorPickerState = {}
}

-- Create BYTELES Library
local BYTELES = {}
BYTELES.__index = BYTELES

local function CreateScreenGui()
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "BYTELES_ADVANCED"
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    ScreenGui.ResetOnSpawn = false
    ScreenGui.Parent = CoreGui
    return ScreenGui
end

local function Tween(object, properties, duration)
    local tween = TweenService:Create(object, TweenInfo.new(duration or 0.3), properties)
    tween:Play()
    return tween
end

function BYTELES:CreateWindow(config)
    config = config or {}
    
    local Window = {}
    Window.Tabs = {}
    Window.IsMinimized = false
    
    local ScreenGui = CreateScreenGui()
    
    -- Create Minimize Button (appears when minimized)
    local MinimizeIcon = Instance.new("ImageButton")
    MinimizeIcon.Name = "MinimizeIcon"
    MinimizeIcon.Size = UDim2.new(0, 60, 0, 60)
    MinimizeIcon.Position = UDim2.new(0, 20, 0.5, -30)
    MinimizeIcon.BackgroundColor3 = _G.BYTELES_State.ThemeColor
    MinimizeIcon.BorderSizePixel = 0
    MinimizeIcon.Image = "rbxassetid://130293507606279"
    MinimizeIcon.ScaleType = Enum.ScaleType.Fit
    MinimizeIcon.Visible = false
    MinimizeIcon.Parent = ScreenGui
    
    local IconCorner = Instance.new("UICorner")
    IconCorner.CornerRadius = UDim.new(0, 10)
    IconCorner.Parent = MinimizeIcon
    
    local IconStroke = Instance.new("UIStroke")
    IconStroke.Color = Color3.fromRGB(255, 255, 255)
    IconStroke.Thickness = 2
    IconStroke.Parent = MinimizeIcon
    
    -- Make icon draggable
    local dragging = false
    local dragInput, mousePos, framePos
    
    MinimizeIcon.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            mousePos = input.Position
            framePos = MinimizeIcon.Position
        end
    end)
    
    MinimizeIcon.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local delta = input.Position - mousePos
            MinimizeIcon.Position = UDim2.new(
                framePos.X.Scale, framePos.X.Offset + delta.X,
                framePos.Y.Scale, framePos.Y.Offset + delta.Y
            )
        end
    end)
    
    -- Main Frame
    local MainFrame = Instance.new("Frame")
    MainFrame.Name = "MainFrame"
    MainFrame.Size = UDim2.new(0, 750, 0, 500)
    MainFrame.Position = UDim2.new(0.5, -375, 0.5, -250)
    MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
    MainFrame.BorderSizePixel = 0
    MainFrame.Parent = ScreenGui
    
    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 12)
    UICorner.Parent = MainFrame
    
    -- Top Bar
    local TopBar = Instance.new("Frame")
    TopBar.Size = UDim2.new(1, 0, 0, 50)
    TopBar.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
    TopBar.BorderSizePixel = 0
    TopBar.Parent = MainFrame
    
    local TopBarCorner = Instance.new("UICorner")
    TopBarCorner.CornerRadius = UDim.new(0, 12)
    TopBarCorner.Parent = TopBar
    
    local TopBarFix = Instance.new("Frame")
    TopBarFix.Size = UDim2.new(1, 0, 0, 25)
    TopBarFix.Position = UDim2.new(0, 0, 1, -25)
    TopBarFix.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
    TopBarFix.BorderSizePixel = 0
    TopBarFix.Parent = TopBar
    
    -- Title
    local Title = Instance.new("TextLabel")
    Title.Size = UDim2.new(0, 400, 1, 0)
    Title.Position = UDim2.new(0, 15, 0, 0)
    Title.BackgroundTransparency = 1
    Title.Text = config.Name or "BYTELES"
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.TextSize = 18
    Title.Font = Enum.Font.GothamBold
    Title.TextXAlignment = Enum.TextXAlignment.Left
    Title.Parent = TopBar
    
    -- Minimize Button
    local MinimizeButton = Instance.new("TextButton")
    MinimizeButton.Size = UDim2.new(0, 35, 0, 35)
    MinimizeButton.Position = UDim2.new(1, -80, 0, 7.5)
    MinimizeButton.BackgroundColor3 = Color3.fromRGB(180, 150, 50)
    MinimizeButton.Text = "─"
    MinimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    MinimizeButton.TextSize = 20
    MinimizeButton.Font = Enum.Font.GothamBold
    MinimizeButton.BorderSizePixel = 0
    MinimizeButton.Parent = TopBar
    
    local MinCorner = Instance.new("UICorner")
    MinCorner.CornerRadius = UDim.new(0, 8)
    MinCorner.Parent = MinimizeButton
    
    -- Close Button
    local CloseButton = Instance.new("TextButton")
    CloseButton.Size = UDim2.new(0, 35, 0, 35)
    CloseButton.Position = UDim2.new(1, -40, 0, 7.5)
    CloseButton.BackgroundColor3 = Color3.fromRGB(220, 50, 50)
    CloseButton.Text = "×"
    CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    CloseButton.TextSize = 22
    CloseButton.Font = Enum.Font.GothamBold
    CloseButton.BorderSizePixel = 0
    CloseButton.Parent = TopBar
    
    local CloseCorner = Instance.new("UICorner")
    CloseCorner.CornerRadius = UDim.new(0, 8)
    CloseCorner.Parent = CloseButton
    
    -- Left Side Container (Tabs + User Info)
    local LeftSide = Instance.new("Frame")
    LeftSide.Size = UDim2.new(0, 170, 1, -60)
    LeftSide.Position = UDim2.new(0, 10, 0, 55)
    LeftSide.BackgroundTransparency = 1
    LeftSide.Parent = MainFrame
    
    -- Tab Container
    local TabContainer = Instance.new("Frame")
    TabContainer.Size = UDim2.new(1, 0, 1, -90)
    TabContainer.Position = UDim2.new(0, 0, 0, 0)
    TabContainer.BackgroundTransparency = 1
    TabContainer.Parent = LeftSide
    
    local TabList = Instance.new("UIListLayout")
    TabList.SortOrder = Enum.SortOrder.LayoutOrder
    TabList.Padding = UDim.new(0, 5)
    TabList.Parent = TabContainer
    
    -- Separator Line
    local Separator = Instance.new("Frame")
    Separator.Size = UDim2.new(1, 0, 0, 2)
    Separator.Position = UDim2.new(0, 0, 1, -85)
    Separator.BackgroundColor3 = Color3.fromRGB(50, 50, 55)
    Separator.BorderSizePixel = 0
    Separator.Parent = LeftSide
    
    -- User Info Container
    local UserInfo = Instance.new("Frame")
    UserInfo.Size = UDim2.new(1, 0, 0, 75)
    UserInfo.Position = UDim2.new(0, 0, 1, -75)
    UserInfo.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
    UserInfo.BorderSizePixel = 0
    UserInfo.Parent = LeftSide
    
    local UserCorner = Instance.new("UICorner")
    UserCorner.CornerRadius = UDim.new(0, 8)
    UserCorner.Parent = UserInfo
    
    -- User Avatar
    local UserAvatar = Instance.new("ImageLabel")
    UserAvatar.Size = UDim2.new(0, 50, 0, 50)
    UserAvatar.Position = UDim2.new(0, 10, 0.5, -25)
    UserAvatar.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
    UserAvatar.BorderSizePixel = 0
    UserAvatar.Image = Players:GetUserThumbnailAsync(Player.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size150x150)
    UserAvatar.Parent = UserInfo
    
    local AvatarCorner = Instance.new("UICorner")
    AvatarCorner.CornerRadius = UDim.new(1, 0)
    AvatarCorner.Parent = UserAvatar
    
    -- User Name
    local UserName = Instance.new("TextLabel")
    UserName.Size = UDim2.new(1, -70, 0, 25)
    UserName.Position = UDim2.new(0, 65, 0, 10)
    UserName.BackgroundTransparency = 1
    UserName.Text = Player.DisplayName
    UserName.TextColor3 = Color3.fromRGB(255, 255, 255)
    UserName.TextSize = 14
    UserName.Font = Enum.Font.GothamBold
    UserName.TextXAlignment = Enum.TextXAlignment.Left
    UserName.TextTruncate = Enum.TextTruncate.AtEnd
    UserName.Parent = UserInfo
    
    -- User Username
    local UserUsername = Instance.new("TextLabel")
    UserUsername.Size = UDim2.new(1, -70, 0, 20)
    UserUsername.Position = UDim2.new(0, 65, 0, 33)
    UserUsername.BackgroundTransparency = 1
    UserUsername.Text = "@" .. Player.Name
    UserUsername.TextColor3 = Color3.fromRGB(150, 150, 150)
    UserUsername.TextSize = 11
    UserUsername.Font = Enum.Font.Gotham
    UserUsername.TextXAlignment = Enum.TextXAlignment.Left
    UserUsername.TextTruncate = Enum.TextTruncate.AtEnd
    UserUsername.Parent = UserInfo
    
    -- Content Container
    local ContentContainer = Instance.new("Frame")
    ContentContainer.Size = UDim2.new(1, -195, 1, -60)
    ContentContainer.Position = UDim2.new(0, 185, 0, 55)
    ContentContainer.BackgroundTransparency = 1
    ContentContainer.Parent = MainFrame
    
    -- Minimize/Restore Logic
    MinimizeButton.MouseButton1Click:Connect(function()
        Window.IsMinimized = true
        Tween(MainFrame, {Size = UDim2.new(0, 0, 0, 0)}, 0.3)
        task.wait(0.3)
        MainFrame.Visible = false
        MinimizeIcon.Visible = true
        Tween(MinimizeIcon, {Size = UDim2.new(0, 60, 0, 60)}, 0.2)
        print("✓ BYTELES Minimized")
    end)
    
    MinimizeIcon.MouseButton1Click:Connect(function()
        Window.IsMinimized = false
        MinimizeIcon.Visible = false
        MainFrame.Visible = true
        MainFrame.Size = UDim2.new(0, 0, 0, 0)
        Tween(MainFrame, {Size = UDim2.new(0, 750, 0, 500)}, 0.3)
        print("✓ BYTELES Restored")
    end)
    
    CloseButton.MouseButton1Click:Connect(function()
        ScreenGui:Destroy()
        print("✓ BYTELES Closed")
    end)
    
    -- Create Tab Function
    function Window:CreateTab(tabName)
        local Tab = {}
        
        local TabButton = Instance.new("TextButton")
        TabButton.Size = UDim2.new(1, 0, 0, 38)
        TabButton.BackgroundColor3 = Color3.fromRGB(35, 35, 40)
        TabButton.Text = tabName
        TabButton.TextColor3 = Color3.fromRGB(200, 200, 200)
        TabButton.TextSize = 14
        TabButton.Font = Enum.Font.Gotham
        TabButton.BorderSizePixel = 0
        TabButton.Parent = TabContainer
        
        local TabCorner = Instance.new("UICorner")
        TabCorner.CornerRadius = UDim.new(0, 8)
        TabCorner.Parent = TabButton
        
        local TabContent = Instance.new("ScrollingFrame")
        TabContent.Size = UDim2.new(1, 0, 1, 0)
        TabContent.BackgroundTransparency = 1
        TabContent.BorderSizePixel = 0
        TabContent.ScrollBarThickness = 5
        TabContent.ScrollBarImageColor3 = _G.BYTELES_State.ThemeColor
        TabContent.Visible = false
        TabContent.Parent = ContentContainer
        
        local ContentList = Instance.new("UIListLayout")
        ContentList.Padding = UDim.new(0, 8)
        ContentList.Parent = TabContent
        
        local ContentPadding = Instance.new("UIPadding")
        ContentPadding.PaddingLeft = UDim.new(0, 10)
        ContentPadding.PaddingRight = UDim.new(0, 10)
        ContentPadding.PaddingTop = UDim.new(0, 10)
        ContentPadding.Parent = TabContent
        
        ContentList:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
            TabContent.CanvasSize = UDim2.new(0, 0, 0, ContentList.AbsoluteContentSize.Y + 20)
        end)
        
        TabButton.MouseButton1Click:Connect(function()
            for _, tab in pairs(Window.Tabs) do
                tab.Button.BackgroundColor3 = Color3.fromRGB(35, 35, 40)
                tab.Button.TextColor3 = Color3.fromRGB(200, 200, 200)
                tab.Content.Visible = false
            end
            TabButton.BackgroundColor3 = _G.BYTELES_State.ThemeColor
            TabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
            TabContent.Visible = true
        end)
        
        Tab.Button = TabButton
        Tab.Content = TabContent
        
        -- Create Button
        function Tab:CreateButton(config)
            config = config or {}
            
            local ButtonFrame = Instance.new("Frame")
            ButtonFrame.Size = UDim2.new(1, 0, 0, 42)
            ButtonFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 40)
            ButtonFrame.BorderSizePixel = 0
            ButtonFrame.Parent = TabContent
            
            local ButtonCorner = Instance.new("UICorner")
            ButtonCorner.CornerRadius = UDim.new(0, 8)
            ButtonCorner.Parent = ButtonFrame
            
            local ButtonLabel = Instance.new("TextLabel")
            ButtonLabel.Size = UDim2.new(1, -90, 1, 0)
            ButtonLabel.Position = UDim2.new(0, 12, 0, 0)
            ButtonLabel.BackgroundTransparency = 1
            ButtonLabel.Text = config.Name or "Button"
            ButtonLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            ButtonLabel.TextSize = 14
            ButtonLabel.Font = Enum.Font.Gotham
            ButtonLabel.TextXAlignment = Enum.TextXAlignment.Left
            ButtonLabel.Parent = ButtonFrame
            
            local Button = Instance.new("TextButton")
            Button.Size = UDim2.new(0, 75, 0, 28)
            Button.Position = UDim2.new(1, -82, 0.5, -14)
            Button.BackgroundColor3 = _G.BYTELES_State.ThemeColor
            Button.Text = "Execute"
            Button.TextColor3 = Color3.fromRGB(255, 255, 255)
            Button.TextSize = 12
            Button.Font = Enum.Font.GothamBold
            Button.BorderSizePixel = 0
            Button.Parent = ButtonFrame
            
            local BtnCorner = Instance.new("UICorner")
            BtnCorner.CornerRadius = UDim.new(0, 6)
            BtnCorner.Parent = Button
            
            Button.MouseButton1Click:Connect(function()
                local originalColor = Button.BackgroundColor3
                Tween(Button, {BackgroundColor3 = Color3.fromRGB(
                    math.max(0, originalColor.R * 255 - 30),
                    math.max(0, originalColor.G * 255 - 30),
                    math.max(0, originalColor.B * 255 - 30)
                )}, 0.1)
                task.wait(0.1)
                Tween(Button, {BackgroundColor3 = originalColor}, 0.1)
                if config.Callback then pcall(config.Callback) end
            end)
        end
        
        -- Create Toggle
        function Tab:CreateToggle(config)
            config = config or {}
            local toggleId = config.Flag or config.Name or "Toggle_" .. tostring(math.random(1000, 9999))
            local currentValue = _G.BYTELES_State.TogglesState[toggleId] or config.CurrentValue or false
            
            local ToggleFrame = Instance.new("Frame")
            ToggleFrame.Size = UDim2.new(1, 0, 0, 42)
            ToggleFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 40)
            ToggleFrame.BorderSizePixel = 0
            ToggleFrame.Parent = TabContent
            
            local ToggleCorner = Instance.new("UICorner")
            ToggleCorner.CornerRadius = UDim.new(0, 8)
            ToggleCorner.Parent = ToggleFrame
            
            local ToggleLabel = Instance.new("TextLabel")
            ToggleLabel.Size = UDim2.new(1, -70, 1, 0)
            ToggleLabel.Position = UDim2.new(0, 12, 0, 0)
            ToggleLabel.BackgroundTransparency = 1
            ToggleLabel.Text = config.Name or "Toggle"
            ToggleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            ToggleLabel.TextSize = 14
            ToggleLabel.Font = Enum.Font.Gotham
            ToggleLabel.TextXAlignment = Enum.TextXAlignment.Left
            ToggleLabel.Parent = ToggleFrame
            
            local ToggleButton = Instance.new("TextButton")
            ToggleButton.Size = UDim2.new(0, 48, 0, 24)
            ToggleButton.Position = UDim2.new(1, -58, 0.5, -12)
            ToggleButton.BackgroundColor3 = currentValue and _G.BYTELES_State.ThemeColor or Color3.fromRGB(50, 50, 55)
            ToggleButton.Text = ""
            ToggleButton.BorderSizePixel = 0
            ToggleButton.Parent = ToggleFrame
            
            local ToggleBtnCorner = Instance.new("UICorner")
            ToggleBtnCorner.CornerRadius = UDim.new(1, 0)
            ToggleBtnCorner.Parent = ToggleButton
            
            local ToggleCircle = Instance.new("Frame")
            ToggleCircle.Size = UDim2.new(0, 20, 0, 20)
            ToggleCircle.Position = currentValue and UDim2.new(1, -22, 0.5, -10) or UDim2.new(0, 2, 0.5, -10)
            ToggleCircle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ToggleCircle.BorderSizePixel = 0
            ToggleCircle.Parent = ToggleButton
            
            local CircleCorner = Instance.new("UICorner")
            CircleCorner.CornerRadius = UDim.new(1, 0)
            CircleCorner.Parent = ToggleCircle
            
            ToggleButton.MouseButton1Click:Connect(function()
                currentValue = not currentValue
                _G.BYTELES_State.TogglesState[toggleId] = currentValue
                
                Tween(ToggleButton, {BackgroundColor3 = currentValue and _G.BYTELES_State.ThemeColor or Color3.fromRGB(50, 50, 55)}, 0.3)
                Tween(ToggleCircle, {Position = currentValue and UDim2.new(1, -22, 0.5, -10) or UDim2.new(0, 2, 0.5, -10)}, 0.3)
                
                if config.Callback then pcall(config.Callback, currentValue) end
            end)
        end
        
        -- Create Dropdown
        function Tab:CreateDropdown(config)
            config = config or {}
            local dropdownId = config.Flag or config.Name or "Dropdown_" .. tostring(math.random(1000, 9999))
            local currentOption = _G.BYTELES_State.DropdownsState[dropdownId] or config.CurrentOption or (config.Options and config.Options[1]) or "None"
            
            local DropdownFrame = Instance.new("Frame")
            DropdownFrame.Size = UDim2.new(1, 0, 0, 42)
            DropdownFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 40)
            DropdownFrame.BorderSizePixel = 0
            DropdownFrame.ClipsDescendants = true
            DropdownFrame.Parent = TabContent
            
            local DropdownCorner = Instance.new("UICorner")
            DropdownCorner.CornerRadius = UDim.new(0, 8)
            DropdownCorner.Parent = DropdownFrame
            
            local DropdownLabel = Instance.new("TextLabel")
            DropdownLabel.Size = UDim2.new(0.5, 0, 0, 42)
            DropdownLabel.Position = UDim2.new(0, 12, 0, 0)
            DropdownLabel.BackgroundTransparency = 1
            DropdownLabel.Text = config.Name or "Dropdown"
            DropdownLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            DropdownLabel.TextSize = 14
            DropdownLabel.Font = Enum.Font.Gotham
            DropdownLabel.TextXAlignment = Enum.TextXAlignment.Left
            DropdownLabel.Parent = DropdownFrame
            
            local DropdownValue = Instance.new("TextLabel")
            DropdownValue.Size = UDim2.new(0.4, -50, 0, 42)
            DropdownValue.Position = UDim2.new(0.5, 0, 0, 0)
            DropdownValue.BackgroundTransparency = 1
            DropdownValue.Text = currentOption
            DropdownValue.TextColor3 = Color3.fromRGB(180, 180, 180)
            DropdownValue.TextSize = 12
            DropdownValue.Font = Enum.Font.Gotham
            DropdownValue.TextXAlignment = Enum.TextXAlignment.Right
            DropdownValue.TextTruncate = Enum.TextTruncate.AtEnd
            DropdownValue.Parent = DropdownFrame
            
            local DropdownArrow = Instance.new("TextLabel")
            DropdownArrow.Size = UDim2.new(0, 25, 0, 42)
            DropdownArrow.Position = UDim2.new(1, -30, 0, 0)
            DropdownArrow.BackgroundTransparency = 1
            DropdownArrow.Text = "▼"
            DropdownArrow.TextColor3 = Color3.fromRGB(200, 200, 200)
            DropdownArrow.TextSize = 10
            DropdownArrow.Font = Enum.Font.Gotham
            DropdownArrow.Parent = DropdownFrame
            
            local DropdownButton = Instance.new("TextButton")
            DropdownButton.Size = UDim2.new(1, 0, 0, 42)
            DropdownButton.BackgroundTransparency = 1
            DropdownButton.Text = ""
            DropdownButton.Parent = DropdownFrame
            
            local OptionsContainer = Instance.new("Frame")
            OptionsContainer.Size = UDim2.new(1, 0, 0, 0)
            OptionsContainer.Position = UDim2.new(0, 0, 0, 42)
            OptionsContainer.BackgroundTransparency = 1
            OptionsContainer.Parent = DropdownFrame
            
            local OptionsList = Instance.new("UIListLayout")
            OptionsList.SortOrder = Enum.SortOrder.LayoutOrder
            OptionsList.Parent = OptionsContainer
            
            local isOpen = false
            
            if config.Options then
                for _, option in ipairs(config.Options) do
                    local OptionButton = Instance.new("TextButton")
                    OptionButton.Size = UDim2.new(1, 0, 0, 32)
                    OptionButton.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
                    OptionButton.Text = option
                    OptionButton.TextColor3 = Color3.fromRGB(200, 200, 200)
                    OptionButton.TextSize = 12
                    OptionButton.Font = Enum.Font.Gotham
                    OptionButton.BorderSizePixel = 0
                    OptionButton.Parent = OptionsContainer
                    
                    OptionButton.MouseButton1Click:Connect(function()
                        currentOption = option
                        _G.BYTELES_State.DropdownsState[dropdownId] = currentOption
                        DropdownValue.Text = option
                        
                        isOpen = false
                        Tween(DropdownFrame, {Size = UDim2.new(1, 0, 0, 42)}, 0.3)
                        Tween(DropdownArrow, {Rotation = 0}, 0.3)
                        
                        if config.Callback then pcall(config.Callback, option) end
                    end)
                end
            end
            
            DropdownButton.MouseButton1Click:Connect(function()
                isOpen = not isOpen
                if isOpen then
                    local optionsHeight = config.Options and (#config.Options * 32) or 0
                    Tween(DropdownFrame, {Size = UDim2.new(1, 0, 0, 42 + optionsHeight)}, 0.3)
                    Tween(DropdownArrow, {Rotation = 180}, 0.3)
                else
                    Tween(DropdownFrame, {Size = UDim2.new(1, 0, 0, 42)}, 0.3)
                    Tween(DropdownArrow, {Rotation = 0}, 0.3)
                end
            end)
        end
        
        -- Create Color Picker
        function Tab:CreateColorPicker(config)
            config = config or {}
            local colorId = config.Flag or config.Name or "Color_" .. tostring(math.random(1000, 9999))
            local currentColor = _G.BYTELES_State.ColorPickerState[colorId] or config.DefaultColor or Color3.fromRGB(255, 255, 255)
            
            local ColorFrame = Instance.new("Frame")
            ColorFrame.Size = UDim2.new(1, 0, 0, 42)
            ColorFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 40)
            ColorFrame.BorderSizePixel = 0
            ColorFrame.Parent = TabContent
            
            local ColorCorner = Instance.new("UICorner")
            ColorCorner.CornerRadius = UDim.new(0, 8)
            ColorCorner.Parent = ColorFrame
            
            local ColorLabel = Instance.new("TextLabel")
            ColorLabel.Size = UDim2.new(1, -70, 1, 0)
            ColorLabel.Position = UDim2.new(0, 12, 0, 0)
            ColorLabel.BackgroundTransparency = 1
            ColorLabel.Text = config.Name or "Color Picker"
            ColorLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            ColorLabel.TextSize = 14
            ColorLabel.Font = Enum.Font.Gotham
            ColorLabel.TextXAlignment = Enum.TextXAlignment.Left
            ColorLabel.Parent = ColorFrame
            
            local ColorDisplay = Instance.new("TextButton")
            ColorDisplay.Size = UDim2.new(0, 45, 0, 28)
            ColorDisplay.Position = UDim2.new(1, -55, 0.5, -14)
            ColorDisplay.BackgroundColor3 = currentColor
            ColorDisplay.Text = ""
            ColorDisplay.BorderSizePixel = 0
            ColorDisplay.Parent = ColorFrame
            
            local ColorDisplayCorner = Instance.new("UICorner")
            ColorDisplayCorner.CornerRadius = UDim.new(0, 6)
            ColorDisplayCorner.Parent = ColorDisplay
            
            local ColorDisplayStroke = Instance.new("UIStroke")
            ColorDisplayStroke.Color = Color3.fromRGB(255, 255, 255)
            ColorDisplayStroke.Thickness = 2
            ColorDisplayStroke.Parent = ColorDisplay
            
            ColorDisplay.MouseButton1Click:Connect(function()
                -- Simple color picker with preset colors
                local ColorPickerFrame = Instance.new("Frame")
                ColorPickerFrame.Size = UDim2.new(0, 200, 0, 150)
                ColorPickerFrame.Position = UDim2.new(0.5, -100, 0.5, -75)
                ColorPickerFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
                ColorPickerFrame.BorderSizePixel = 0
                ColorPickerFrame.Parent = ScreenGui
                ColorPickerFrame.ZIndex = 100
                
                local PickerCorner = Instance.new("UICorner")
                PickerCorner.CornerRadius = UDim.new(0, 10)
                PickerCorner.Parent = ColorPickerFrame
                
                local PickerTitle = Instance.new("TextLabel")
                PickerTitle.Size = UDim2.new(1, 0, 0, 30)
                PickerTitle.BackgroundTransparency = 1
                PickerTitle.Text = "Select Color"
                PickerTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
                PickerTitle.TextSize = 14
                PickerTitle.Font = Enum.Font.GothamBold
                PickerTitle.Parent = ColorPickerFrame
                
                local ColorsGrid = Instance.new("Frame")
                ColorsGrid.Size = UDim2.new(1, -20, 1, -60)
                ColorsGrid.Position = UDim2.new(0, 10, 0, 35)
                ColorsGrid.BackgroundTransparency = 1
                ColorsGrid.Parent = ColorPickerFrame
                
                local GridLayout = Instance.new("UIGridLayout")
                GridLayout.CellSize = UDim2.new(0, 30, 0, 30)
                GridLayout.CellPadding = UDim2.new(0, 5, 0, 5)
                GridLayout.Parent = ColorsGrid
                
                local presetColors = {
                    Color3.fromRGB(255, 0, 0), Color3.fromRGB(0, 255, 0), Color3.fromRGB(0, 0, 255),
                    Color3.fromRGB(255, 255, 0), Color3.fromRGB(255, 0, 255), Color3.fromRGB(0, 255, 255),
                    Color3.fromRGB(255, 128, 0), Color3.fromRGB(128, 0, 255), Color3.fromRGB(255, 0, 128),
                    Color3.fromRGB(255, 255, 255), Color3.fromRGB(128, 128, 128), Color3.fromRGB(0, 0, 0)
                }
                
                for _, color in ipairs(presetColors) do
                    local ColorButton = Instance.new("TextButton")
                    ColorButton.Size = UDim2.new(0, 30, 0, 30)
                    ColorButton.BackgroundColor3 = color
                    ColorButton.Text = ""
                    ColorButton.BorderSizePixel = 0
                    ColorButton.Parent = ColorsGrid
                    
                    local ColorBtnCorner = Instance.new("UICorner")
                    ColorBtnCorner.CornerRadius = UDim.new(0, 6)
                    ColorBtnCorner.Parent = ColorButton
                    
                    ColorButton.MouseButton1Click:Connect(function()
                        currentColor = color
                        _G.BYTELES_State.ColorPickerState[colorId] = currentColor
                        ColorDisplay.BackgroundColor3 = currentColor
                        ColorPickerFrame:Destroy()
                        if config.Callback then pcall(config.Callback, currentColor) end
                    end)
                end
                
                local ClosePickerBtn = Instance.new("TextButton")
                ClosePickerBtn.Size = UDim2.new(1, -20, 0, 25)
                ClosePickerBtn.Position = UDim2.new(0, 10, 1, -30)
                ClosePickerBtn.BackgroundColor3 = Color3.fromRGB(220, 50, 50)
                ClosePickerBtn.Text = "Close"
                ClosePickerBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
                ClosePickerBtn.TextSize = 12
                ClosePickerBtn.Font = Enum.Font.GothamBold
                ClosePickerBtn.BorderSizePixel = 0
                ClosePickerBtn.Parent = ColorPickerFrame
                
                local CloseBtnCorner = Instance.new("UICorner")
                CloseBtnCorner.CornerRadius = UDim.new(0, 6)
                CloseBtnCorner.Parent = ClosePickerBtn
                
                ClosePickerBtn.MouseButton1Click:Connect(function()
                    ColorPickerFrame:Destroy()
                end)
            end)
        end
        
        -- Create Label
        function Tab:CreateLabel(text)
            local LabelFrame = Instance.new("Frame")
            LabelFrame.Size = UDim2.new(1, 0, 0, 32)
            LabelFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 40)
            LabelFrame.BorderSizePixel = 0
            LabelFrame.Parent = TabContent
            
            local LabelCorner = Instance.new("UICorner")
            LabelCorner.CornerRadius = UDim.new(0, 8)
            LabelCorner.Parent = LabelFrame
            
            local Label = Instance.new("TextLabel")
            Label.Size = UDim2.new(1, -20, 1, 0)
            Label.Position = UDim2.new(0, 12, 0, 0)
            Label.BackgroundTransparency = 1
            Label.Text = text or "Label"
            Label.TextColor3 = Color3.fromRGB(255, 255, 255)
            Label.TextSize = 14
            Label.Font = Enum.Font.Gotham
            Label.TextXAlignment = Enum.TextXAlignment.Left
            Label.Parent = LabelFrame
        end
        
        table.insert(Window.Tabs, Tab)
        
        -- Auto select first tab
        if #Window.Tabs == 1 then
            TabButton.BackgroundColor3 = _G.BYTELES_State.ThemeColor
            TabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
            TabContent.Visible = true
        end
        
        return Tab
    end
    
    -- Update Theme Color Function
    function Window:UpdateThemeColor(newColor)
        _G.BYTELES_State.ThemeColor = newColor
        MinimizeIcon.BackgroundColor3 = newColor
        
        for _, tab in pairs(Window.Tabs) do
            if tab.Content.Visible then
                tab.Button.BackgroundColor3 = newColor
            end
            tab.Content.ScrollBarImageColor3 = newColor
        end
        
        print("✓ Theme color updated!")
    end
    
    print("✓ Window Created: " .. (config.Name or "BYTELES"))
    return Window
end

-- CREATE TEST SCRIPT
print("✓ Creating Test Interface...")

local Window = BYTELES:CreateWindow({
    Name = "TESTE SCRIPT #Verified"
})

-- Main Tab
local MainTab = Window:CreateTab("Main")

MainTab:CreateLabel("━━━━━ Welcome to TESTE SCRIPT! ━━━━━")

MainTab:CreateButton({
    Name = "Print Hello World",
    Callback = function()
        print("✓ Hello World from BYTELES!")
    end
})

MainTab:CreateButton({
    Name = "Print Player Info",
    Callback = function()
        print("━━━━━━━━━ PLAYER INFO ━━━━━━━━━")
        print("✓ Username: " .. Player.Name)
        print("✓ DisplayName: " .. Player.DisplayName)
        print("✓ UserId: " .. Player.UserId)
        print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━")
    end
})

MainTab:CreateToggle({
    Name = "Auto Print Toggle",
    Flag = "AutoPrint",
    CurrentValue = false,
    Callback = function(value)
        print("✓ Auto Print: " .. tostring(value))
    end
})

MainTab:CreateLabel("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━")

MainTab:CreateButton({
    Name = "Copy Username",
    Callback = function()
        if setclipboard then
            setclipboard(Player.Name)
            print("✓ Copied: " .. Player.Name)
        else
            print("✗ Clipboard not supported")
        end
    end
})

-- Selection Tab
local SelectTab = Window:CreateTab("Selection")

SelectTab:CreateLabel("━━━━━ Dropdown Options ━━━━━")

SelectTab:CreateDropdown({
    Name = "Select Mode",
    Flag = "GameMode",
    Options = {"Classic", "Hardcore", "Creative", "Adventure"},
    CurrentOption = "Classic",
    Callback = function(option)
        print("✓ Selected: " .. option)
    end
})

SelectTab:CreateDropdown({
    Name = "Select Difficulty",
    Flag = "Difficulty",
    Options = {"Easy", "Normal", "Hard", "Expert"},
    CurrentOption = "Normal",
    Callback = function(option)
        print("✓ Difficulty: " .. option)
    end
})

SelectTab:CreateLabel("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━")

SelectTab:CreateButton({
    Name = "Print Selections",
    Callback = function()
        print("━━━━━━━━━ SELECTIONS ━━━━━━━━━")
        print("✓ Game Mode: " .. (_G.BYTELES_State.DropdownsState["GameMode"] or "None"))
        print("✓ Difficulty: " .. (_G.BYTELES_State.DropdownsState["Difficulty"] or "None"))
        print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━")
    end
})

-- Settings Tab
local SettingsTab = Window:CreateTab("Settings")

SettingsTab:CreateLabel("━━━━━ Theme Settings ━━━━━")

SettingsTab:CreateColorPicker({
    Name = "Theme Color",
    Flag = "ThemeColor",
    DefaultColor = Color3.fromRGB(60, 130, 220),
    Callback = function(color)
        Window:UpdateThemeColor(color)
        print("✓ Theme updated!")
    end
})

SettingsTab:CreateLabel("━━━━━ Toggle Features ━━━━━")

SettingsTab:CreateToggle({
    Name = "Feature Alpha",
    Flag = "FeatureAlpha",
    CurrentValue = false,
    Callback = function(value)
        print("✓ Feature Alpha: " .. tostring(value))
    end
})

SettingsTab:CreateToggle({
    Name = "Feature Beta",
    Flag = "FeatureBeta",
    CurrentValue = false,
    Callback = function(value)
        print("✓ Feature Beta: " .. tostring(value))
    end
})

SettingsTab:CreateToggle({
    Name = "Feature Gamma",
    Flag = "FeatureGamma",
    CurrentValue = true,
    Callback = function(value)
        print("✓ Feature Gamma: " .. tostring(value))
    end
})

SettingsTab:CreateLabel("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━")

SettingsTab:CreateButton({
    Name = "Print All Settings",
    Callback = function()
        print("━━━━━━━━━ ALL SETTINGS ━━━━━━━━━")
        print("✓ Toggles:")
        for key, value in pairs(_G.BYTELES_State.TogglesState) do
            print("  • " .. key .. ": " .. tostring(value))
        end
        print("✓ Dropdowns:")
        for key, value in pairs(_G.BYTELES_State.DropdownsState) do
            print("  • " .. key .. ": " .. value)
        end
        print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━")
    end
})

-- Credits Tab
local CreditsTab = Window:CreateTab("Credits")

CreditsTab:CreateLabel("━━━━━ TESTE SCRIPT #Verified ━━━━━")
CreditsTab:CreateLabel("Version: 2.0.0 - Advanced")
CreditsTab:CreateLabel("Status: Verified ✓")
CreditsTab:CreateLabel("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━")
CreditsTab:CreateLabel("Created by: ByteBandit_ofici")
CreditsTab:CreateLabel("Library: BYTELES UI v2.0")
CreditsTab:CreateLabel("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━")

CreditsTab:CreateButton({
    Name = "Print Credits",
    Callback = function()
        print("━━━━━━━━━ CREDITS ━━━━━━━━━")
        print("✓ Script: TESTE SCRIPT #Verified")
        print("✓ Version: 2.0.0")
        print("✓ Creator: ByteBandit_ofici")
        print("✓ Library: BYTELES UI")
        print("✓ Features:")
        print("  • Minimize/Restore GUI")
        print("  • User Info Display")
        print("  • State Persistence")
        print("  • Theme Color Picker")
        print("  • Dropdowns & Toggles")
        print("━━━━━━━━━━━━━━━━━━━━━━━━━━")
    end
})

CreditsTab:CreateLabel("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━")

CreditsTab:CreateButton({
    Name = "Reset All Settings",
    Callback = function()
        _G.BYTELES_State = {
            ThemeColor = Color3.fromRGB(60, 130, 220),
            TogglesState = {},
            DropdownsState = {},
            SlidersState = {},
            ColorPickerState = {}
        }
        print("✓ All settings reset! Reload the script.")
    end
})

print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━")
print("✓ TESTE SCRIPT #Verified v2.0 Loaded!")
print("✓ All features ready:")
print("  ✓ Minimize/Restore Button")
print("  ✓ User Avatar & Info")
print("  ✓ State Persistence")
print("  ✓ Theme Color Picker")
print("  ✓ Dropdowns & Toggles")
print("  ✓ Draggable Minimize Icon")
print("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━")
