-- [[ XZNE Library Loader & Feature Showcase ]]
-- This script loads XZNELib from GitHub and demonstrates ALL available features
-- 📍 GitHub: https://github.com/AgusSetiawn/GuiScriptHub

print("╔══════════════════════════════════════════════════════╗")
print("║     XZNE Library - Complete Feature Showcase        ║")
print("╚══════════════════════════════════════════════════════╝")
print("")

-- 🔧 LOADER - Load from GitHub
local LoaderSuccess, Library = pcall(function()
    local url = "https://raw.githubusercontent.com/AgusSetiawn/GuiScriptHub/main/lib/XZNELib.lua"
    print("[LOADER] Downloading from GitHub...")
    print("[LOADER] URL:", url)
    
    local response = game:HttpGet(url, true)
    print("[LOADER] ✓ Downloaded successfully!")
    
    local lib = loadstring(response)()
    getgenv().XZNELib = lib
    return lib
end)

if not LoaderSuccess then
    warn("[LOADER] ✗ Failed to load from GitHub:", Library)
    warn("[LOADER] Falling back to local file...")
    
    -- Fallback: Load from local file
    if isfile and isfile("lib/XZNELib.lua") then
        local Success, Result = pcall(function()
            return loadstring(readfile("lib/XZNELib.lua"))()
        end)
        
        if Success then
            Library = Result
            getgenv().XZNELib = Library
            print("[LOADER] ✓ Loaded from local file")
        else
            error("[LOADER] ✗ Failed to load library: " .. tostring(Result))
        end
    else
        error("[LOADER] ✗ Library file not found!")
    end
end

print("[LOADER] ✓ XZNELib loaded successfully!")
print("")

-- 🔔 NOTIFICATION TEST
print("[TEST] Testing Notification System...")
Library:MakeNotify({
    Title = "XZNE Library Loaded",
    Description = "All systems operational!",
    Time = 4
})

task.wait(0.5)

Library:MakeNotify({
    Title = "Feature Showcase",
    Description = "Demonstrating all library capabilities",
    Time = 3
})

print("[TEST] ✓ Notifications working!")
print("")

-- 🎨 GUI CREATION
print("[GUI] Creating main window...")
local Window = Library:MakeGui({
    NameHub = "XZNE Feature Showcase",
    Description = "Complete Library Demo",
    Color = Color3.fromRGB(255, 50, 50), -- Red theme
})

print("[GUI] ✓ Main window created!")
print("")

-- 📑 TABS
print("[TABS] Creating navigation tabs...")

local HomeTab = Window:CreateTab({
    Name = "Home",
    Icon = "rbxassetid://10723407389"
})

local ElementsTab = Window:CreateTab({
    Name = "Elements",
    Icon = "rbxassetid://10723434711"
})

local ControlsTab = Window:CreateTab({
    Name = "Controls", 
    Icon = "rbxassetid://10723408992"
})

local SettingsTab = Window:CreateTab({
    Name = "Settings",
    Icon = "rbxassetid://10723408427"
})

print("[TABS] ✓ Created 4 tabs!")
print("")

-- 📝 HOME TAB - Information
local InfoSection = HomeTab:AddSection("Library Information")

InfoSection:AddParagraph({
    Title = "Welcome to XZNE Library!",
    Content = "This is a comprehensive demonstration of all available features in XZNELib."
})

InfoSection:AddParagraph({
    Title = "Features",
    Content = "✓ Modern UI Design\n✓ Custom Themes\n✓ Full V5 Compatibility\n✓ Notification System\n✓ All Element Types"
})

local StatusSection = HomeTab:AddSection("Status")

StatusSection:AddParagraph({
    Title = "System Status",
    Content = "Version: 1.0.0\nStatus: ✓ Online\nLoaded From: GitHub"
})

-- 📦 ELEMENTS TAB - All Element Types
print("[ELEMENTS] Adding all element types...")

local ButtonSection = ElementsTab:AddSection("Buttons")

ButtonSection:AddButton({
    Title = "Test Button",
    Content = "Click to trigger notification",
    Icon = "rbxassetid://10723413862",
    Callback = function()
        Library:MakeNotify({
            Title = "Button Clicked!",
            Description = "Button callback executed successfully",
            Time = 2
        })
        print("[CALLBACK] Button clicked!")
    end
})

local ToggleSection = ElementsTab:AddSection("Toggles")

