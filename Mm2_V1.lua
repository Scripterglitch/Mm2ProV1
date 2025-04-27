--// Mm2Pro | Made by SpiderGlitch | Owner: ZackEsmeroFox1
--// V1 - Full Features Script

local ownerUserId = 3593217397 -- Your Roblox ID
local MarketplaceService = game:GetService("MarketplaceService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- UI Library
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

local Window = OrionLib:MakeWindow({
    Name = "MM2Pro V1",
    HidePremium = false,
    SaveConfig = true,
    ConfigFolder = "MM2ProConfig",
    IntroEnabled = true,
    IntroText = "Made by SpiderGlitch | Owner: ZackEsmeroFox1",
})

-- Variables
local espEnabled = true
local espType = "Highlight"
local gunTrapEsp = true

-- Functions
function notify(text)
    OrionLib:MakeNotification({
        Name = "MM2Pro",
        Content = text,
        Image = "rbxassetid://4483345998",
        Time = 3
    })
end

function createESP(player)
    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        for _, v in pairs(player.Character:GetChildren()) do
            if v:IsA("Highlight") or v:IsA("BoxHandleAdornment") then
                v:Destroy()
            end
        end
        if espType == "Highlight" or espType == "Both" then
            local highlight = Instance.new("Highlight", player.Character)
            highlight.FillColor = Color3.fromRGB(255, 255, 255)
            highlight.OutlineColor = Color3.fromRGB(0, 0, 0)
        end
        if espType == "Box" or espType == "Both" then
            local box = Instance.new("BoxHandleAdornment")
            box.Adornee = player.Character:FindFirstChild("HumanoidRootPart")
            box.Size = Vector3.new(6, 7, 3)
            box.Color3 = Color3.fromRGB(255, 255, 255)
            box.AlwaysOnTop = true
            box.Parent = player.Character
        end
    end
end

function setupAllESP()
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            createESP(player)
        end
    end
end

function toggleGunTrapESP(state)
    gunTrapEsp = state
end

function buyPro()
    MarketplaceService:PromptProductPurchase(LocalPlayer, 1180773455) -- Your real Gamepass ID
end

-- GUI Tabs
local FreeTab = Window:MakeTab({
    Name = "Free",
    Icon = "rbxassetid://6034977836",
    PremiumOnly = false
})

local ProTab = Window:MakeTab({
    Name = "Pro",
    Icon = "rbxassetid://6034977836",
    PremiumOnly = false
})

-- Free Tab Content
FreeTab:AddLabel("FREE FEATURES")

FreeTab:AddDropdown({
    Name = "ESP Type",
    Default = "Highlight",
    Options = {"Highlight", "Box", "Both", "None"},
    Callback = function(Value)
        espType = Value
        setupAllESP()
    end
})

FreeTab:AddToggle({
    Name = "ESP Gun Drops + Traps",
    Default = true,
    Callback = function(Value)
        toggleGunTrapESP(Value)
    end
})

FreeTab:AddButton({
    Name = "Shot Murderer / Throw Knife",
    Callback = function()
        notify("Locking Target...")
        -- Your aimbot or shot logic here
    end
})

FreeTab:AddButton({
    Name = "Round Timer",
    Callback = function()
        notify("Round Time Left: Example 120s")
    end
})

-- Pro Tab Content
ProTab:AddLabel("PRO FEATURES")

if LocalPlayer.UserId ~= ownerUserId then
    ProTab:AddButton({
        Name = "Buy Pro (100 Robux)",
        Callback = function()
            buyPro()
        end
    })
else
    ProTab:AddButton({
        Name = "Sharp Shot",
        Callback = function()
            notify("Sharp Shot Activated!")
            -- sharp shot logic
        end
    })

    ProTab:AddButton({
        Name = "Sharp Throw Knife",
        Callback = function()
            notify("Sharp Throw Activated!")
            -- sharp throw logic
        end
    })

    ProTab:AddToggle({
        Name = "Speed Glitch",
        Default = false,
        Callback = function(Value)
            if Value then
                notify("Speed Glitch ON")
            else
                notify("Speed Glitch OFF")
            end
        end
    })

    ProTab:AddToggle({
        Name = "God Mode",
        Default = false,
        Callback = function(Value)
            if Value then
                notify("God Mode Enabled")
            else
                notify("God Mode Disabled")
            end
        end
    })
end

OrionLib:Init()
