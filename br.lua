local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("PROVE MOM WRONG BY BEING A FAMOUS STREAMER", "Ocean")

local Tab = Window:NewTab("Main")
local Section = Tab:NewSection("Auto")
local Upgrade = Tab:NewSection("Upgrade")
local last = Tab:NewSection("Mom")

last:NewToggle("Prove Mom Wrong", "prove moo milker mommy wrong", function(state)
    if state then
        isprove = true
        proveha() 
    else
        isStreaming = false
    end
end)

Section:NewToggle("Auto Stream (a bit slow)", "get ez money", function(state)
    if state then
        isStreaming = true
        autostream() 
    else
        isStreaming = false
    end
end)

Upgrade:NewToggle("Donation Chance (money)", "ez", function(state)
    if state then
        isDonationChance = true
        DonationChance() 
    else
        isDonationChance = false
    end
end)

Upgrade:NewToggle("Upgrade Streaming Quality (money)", "ez", function(state)
    if state then
        isStreamingQuality = true
        StreamingQuality() 
    else
        isStreamingQuality = false
    end
end)

Upgrade:NewToggle("Upgrade Streaming Time (money)", "ez", function(state)
    if state then
        isStreamingUpgrade = true
        UpgradeStreaming() 
    else
        isStreamingUpgrade = false
    end
end)

function proveda()
    while isprove and task.wait() do
        coroutine.wrap(function()
        game:GetService("ReplicatedStorage").Packages.Knit.Services.RebirthService.RE.Rebirth:FireServer()
            task.wait(0)
        end)()
    end
end

function UpgradeStreaming()
    while isStreamingUpgrade and task.wait() do
        coroutine.wrap(function()
        local args = {
            [1] = "StreamingTime"
        }
        game:GetService("ReplicatedStorage").Packages.Knit.Services.UpgradeService.RE.Upgrade:FireServer(unpack(args))
            task.wait(0)
        end)()
    end
end

function DonationChance()
    while isDonationChance and task.wait() do
        coroutine.wrap(function()
    local args = {
    [1] = "DonationChance"
    }
    game:GetService("ReplicatedStorage").Packages.Knit.Services.UpgradeService.RE.Upgrade:FireServer(unpack(args))
            task.wait(0)
        end)()
    end
end

function StreamingQuality()
    while isStreamingQuality and task.wait() do
        coroutine.wrap(function()
        local args = {
           [1] = "StreamingQuality"
        }
            game:GetService("ReplicatedStorage").Packages.Knit.Services.UpgradeService.RE.Upgrade:FireServer(unpack(args))
            task.wait(0)
        end)()
    end
end

function autostream()
    while isStreaming and task.wait() do
        coroutine.wrap(function()
            game:GetService("ReplicatedStorage").Packages.Knit.Services.StarterPcService.RF.FinishedPattern:InvokeServer()
            task.wait(0)
        end)()
    end
end
