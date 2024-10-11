-- SnowWare for BSS | SnowFlake farmer | Use With Caution! | By CrystalHub
-- This code is horrible but whatever
-- Dont add to autoexecute it reloads automatically
repeat task.wait() until game:IsLoaded()
local path = workspace:WaitForChild"Particles":WaitForChild"Snowflakes"
local lplr = game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait()
local tweenservice = game:GetService("TweenService")
local collecttick = tick()
local serverhopping = true

game:GetService("Players").LocalPlayer.OnTeleport:Connect(function(State)
    queue_on_teleport("loadstring(game:HttpGet('https://raw.githubusercontent.com/railme37509124/SnowWare/main/beeswarm.lua'))()")
end)

if workspace:FindFirstChild("Amulets") then
    workspace.Amulets:Destroy()
end

game.StarterGui:SetCore("ChatMakeSystemMessage", {
    Text = "SnowWare has loaded. Please Take Caution when AutoFarming Snowflakes overnight!"; 
    Color = Color3.fromRGB(107, 170, 253)
})

game.StarterGui:SetCore("SendNotification", {
    Title = "SnowWare"; 
    Text = "Please Take Caution when AutoFarming Snowflakes overnight!";
    Duration = 5;
})



function main()
    for i,v in pairs(lplr:GetDescendants()) do
        if v:IsA("BasePart") or v:IsA("Decal") then
            v.Transparency = 1
        end
    end

    for _, snowflake in path:GetChildren() do
        workspace.CurrentCamera.CameraSubject = snowflake
        lplr.Humanoid:MoveTo(Vector3.new(2048, 9125, 6147))
        task.spawn(function()
            repeat
                tweenservice:Create(lplr.HumanoidRootPart, TweenInfo.new(0.1, Enum.EasingStyle.Linear), {CFrame = snowflake.CFrame + Vector3.new(0, 10, 0)}):Play()
                task.wait(0.1)
            until (tick() - collecttick > 5) or (snowflake.Parent ~= path)
            lplr.HumanoidRootPart.CFrame = snowflake.CFrame
            task.wait(game.Players.LocalPlayer:GetNetworkPing() * 1000)
        end)
        task.spawn(function()
            repeat
                lplr.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
                task.wait()
            until (tick() - collecttick > 5) or (snowflake.Parent ~= path)
        end)
        if not serverhopping then
            game.StarterGui:SetCore("SendNotification", {
                Title = "SnowFlake Collected"; 
                Text = "+1 SnowFlake";
                Duration = 5;
            })
        end
        collecttick = tick()
        task.wait(1.2)
    end
end

spawn(function()
    repeat
        main()
    until nil
end)

wait(120)
serverhopping = true
game.StarterGui:SetCore("SendNotification", {
    Title = "SnowWare"; 
    Text = "Attempting to ServerHop";
    Duration = 9e9;
})
repeat task.wait(5)
    loadstring(game:HttpGet"https://raw.githubusercontent.com/LeoKholYt/roblox/main/lk_serverhop.lua")():Teleport(game.PlaceId)
until nil
