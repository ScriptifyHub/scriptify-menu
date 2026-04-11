local success, RemoteEvent = pcall(function()
    return game:GetService('ReplicatedStorage').Shared.Framework.Network.Remote.RemoteEvent
end)

if not success or not RemoteEvent then
    warn("re_helper.lua - Error finding RemoteEvent.")
    return
end

local function FireEvent(args)
    local success, RootEvent = pcall(function()
        return RemoteEvent
    end)

    RootEvent:FireServer(unpack(args))
end

return FireEvent
