-- MM2Pro | Made by SpiderGlitch | Owner: ZackEsmeroFox1

local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local MarketplaceService = game:GetService("MarketplaceService")

local ProUnlocked = false
local GamepassID = 3593217397 -- Your Gamepass ID

-- Create ScreenGui
local mainGui = Instance.new("ScreenGui")
mainGui.Name = "MM2ProGUI"
mainGui.ResetOnSpawn = false
mainGui.Parent = playerGui

-- Main Frame
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 400, 0, 300)
mainFrame.Position = UDim2.new(0.5, -200, 0.5, -150)
mainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
mainFrame.BorderSizePixel = 0
mainFrame.Parent = mainGui

-- Title
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 50)
title.Position = UDim2.new(0, 0, 0, 0)
title.BackgroundTransparency = 1
title.Text = "MM2Pro - Owner: ZackEsmeroFox1"
title.Font = Enum.Font.GothamBold
title.TextSize = 24
title.TextColor3 = Color3.fromRGB(0, 255, 0)
title.Parent = mainFrame

-- Tabs
local normalTab = Instance.new("TextButton")
normalTab.Size = UDim2.new(0.5, 0, 0, 40)
normalTab.Position = UDim2.new(0, 0, 0, 50)
normalTab.Text = "Normal"
normalTab.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
normalTab.TextColor3 = Color3.new(1,1,1)
normalTab.Parent = mainFrame

local proTab = Instance.new("TextButton")
proTab.Size = UDim2.new(0.5, 0, 0, 40)
proTab.Position = UDim2.new(0.5, 0, 0, 50)
proTab.Text = "Pro"
proTab.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
proTab.TextColor3 = Color3.new(1,1,1)
proTab.Parent = mainFrame

-- Content Frame
local contentFrame = Instance.new("Frame")
contentFrame.Size = UDim2.new(1, 0, 1, -90)
contentFrame.Position = UDim2.new(0, 0, 0, 90)
contentFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
contentFrame.BorderSizePixel = 0
contentFrame.Parent = mainFrame

local function clearContent()
    for _,v in pairs(contentFrame:GetChildren()) do
        if not v:IsA("UIListLayout") then
            v:Destroy()
        end
    end
end

-- Functions
local function shootMurderer()
    print("Sharp shooting murderer...")
end

local function throwKnife()
    print("Sharp throwing knife...")
end

-- Tab Buttons
normalTab.MouseButton1Click:Connect(function()
    clearContent()

    local shotButton = Instance.new("TextButton")
    shotButton.Size = UDim2.new(0, 200, 0, 50)
    shotButton.Position = UDim2.new(0.5, -100, 0.2, 0)
    shotButton.Text = "Shoot Murderer"
    shotButton.BackgroundColor3 = Color3.fromRGB(100, 100, 255)
    shotButton.TextColor3 = Color3.new(1,1,1)
    shotButton.Parent = contentFrame
    shotButton.MouseButton1Click:Connect(function()
        print("Regular shot at murderer.")
    end)

    local throwButton = Instance.new("TextButton")
    throwButton.Size = UDim2.new(0, 200, 0, 50)
    throwButton.Position = UDim2.new(0.5, -100, 0.5, 0)
    throwButton.Text = "Throw Knife"
    throwButton.BackgroundColor3 = Color3.fromRGB(255, 100, 100)
    throwButton.TextColor3 = Color3.new(1,1,1)
    throwButton.Parent = contentFrame
    throwButton.MouseButton1Click:Connect(function()
        print("Regular throw knife.")
    end)
end)

proTab.MouseButton1Click:Connect(function()
    clearContent()

    local function checkOwnsPass()
        local success, owns = pcall(function()
            return MarketplaceService:UserOwnsGamePassAsync(player.UserId, GamepassID)
        end)
        return success and owns
    end

    if player.UserId == 3593217397 or checkOwnsPass() then
        -- Owner or bought
        local sharpShoot = Instance.new("TextButton")
        sharpShoot.Size = UDim2.new(0, 200, 0, 50)
        sharpShoot.Position = UDim2.new(0.5, -100, 0.2, 0)
        sharpShoot.Text = "Sharp Shoot Murd"
        sharpShoot.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
        sharpShoot.TextColor3 = Color3.new(1,1,1)
        sharpShoot.Parent = contentFrame
        sharpShoot.MouseButton1Click:Connect(function()
            shootMurderer()
        end)

        local sharpThrow = Instance.new("TextButton")
        sharpThrow.Size = UDim2.new(0, 200, 0, 50)
        sharpThrow.Position = UDim2.new(0.5, -100, 0.5, 0)
        sharpThrow.Text = "Sharp Throw Knife"
        sharpThrow.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
        sharpThrow.TextColor3 = Color3.new(1,1,1)
        sharpThrow.Parent = contentFrame
        sharpThrow.MouseButton1Click:Connect(function()
            throwKnife()
        end)

    else
        -- Must buy
        local buyButton = Instance.new("TextButton")
        buyButton.Size = UDim2.new(0, 250, 0, 100)
        buyButton.Position = UDim2.new(0.5, -125, 0.4, 0)
        buyButton.Text = "Buy MM2Pro (100 Robux)"
        buyButton.BackgroundColor3 = Color3.fromRGB(255, 215, 0)
        buyButton.TextColor3 = Color3.new(0,0,0)
        buyButton.Parent = contentFrame
        buyButton.MouseButton1Click:Connect(function()
            MarketplaceService:PromptGamePassPurchase(player, GamepassID)
        end)
    end
end)

-- Open Normal tab by default
normalTab:MouseButton1Click()

-- Welcome print
print("MM2Pro Loaded | Made by SpiderGlitch | Owner: ZackEsmeroFox1")
