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

    local A = V.Button({Text = "Created by Invell", Callback = function()
      warn("Who is Candice?")
    end})
 
    --// Declarations
    local getPlayer = game:GetService("Players").LocalPlayer;
    local getBlade = getPlayer.Character.Sword.Blade
    local getPlayerBlade = getPlayer.Backpack.sumbagay.RemoteEvent


    do --// Do blocks winning always

      --// Debris > Destroy() 
      local Debris = game:GetService("Debris")
    
      --// Removing Anti-Cheat
      getPlayer.Character.Punchonwall.Parent = game:GetService("Players")
        wait(2)
      Debris:AddItem(game:GetService("Players").Punchonwall, 1)
    

      --// Making Hitbox bigger
      for _,v in pairs(workspace:GetDescendants()) do 
        if (v ~= game:GetService("Players").LocalPlayer.Character and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid")) then --// Removing players from the expansion
          v.HumanoidRootPart.Size = Vector3.new(20,10,20)
          v.HumanoidRootPart.CanCollide = false
          v.HumanoidRootPart.Transparency = 0.9
        end;
      end;
    
    end;
    --// Main Script
    coroutine.wrap(function()
      while wait() do
        if (autoFarm) then

        local getChild = game:GetService("Workspace"):GetChildren()
        for i = 1,#getChild do local v = getChild[i]
          if (v:FindFirstChild("Reward") and v.Humanoid.Health > 0) then 

            pcall(function() repeat 
                getPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0,6,5) * CFrame.Angles(math.rad(-45),0,0)
                  getPlayerBlade:FireServer("AGDSGSDG", 1, getBlade) wait()
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
