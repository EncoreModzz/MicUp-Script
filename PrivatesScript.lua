lib=loadstring(game:HttpGet('https://raw.githubusercontent.com/UnxableDev/libwrapper/refs/heads/main/libwrapper.lua?token=GHSAT0AAAAAACZPSK5UQJVKMCMAV76K6WP2ZY4EUNA'))()
window = lib:CreateWindow("Encore Modzz")
tab=window:CreateTab("Character")
playertab=window:CreateTab("Target")
Stalltab=window:CreateTab("Stall")
TPTab=window:CreateTab("Teleport")
ExtraTab=window:CreateTab("Extras")


spawn(function()sw1ndlernotify = loadstring(game:HttpGet('https://raw.githubusercontent.com/benomat/scripts/m/paste/sw1ndlernotify.lua'))()end)
local LocalPlayer = game.Players.LocalPlayer
function erm(t)
    return t[1]
end

tab:CreateSection("Character Speed")
spawn(function()wsBoost=loadstring(game:HttpGet("https://raw.githubusercontent.com/benomat/scripts/m/myown/wsBoost.lua"))()end)
tab:CreateSlider("Speed",{16, 300},1,"",game.Players.LocalPlayer.Character.Humanoid.WalkSpeed,function(v) game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v end)
tab:CreateSlider("CFrame Speed",{0, 100},1,"",0,function(v) wsBoost(v/30) 
end)

