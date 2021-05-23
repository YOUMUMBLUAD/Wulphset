local Material = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kinlei/MaterialLua/master/Module.lua"))()


local X = Material.Load({
    Title = "Wulphset: Solo Blox Leveling",
    Style = 3,
    SizeX = 350,
    SizeY = 300,
    Theme = "Dark",
    ColorOverrides = {
        MainFrame = Color3.fromRGB(17,17,17)
    }})

    local V = X.New({
        Title = "Farming"
    })

    --// GUI Declarations
    local A = V.Toggle({Text = "Auto-Farm", Callback = function(State)
      autoFarm = State
    end, Enabled = false})

    local B = V.Button({Text = "Created by Invell", Callback = function()
      warn("Who is Candice?")
    end})

    local C = V.Button({Text = "(Click for Discord Link)", Callback = function()
      setclipboard("https://discord.gg/7wuQt9SeHe")
      wait(1)
      X.Banner({Text = "Discord Link Copied to Clipboard"})
    end})
 
    --// Declarations
    local getPlayer = game:GetService("Players").LocalPlayer;
    local getBlade = getPlayer.Character.Sword.Blade;
    local getPlayerBlade = getPlayer.Backpack.sumbagay.RemoteEvent

    --// Creating Tween Function
    local function TweenTo(Time, Targ)
      local TweenService = game:GetService("TweenService");
      PlayTween = TweenService:Create(getPlayer.Character.HumanoidRootPart, TweenInfo.new(Time, Enum.EasingStyle.Linear),  {CFrame = Targ}):Play()
    end

    do --// Do blocks winning always

      --// Debris > Destroy() 
      local Debris = game:GetService("Debris")
    
      --// Removing Anti-Cheat
      pcall(function()
      getPlayer.Character.Punchonwall.Parent = game:GetService("Players")
        wait(2)
      Debris:AddItem(game:GetService("Players").Punchonwall, 1)
      end)
    
    end;
    --// Main Script
    coroutine.wrap(function()
      while wait() do
        if (autoFarm) then

        local getChild = game:GetService("Workspace"):GetChildren()
        for i = 1,#getChild do local v = getChild[i]
          if (v:FindFirstChild("Reward") and v.Humanoid.Health > 0) then 

            pcall(function() repeat wait()
              getPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0,0,math.random(2, 12))
                getPlayerBlade:FireServer("AGDSGSDG", 3, getBlade)
              until (v.Humanoid.Health <= 0 or not autoFarm) 
            end);

            end; 
          end;
        end;
      end;

    end)();

    --// No-Clip
    game:GetService("RunService").Stepped:Connect(function()
      if (getPlayer.Character and autoFarm) then
        getPlayer.Character.Humanoid:ChangeState(11)
      end;
    end);
