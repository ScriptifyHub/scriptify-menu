local FireEvent = loadstring(game:HttpGet('https://raw.githubusercontent.com/ScriptifyHub/scriptify-menu/refs/heads/main/re_helper.lua'))() -- args = {'EventName', ...}

--//Auto Bubble (ADD TO NEW MENU)
FireEvent("BlowBubble")

--//Send Trade to user (ADD TO NEW MENU)
FireEvent({'TradeRequest', game:GetService("Players")['username here']})

--//Open Egg (ADD TO NEW MENU)
FireEvent({'HatchEgg', 'EggName', 0})

--//Auto Use Potion (ADD TO NEW MENU)
FireEvent({"UsePotion",'Potion Name','Tier (1-7)'})

--//Auto Claim Playtime Rewards (ADD TO NEW MENU)
local success, RemoteFunction = pcall(function()
    return game:GetService("ReplicatedStorage").Shared.Framework.Network.Remote.RemoteFunction
end)

if not success or not RemoteFunction then
    warn('Couldnt find RF')
    return
end

local function claimAllPlaytime()
    task.spawn(function()
        while true do
            for i = 1, 9 do
                local args = { [1] = 'ClaimPlaytime', [2] = i }
                local ok, result = pcall(function()
                    return RemoteFunction:InvokeServer(unpack(args))
                end)
            end
        end
    end)
end
claimAllPlaytime()

--//Auto Claim Season Pass Rewards
repeat task.wait()
    if 1=1 then
        FireEvent({'ClaimSeason'})
    end
        until 1=2
