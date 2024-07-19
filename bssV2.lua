-- SnowWare Snowflake farmer by crystalHub
-- Issues? discord.gg/FJQXYfaAh2
-- Load an Anti-AFK please!

local path = workspace:WaitForChild"Particles":WaitForChild"Snowflakes"
local lplr = game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait()
local info = "Please Take Caution when AutoFarming Snowflakes overnight! Issues? discord.gg/FJQXYfaAh2"
local collecttick = tick()

function chatmsg(t,c)
    game.StarterGui:SetCore("ChatMakeSystemMessage", {
        Text = t; 
        Color = c
    })
end

function notif(ti,tx,du)
    game.StarterGui:SetCore("SendNotification", {
        Title = ti; 
        Text = tx;
        Duration = du;
    })
end

chatmsg(info, Color3.fromRGB(107, 170, 253))
chatmsg("Version 1.0.2", Color3.fromRGB(107, 170, 253))
notif("SnowWare", info, 5)
notif("SnowWare", "Sometimes snowflakes wont collect just keep waiting or serverhop & add to autoexec", 5)

function getsnowflake()
    return path:GetChildren()[math.random(1, #path:GetChildren())]
end

while true do
    notif("SnowWare", "Collecting Snowflake", 2.5) --Sorry for a bit of notification spam
    selectedsnowflake = getsnowflake()
    collecttick = tick()
    repeat task.wait()
        lplr.HumanoidRootPart.CFrame = selectedsnowflake.CFrame + Vector3.new(0, 15, 0)
    until (tick() - collecttick > 4.5)
    task.wait(6)
end
