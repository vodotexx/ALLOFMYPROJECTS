if game.GameId ~= 1055653882 then return end
game.Players.LocalPlayer.CharacterAdded:Connect(function()
    if _G.a then _G.a:Disconnect() end
    if _G.b then _G.b:Disconnect() end
    wait(2)
    local vm = game:GetObjects("rbxassetid://6380550860")
vm[1].Parent = game.Players.LocalPlayer.Backpack

-- Decompiled with the Synapse X Luau decompiler.
wait()
Tool = vm[1];
yes = Tool:WaitForChild("yes");
Players = game:GetService("Players");
StandStill = Tool:WaitForChild("StandStill");
Button = Tool:WaitForChild("Button");
ThrustingAnim = yes:WaitForChild("Thrusting");
CurrentCamera = game:GetService("Workspace").CurrentCamera;
Mass = 0;
EqualizingForce = 196.66666666666669;
Gravity = 0.8;
Gui = nil;
Anim = nil;
Regen = false;
Force = Instance.new("BodyVelocity");
Force.velocity = Vector3.new(0, 0, 0);
BodyGyro = Instance.new("BodyGyro");
BodyGyro.P = 20000;
BodyGyro.D = 8000;
BodyGyro.maxTorque = Vector3.new(BodyGyro.P, BodyGyro.P, BodyGyro.P);
function Thrust()
	Thrusting = true;
	Force.Parent = Torso;
	BodyGyro.Parent = Torso;
	ThrustingAnim:Play();
	if Anim then
		Anim:Play();
		Anim:AdjustSpeed(2.5);
	end;
	while true do
		if Thrusting then

		else
			break;
		end;
		BodyGyro.cframe = CurrentCamera.CoordinateFrame;
		Force.velocity = Vector3.new(0, CurrentCamera.CoordinateFrame.lookVector.unit.y, 0) * 100;
		wait();	
	end;
	ThrustingAnim:Stop();
end;
function CutEngine()
	Thrusting = false;
	Force.velocity = Vector3.new(0, 0, 0);
	Force.Parent = nil;
	Anim:Stop();
	BodyGyro.Parent = nil;
end;
function RecursiveGetLift(p1)
	local v1 = 0;
	local v2, v3, v4 = pairs(p1:GetChildren());
	while true do
		local v5, v6 = v2(v3, v4);
		if v5 then

		else
			break;
		end;
		v4 = v5;
		if v6:IsA("BasePart") then
			if Head then
				if Head.Parent then
					if (v6.Position - Head.Position).magnitude < 10 then
						v1 = v1 + v6:GetMass() * EqualizingForce * 1;
					else
						TotalMas = v1 + v6:GetMass() * EqualizingForce * Gravity;
					end;
				else
					TotalMas = v1 + v6:GetMass() * EqualizingForce * Gravity;
				end;
			else
				TotalMas = v1 + v6:GetMass() * EqualizingForce * Gravity;
			end;
		end;
		v1 = v1 + RecursiveGetLift(v6);	
	end;
	return v1;
end;
function EquipJetPack()
	spawn(function()
		while true do
			if yes then

			else
				break;
			end;
			if wait(0.1) then

			else
				break;
			end;
			pcall(function()
				yes.CFrame = Tool.Parent.HumanoidRootPart.CFrame;
			end);		
		end;
	end);
end;
function Equipped(p2)
	Character = Tool.Parent;
	Player = Players:GetPlayerFromCharacter(Character);
	Humanoid = Character:FindFirstChild("Humanoid");
	Gui = Button:Clone();
	Gui.Parent = Player:FindFirstChild("PlayerGui");
	Gui.FlyButton.MouseButton1Down:connect(Thrust);
	Gui.FlyButton.MouseButton1Up:connect(CutEngine);
	Head = Character:FindFirstChild("Head");
	Torso = Character:FindFirstChild("Torso");
	if Player then
		if Humanoid then
			if Humanoid.Health ~= 0 then
				if Head then
					if not Torso then

					else
						wait();
						EquipJetPack();
						Mass = RecursiveGetLift(Character);
						Force.P = Mass * 10;
						Force.maxForce = Vector3.new(0, Force.P, 0);
						--p2 = game.Players.LocalPlayer:GetMouse()
						--wait(.1)
						p2.Button1Down:connect(Thrust);
						p2.Button1Up:connect(CutEngine);
						Anim = Humanoid:LoadAnimation(StandStill);
						return;
					end;
				end;
			end;
		end;
	end;
end;
function Unequipped()
	if Gui then
		Gui:Destroy();
	end;
	Regen = false;
	if Force then
		if Force.Parent then
			Force.Parent = nil;
		end;
	end;
	if BodyGyro then
		if BodyGyro.Parent then
			BodyGyro.Parent = nil;
		end;
	end;
	if Anim then
		Anim:Stop();
	end;
	Thrusting = false;
end;
_G.a=Tool.Equipped:connect(Equipped);
_G.b=Tool.Unequipped:connect(Unequipped);
end)
