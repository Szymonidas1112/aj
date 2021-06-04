if game.PlaceId == 5774073359 then
  local colors = {
    SchemeColor = Color3.fromRGB(51, 0, 102),
    Background = Color3.fromRGB(0, 0, 0),
    Header = Color3.fromRGB(0, 0, 0),
    TextColor = Color3.fromRGB(153, 50, 204),
    ElementColor = Color3.fromRGB(0, 0, 0)
}

    local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
    local Window = Library.CreateLib("Eat Sand Simulator AU", colors)
    local Tab = Window:NewTab("Main")
    local TeleportsSection = Tab:NewSection("Teleports")
    local TogglesSection = Tab:NewSection("Toggles")
    TeleportsSection:NewButton("ATM", "Teleports to Atm", function(v)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.ATM.CFrame
    end)
    TeleportsSection:NewButton("Chest", "Teleports to chest", function(v)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = gaame.Workspace.Chest.CFrame
    end)
    TogglesSection:NewToggle("TogglePunch", "Loop Punch", function(state)
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
TogglesSection:NewToggle("Toggle Rebirth", "Loop Rebirth", function(state)
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
TeleportsSection:NewButton("Safe", "Teleports to safe", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.Safe.CFrame
end)
TeleportsSection:NewButton("Sand Mound", "Teleports to Sand Mound", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.SandMound.CFrame
end)
TeleportsSection:NewButton("Sand Castle", "Teleports to Sand Castle", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.SandCastle.CFrame
end)
TeleportsSection:NewButton("Monster Plus", "Teleports to Monster Plus", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.MonsterPlus.Handle.CFrame
end)
PlayerSection:NewButton("Ctrl Tp", "Hold ctrl and click to tp", function()
local Plr = game:GetService("Players").LocalPlayer
local Mouse = Plr:GetMouse()

Mouse.Button1Down:connect(function()
if not game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.LeftControl) then return end
if not Mouse.Target then return end
mouse = game.Players.LocalPlayer:GetMouse()
local pos = mouse.Hit+Vector3.new(0,2.5,0)
pos = CFrame.new(pos.X,pos.Y,pos.Z)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = pos
end)
end)
PlayerSection:NewButton("Toggle Fly", "Press E to toggle fly", function()
    repeat wait() until game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:findFirstChild("Torso") and game.Players.LocalPlayer.Character:findFirstChild("Humanoid")
local mouse = game.Players.LocalPlayer:GetMouse()
repeat wait() until mouse
  local plr = game.Players.LocalPlayer
  local torso = plr.Character.Torso
  local flying = true
  local deb = true
  local ctrl = {f = 0, b = 0, l = 0, r = 0}
  local lastctrl = {f = 0, b = 0, l = 0, r = 0}
  local maxspeed = 50
  local speed = 0

  function Fly()
    local bg = Instance.new("BodyGyro", torso)
    bg.P = 9e4
    bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
    bg.cframe = torso.CFrame
    local bv = Instance.new("BodyVelocity", torso)
    bv.velocity = Vector3.new(0,0.1,0)
    bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
    repeat wait()
      if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then
        speed = speed+.5+(speed/maxspeed)
        if speed > maxspeed then
          speed = maxspeed
        end
      elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then
        speed = speed-1
        if speed < 0 then
          speed = 0
        end
      end
      if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then
        bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f+ctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l+ctrl.r,(ctrl.f+ctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
        lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r}
      elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then
        bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f+lastctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l+lastctrl.r,(lastctrl.f+lastctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
      else
        bv.velocity = Vector3.new(0,0.1,0)
      end
      bg.cframe = game.Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f+ctrl.b)*50*speed/maxspeed),0,0)
    until not flying
    ctrl = {f = 0, b = 0, l = 0, r = 0}
    lastctrl = {f = 0, b = 0, l = 0, r = 0}
    speed = 0
    bg:Destroy()
    bv:Destroy()
  end
  mouse.KeyDown:connect(function(key)
  if key:lower() == "e" then
    if flying then flying = false
  else
    flying = true
    Fly()
  end
elseif key:lower() == "w" then
  ctrl.f = 1
elseif key:lower() == "s" then
  ctrl.b = -1
elseif key:lower() == "a" then
  ctrl.l = -1
elseif key:lower() == "d" then
  ctrl.r = 1
end
end)
mouse.KeyUp:connect(function(key)
if key:lower() == "w" then
  ctrl.f = 0
elseif key:lower() == "s" then
  ctrl.b = 0
elseif key:lower() == "a" then
  ctrl.l = 0
elseif key:lower() == "d" then
  ctrl.r = 0
end
end)
Fly()
end)
TogglesSection:NewButton("Autoclicker", "Press  g to toggle", function()
  local Key = "F2"
local AutoClickerData = Instance.new("ScreenGui")
local Enabled = Instance.new("TextLabel")

AutoClickerData.Name = "AutoClickerData"
AutoClickerData.Parent = game.CoreGui

Enabled.Name = "Enabled"
Enabled.Parent = AutoClickerData
Enabled.BackgroundColor3 = Color3.new(1, 1, 1)
Enabled.Size = UDim2.new(0, 200, 0, 50)
Enabled.Visible = false
Enabled.Font = Enum.Font.SourceSans
Enabled.Text = "nope"
Enabled.TextColor3 = Color3.new(0, 0, 0)
Enabled.TextSize = 14




function onKeyPress(inputObject, gameProcessedEvent)
   if inputObject.KeyCode == Enum.KeyCode[Key] then
      if Enabled.Text == "nope" then
  Enabled.Text = "yes"
      while Enabled.Text == "yes" do
    wait(0.01)
mouse1click()
end
       else
   Enabled.Text = "nope"
end
   end
end

game:GetService("UserInputService").InputBegan:connect(onKeyPress)
end)
end
