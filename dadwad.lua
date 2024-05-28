local player = game.Players.LocalPlayer
local mouse = player:GetMouse()

-- Function to teleport the player to the clicked position
local function teleportToPosition(position)
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
    
    -- Adjust the position to avoid the player being stuck in the ground
    position = position + Vector3.new(0, 3, 0)
    
    -- Set the player's position
    humanoidRootPart.CFrame = CFrame.new(position)
end

-- Event handler for mouse button click
mouse.Button1Down:Connect(function()
    local unitRay = mouse.UnitRay
    local ray = Ray.new(unitRay.Origin, unitRay.Direction * 1000)
    local ignoreList = {player.Character}
    local hit, position = workspace:FindPartOnRayWithIgnoreList(ray, ignoreList)
    
    if hit then
        teleportToPosition(position)
    end
end)
