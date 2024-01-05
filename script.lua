-- script proudly made by mazyr --

local Players = game:GetService("Players")

local Player = Players.LocalPlayer
local PlayerCharacter = Player.Character or Player.CharacterAdded:Wait()
local PlayerGui = Player:WaitForChild("PlayerGui")

local Humanoid = PlayerCharacter:FindFirstChild("Humanoid")
local HumanoidRootPart = PlayerCharacter:WaitForChild("HumanoidRootPart")

HumanoidRootPart.Anchored = true

local Screen = Instance.new("ScreenGui", PlayerGui)
Screen.Name = "Screen"
Screen.IgnoreGuiInset = true
Screen.ResetOnSpawn = false

local Frame = Instance.new("Frame", Screen)
Frame.Size = UDim2.new(1,0,1,0)
Frame.Transparency = 1

local Header = Instance.new("TextLabel", Frame)
Header.Size = UDim2.new(0,200,0,50)
Header.Position = UDim2.new(0.418,0,0.465,0)
Header.Name = "Header"
Header.Text = "Would you like to die?"

Header.Font = Enum.Font.Creepster
Header.TextColor3 = Color3.fromRGB(255,0,0)
Header.TextScaled = true
Header.TextStrokeColor3 = Color3.fromRGB(255,255,255)
Header.TextStrokeTransparency = 0
Header.BackgroundTransparency = 1

local Option1 = Instance.new("TextButton", Frame)
Option1.Size = UDim2.new(0, 200,0, 30)
Option1.Position = UDim2.new(0.418, 0,0.585, 0)
Option1.Name = "Yes (Option 1)"
Option1.Text = "Yes"

Option1.Font = Enum.Font.Merriweather
Option1.TextColor3 = Color3.fromRGB(255,255,255)
Option1.TextScaled = true
Option1.TextStrokeColor3 = Color3.fromRGB(0,0,0)
Option1.TextStrokeTransparency = 0
Option1.BackgroundTransparency = 0.5

local Option2 = Instance.new("TextButton", Frame)
Option2.Size = UDim2.new(0, 200,0, 30)
Option2.Position = UDim2.new(0.418, 0,0.533, 0)
Option2.Name = "Yes (Option 2)"
Option2.Text = "Yes"

Option2.Font = Enum.Font.Merriweather
Option2.TextColor3 = Color3.fromRGB(255,255,255)
Option2.TextScaled = true
Option2.TextStrokeColor3 = Color3.fromRGB(0,0,0)
Option2.TextStrokeTransparency = 0
Option2.BackgroundTransparency = 0.5

local function createFire()
	local Fire = Instance.new("Fire", HumanoidRootPart)
	Fire.Color = Color3.fromRGB(236,139,70)
	Fire.Enabled = true
	Fire.Heat = 25
	Fire.SecondaryColor = Color3.fromRGB(139,80,55)
	Fire.Size = 10
	Fire.TimeScale = 1
end

local function colorPlayerBlack()
	for i,v in pairs(PlayerCharacter:GetDescendants()) do
		if v:IsA("BasePart") then
			v.Color = Color3.fromRGB(0,0,0)
		elseif v:IsA("Shirt") or v:IsA("Pants") or v:IsA("ShirtGraphic") then
			v:Destroy()
		end
	end
end

local function killPlayer()
	if Humanoid and Humanoid.Health > 0 then
		createFire()
		colorPlayerBlack()
		Humanoid.WalkSpeed = 0.666
		wait(0.666)
		Humanoid.Health = 0
		warn("Your fate was decided.")
		Screen.Enabled = false
		Screen:Destroy()
	end
end

Option1.Activated:Connect(killPlayer)
Option2.Activated:Connect(killPlayer)