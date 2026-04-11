return {
    local function test()
        local success, RemoteFunction = pcall(function()
            return game:GetService("ReplicatedStorage").Shared.Framework.Network.Remote.RemoteFunction
        end)

        if not success or not RemoteFunction then
            warn('Failed to find RemoteFunction')
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
    end
}
