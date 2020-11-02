local library = loadstring(game:HttpGet("https://pastebin.com/raw/qwdPKKDN"))()
local One = library.new("SCP - 3008 | Developed by Invell", 5013109572)

--Variables
getgenv().Selection = nil 

local Main = One:addPage("Main", 5012544693)
local Info = One:addPage("Information", 5012544693)
local FInfo = Info:addSection('Toggles that need activated again after death:')
local FInfo2 = Info:addSection('Remove Fall Damage\nRemove Energy Depletion')
local FMain = Main:addSection("Toggles")
local FSecond = Main:addSection("Misc")
local FThird = Main:addSection("GUI Toggle")


-- Fall Damage Remover
FMain:addButton('Remove Fall Damage', function()
    pcall(function()
        local a = game.Players.LocalPlayer.Character
        a.SmallFall:Destroy()
        a.BreakLeg:Destroy()
        a.Health:Destroy()
        a.falldamage:Destroy()
        a.Humanoid.HealthChanged:Destroy()
    end)
end)

FMain:addButton('Remove Energy Depletion', function()
    pcall(function()
        game.Players.LocalPlayer.Character.EnergyDepletion:Destroy()
    end)
end)

FSecond:addButton('Infinite Jump', function()
    pcall(function()
        local Player = game:GetService'Players'.LocalPlayer;
        local UIS = game:GetService'UserInputService';
        _G.JumpHeight = 50;

function Action(Object, Function) if Object ~= nil then Function(Object); end end

UIS.InputBegan:connect(function(UserInput)
    if UserInput.UserInputType == Enum.UserInputType.Keyboard and UserInput.KeyCode == Enum.KeyCode.Space then
        Action(Player.Character.Humanoid, function(self)
            if self:GetState() == Enum.HumanoidStateType.Jumping or self:GetState() == Enum.HumanoidStateType.Freefall then
                Action(self.Parent.HumanoidRootPart, function(self)
                    self.Velocity = Vector3.new(0, _G.JumpHeight, 0);
                end)
            end
        end)
    end
end)
    end)
end)

-- Full Bright

FSecond:addButton('Full Bright', function()
    pcall(function()
        loadstring(game:HttpGet("https://pastebin.com/raw/06iG6YkU", true))()
    end)
end)

-- Hide Name

FSecond:addButton('Hide Name', function()
    pcall(function()
        game.Players.LocalPlayer.Character.Head.Nametag:Destroy()
    end)
end)

-- GUI Toggle

FThird:addKeybind("GUI Toggle Key", Enum.KeyCode.One, function()
    print("Activated Keybind")
        One:toggle()
            end, function()
    print("Changed Keybind")
end)


