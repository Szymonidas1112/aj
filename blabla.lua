if game.PlaceId == 5774073359 then
    local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
    local Window = Library.CreateLib("Eat Shit Simulator", "Sentinel")
    local Tab = Window:NewTab("Main")
    local TeleportsSection = Tab:NewSection("Teleports")
    TeleportsSection:NewButton("ATM", "tp to atm", function(v)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.ATM.CFrame
    end)
    TeleportsSection:NewButton("Chest", "tp to chest", function(v)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.Chest.CFrame
    end)
    TeleportsSection:NewToggle("TogglePunch", "Loop Punch", function(state)
    if state then
    _G.Toggle = true

    while _G.Toggle do
    wait()
    while true do
    wait(0)
    game:GetService("Players").LocalPlayer.Character.Combat.Attack:FireServer()
    end
    end

    else
        _G.Toggle = false

    while _G.Toggle do
    wait()
    while true do
    wait(0)
    game:GetService("Players").LocalPlayer.Character.Combat.Attack:FireServer()
    end
    end
    end
end)
TeleportsSection:NewToggle("Toggle Rebirth", "Loop Rebirth", function(state)
    if state then
        _G.Toggle = true

while _G.Toggle do
wait(0.1)
game.ReplicatedStorage.Rebirth:FireServer()
end
    else
        _G.Toggle = false

while _G.Toggle do
wait(0.1)
game.ReplicatedStorage.Rebirth:FireServer()
end
    end
end)
local Tab = Window:NewTab("Player")
local PlayerSection = Tab:NewSection("Player")
PlayerSection:NewSlider("WalkSpeed", "Changes walkspeed", 500, 0, function(s) -- 500 (MaxValue) | 0 (MinValue)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)
PlayerSection:NewButton("Set Original WalkSpeed", "Sets walkspeed to original", function()
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
end)
PlayerSection:NewSlider("JumpPower", "Changes jumppower", 500, 0, function(s) -- 500 (MaxValue) | 0 (MinValue)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = s
end)
PlayerSection:NewButton("Set Original JumpPower", "Sets jumppower to original", function()
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = 50
end)
end
