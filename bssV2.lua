local path = workspace:WaitForChild"Particles":WaitForChild"Snowflakes"
local lplr = game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait()
local info = "SnowWare has loaded. Please Take Caution when AutoFarming Snowflakes overnight!"

game:GetService("Players").LocalPlayer.OnTeleport:Connect(function(State)
    if State == Enum.TeleportState.Started then
        syn.queue_on_teleport("loadstring(game:HttpGet('https://raw.githubusercontent.com/railme37509124/SnowWare/main/bssV2.lua'))()")
    end
end)

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

function getsnowflake()
    return path:GetChildren()[math.random(1, #path:GetChildren())]
end

while task.wait(0.3) do
    lplr.HumanoidRootPart.CFrame = getsnowflake().CFrame
    notif("SnowWare", "teleporting-snowflake", 2.5) --Sorry for notification spam
end