tab:CreateSection("Character Jump")
tab:CreateButton("Infinity Jump",function()
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
tab:CreateLabel("SPAM [SPACE]")

tab:CreateSection("Character Visible")
tab:CreateButton("Turn Visible",function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/benomat/scripts/m/paste/InvisibilityToggle.lua'))()
end)
tab:CreateLabel("Press [E]")



tab:CreateSection("Troll")
tab:CreateToggle("Break TTT",false,function(state)
    getgenv().breakTTT=state
    while getgenv().breakTTT do
        for _, playingtable in pairs(workspace:GetChildren()) do
            if playingtable.Name == "Tic Tac Toe" then
                for _, field in pairs(playingtable:GetChildren()) do
                    if field.Name:sub(1, 5) == "Detec" then
                        fireclickdetector(field)
                        task.wait()
                    end
                end
            end
        end
        wait(.5)
    end
end)

tab:CreateButton("Trip and Die",function()
   function getRoot(char)
      local rootPart = char:FindFirstChild('HumanoidRootPart') or char:FindFirstChild('Torso') or char:FindFirstChild('UpperTorso')
      return rootPart
  end

  local Players = cloneref(game:GetService("Players")) or game:GetService("Players")
  local LocalPlayer = Players.LocalPlayer
  local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
  local hum = Character:FindFirstChildOfClass("Humanoid")
  local root = getRoot(Character)
  hum.Jump = true
  wait()
  hum.Jump = true
  wait(0.1)
  hum:ChangeState(0)
  root.Velocity = root.CFrame.LookVector * 30
  wait(0.3)
  hum.Health = 0
end)

local GetService = game.GetService
local Services = { 
    Workspace = GetService(game, "Workspace");
    UserInputService = GetService(game, "UserInputService");
    ReplicatedStorage = GetService(game, "ReplicatedStorage");
    StarterPlayer = GetService(game, "StarterPlayer");
    StarterPack = GetService(game, "StarterPack");
    StarterGui = GetService(game, "StarterGui");
    TeleportService = GetService(game, "TeleportService");
    CoreGui = GetService(game, "CoreGui");
    TweenService = GetService(game, "TweenService");
    HttpService = GetService(game, "HttpService");
    TextService = GetService(game, "TextService");
    MarketplaceService = GetService(game, "MarketplaceService");
    Chat = GetService(game, "Chat");
    Teams = GetService(game, "Teams");
    SoundService = GetService(game, "SoundService");
    Lighting = GetService(game, "Lighting");
    ScriptContext = GetService(game, "ScriptContext");
    Stats = GetService(game, "Stats");
}
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local Player = Players.LocalPlayer
local GetPlayer = function(Name)
    Name = Name:lower()
    if Name == "random" then
        local GetPlayers = Players:GetPlayers()
        if table.find(GetPlayers, Player) then
            table.remove(GetPlayers, table.find(GetPlayers, Player))
        end
        return GetPlayers[math.random(#GetPlayers)]
        elseif Name ~= "random" then
            for _, x in next, Players:GetPlayers() do
            if x ~= Player then
                if x.Name:lower():match("^" .. Name) then
                    return x;
                    elseif x.DisplayName:lower():match("^" .. Name) then
                        return x;
                    end
            end
        end
    else
        return
    end
end
playertab:CreateSection("Username Input")
playertab:CreateInput("Select Player","Username",true,function(name)
    getgenv().SelectedPlayer = GetPlayer(name)
end)

playertab:CreateSection("Functions")
playertab:CreateToggle("View",false,function(state)
    if state then Workspace.Camera.CameraSubject = getgenv().SelectedPlayer.Character
else Workspace.Camera.CameraSubject = Player.Character end
end)
playertab:CreateToggle("Listen to the Player",false,function(state)
    if state then Services.SoundService:SetListener(Enum.ListenerType.ObjectPosition,getgenv().SelectedPlayer.Character.HumanoidRootPart)
    else Services.SoundService:SetListener(Enum.ListenerType.Camera)end
end)
playertab:CreateToggle("Loop TP to the Player",false,function(state)
    getgenv().LoopTP=state
    while getgenv().LoopTP do
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = getgenv().SelectedPlayer.Character.HumanoidRootPart.CFrame
        game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity=getgenv().SelectedPlayer.Character.HumanoidRootPart.Velocity
        task.wait()
    end
end)
local function tpn(...)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(...)
end
function scary()
    solidfloortoggle:Set(true)
    for _,v in pairs(game.Workspace:GetChildren()) do
        if v:FindFirstChild("houseInteriorCoffeeTable") then
            for _,idkwhattocallthis in pairs(v:GetChildren()) do
                if idkwhattocallthis:FindFirstChild("Texture") then
                    idkwhattocallthis.CanCollide=true
                end
            end
        end
    end
end
TPTab:CreateSection("Locations")
TPTab:CreateButton("Private Room [INSIDE]",function()
    scary()
    tpn(4221.1220703125, 5.622772216796875, 60.028804779052734)
end)
TPTab:CreateButton("Private Room [ON TOP]",function()
    tpn(4240.51904296875, 23.304279327392578, 75.93709564208984)
end)

TPTab:CreateSection("Other Teleports")
TPTab:CreateButton("Tower",function()tpn(59.98295974731445, 313.0125732421875, 225.32273864746094)end)
TPTab:CreateButton("Slide",function()tpn(16.68634796142578, 225.0092315673828, 65.47396850585938)end)
TPTab:CreateButton("Glass Platform",function()tpn(172.06375122070312, 61.18655014038086, -114.35980224609375)end)
TPTab:CreateButton("Donut Shop",function()tpn(-55.430057525634766, 4.6999969482421875, -62.683597564697266)end)


spawn(function()
if not fireproximityprompt or identifyexecutor()=="Solara" then
    getgenv().fireproximityprompt=function(pp)
        local oldenabled=pp.Enabled
        local oldhold=pp.HoldDuration
        local oldrlos=pp.RequiresLineOfSight
        local oldMaxActivationDistance=pp.MaxActivationDistance
        local oldCameraCFrame = workspace.CurrentCamera.CFrame
        pp.MaxActivationDistance=math.huge
        pp.Enabled=true
        pp.HoldDuration=0
        pp.RequiresLineOfSight=false
        pcall(function()workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position, pp.Parent.Position)end)
        wait()
        pp:InputHoldBegin()
        task.wait()
        pp:InputHoldEnd()
        task.wait()
        pp.Enabled=pp.Enabled
        pp.HoldDuration=pp.HoldDuration
        pp.RequiresLineOfSight=pp.RequiresLineOfSight
        pp.MaxActivationDistance=oldMaxActivationDistance
        workspace.CurrentCamera.CFrame=oldCameraCFrame
    end
end
end)
Stalltab:CreateSection("Stall Function") --[you can scroll btw]
Stalltab:CreateToggle("Steal/Clear all Stalls",false,function(state)
    if pcall(function() fireproximityprompt(Workspace.Stalls.Stall1.ProxPart.ProximityPrompt) end) then
        for _,v in pairs(Workspace.Stalls:GetChildren()) do
            if tostring(v.Player.Value)==game.Players.LocalPlayer.Name then
                v.CloseStall:FireServer()
            end
        end
        wait(.05)
        getgenv().ThisIsTooOp=state
        while getgenv().ThisIsTooOp do
            local oldpos=game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
            for _,v in pairs(Workspace.Stalls:GetChildren()) do
                if v.Player.Value then
                    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.ProxPart.Position).magnitude>=30 then distancethingyyes=true game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=v.ProxPart.CFrame end
                    wait(.23)
                    fireproximityprompt(v.ProxPart.ProximityPrompt)
                    wait(.23)
                    game.Players.LocalPlayer.PlayerGui.StallLocal.StallFrame.Visible=false
                    if tostring(v.Player.Value)==game.Players.LocalPlayer.Name then
                        v.CloseStall:FireServer()
                    end
                    wait(.23)
                end
            end
            if distancethingyyes then game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=oldpos end
            distancethingyyes=false
            task.wait()
        end
    elseif state then
        sw1ndlernotify:CreateDefaultNotif({
            TweenSpeed = 1,
            Title = "Error",
            Text = "Your Executor doesnt support this",
            Duration = 5
           })
    end
end)
stallorder={"3","2","1","5","4"}
Stalltab:CreateInput("Steal stall by number (1-5)","number",true,function(input)
    local targetstall=Workspace.Stalls["Stall"..stallorder[tonumber(input)]]
    for _,v in pairs(Workspace.Stalls:GetChildren()) do
        if tostring(v.Player.Value)==game.Players.LocalPlayer.Name then
            v.CloseStall:FireServer()
        end
    end
    wait(.05)
    local oldpos=game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - targetstall.ProxPart.Position).magnitude>=30 then distancethingyyes=true game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=targetstall.ProxPart.CFrame end
    wait(.25)
    fireproximityprompt(targetstall.ProxPart.ProximityPrompt)
    wait(.23)
    game.Players.LocalPlayer.PlayerGui.StallLocal.StallFrame.Visible=false
    if distancethingyyes then game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=oldpos end
end)

