wait(.2)

pcall(function()
	spawn(function()
		local balls = getsynasset or getcustomasset
		if not isfile("creditsMDMDMDMDM.ogg") then
		    writefile("creditsMDMDMDMDM.ogg", syn_crypt_b64_decode(game:HttpGet("https://raw.githubusercontent.com/vodotexx/ALLOFMYPROJECTS/main/creditsBytecode.txt")))
		end

		local s = Instance.new("Sound", game.CoreGui)
		s.Name = game.HttpService:GenerateGUID()
		s.SoundId = balls("creditsMDMDMDMDM.ogg")
		s.Volume = 0.5
		s:Play()
		wait(5.954)
		s:Destroy()
		delfile("creditsMDMDMDMDM.ogg")
	end)
end)

local plr = game.Players.LocalPlayer
local char = plr.Character

if not char:FindFirstChild("StrawHat") then
	local a = Instance.new("Message", workspace)
	a.Text = "lol retard u need the strawhat to use this script"
	game.Debris:AddItem(a, 2)
end

if char:FindFirstChild("StrawHat") then
	local sh = char.StrawHat
	sh.Parent = workspace

	wait(.2)

	sh.Handle.CanCollide = false
	sh.Handle.Mesh:Destroy()
	local alignPos = Instance.new("AlignPosition", sh.Handle)
	local a0,a1 = Instance.new("Attachment",sh.Handle),Instance.new("Attachment",char.Torso or char.LowerTorso)

	alignPos.Attachment0 = a0
	alignPos.Attachment1 = a1
	alignPos.RigidityEnabled = false
	alignPos.ReactionForceEnabled = false
	alignPos.ApplyAtCenterOfMass = false
	alignPos.MaxForce = 9999999
	alignPos.MaxVelocity = math.huge
	alignPos.Responsiveness = 65

	local bt = Instance.new("BodyThrust",sh.Handle)
	bt.Location = Vector3.new(3,0,0)
	bt.Force = Vector3.new(4000,4000,4000)
end
return
