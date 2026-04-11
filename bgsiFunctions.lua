local ReplicatedStorage = game:GetService("ReplicatedStorage")
local HttpService = game:GetService("HttpService")

local Lib = {}

function Lib.test()
    return 'yes'
end

--// Format numbers to have commas where they should be
function Lib.addCommasToNumber(number)
    local formatted = tostring(num)
    local k

    repeat
        formatted, k = formatted:gsub("^(-?%d+)(%d%d%d)", "%1,%2")
    until k == 0

    return formatted
end

--// Get Pet Data By Name
function Lib.getPetData(petName)
    local response = request({
        Url = 'https://api.bgsi.gg/api/items/'..petName,
        Method = 'GET',
        Headers = { ['Content-Type'] = 'application/json' }
    })
    local success, data = pcall(function()
        return HttpService:JSONDecode(response.Body)
    end)

    return response.Body
end

--// Initiate Rayfield UI Window
function Lib.createWindow(UserInterface)
    return UserInterface:CreateWindow({Name = 'Bubble Gum Simulator Infinity',Icon = 0,LoadingTitle = 'Thank you for chosing Scriptify.',LoadingSubtitle = 'Your menu should load shortly.',ShowText = 'ShowText test',Theme = 'Default',ToggleUIKeybind = 'K',DisableRayfieldPrompts = true,DisableBuildWarnings = false,ConfigurationSaving = {Enabled = true,FolderName = nil,FileName = 'Big Hub'},Discord = {Enabled = false,Invite = 'noinvitelink',RememberJoins = true},KeySystem = false,KeySettings = {Title = 'Key System Title',Subtitle = 'Subtitle',Note = 'No method of obtaining the key is listed.',FileName = 'Key',SaveKey = false,GrabKeyFromSite = false,Key = {'Hello1', 'Hello2'}}})
end

--// Notify a user with Rayfield UI
function Lib.notifyUser(UserInterface, title, content, duration, image)
    UserInterface:Notify({Title = title, Content = content, Duration = duration, Image = image})
end

--// Claim All Playtime Rewards (BGSI)
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