ExtraTab:CreateSection("Infinite Yield")
ExtraTab:CreateButton("Infinite Yield",function()
   loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end)

ExtraTab:CreateSection("System Broken")
ExtraTab:CreateButton("System Broken",function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/EnterpriseExperience/SystemBroken/main/source"))()
end)

ExtraTab:CreateSection("Ball Fling")
ExtraTab:CreateButton("Ball Fling [NEW]",function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/Alikhammass/MyAdmin/refs/heads/main/Micupfling"))()
end)
ExtraTab:CreateButton("Ball Fling [OLD]",function()
local Players = game:GetService("Players")
        local RunService = game:GetService("RunService")
        local LocalPlayer = Players.LocalPlayer
        local Workspace = game:GetService("Workspace")

        local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

        humanoidRootPart.CFrame = CFrame.new(225.964813, 3.02499914, -78.1774216)
        wait()
        for i, v in pairs(workspace:GetDescendants()) do
            if v:IsA("RopeConstraint") then
                v.Enabled = false
            end
        end
        wait()
        local Folder = Instance.new("Folder", Workspace)
        local Part = Instance.new("Part", Folder)
        local Attachment1 = Instance.new("Attachment", Part)
        Part.Anchored = true
        Part.CanCollide = false
        Part.Transparency = 1

        if not getgenv().Network then
            getgenv().Network = {
                BaseParts = {},
                Velocity = Vector3.new(14.46262424, 14.46262424, 14.46262424)
            }

            Network.RetainPart = function(Part)
                if typeof(Part) == "Instance" and Part:IsA("BasePart") and Part:IsDescendantOf(Workspace) then
                    table.insert(Network.BaseParts, Part)
                    Part.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0, 0, 0)
                    Part.CanCollide = false
                end
            end

            local function EnablePartControl()
                LocalPlayer.ReplicationFocus = Workspace
                RunService.Heartbeat:Connect(function()
                    sethiddenproperty(LocalPlayer, "SimulationRadius", math.huge)
                    for _, Part in pairs(Network.BaseParts) do
                        if Part:IsDescendantOf(Workspace) then
                            Part.Velocity = Network.Velocity
                        end
                    end
                end)
            end

            EnablePartControl()
        end

        local function ForcePart(v)
            if v:IsA("Part") and not v.Anchored and not v.Parent:FindFirstChild("Humanoid") and not v.Parent:FindFirstChild("Head") and v.Name ~= "Handle" then
                for _, x in next, v:GetChildren() do
                    if x:IsA("BodyAngularVelocity") or x:IsA("BodyForce") or x:IsA("BodyGyro") or x:IsA("BodyPosition") or x:IsA("BodyThrust") or x:IsA("BodyVelocity") or x:IsA("RocketPropulsion") then
                        x:Destroy()
                    end
                end
                if v:FindFirstChild("Attachment") then
                    v:FindFirstChild("Attachment"):Destroy()
                end
                if v:FindFirstChild("AlignPosition") then
                    v:FindFirstChild("AlignPosition"):Destroy()
                end
                if v:FindFirstChild("Torque") then
                    v:FindFirstChild("Torque"):Destroy()
                end
                v.CanCollide = false
                local Torque = Instance.new("Torque", v)
                Torque.Torque = Vector3.new(100000, 100000, 100000)
                local AlignPosition = Instance.new("AlignPosition", v)
                local Attachment2 = Instance.new("Attachment", v)
                Torque.Attachment0 = Attachment2
                AlignPosition.MaxForce = 9999999999999999
                AlignPosition.MaxVelocity = math.huge
                AlignPosition.Responsiveness = 200
                AlignPosition.Attachment0 = Attachment2
                AlignPosition.Attachment1 = Attachment1
            end
        end

        local blackHoleActive = true

        local function toggleBlackHole()
            blackHoleActive = not blackHoleActive
            if blackHoleActive then
                for _, v in next, Workspace:GetDescendants() do
                    ForcePart(v)
                end

                Workspace.DescendantAdded:Connect(function(v)
                    if blackHoleActive then
                        ForcePart(v)
                    end
                end)

                spawn(function()
                    while blackHoleActive and RunService.RenderStepped:Wait() do
                        Attachment1.WorldCFrame = humanoidRootPart.CFrame
                    end
                end)
            end
        end

        local function createControlButton()
            local screenGui = Instance.new("ScreenGui")
            local button = Instance.new("TextButton")

            screenGui.Name = "BlackHoleControlGUI"
            screenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

            button.Name = "ToggleBlackHoleButton"
            button.Size = UDim2.new(0, 200, 0, 50)
            button.Position = UDim2.new(0.5, -100, 0, 100)
            button.Text = "Disable Ball Fling"
            button.Parent = screenGui

            button.MouseButton1Click:Connect(function()
                toggleBlackHole()
                if blackHoleActive then
                    button.Text = "Disable Ball Fling"
                else
                    button.Text = "Enable Ball Fling"
                end
            end)
        end

        createControlButton()
        toggleBlackHole()
