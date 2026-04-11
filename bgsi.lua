local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Lib = {}

function Lib.test()
    print('works')
end

function Lib.claimAllPlaytime()
    local success, RemoteFunction = pcall(function()
        return ReplicatedStorage.Shared.Framework.Network.Remote.RemoteFunction
    end)

    if not success or not RemoteFunction then
        return 'Failed to find RemoteFunction - ClaimAllPlaytimeRewards'
    end
    local function claimAllPlaytime()
        task.spawn(function()
            while true do
                for i = 1, 9 do
                local ok, result = pcall(function()
                    return RemoteFunction:InvokeServer({ [1] = 'ClaimPlaytime', [2] = i })
                end)
            end
        end
    end)
end
claimAllPlaytime()
end

return Lib
