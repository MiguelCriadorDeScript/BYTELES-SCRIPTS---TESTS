# 🎯 BYTELES UI Library

<div align="center">

![BYTELES Logo](https://i.ytimg.com/vi/AHswxUYSMdw/oar2.jpg?sqp=-oaymwEiCJwEENAFSFqQAgHyq4qpAxEIARUAAAAAJQAAyEI9AICiQw==&rs=AOn4CLBolEo_M8MviRYv2lsA1DJkgEbRng)

**A modern, professional UI library for Roblox scripting**

[![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)
[![Roblox](https://img.shields.io/badge/Roblox-Compatible-brightgreen.svg)](https://www.roblox.com)
[![Version](https://img.shields.io/badge/version-1.0.0-orange.svg)](https://github.com/yourusername/BYTELES)

[Features](#-features) • [Installation](#-installation) • [Documentation](#-documentation) • [Examples](#-examples) • [Contributing](#-contributing)

</div>

---

## 📋 Table of Contents

- [Overview](#-overview)
- [Features](#-features)
- [Installation](#-installation)
- [Quick Start](#-quick-start)
- [API Reference](#-api-reference)
  - [Window Creation](#window-creation)
  - [Tab Management](#tab-management)
  - [UI Elements](#ui-elements)
- [Advanced Usage](#-advanced-usage)
- [Customization](#-customization)
- [Best Practices](#-best-practices)
- [Troubleshooting](#-troubleshooting)
- [Contributing](#-contributing)
- [License](#-license)

---

## 🌟 Overview

BYTELES is a feature-rich UI library designed specifically for Roblox script development. It provides a clean, modern interface with smooth animations and an intuitive API that makes creating professional GUIs effortless.

### Why BYTELES?

- **🎨 Modern Design**: Dark-themed interface with smooth animations
- **⚡ Performance**: Optimized for minimal resource usage
- **🔧 Flexibility**: Extensive customization options
- **📱 Responsive**: Fully draggable and adaptive UI
- **🛡️ Protected**: Built-in executor protection support
- **📚 Well-Documented**: Comprehensive documentation and examples

---

## ✨ Features

### Core Features
- ✅ Draggable windows with smooth animations
- ✅ Multiple tab support
- ✅ 7+ UI element types
- ✅ Automatic first-tab selection
- ✅ Protected GUI container support
- ✅ Responsive scrolling content
- ✅ Custom color schemes

### UI Elements
- **Button** - Execute functions with visual feedback
- **Toggle** - Binary state switches with animations
- **Slider** - Numeric value selection with range
- **Input** - Text input with validation
- **Dropdown** - Multi-option selection menus
- **Label** - Static text display
- **Paragraph** - Multi-line formatted text

### Planned Features
- 🔄 Configuration saving/loading system
- 🔐 Built-in key authentication system
- 🎭 Loading screen customization
- 🌈 Theme engine with presets
- 📊 Additional UI elements (Color Picker, Keybind, etc.)

---

## 🚀 Installation

### Method 1: Direct Loadstring (Recommended)

```lua
local BYTELES = loadstring(game:HttpGet("https://raw.githubusercontent.com/yourusername/BYTELES/main/source.lua"))()
```

### Method 2: Local File

1. Download `source.lua` from the repository
2. Load it using your executor's file system:

```lua
local BYTELES = loadstring(readfile("BYTELES/source.lua"))()
```

### Method 3: Module Require (Advanced)

```lua
local BYTELES = require(game:GetService("ReplicatedStorage").BYTELES)
```

---

## ⚡ Quick Start

Here's a simple example to get you started:

```lua
-- Load the library
local BYTELES = loadstring(game:HttpGet("YOUR_URL"))()

-- Create main window
local Window = BYTELES:CreateWindow({
    Name = "My First Script"
})

-- Create a tab
local Tab = Window:CreateTab("Home")

-- Add a button
Tab:CreateButton({
    Name = "Say Hello",
    Callback = function()
        print("Hello, BYTELES!")
    end
})

-- Add a toggle
Tab:CreateToggle({
    Name = "Enable Feature",
    CurrentValue = false,
    Callback = function(Value)
        print("Feature is now: " .. tostring(Value))
    end
})
```

---

## 📚 API Reference

### Window Creation

#### `BYTELES:CreateWindow(config)`

Creates a new window instance with specified configuration.

**Parameters:**

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `Name` | string | `"BYTELES"` | Window title displayed in top bar |
| `LoadingEnabled` | boolean | `false` | Enable loading screen on startup |
| `LoadingTitle` | string | `"BYTELES Interface"` | Loading screen main title |
| `LoadingSubtitle` | string | `"by Your Name"` | Loading screen subtitle |
| `ConfigurationSaving` | table | See below | Configuration save settings |
| `KeySystem` | boolean | `false` | Enable key authentication |
| `KeySettings` | table | See below | Key system configuration |

**ConfigurationSaving Table:**

```lua
ConfigurationSaving = {
    Enabled = false,           -- Enable/disable config saving
    FolderName = nil,          -- Folder name for configs
    FileName = "BYTELES_Config" -- Config file name
}
```

**KeySettings Table:**

```lua
KeySettings = {
    Title = "Key System",      -- Key prompt title
    Subtitle = "Enter Key",    -- Key prompt subtitle
    Key = "BYTELES_KEY"        -- Required key string
}
```

**Returns:** `Window` object

**Example:**

```lua
local Window = BYTELES:CreateWindow({
    Name = "Advanced Script Hub",
    LoadingEnabled = true,
    LoadingTitle = "Loading Script",
    LoadingSubtitle = "Please wait...",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "MyScriptConfigs",
        FileName = "Config_v1"
    }
})
```

---

### Tab Management

#### `Window:CreateTab(tabName)`

Creates a new tab in the window.

**Parameters:**

| Parameter | Type | Description |
|-----------|------|-------------|
| `tabName` | string | Name displayed on tab button |

**Returns:** `Tab` object

**Example:**

```lua
local MainTab = Window:CreateTab("Main")
local SettingsTab = Window:CreateTab("Settings")
local CreditsTab = Window:CreateTab("Credits")
```

**Note:** The first tab created is automatically selected and displayed.

---

### UI Elements

#### 1. Button

Creates a clickable button that executes a callback function.

**Syntax:**
```lua
Tab:CreateButton(config)
```

**Parameters:**

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `Name` | string | Yes | Button label text |
| `Callback` | function | Yes | Function to execute on click |

**Example:**

```lua
Tab:CreateButton({
    Name = "Teleport to Spawn",
    Callback = function()
        local player = game.Players.LocalPlayer
        player.Character.HumanoidRootPart.CFrame = CFrame.new(0, 50, 0)
        print("Teleported!")
    end
})
```

---

#### 2. Toggle

Creates a switch that maintains on/off state.

**Syntax:**
```lua
Tab:CreateToggle(config)
```

**Parameters:**

| Parameter | Type | Required | Default | Description |
|-----------|------|----------|---------|-------------|
| `Name` | string | Yes | - | Toggle label text |
| `CurrentValue` | boolean | No | `false` | Initial state |
| `Flag` | string | No | `nil` | Unique identifier for saving |
| `Callback` | function | Yes | - | Function called on state change |

**Callback Parameters:**
- `Value` (boolean) - New toggle state

**Example:**

```lua
Tab:CreateToggle({
    Name = "Auto Farm",
    CurrentValue = false,
    Flag = "AutoFarm_Toggle",
    Callback = function(Value)
        _G.AutoFarm = Value
        if Value then
            print("Auto Farm enabled")
            -- Start farming logic
        else
            print("Auto Farm disabled")
            -- Stop farming logic
        end
    end
})
```

---

#### 3. Slider

Creates a draggable slider for numeric value selection.

**Syntax:**
```lua
Tab:CreateSlider(config)
```

**Parameters:**

| Parameter | Type | Required | Default | Description |
|-----------|------|----------|---------|-------------|
| `Name` | string | Yes | - | Slider label text |
| `Range` | table | No | `{0, 100}` | Min and max values `{min, max}` |
| `Increment` | number | No | `1` | Step size for value changes |
| `CurrentValue` | number | No | `50` | Initial value |
| `Flag` | string | No | `nil` | Unique identifier for saving |
| `Callback` | function | Yes | - | Function called on value change |

**Callback Parameters:**
- `Value` (number) - New slider value

**Example:**

```lua
Tab:CreateSlider({
    Name = "Walk Speed",
    Range = {16, 200},
    Increment = 2,
    CurrentValue = 16,
    Flag = "WalkSpeed_Slider",
    Callback = function(Value)
        local player = game.Players.LocalPlayer
        if player.Character and player.Character:FindFirstChild("Humanoid") then
            player.Character.Humanoid.WalkSpeed = Value
        end
    end
})
```

---

#### 4. Input

Creates a text input field.

**Syntax:**
```lua
Tab:CreateInput(config)
```

**Parameters:**

| Parameter | Type | Required | Default | Description |
|-----------|------|----------|---------|-------------|
| `Name` | string | Yes | - | Input field label |
| `PlaceholderText` | string | No | `"Enter text..."` | Placeholder text |
| `RemoveTextAfterFocusLost` | boolean | No | `false` | Clear text after Enter pressed |
| `Flag` | string | No | `nil` | Unique identifier for saving |
| `Callback` | function | Yes | - | Function called on Enter key |

**Callback Parameters:**
- `Text` (string) - Entered text value

**Example:**

```lua
Tab:CreateInput({
    Name = "Player Username",
    PlaceholderText = "Enter username...",
    RemoveTextAfterFocusLost = true,
    Flag = "PlayerName_Input",
    Callback = function(Text)
        local targetPlayer = game.Players:FindFirstChild(Text)
        if targetPlayer then
            print("Found player: " .. targetPlayer.Name)
        else
            print("Player not found")
        end
    end
})
```

---

#### 5. Dropdown

Creates a dropdown menu with multiple options.

**Syntax:**
```lua
Tab:CreateDropdown(config)
```

**Parameters:**

| Parameter | Type | Required | Default | Description |
|-----------|------|----------|---------|-------------|
| `Name` | string | Yes | - | Dropdown label text |
| `Options` | table | No | `{"Option 1", "Option 2"}` | Array of selectable options |
| `CurrentOption` | string | No | First option | Initially selected option |
| `Flag` | string | No | `nil` | Unique identifier for saving |
| `Callback` | function | Yes | - | Function called on selection |

**Callback Parameters:**
- `Option` (string) - Selected option text

**Example:**

```lua
Tab:CreateDropdown({
    Name = "Select Weapon",
    Options = {"Sword", "Bow", "Staff", "Axe"},
    CurrentOption = "Sword",
    Flag = "Weapon_Dropdown",
    Callback = function(Option)
        print("Selected weapon: " .. Option)
        -- Equip weapon logic here
        equipWeapon(Option)
    end
})
```

---

#### 6. Label

Creates a simple text label.

**Syntax:**
```lua
Tab:CreateLabel(text)
```

**Parameters:**

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `text` | string | Yes | Label text content |

**Returns:** `TextLabel` instance

**Example:**

```lua
Tab:CreateLabel("Welcome to my script!")
Tab:CreateLabel("Version: 1.0.0")
Tab:CreateLabel("─────────────────") -- Separator line
```

---

#### 7. Paragraph

Creates a formatted text block with title and content.

**Syntax:**
```lua
Tab:CreateParagraph(config)
```

**Parameters:**

| Parameter | Type | Required | Default | Description |
|-----------|------|----------|---------|-------------|
| `Title` | string | Yes | `"Paragraph"` | Bold title text |
| `Content` | string | Yes | `"This is a paragraph."` | Body text content |

**Example:**

```lua
Tab:CreateParagraph({
    Title = "Important Information",
    Content = "This script includes auto-farming features. Make sure to follow the game rules and use responsibly. Abuse may result in bans."
})
```

---

## 🔥 Advanced Usage

### Multi-Tab Script Example

```lua
local BYTELES = loadstring(game:HttpGet("YOUR_URL"))()

local Window = BYTELES:CreateWindow({
    Name = "Advanced Script Hub v2.0"
})

-- Main Tab
local MainTab = Window:CreateTab("Main")

MainTab:CreateParagraph({
    Title = "Welcome!",
    Content = "Select features from the tabs above. Configure settings in the Settings tab."
})

MainTab:CreateButton({
    Name = "Collect All Coins",
    Callback = function()
        for _, coin in pairs(workspace.Coins:GetChildren()) do
            if coin:IsA("BasePart") then
                coin.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
            end
        end
    end
})

local autoFarmEnabled = false
MainTab:CreateToggle({
    Name = "Auto Farm",
    CurrentValue = false,
    Callback = function(Value)
        autoFarmEnabled = Value
        while autoFarmEnabled do
            wait(0.1)
            -- Auto farm logic
        end
    end
})

-- Combat Tab
local CombatTab = Window:CreateTab("Combat")

CombatTab:CreateSlider({
    Name = "Attack Range",
    Range = {5, 50},
    Increment = 1,
    CurrentValue = 10,
    Callback = function(Value)
        _G.AttackRange = Value
    end
})

CombatTab:CreateDropdown({
    Name = "Combat Mode",
    Options = {"Aggressive", "Defensive", "Balanced"},
    CurrentOption = "Balanced",
    Callback = function(Option)
        _G.CombatMode = Option
    end
})

-- Settings Tab
local SettingsTab = Window:CreateTab("Settings")

SettingsTab:CreateLabel("Character Settings")

SettingsTab:CreateSlider({
    Name = "Walk Speed",
    Range = {16, 100},
    Increment = 1,
    CurrentValue = 16,
    Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
    end
})

SettingsTab:CreateSlider({
    Name = "Jump Power",
    Range = {50, 150},
    Increment = 5,
    CurrentValue = 50,
    Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
    end
})

SettingsTab:CreateLabel("─────────────────")
SettingsTab:CreateLabel("Player Targeting")

SettingsTab:CreateInput({
    Name = "Target Player",
    PlaceholderText = "Enter player name...",
    RemoveTextAfterFocusLost = false,
    Callback = function(Text)
        _G.TargetPlayer = Text
    end
})

-- Credits Tab
local CreditsTab = Window:CreateTab("Credits")

CreditsTab:CreateParagraph({
    Title = "Script Information",
    Content = "Created by YourName\nVersion: 2.0.0\nLast Updated: December 2024"
})

CreditsTab:CreateLabel("Thanks for using BYTELES!")
```

---

## 🎨 Customization

### Color Scheme

To customize colors, modify these values in the source code:

```lua
-- Main background colors
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 30)     -- Primary
TopBar.BackgroundColor3 = Color3.fromRGB(30, 30, 35)        -- Secondary

-- Accent colors
TabButton.BackgroundColor3 = Color3.fromRGB(60, 130, 220)   -- Active tab
Button.BackgroundColor3 = Color3.fromRGB(60, 130, 220)       -- Buttons
ToggleButton.BackgroundColor3 = Color3.fromRGB(60, 130, 220) -- Active toggle

-- Element colors
ElementFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 40)  -- Element background
```

### Window Size

Modify the main window dimensions:

```lua
MainFrame.Size = UDim2.new(0, 800, 0, 500)  -- Width: 800px, Height: 500px
```

---

## 💡 Best Practices

### 1. **Use Flags for Important Settings**

```lua
Tab:CreateToggle({
    Name = "Important Feature",
    Flag = "ImportantFeature_Toggle",  -- Unique identifier
    Callback = function(Value)
        -- Your code
    end
})
```

### 2. **Organize with Multiple Tabs**

```lua
local MainTab = Window:CreateTab("Main")
local CombatTab = Window:CreateTab("Combat")
local MiscTab = Window:CreateTab("Miscellaneous")
local SettingsTab = Window:CreateTab("Settings")
```

### 3. **Use Labels as Separators**

```lua
Tab:CreateLabel("─────────── Section 1 ───────────")
Tab:CreateButton({Name = "Button 1", Callback = function() end})
Tab:CreateButton({Name = "Button 2", Callback = function() end})

Tab:CreateLabel("─────────── Section 2 ───────────")
Tab:CreateToggle({Name = "Toggle 1", Callback = function() end})
```

### 4. **Error Handling in Callbacks**

```lua
Tab:CreateButton({
    Name = "Safe Button",
    Callback = function()
        local success, error = pcall(function()
            -- Your potentially unsafe code
        end)
        
        if not success then
            warn("Error occurred: " .. tostring(error))
        end
    end
})
```

### 5. **Global State Management**

```lua
-- At the top of your script
_G.ScriptSettings = {
    AutoFarm = false,
    WalkSpeed = 16,
    TargetPlayer = nil
}

-- Use in callbacks
Tab:CreateToggle({
    Name = "Auto Farm",
    Callback = function(Value)
        _G.ScriptSettings.AutoFarm = Value
    end
})
```

---

## 🔧 Troubleshooting

### Common Issues

#### Issue: UI doesn't appear

**Solution:**
- Check if your executor supports `HttpGet`
- Verify the loadstring URL is correct
- Try using `syn.protect_gui()` if available

```lua
-- Test if library loads
local success, BYTELES = pcall(function()
    return loadstring(game:HttpGet("YOUR_URL"))()
end)

if success then
    print("Library loaded successfully!")
else
    warn("Failed to load library: " .. tostring(BYTELES))
end
```

#### Issue: Window is off-screen

**Solution:**
The window is centered by default. If off-screen, adjust position:

```lua
-- After creating window
MainFrame.Position = UDim2.new(0.5, -400, 0.5, -250)
```

#### Issue: Callbacks not firing

**Solution:**
- Ensure callback is a function
- Check for syntax errors in callback
- Add print statements to debug

```lua
Tab:CreateButton({
    Name = "Test Button",
    Callback = function()
        print("Button clicked!")  -- Debug line
        -- Your code here
    end
})
```

#### Issue: Slider not smooth

**Solution:**
- Reduce `Increment` value for smoother sliding
- Ensure range values are correct

```lua
Tab:CreateSlider({
    Name = "Smooth Slider",
    Range = {0, 100},
    Increment = 0.1,  -- Smaller increment = smoother
    CurrentValue = 50,
    Callback = function(Value) end
})
```

---

## 🤝 Contributing

We welcome contributions! Here's how you can help:

### Reporting Bugs

1. Check if the issue already exists
2. Create a detailed bug report with:
   - Steps to reproduce
   - Expected behavior
   - Actual behavior
   - Screenshots (if applicable)
   - Executor used

### Suggesting Features

Open an issue with the `enhancement` label and describe:
- Feature description
- Use case
- Mockups or examples (if applicable)

### Pull Requests

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit changes (`git commit -m 'Add AmazingFeature'`)
4. Push to branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

### Code Style Guidelines

- Use descriptive variable names
- Comment complex logic
- Follow existing code structure
- Test thoroughly before submitting

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

```
MIT License

Copyright (c) 2024 BYTELES

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

---

## 📞 Support

- **Discord**: [Join our server](https://discord.gg/your-invite)
- **Issues**: [GitHub Issues](https://github.com/yourusername/BYTELES/issues)
- **Discussions**: [GitHub Discussions](https://github.com/yourusername/BYTELES/discussions)

---

## 🌟 Acknowledgments

- Inspired by Rayfield UI Library
- Thanks to the Roblox scripting community
- Special thanks to all contributors

---

## 📊 Statistics

![GitHub stars](https://img.shields.io/github/stars/yourusername/BYTELES?style=social)
![GitHub forks](https://img.shields.io/github/forks/yourusername/BYTELES?style=social)
![GitHub watchers](https://img.shields.io/github/watchers/yourusername/BYTELES?style=social)

---

<div align="center">

**⭐ Star this repository if you find it helpful!**

Made with ❤️ by the BYTELES Team

[Back to Top](#-byteles-ui-library)

</div>
