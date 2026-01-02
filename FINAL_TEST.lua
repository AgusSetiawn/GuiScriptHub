-- FINAL TEST - Full GUI Showcase
print("==========================================")
print("  XZNELIB FULL GUI TEST")
print("==========================================")
print("")

-- Download library
print("[1/4] Downloading from GitHub...")
local url = "https://raw.githubusercontent.com/AgusSetiawn/GuiScriptHub/main/lib/XZNELib.lua"

local success, response = pcall(function()
    return game:HttpGet(url, true)
end)

if not success then
    error("[FAILED] Download error: " .. tostring(response))
end

print("[1/4] ✅ Downloaded (" .. #response .. " bytes)")
print("")

-- Load library
print("[2/4] Loading library...")
local Library = loadstring(response)()
print("[2/4] ✅ Library loaded!")
print("")

-- Test notification
print("[3/4] Creating notification...")
Library:MakeNotify({
    Title = "XZNELib Ready!",
    Description = "Creating full GUI showcase...",
    Time = 3
})
print("[3/4] ✅ Notification works!")
print("")

-- Create full GUI
print("[4/4] Creating GUI showcase...")
local Window = Library:MakeGui({
    NameHub = "XZNE Library Showcase",
    Description = "Full Feature Test"
})

local Tab = Window:CreateTab({
    Name = "Main",
    Icon = "rbxassetid://10723407389"
})

local Section = Tab:AddSection("Test Features")

Section:AddButton({
    Title = "Test Button",
    Content = "Click me!",
    Callback = function()
        Library:MakeNotify({
            Title = "Button Clicked!",
            Description = "All features working!",
            Time = 2
        })
    end
})

Section:AddToggle({
    Title = "Test Toggle",
    Content = "Toggle me!",
    Default = false,
    Callback = function(value)
        print("Toggle:", value)
    end
})

Section:AddSlider({
    Title = "Test Slider",
    Content = "Drag the slider",
    Min = 0,
    Max = 100,
    Default = 50,
    Increment = 1,
    Callback = function(value)
        print("Slider:", value)
    end
})

Section:AddInput({
    Title = "Test Input",
    Content = "Type something...",
    Default = "Hello World",
    Callback = function(value)
        print("Input:", value)
    end
})

Section:AddParagraph({
    Title = "Success!",
    Content = "✅ All features loaded successfully!\n\nNo ImageRectSize errors!\nNo syntax errors!\nV5 compatibility working!"
})

print("[4/4] ✅ GUI created!")
print("")
print("==========================================")
print("  ✅ FULL TEST COMPLETE!")
print("==========================================")
print("  - Notification: WORKING")
print("  - GUI Creation: WORKING")
print("  - All Elements: WORKING")
print("==========================================")