end)


ExtraTab:CreateSection("Chat")
ExtraTab:CreateButton("Chat Bypasser",function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/SkireScripts/Ouxie/main/Projects/simplebypass.lua"))()
end)

ExtraTab:CreateButton("Fake Chat",function()
local a=Instance.new("ScreenGui")local b=Instance.new("Frame")local c=Instance.new("UICorner")local d=Instance.new("Frame")local e=Instance.new("UICorner")local f=Instance.new("Frame")local g=Instance.new("TextLabel")local h=Instance.new("TextButton")local i=Instance.new("UICorner")local j=Instance.new("TextLabel")local k=Instance.new("Frame")local l=Instance.new("UICorner")local m=Instance.new("Frame")local n=Instance.new("TextButton")local o=Instance.new("TextLabel")local p=Instance.new("ImageLabel")local q=Instance.new("UICorner")local r=Instance.new("TextLabel")local s=Instance.new("Frame")local t=Instance.new("UIListLayout")local u=Instance.new("TextButton")local v=Instance.new("UICorner")local w=Instance.new("UIPadding")local x=Instance.new("TextButton")local y=Instance.new("Frame")local z=Instance.new("UICorner")local A=Instance.new("TextBox")local B=Instance.new("Frame")local C=Instance.new("UICorner")local D=Instance.new("TextBox")local E=Instance.new("Frame")local F=Instance.new("TextButton")local G=Instance.new("ImageLabel")local H=Instance.new("UICorner")local I=Instance.new("Frame")local J=Instance.new("TextButton")local K=Instance.new("ImageLabel")local L=Instance.new("UICorner")local M=Instance.new("Frame")local N=Instance.new("UICorner")local O=Instance.new("Frame")local P=Instance.new("UICorner")local Q=Instance.new("Frame")local R=Instance.new("TextLabel")local S=Instance.new("Frame")local T=Instance.new("UICorner")local U=Instance.new("ScrollingFrame")local V=Instance.new("UIListLayout")local W=Instance.new("UIPadding")a.Name="ChatTroll"a.Parent=game:GetService("CoreGui")a.ZIndexBehavior=Enum.ZIndexBehavior.Sibling;a.DisplayOrder=67;a.ResetOnSpawn=false;b.Name="Main"b.Parent=a;b.BackgroundColor3=Color3.fromRGB(40,40,40)b.BorderSizePixel=0;b.ClipsDescendants=true;b.Position=UDim2.new(0.714853048,0,0.322327048,0)b.Size=UDim2.new(0,300,0,225)c.CornerRadius=UDim.new(0,12)c.Parent=b;d.Name="Top"d.Parent=b;d.BackgroundColor3=Color3.fromRGB(25,25,25)d.Size=UDim2.new(1,0,0,44)e.CornerRadius=UDim.new(0,12)e.Parent=d;f.Parent=d;f.BackgroundColor3=Color3.fromRGB(25,25,25)f.BorderSizePixel=0;f.Position=UDim2.new(0,0,1,-16)f.Size=UDim2.new(1,0,0,16)g.Name="Title"g.Parent=d;g.BackgroundColor3=Color3.fromRGB(255,255,255)g.BackgroundTransparency=1.000;g.BorderSizePixel=0;g.Position=UDim2.new(0,16,0.150000006,0)g.Size=UDim2.new(0,200,0.699999988,0)g.Font=Enum.Font.Gotham;g.Text="Chat Admin"g.TextColor3=Color3.fromRGB(255,255,255)g.TextScaled=true;g.TextSize=14.000;g.TextWrapped=true;g.TextXAlignment=Enum.TextXAlignment.Left;h.Name="Exit"h.Parent=d;h.BackgroundColor3=Color3.fromRGB(255,82,82)h.BorderSizePixel=0;h.Position=UDim2.new(0,270,0.5,-4)h.Size=UDim2.new(0,8,0,8)h.Font=Enum.Font.SourceSans;h.Text=""h.TextColor3=Color3.fromRGB(0,0,0)h.TextSize=14.000;i.CornerRadius=UDim.new(0,64)i.Parent=h;j.Name="Credits"j.Parent=b;j.BackgroundColor3=Color3.fromRGB(255,255,255)j.BackgroundTransparency=1.000;j.BorderSizePixel=0;j.Position=UDim2.new(0,0,1,-14)j.Size=UDim2.new(1,0,0,12)j.Font=Enum.Font.Gotham;j.Text="by unxable, v2.0"j.TextColor3=Color3.fromRGB(170,170,170)j.TextScaled=true;j.TextSize=14.000;j.TextWrapped=true;k.Name="Chat"k.Parent=b;k.BackgroundColor3=Color3.fromRGB(50,50,50)k.Position=UDim2.new(0,16,0,54)k.Size=UDim2.new(1,-32,0,150)l.Parent=k;m.Name="Dropdown"m.Parent=k;m.BackgroundColor3=Color3.fromRGB(30,30,30)m.BackgroundTransparency=1.000;m.Position=UDim2.new(0,8,0,8)m.Size=UDim2.new(1,-16,0,32)m.ZIndex=2;n.Name="Btn"n.Parent=m;n.BackgroundColor3=Color3.fromRGB(30,30,30)n.Size=UDim2.new(1,0,0,24)n.ZIndex=3;n.AutoButtonColor=false;n.Font=Enum.Font.SourceSans;n.Text=""n.TextColor3=Color3.fromRGB(0,0,0)n.TextSize=14.000;o.Name="Title"o.Parent=n;o.BackgroundColor3=Color3.fromRGB(255,255,255)o.BackgroundTransparency=1.000;o.Position=UDim2.new(0,10,0,0)o.Selectable=true;o.Size=UDim2.new(0,1,1,0)o.ZIndex=3;o.Font=Enum.Font.Gotham;o.Text="Chat System"o.TextColor3=Color3.fromRGB(255,255,255)o.TextSize=14.000;o.TextXAlignment=Enum.TextXAlignment.Left;p.Name="Ico"p.Parent=n;p.AnchorPoint=Vector2.new(1,0.5)p.BackgroundColor3=Color3.fromRGB(255,255,255)p.BackgroundTransparency=1.000;p.Position=UDim2.new(1,-10,0.5,0)p.Size=UDim2.new(0,20,0,20)p.ZIndex=3;p.Image="http://www.roblox.com/asset/?id=6034818379"p.ImageTransparency=0.400;q.CornerRadius=UDim.new(0,5)q.Parent=n;r.Name="Value"r.Parent=n;r.AnchorPoint=Vector2.new(1,0.5)r.BackgroundColor3=Color3.fromRGB(255,255,255)r.BackgroundTransparency=1.000;r.Position=UDim2.new(1,-35,0.5,0)r.Selectable=true;r.Size=UDim2.new(0,1,0,32)r.ZIndex=3;r.Font=Enum.Font.Gotham;r.Text="Dropdown"r.TextColor3=Color3.fromRGB(255,255,255)r.TextSize=14.000;r.TextTransparency=0.400;r.TextXAlignment=Enum.TextXAlignment.Right;s.Name="Holder"s.Parent=m;s.BackgroundColor3=Color3.fromRGB(36,36,36)s.BackgroundTransparency=1.000;s.ClipsDescendants=true;s.Position=UDim2.new(0,0,0,19)s.Size=UDim2.new(1,0,0,5)s.ZIndex=2;t.Name="Layout"t.Parent=s;t.SortOrder=Enum.SortOrder.LayoutOrder;u.Name="Legacy"u.Parent=s;u.BackgroundColor3=Color3.fromRGB(255,255,255)u.BackgroundTransparency=1.000;u.BorderColor3=Color3.fromRGB(27,42,53)u.BorderSizePixel=0;u.Size=UDim2.new(1,0,0,32)u.ZIndex=2;u.Font=Enum.Font.Gotham;u.Text="Legacy"u.TextColor3=Color3.fromRGB(255,255,255)u.TextSize=14.000;u.TextTransparency=0.400;v.CornerRadius=UDim.new(0,5)v.Parent=s;w.Parent=s;w.PaddingTop=UDim.new(0,5)x.Name="New"x.Parent=s;x.BackgroundColor3=Color3.fromRGB(255,255,255)x.BackgroundTransparency=1.000;x.BorderColor3=Color3.fromRGB(27,42,53)x.BorderSizePixel=0;x.Size=UDim2.new(1,0,0,32)x.ZIndex=2;x.Font=Enum.Font.Gotham;x.Text="New"x.TextColor3=Color3.fromRGB(255,255,255)x.TextSize=14.000;x.TextTransparency=0.400;y.Name="Real"y.Parent=k;y.BackgroundColor3=Color3.fromRGB(30,30,30)y.Position=UDim2.new(0,8,0,40)y.Size=UDim2.new(1,-16,0,24)z.CornerRadius=UDim.new(0,5)z.Parent=y;A.Parent=y;A.BackgroundColor3=Color3.fromRGB(255,255,255)A.BackgroundTransparency=1.000;A.BorderSizePixel=0;A.Position=UDim2.new(0,8,1,-19)A.Size=UDim2.new(1,-14,0,14)A.ClearTextOnFocus=false;A.Font=Enum.Font.Gotham;A.PlaceholderColor3=Color3.fromRGB(178,178,178)A.PlaceholderText="Put your disguise here"A.Text=""A.TextColor3=Color3.fromRGB(255,255,255)A.TextSize=14.000;A.TextWrapped=true;A.TextXAlignment=Enum.TextXAlignment.Left;B.Name="Fake"B.Parent=k;B.BackgroundColor3=Color3.fromRGB(30,30,30)B.Position=UDim2.new(0,8,0,71)B.Size=UDim2.new(1,-16,0,24)C.CornerRadius=UDim.new(0,5)C.Parent=B;D.Parent=B;D.BackgroundColor3=Color3.fromRGB(255,255,255)D.BackgroundTransparency=1.000;D.BorderSizePixel=0;D.Position=UDim2.new(0,8,1,-19)D.Size=UDim2.new(1,-16,0,14)D.ClearTextOnFocus=false;D.Font=Enum.Font.Gotham;D.MultiLine=true;D.PlaceholderText="Put the \"fake\" message here"D.Text=""D.TextColor3=Color3.fromRGB(255,255,255)D.TextScaled=true;D.TextSize=14.000;D.TextWrapped=true;D.TextXAlignment=Enum.TextXAlignment.Left;E.Name="Send"E.Parent=k;E.BackgroundColor3=Color3.fromRGB(30,30,30)E.BorderSizePixel=0;E.Position=UDim2.new(0,8,0,110)E.Size=UDim2.new(0.694029868,-16,0,32)F.Name="Btn"F.Parent=E;F.BackgroundColor3=Color3.fromRGB(30,30,30)F.BackgroundTransparency=1.000;F.Size=UDim2.new(1,0,1,0)F.Font=Enum.Font.Gotham;F.Text="Send"F.TextColor3=Color3.fromRGB(255,255,255)F.TextSize=14.000;H.CornerRadius=UDim.new(0,5)H.Parent=E;I.Name="Presets"I.Parent=k;I.BackgroundColor3=Color3.fromRGB(30,30,30)I.BorderSizePixel=0;I.Position=UDim2.new(0,185,0,110)I.Size=UDim2.new(0.339552253,-16,0,32)J.Name="Btn"J.Parent=I;J.BackgroundColor3=Color3.fromRGB(30,30,30)J.BackgroundTransparency=1.000;J.Size=UDim2.new(1,0,1,0)J.Font=Enum.Font.Gotham;J.Text="Presets"J.TextColor3=Color3.fromRGB(255,255,255)J.TextSize=14.000;L.CornerRadius=UDim.new(0,5)L.Parent=I;M.Name="Presets"M.Parent=a;M.BackgroundColor3=Color3.fromRGB(40,40,40)M.BorderSizePixel=0;M.ClipsDescendants=true;M.Position=UDim2.new(0.0452739783,0,0.322327048,0)M.Size=UDim2.new(0,174,0,225)N.CornerRadius=UDim.new(0,12)N.Parent=M;O.Name="Top"O.Parent=M;O.BackgroundColor3=Color3.fromRGB(25,25,25)O.Size=UDim2.new(1,0,0,44)P.CornerRadius=UDim.new(0,12)P.Parent=O;Q.Parent=O;Q.BackgroundColor3=Color3.fromRGB(25,25,25)Q.BorderSizePixel=0;Q.Position=UDim2.new(0,0,1,-16)Q.Size=UDim2.new(1,0,0,16)R.Name="Title"R.Parent=O;R.BackgroundColor3=Color3.fromRGB(255,255,255)R.BackgroundTransparency=1.000;R.BorderSizePixel=0;R.Position=UDim2.new(0,16,0.150000006,0)R.Size=UDim2.new(0,200,0.699999988,0)R.Font=Enum.Font.Gotham;R.Text="Presets"R.TextColor3=Color3.fromRGB(255,255,255)R.TextScaled=true;R.TextSize=14.000;R.TextWrapped=true;R.TextXAlignment=Enum.TextXAlignment.Left;S.Name="List"S.Parent=M;S.BackgroundColor3=Color3.fromRGB(50,50,50)S.Position=UDim2.new(0,16,0,58)S.Size=UDim2.new(1,-32,0,150)T.Parent=S;U.Parent=S;U.Active=true;U.BackgroundColor3=Color3.fromRGB(255,255,255)U.BackgroundTransparency=1.000;U.BorderSizePixel=0;U.Size=UDim2.new(1,-4,1,0)U.ScrollBarThickness=6;V.Parent=U;V.SortOrder=Enum.SortOrder.LayoutOrder;V.Padding=UDim.new(0,5)W.Parent=U;W.PaddingTop=UDim.new(0,5)local function X()local Y=Instance.new('LocalScript',b)local Z=game:GetService("UserInputService")local _=game:GetService("RunService")local a0=Y.Parent;local a1;local a2;local a3;local a4;function Lerp(a5,a6,a7)return a5+(a6-a5)*a7 end;local a8;local a9;local aa=8;function Update(ab)if not a4 then return end;if not a1 and a9 then a0.Position=UDim2.new(a4.X.Scale,Lerp(a0.Position.X.Offset,a9.X.Offset,ab*aa),a4.Y.Scale,Lerp(a0.Position.Y.Offset,a9.Y.Offset,ab*aa))return end;local ac=a8-Z:GetMouseLocation()local ad=a4.X.Offset-ac.X;local ae=a4.Y.Offset-ac.Y;a9=UDim2.new(a4.X.Scale,ad,a4.Y.Scale,ae)a0.Position=UDim2.new(a4.X.Scale,Lerp(a0.Position.X.Offset,ad,ab*aa),a4.Y.Scale,Lerp(a0.Position.Y.Offset,ae,ab*aa))end;a0.InputBegan:Connect(function(af)if af.UserInputType==Enum.UserInputType.MouseButton1 or af.UserInputType==Enum.UserInputType.Touch then a1=true;a3=af.Position;a4=a0.Position;a8=Z:GetMouseLocation()af.Changed:Connect(function()if af.UserInputState==Enum.UserInputState.End then a1=false end end)end end)a0.InputChanged:Connect(function(af)if af.UserInputType==Enum.UserInputType.MouseMovement or af.UserInputType==Enum.UserInputType.Touch then a2=af end end)_.Heartbeat:Connect(Update)end;coroutine.wrap(X)()local function ag()local Y=Instance.new('LocalScript',h)local ah=false;Y.Parent.MouseButton1Down:Connect(function()if ah==true then return end;ah=true;Y.Parent.Parent.Parent:TweenPosition(UDim2.new(.2,0,-1,-36))wait(1)Y.Parent.Parent.Parent.Parent:Destroy()end)end;coroutine.wrap(ag)()local function ai()local Y=Instance.new('LocalScript',F)local aj=game.Players.LocalPlayer:GetMouse()local function ak(al,am,an)coroutine.resume(coroutine.create(function()al.ClipsDescendants=true;local G=Y:WaitForChild("Circle"):Clone()G.Parent=al;local ao=am-G.AbsolutePosition.X;local ap=an-G.AbsolutePosition.Y;G.Position=UDim2.new(0,ao,0,ap)local aq=0;if al.AbsoluteSize.X>al.AbsoluteSize.Y then aq=al.AbsoluteSize.X*1.5 elseif al.AbsoluteSize.X<al.AbsoluteSize.Y then aq=al.AbsoluteSize.Y*1.5 elseif al.AbsoluteSize.X==al.AbsoluteSize.Y then aq=al.AbsoluteSize.X*1.5 end;local ar=0.5;G:TweenSizeAndPosition(UDim2.new(0,aq,0,aq),UDim2.new(0.5,-aq/2,0.5,-aq/2),"Out","Quad",ar,false,nil)for as=0.8,1,0.01 do G.ImageTransparency=as;wait(ar/10)end;G:Destroy()end))end;Y.Parent.MouseButton1Down:connect(function()ak(Y.Parent,aj.X,aj.Y)end)end;coroutine.wrap(ai)()local function at()local Y=Instance.new('LocalScript',k)local au;local function av(ah)Y.Parent.Dropdown.Btn.Value.Text=ah.Text;au=ah.Name;if au=="Legacy"then Y.Parent.Fake.TextBox.MultiLine=false elseif au=="New"then Y.Parent.Fake.TextBox.MultiLine=true end end;if game:GetService("TextChatService").ChatVersion==Enum.ChatVersion.TextChatService then av(Y.Parent.Dropdown.Holder.New)else av(Y.Parent.Dropdown.Holder.Legacy)end;local aw=false;local ax=false;Y.Parent.Dropdown.Btn.MouseButton1Down:Connect(function()if ax==true then return end;ax=true;if aw==false then Y.Parent.Dropdown.Holder.Transparency=0;coroutine.wrap(function()for as=0,180,10 do Y.Parent.Dropdown.Btn.Ico.Rotation=as;wait()end end)()local ay=0;for as,ah in pairs(Y.Parent.Dropdown.Holder:GetChildren())do if ah:IsA("TextButton")then ay=ay+1 end end;Y.Parent.Dropdown.Holder:TweenSize(UDim2.new(1,0,0,10+32*ay))wait(1)else coroutine.wrap(function()for as=180,0,-10 do Y.Parent.Dropdown.Btn.Ico.Rotation=as;wait()end end)()Y.Parent.Dropdown.Holder:TweenSize(UDim2.new(1,0,0,5))wait(1)Y.Parent.Dropdown.Holder.Transparency=1 end;aw=not aw;ax=false end)for as,ah in pairs(Y.Parent.Dropdown.Holder:GetChildren())do if ah:IsA("TextButton")then ah.MouseButton1Down:Connect(function()av(ah)end)end end;Y.Parent.Send.Btn.MouseButton1Down:Connect(function()local az=Y.Parent.Real.TextBox.Text;local aA=Y.Parent.Fake.TextBox.Text;if au=="New"then aA=string.gsub(aA,"\n","\r")game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync(az..'\r'..aA)elseif au=="Legacy"then game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(az..string.sub("                                                                                                                                                           ",#az)..aA,"All")end end)Y.Parent.Parent.Parent.Presets.Visible=false;Y.Parent.Presets.Btn.MouseButton1Down:Connect(function()Y.Parent.Parent.Parent.Presets.Visible=not Y.Parent.Parent.Parent.Presets.Visible end)end;coroutine.wrap(at)()local function aB()local Y=Instance.new('LocalScript',J)local aj=game.Players.LocalPlayer:GetMouse()local function ak(al,am,an)coroutine.resume(coroutine.create(function()al.ClipsDescendants=true;local G=Y:WaitForChild("Circle"):Clone()G.Parent=al;local ao=am-G.AbsolutePosition.X;local ap=an-G.AbsolutePosition.Y;G.Position=UDim2.new(0,ao,0,ap)local aq=0;if al.AbsoluteSize.X>al.AbsoluteSize.Y then aq=al.AbsoluteSize.X*1.5 elseif al.AbsoluteSize.X<al.AbsoluteSize.Y then aq=al.AbsoluteSize.Y*1.5 elseif al.AbsoluteSize.X==al.AbsoluteSize.Y then aq=al.AbsoluteSize.X*1.5 end;local ar=0.5;G:TweenSizeAndPosition(UDim2.new(0,aq,0,aq),UDim2.new(0.5,-aq/2,0.5,-aq/2),"Out","Quad",ar,false,nil)for as=0.8,1,0.01 do G.ImageTransparency=as;wait(ar/10)end;G:Destroy()end))end;Y.Parent.MouseButton1Down:connect(function()ak(Y.Parent,aj.X,aj.Y)end)end;coroutine.wrap(aB)()local function aC()local Y=Instance.new('LocalScript',M)local Z=game:GetService("UserInputService")local _=game:GetService("RunService")local a0=Y.Parent;local a1;local a2;local a3;local a4;function Lerp(a5,a6,a7)return a5+(a6-a5)*a7 end;local a8;local a9;local aa=8;function Update(ab)if not a4 then return end;if not a1 and a9 then a0.Position=UDim2.new(a4.X.Scale,Lerp(a0.Position.X.Offset,a9.X.Offset,ab*aa),a4.Y.Scale,Lerp(a0.Position.Y.Offset,a9.Y.Offset,ab*aa))return end;local ac=a8-Z:GetMouseLocation()local ad=a4.X.Offset-ac.X;local ae=a4.Y.Offset-ac.Y;a9=UDim2.new(a4.X.Scale,ad,a4.Y.Scale,ae)a0.Position=UDim2.new(a4.X.Scale,Lerp(a0.Position.X.Offset,ad,ab*aa),a4.Y.Scale,Lerp(a0.Position.Y.Offset,ae,ab*aa))end;a0.InputBegan:Connect(function(af)if af.UserInputType==Enum.UserInputType.MouseButton1 or af.UserInputType==Enum.UserInputType.Touch then a1=true;a3=af.Position;a4=a0.Position;a8=Z:GetMouseLocation()af.Changed:Connect(function()if af.UserInputState==Enum.UserInputState.End then a1=false end end)end end)a0.InputChanged:Connect(function(af)if af.UserInputType==Enum.UserInputType.MouseMovement or af.UserInputType==Enum.UserInputType.Touch then a2=af end end)_.Heartbeat:Connect(Update)end;coroutine.wrap(aC)()G.Name="Circle"G.Parent=J:WaitForChild("LocalScript")G.BackgroundColor3=Color3.fromRGB(255,255,255)G.BackgroundTransparency=1.000;G.ZIndex=10;G.Image="rbxassetid://266543268"G.ImageColor3=Color3.fromRGB(0,0,0)G.ImageTransparency=0.800;K.Name="Circle"K.Parent=F:WaitForChild("LocalScript")K.BackgroundColor3=Color3.fromRGB(255,255,255)K.BackgroundTransparency=1.000;K.ZIndex=10;K.Image="rbxassetid://266543268"K.ImageColor3=Color3.fromRGB(0,0,0)K.ImageTransparency=0.800;local aD=Instance.new("TextButton")aD.Parent=U;aD.BackgroundColor3=Color3.fromRGB(255,255,255)aD.BackgroundTransparency=1.000;aD.BorderSizePixel=0;aD.Size=UDim2.new(1,-10,0,12)aD.Font=Enum.Font.Gotham;aD.Text="Fake admin all"aD.TextColor3=Color3.fromRGB(255,255,255)aD.TextScaled=true;aD.TextSize=14.000;aD.TextWrapped=true;aD.MouseButton1Down:Connect(function()y.TextBox.Text=";admin all"B.TextBox.Text="{Team} You are now on the 'Admins' team."end)local aD=Instance.new("TextButton")aD.Parent=U;aD.BackgroundColor3=Color3.fromRGB(255,255,255)aD.BackgroundTransparency=1.000;aD.BorderSizePixel=0;aD.Size=UDim2.new(1,-10,0,12)aD.Font=Enum.Font.Gotham;aD.Text="Fake shutdown"aD.TextColor3=Color3.fromRGB(255,255,255)aD.TextScaled=true;aD.TextSize=14.000;aD.TextWrapped=true;aD.MouseButton1Down:Connect(function()y.TextBox.Text=";shutdown"B.TextBox.Text="[Server]: Shutting down in 60 seconds"end)local aD=Instance.new("TextButton")aD.Parent=U;aD.BackgroundColor3=Color3.fromRGB(255,255,255)aD.BackgroundTransparency=1.000;aD.BorderSizePixel=0;aD.Size=UDim2.new(1,-10,0,12)aD.Font=Enum.Font.Gotham;aD.Text="Team join"aD.TextColor3=Color3.fromRGB(255,255,255)aD.TextScaled=true;aD.TextSize=14.000;aD.TextWrapped=true;aD.MouseButton1Down:Connect(function()y.TextBox.Text=""B.TextBox.Text="{Team} You are now on the 'put anything here' team."end)local aD=Instance.new("TextButton")aD.Parent=U;aD.BackgroundColor3=Color3.fromRGB(255,255,255)aD.BackgroundTransparency=1.000;aD.BorderSizePixel=0;aD.Size=UDim2.new(1,-10,0,12)aD.Font=Enum.Font.Gotham;aD.Text="System message"aD.TextColor3=Color3.fromRGB(255,255,255)aD.TextScaled=true;aD.TextSize=14.000;aD.TextWrapped=true;aD.MouseButton1Down:Connect(function()y.TextBox.Text=""B.TextBox.Text="[Server]: "end)
end)
