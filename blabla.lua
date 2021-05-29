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
    wait(0.1)
    game:GetService("Players").LocalPlayer.Character.Combat.Attack:FireServer()
    end
    end

    else
        _G.Toggle = false

    while _G.Toggle do
    wait()
    while true do
    wait(0.1)
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
end
