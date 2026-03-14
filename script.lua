-- Settings
local HoldClick = true

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()

local Scoped = false
local CurrentlyPressed = false

-- Detect right click (scope)
Mouse.Button2Down:Connect(function()
    Scoped = true
end)

Mouse.Button2Up:Connect(function()
    Scoped = false

    if HoldClick and CurrentlyPressed then
        CurrentlyPressed = false
        mouse1release()
    end
end)

RunService.RenderStepped:Connect(function()
    if Scoped then
        if Mouse.Target then
            if Mouse.Target.Parent:FindFirstChild("Humanoid") then
                if HoldClick then
                    if not CurrentlyPressed then
                        CurrentlyPressed = true
                        mouse1press()
                    end
                else
                    mouse1click()
                end
            else
                if HoldClick and CurrentlyPressed then
                    CurrentlyPressed = false
                    mouse1release()
                end
            end
        end
    end
end)
