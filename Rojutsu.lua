  local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Allinity/Allinity-Hub/main/Test"))()
  WindowYSize = 545
  WindowTheme = Color3.fromRGB(233, 134, 111)
  Window = Library:Window("Wulphset", WindowTheme, WindowYSize)
  Tab = Window:Tab("Main")
  Section = Tab:Section("Farming")

  --// Declarations
  local getPlayer = game:GetService("Players").LocalPlayer;
  local getEvent = workspace.EventHolder.Combat_Damage.Reactor;

  do --// Grabbibg Player / Mob tables

    Mob = {}
    for _,v in pairs(game:GetService("Workspace"):GetChildren()) do
      if (v:FindFirstChild("Spawn") and not table.find(Mob, v.Name)) then
        table.insert(Mob, v.Name)
      end;
    end;
  
    PlayersEnv = {}
    for _,v in pairs(game:GetService("Players"):GetPlayers()) do
      if (v ~= getPlayer) then
        table.insert(PlayersEnv, v.Name)
      end;
    end;
  
  end;

  --// Insta Kill function (insert after Damage function)
  local function instKill(Value)
    if (Value.Humanoid.Health < Value.Humanoid.MaxHealth) then
      Value.Humanoid.Health = 0
    end;
  end;

  Window:Label("Rojutsu Blox", Color3.fromRGB(255, 255, 255))

  Section:Toggle("Auto-Farm", function(getFarm)
      autoFarm = getFarm
  end)

  Section:Toggle("Kill-Target", function(getFarmPlayer)
    autoFarmPlayer = getFarmPlayer
  end)

  Section:Dropdown("Enemy Type", Mob, function(getMob)
    Mob = getMob
  end)

  Section:Dropdown("Target Player", PlayersEnv, function(getPlayersEnv)
    PlayersEnv = getPlayersEnv
  end)

  Section:Button("Hide-Name", pcall(function()
      getPlayer.Character.Head.Overhead:Destroy()
  end))

  Section:Button("Copy Discord Invite", function()
    setclipboard("https://discord.gg/7wuQt9SeHe")
    wait()
    messagebox("The Discord invite has been pasted to your clipboard", "Script Notifier", 0)
  end)

  --// Auto-Farm
  coroutine.wrap(function()
    while wait() do
      pcall(function()

      local getChild = game:GetService("Workspace"):GetChildren()
      for i = 1,#getChild do local v = getChild[i]
        if (autoFarm and v.Name == Mob and v.Humanoid.Health > 0) then 

          repeat wait()
            getPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0,-6,0) * CFrame.Angles(math.rad(90),0,0)
              getEvent:FireServer("Yes");
            pcall(instKill, v)
                
          if (v.Humanoid.Health <= 0) then 
            getPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0,3000,0)
              end;
                
            until (v.Humanoid.Health <= 0 or not autoFarm)
        
          end; 
        end;

      end);
    end;
  end)();


  --// Kill Players
  coroutine.wrap(function()
    while wait() do
      pcall(function()

      local getPlayers = game:GetService("Players"):GetPlayers()
      for i = 1,#getPlayers do local v = getPlayers[i]
        if (autoFarmPlayer and v.Name == PlayersEnv and v.Character and v.Character.Humanoid.Health > 0) then

          repeat wait()
            getPlayer.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame * CFrame.new(0,-6,0) * CFrame.Angles(math.rad(90),0,0)
              getEvent:FireServer("Yes");
                
          if (v.Character.Humanoid.Health <= 0) then 
            getPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0,3000,0)
              end;
                
            until (v.Character.Humanoid.Health <= 0 or not autoFarmPlayer)

          end;
        end;

      end);
    end;
  end)();

  --// No-Clip
  game:GetService("RunService").Stepped:Connect(function()
    if (getPlayer.Character and autoFarm or autoFarmPlayer) then
      getPlayer.Character.Humanoid:ChangeState(11)
    end;
  end);

