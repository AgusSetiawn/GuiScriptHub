-- FINAL TEST - Clean version from working base
print("==========================================")
print("  XZNELIB FINAL TEST")
print("==========================================")
print("")

-- Test 1: Download from GitHub
print("[1/3] Downloading from GitHub...")
local url = "https://raw.githubusercontent.com/AgusSetiawn/GuiScriptHub/main/lib/XZNELib.lua"

local success, response = pcall(function()
    return game:HttpGet(url, true)
end)

if not success then
    error("[FAILED] Download error: " .. tostring(response))
end

print("[1/3] ✅ Downloaded successfully (" .. #response .. " bytes)")
print("")

-- Test 2: Load library
print("[2/3] Loading library...")
local loadSuccess, Library = pcall(function()
    return loadstring(response)()
end)

if not loadSuccess then
    error("[FAILED] Load error: " .. tostring(Library))
end

print("[2/3] ✅ Library loaded!")
print("")

-- Test 3: Test notification (triggers Icon function)
print("[3/3] Testing notification (Icon system)...")

local notifySuccess, notifyErr = pcall(function()
    Library:MakeNotify({
        Title = "SUCCESS!",
        Description = "XZNELib loaded and working perfectly!",
        Time = 5
    })
end)

if not notifySuccess then
    error("[FAILED] Notification error: " .. tostring(notifyErr))
end

print("[3/3] ✅ Notification works!")
print("")
print("==========================================")
print("  ✅ ALL TESTS PASSED!")
print("==========================================")
print("")
print("Library is ready! No ImageRectSize errors!")
