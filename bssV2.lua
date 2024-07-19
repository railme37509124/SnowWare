-- SnowWare Snowflake farmer by crystalHub
-- Issues? discord.gg/FJQXYfaAh2
-- Load an Anti-AFK please!

local path = workspace:WaitForChild"Particles":WaitForChild"Snowflakes"
local lplr = game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait()
local info = "Please Take Caution when AutoFarming Snowflakes overnight! Issues? discord.gg/FJQXYfaAh2"

--[[game:GetService("Players").LocalPlayer.OnTeleport:Connect(function(State)
    if State == Enum.TeleportState.Started then
        syn.queue_on_teleport(" ")
    end
end)--]]

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
notif("SnowWare", info, 5)
notif("SnowWare", "Sometimes snowflakes wont collect just keep waiting or serverhop & add to autoexec", 15)

function getsnowflake()
    return path:GetChildren()[math.random(1, #path:GetChildren())]
end

while true do
    lplr.HumanoidRootPart.CFrame = getsnowflake().CFrame
    notif("SnowWare", "Teleporting To Snowflake", 2.5) --Sorry for a bit of notification spam
    task.wait(6)
end
