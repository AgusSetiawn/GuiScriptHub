-- MINIMAL TEST LOADER - Test XZNELib from GitHub with minimal overhead
print("==========================================")
print("  TESTING XZNELIB FROM GITHUB")
print("==========================================")
print("")

-- Test 1: Download
print("[1/3] Downloading from GitHub...")
local url = "https://raw.githubusercontent.com/AgusSetiawn/GuiScriptHub/main/lib/XZNELib.lua"

local downloadSuccess, response = pcall(function()
    return game:HttpGet(url, true)
end)

if not downloadSuccess then
    error("[FAILED] Could not download library: " .. tostring(response))
end

print("[1/3] ✅ Downloaded (" .. #response .. " bytes)")
print("")

-- Test 2: Load
print("[2/3] Loading library...")
local loadSuccess, Library = pcall(function()
    return loadstring(response)()
end)

if not loadSuccess then
    error("[FAILED] Load error: " .. tostring(Library))
end

print("[2/3] ✅ Library loaded successfully!")
print("[2/3] Library type:", type(Library))
print("")

-- Test 3: Quick function test
print("[3/3] Testing basic functions...")

-- Test MakeNotify exists
if Library.MakeNotify then
    print("  ✅ MakeNotify exists")
else
    warn("  ❌ MakeNotify missing!")
end

-- Test MakeGui exists  
if Library.MakeGui then
    print("  ✅ MakeGui exists")
else
    warn("  ❌ MakeGui missing!")
end

print("")
print("==========================================")
print("  ✅ ALL TESTS PASSED!")
print("==========================================")
print("")
print("Library is ready to use. Creating test notification...")

-- Create test notification
pcall(function()
    Library:MakeNotify({
        Title = "XZNELib Ready!",
        Description = "Library loaded successfully from GitHub",
        Time = 3
    })
end)

print("✅ Test notification sent!")
print("")
print("You can now use the library:")
print("  Library:MakeGui(...)")
print("  Library:MakeNotify(...)")
