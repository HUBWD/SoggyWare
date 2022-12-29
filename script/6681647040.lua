local startTick = tick()

repeat task.wait() until game:IsLoaded()

function aura(a)
    for _,v in next, game:GetService("Players"):GetPlayers() do
        if v.Name ~= game.Players.LocalPlayer.Name then
            if (v.Character.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 20 then
                local args = {
                    [1] = game:GetService("Players")[a].Character:FindFirstChild("Head")
                }
                game:GetService("ReplicatedStorage").b:FireServer(unpack(args))
            end
        end
    end
end

function closest()
    local closestDistance, closestObject = math.huge, nil
    for _, v in ipairs(game:GetService("Players"):GetPlayers()) do
        if v.Name ~= game.Players.LocalPlayer.Name then
            local distance = game:GetService("Players").LocalPlayer:DistanceFromCharacter(v.Character.HumanoidRootPart.Position)
            if distance < closestDistance then
                closestDistance = distance
                closestObject = v.Name
            end
        end
    end
    return closestObject
end

local title =
    "Soggyware | " .. game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name .. " | Version: 2.8.5d"

local Config = {
    WindowName = title,
    Color = Color3.fromRGB(3, 127, 252),
    Keybind = Enum.KeyCode.F
}

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/AlexR32/Roblox/main/BracketV3.lua"))()
local Window = Library:CreateWindow(Config, game:GetService("CoreGui"))
local Notification = loadstring(game:HttpGet(("https://raw.githubusercontent.com/shlexware/Orion/main/source")))()

Notification:MakeNotification(
    {
        Name = "Soggyware",
        Content = "Welcome " .. game.Players.LocalPlayer.Name .. " the hub is loading now!",
        Image = "rbxassetid://7072718307",
        Time = 1
    }
)

local esplib = loadstring(game:HttpGet("https://rentry.co/5yod5m/raw"))()
local Tab = Window:CreateTab("Main")
local Section = Tab:CreateSection("Farming")
local targettingLabel = Section:CreateLabel("Targetting Player: " .. tostring(closest()))

spawn(function()
    while true do
        targettingLabel:UpdateText("Targetting Player: " .. tostring(closest()))
        task.wait(1)
    end
end)

local slapAura = Section:CreateToggle(
    "Slap Aura",
    nil,
    function(x)
        getgenv().slapAura = x

        while slapAura == true do task.wait()
            pcall(function()
                if slapAura == true then
                    aura(closest())
                end
            end)
        end
    end
)

slapAura:CreateKeybind("E")

local Section = Tab:CreateSection("ESP")

local espToggle = Section:CreateToggle(
    "Toggle ESP",
    nil,
    function(x)
        esplib:Toggle(x)
    end
)

espToggle:CreateKeybind("F")

Section:CreateToggle(
    "Name ESP",
    true,
    function(x)
        esplib.Names = x
    end
)

Section:CreateToggle(
    "Box ESP",
    true,
    function(x)
        esplib.Boxes = x
    end
)

Section:CreateToggle(
    "Toggle Boxes Face Cam",
    nil,
    function(x)
        esplib.FaceCamera = x
    end
)

Notification:MakeNotification(
    {
        Name = "Soggyware",
        Content = "Time took to script to load: " .. math.floor(tick() - startTick) .. " Seconds",
        Image = "rbxassetid://7072718307",
        Time = 2
    }
)

local Tab = Window:CreateTab("Settings + Info")

local Section = Tab:CreateSection("Settings")

local toggleui =
    Section:CreateToggle(
    "Toggle UI",
    nil,
    function(x)
        for _, v in next, game:GetService("CoreGui"):GetChildren() do
            a = v:FindFirstChild("ToolTip")
            if a then
                if x == true then
                    a.Parent.Enabled = false
                elseif x == false then
                    a.Parent.Enabled = true
                end
            end
        end
    end
)

toggleui:CreateKeybind("RightShift")

Section:CreateButton(
    "Join Discord Server",
    function()
        local http = game:GetService("HttpService")
        if toClipboard then
            toClipboard("https://discord.gg/soggy")
        else
        end
        local req =
            syn and syn.request or http and http.request or http_request or fluxus and fluxus.request or
            getgenv().request or
            request
        if req then
            req(
                {
                    Url = "http://127.0.0.1:6463/rpc?v=1",
                    Method = "POST",
                    Headers = {
                        ["Content-Type"] = "application/json",
                        Origin = "https://discord.com"
                    },
                    Body = http:JSONEncode(
                        {
                            cmd = "INVITE_BROWSER",
                            nonce = http:GenerateGUID(false),
                            args = {code = "soggy"}
                        }
                    )
                }
            )
        end
    end
)

Section:CreateButton(
    "Close GUI",
    function()
        for _, v in next, game:GetService("CoreGui"):GetChildren() do
            if v:FindFirstChild("ToolTip") then
                v:Destroy()
                break
            end
        end
    end
)

Section:CreateToggle(
    "Close Game",
    nil,
    function(x)
        game:Shutdown()
    end
)

Section:CreateToggle(
    "Rejoin Game",
    nil,
    function(x)
        game:GetService("TeleportService"):Teleport(game.PlaceId, game.Players.LocalPlayer)
    end
)

Section:CreateToggle(
    "Anti AFK",
    nil,
    function(x)
        local vu = game:GetService("VirtualUser")
        game:GetService("Players").LocalPlayer.Idled:Connect(
            function()
                vu:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
                wait(1)
                vu:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
            end
        )
    end
)