local TestToggle = ToggleSection:AddToggle({
    Title = "Feature Toggle",
    Content = "Enable/disable feature",
    Default = false,
    Callback = function(Value)
        print("[CALLBACK] Toggle changed:", Value)
        Library:MakeNotify({
            Title = "Toggle " .. (Value and "ON" or "OFF"),
            Description = "Toggle state: " .. tostring(Value),
            Time = 2
        })
    end
})

-- Demonstrate programmatic control
task.spawn(function()
    task.wait(5)
    print("[AUTO] Setting toggle to true...")
    TestToggle:Set(true)
end)

local SliderSection = ElementsTab:AddSection("Sliders")

local TestSlider = SliderSection:AddSlider({
    Title = "Value Slider",
    Content = "Adjust numeric value",
    Min = 0,
    Max = 100,
    Default = 50,
    Increment = 1,
    Callback = function(Value)
        print("[CALLBACK] Slider value:", Value)
    end
})

local InputSection = ElementsTab:AddSection("Text Input")

local TestInput = InputSection:AddInput({
    Title = "Text Input",
    Content = "Enter custom text",
    Default = "Hello World",
    Callback = function(Value)
        print("[CALLBACK] Input value:", Value)
        Library:MakeNotify({
            Title = "Input Changed",
            Description = "New value: " .. Value,
            Time = 2
        })
    end
})

local DropdownSection = ElementsTab:AddSection("Dropdowns")

local TestDropdown = DropdownSection:AddDropdown({
    Title = "Single Select",
    Content = "Choose one option",
    Multi = false,
    Options = {"Option 1", "Option 2", "Option 3", "Option 4"},
    Default = "Option 1",
    Callback = function(Value)
        print("[CALLBACK] Dropdown selected:", Value)
    end
})

local MultiDropdown = DropdownSection:AddDropdown({
    Title = "Multi Select",
    Content = "Choose multiple options",
    Multi = true,
    Options = {"Feature A", "Feature B", "Feature C", "Feature D"},
    Default = {"Feature A"},
    Callback = function(Value)
        if type(Value) == "table" then
            print("[CALLBACK] Multi-select:", table.concat(Value, ", "))
        end
    end
})

-- Demonstrate dropdown refresh
task.spawn(function()
    task.wait(7)
    print("[AUTO] Refreshing dropdown options...")
    TestDropdown:Refresh({"New Option 1", "New Option 2", "New Option 3"}, "New Option 1")
end)

print("[ELEMENTS] ✓ All elements added!")
print("")

-- 🎮 CONTROLS TAB - Player Controls
local PlayerSection = ControlsTab:AddSection("Player Controls")

PlayerSection:AddSlider({
    Title = "WalkSpeed",
    Content = "Adjust player speed",
    Min = 16,
    Max = 200,
    Default = 16,
    Increment = 1,
    Callback = function(Value)
        pcall(function()
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
        end)
    end
})

PlayerSection:AddSlider({
    Title = "JumpPower",
    Content = "Adjust jump height",
    Min = 50,
    Max = 300,
    Default = 50,
    Increment = 1,
    Callback = function(Value)
        pcall(function()
            game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
        end)
    end
})

local ActionSection = ControlsTab:AddSection("Actions")

ActionSection:AddButton({
    Title = "Reset Character",
    Content = "Respawn player",
    Icon = "rbxassetid://10723410657",
    Callback = function()
        pcall(function()
            game.Players.LocalPlayer.Character:BreakJoints()
        end)
    end
})

-- ⚙️ SETTINGS TAB
local UISection = SettingsTab:AddSection("UI Controls")

UISection:AddButton({
    Title = "Show Notification",
    Content = "Test notification system",
    Icon = "rbxassetid://10709782110",
    Callback = function()
        Library:MakeNotify({
            Title = "Test Notification",
            Description = "This is a test notification from Settings tab",
            Time = 3
        })
    end
})

UISection:AddButton({
    Title = "Destroy GUI",
    Content = "Close the interface",
    Icon = "rbxassetid://10723396559",
    Callback = function()
        Window:DestroyGui()
        Library:MakeNotify({
            Title = "GUI Destroyed",
            Description = "Interface has been closed",
            Time = 3
        })
    end
})

print("╔══════════════════════════════════════════════════════╗")
print("║            XZNE Library - Ready to Use!              ║")
print("╚══════════════════════════════════════════════════════╝")
print("")
print("[INFO] All features loaded successfully!")
print("[INFO] GitHub: https://github.com/AgusSetiawn/GuiScriptHub")
print("")
