
-- 🕹 Mobile-Friendly GUI: Fly, Speed, Noclip
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local FlyButton = Instance.new("TextButton")
local SpeedButton = Instance.new("TextButton")
local NoclipButton = Instance.new("TextButton")

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.Name = "HackGUI"

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Frame.Position = UDim2.new(0, 50, 0, 50)
Frame.Size = UDim2.new(0, 200, 0, 200)
Frame.Active = true
Frame.Draggable = true

FlyButton.Parent = Frame
FlyButton.Position = UDim2.new(0, 10, 0, 10)
FlyButton.Size = UDim2.new(0, 180, 0, 50)
FlyButton.Text = "Toggle Fly"
FlyButton.BackgroundColor3 = Color3.fromRGB(70, 130, 180)

SpeedButton.Parent = Frame
SpeedButton.Position = UDim2.new(0, 10, 0, 70)
SpeedButton.Size = UDim2.new(0, 180, 0, 50)
SpeedButton.Text = "Speed Boost"
SpeedButton.BackgroundColor3 = Color3.fromRGB(34, 139, 34)

NoclipButton.Parent = Frame
NoclipButton.Position = UDim2.new(0, 10, 0, 130)
NoclipButton.Size = UDim2.new(0, 180, 0, 50)
NoclipButton.Text = "Toggle Noclip"
NoclipButton.BackgroundColor3 = Color3.fromRGB(178, 34, 34)

-- Fly Function
local flying = false
FlyButton.MouseButton1Click:Connect(function()
    flying = not flying
    local player = game.Players.LocalPlayer
    local char = player.Character or player.CharacterAdded:Wait()
    local humanoid = char:FindFirstChildOfClass("Humanoid")
    humanoid.PlatformStand = flying
    while flying do
        char.HumanoidRootPart.Velocity = Vector3.new(0, 50, 0)
        wait(0.1)
    end
end)

-- Speed Boost Function
SpeedButton.MouseButton1Click:Connect(function()
    local player = game.Players.LocalPlayer
    local char = player.Character or player.CharacterAdded:Wait()
    char:FindFirstChildOfClass("Humanoid").WalkSpeed = 100
end)

-- Noclip Function
local noclip = false
NoclipButton.MouseButton1Click:Connect(function()
    noclip = not noclip
    game:GetService("RunService").Stepped:Connect(function()
        if noclip then
            for _,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                if v:IsA("BasePart") and v.CanCollide == true then
                    v.CanCollide = false
                end
            end
        end
    end)
end)
