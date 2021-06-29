local RunService = game:GetService("RunService");

local player = game:GetService("Players").LocalPlayer;

local function NewServer()
    local x = {}
	for _, v in ipairs(game:GetService("HttpService"):JSONDecode(game:HttpGetAsync("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100")).data) do
		if type(v) == "table" and v.maxPlayers > v.playing and v.id ~= game.JobId then
			x[#x + 1] = v.id;
		end;
	end;
	if #x > 0 then
		game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, x[math.random(1, #x)]);
	else
		return print("Serverhop","Couldn't find a server.");
	end;
end;

local function Kill(target)
    repeat RunService.Heartbeat:Wait(); until player.Character and player.Character:FindFirstChildOfClass("Humanoid") and player:FindFirstChild("Backpack");

    local char = player.Character;
    local tool = player.Character:FindFirstChildWhichIsA("Tool") or player.Backpack:FindFirstChildWhichIsA("Tool");
    tool.Parent = player.Backpack;
    
    char.HumanoidRootPart.CFrame = CFrame.new(target.HumanoidRootPart.Position-target.HumanoidRootPart.CFrame.lookVector*4, target.HumanoidRootPart.Position);

    char.Humanoid:Destroy();
    local fakeHumanoid = Instance.new("Humanoid", char);
    fakeHumanoid:UnequipTools();
    fakeHumanoid:EquipTool(tool);
    tool.Parent = workspace;

    repeat
        tool.Grip = CFrame.new();
        tool.Grip = tool.Handle.CFrame:ToObjectSpace(target.Character.Head.CFrame):Inverse();
        firetouchinterest(tool.Handle, target.Character.Head, 0);
        firetouchinterest(tool.Handle, target.Character.Head, 1);
        RunService.Heartbeat:Wait();
    until tool.Parent ~= char

    player.Character = nil;
    fakeHumanoid.Health = 0;
end;

local function Chat(bb)
    game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(bb, "All");
end;
repeat RunService.Heartbeat:Wait(); until game:IsLoaded()
wait(.4);

----------------------------------------------------------------------------------------------------------------------------------------------------------
--======================================================================================================================================================--
----------------------------------------------------------------------------------------------------------------------------------------------------------

for i = 1,7,1 do
    Chat("balls | snvyv");
end;

for i,v in pairs(workspace:GetDescendants()) do
    if v:IsA("Sound") then v:Stop(); end;
end;

for i,v in pairs(game.Players:GetPlayers()) do
    if v.Character:FindFirstChildOfClass("Tool") then
        Kill(v.Character);
        break;
    end;
end;

syn.queue_on_teleport("how am i supposed to tell the link yet");
NewServer();
