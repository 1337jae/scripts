local Library = loadstring(game:HttpGet('https://raw.githubusercontent.com/Rain-Design/Unnamed/main/Library.lua'))()
Library.Theme = "Dark"
local Flags = Library.Flags

local autoClickActive = false 
local autoClickCoroutine 

local Window = Library:Window({
   Text = "Arm Wrestle Simulator"
})

local Tab = Window:Tab({
   Text = "Main"
})

local Section = Tab:Section({
   Text = "Main Features"
})

local Eggs = Tab:Section({
   Text = "Eggs"
})

Eggs:Button({
    Text = "Buy Earth Egg",
    Callback = function(bool)
        if bool then
            local args = {
                [1] = "Earth",
                [4] = false 
            }
            local success, result = pcall(function()
                return game:GetService("ReplicatedStorage").Packages.Knit.Services.EggService.RF.purchaseEgg:InvokeServer(unpack(args))
            end)
            if not success then
            end
        end
    end
})

Eggs:Button({
    Text = "Buy Icy Egg",
    Callback = function(bool)
        if bool then
            local args = {
             [1] = "Icy",
             [4] = false
            }
            local success, result = pcall(function()
                return game:GetService("ReplicatedStorage").Packages.Knit.Services.EggService.RF.purchaseEgg:InvokeServer(unpack(args))
            end)
            if not success then
            end
        end
    end
})

Eggs:Button({
    Text = "Buy Lava Egg",
    Callback = function(bool)
        if bool then
            local args = {
             [1] = "Lava",
             [4] = false
            }
            local success, result = pcall(function()
                return game:GetService("ReplicatedStorage").Packages.Knit.Services.EggService.RF.purchaseEgg:InvokeServer(unpack(args))
            end)
            if not success then
            end
        end
    end
})

Eggs:Button({
    Text = "Buy Blackhole Egg",
    Callback = function(bool)
        if bool then
            local args = {
             [1] = "Blackhole",
             [4] = false
            }
            local success, result = pcall(function()
                return game:GetService("ReplicatedStorage").Packages.Knit.Services.EggService.RF.purchaseEgg:InvokeServer(unpack(args))
            end)
            if not success then
            end
        end
    end
})


Section:Toggle({
    Text = "Auto Click",
    Callback = function(bool)
        warn(bool) 
        autoClickActive = bool 
        if bool then
            autoClickCoroutine = coroutine.create(function()
                while autoClickActive do
                    game:GetService("ReplicatedStorage").Packages.Knit.Services.ToolService.RE.onClick:FireServer()
                    task.wait(0) 
                end
            end)
            coroutine.resume(autoClickCoroutine)
        end
    end
})

Section:Toggle({
    Text = "Auto Win Battle",
    Callback = function(bool)
        autowinActive = bool 
        if bool then
            autowinCoroutine = coroutine.create(function()
                while autowinActive do  
                    game:GetService("ReplicatedStorage").Packages.Knit.Services.ArmWrestleService.RE.onClickRequest:FireServer()
                    task.wait(0) 
                end
            end)
            coroutine.resume(autowinCoroutine)
        end
    end
})


Section:Toggle({
    Text = "Auto Rebirth",
    Callback = function(bool)
        warn("Auto Rebirth:", bool)
        autoRebirthActive = bool 
        if bool then
            autoRebirthCoroutine = coroutine.create(function()
                while autoRebirthActive do
                    game:GetService("ReplicatedStorage").Packages.Knit.Services.RebirthService.RE.onRebirthRequest:FireServer()
                    task.wait(0) 
                end
            end)
            coroutine.resume(autoRebirthCoroutine)
        end
    end
})

game:GetService("Players").PlayerRemoving:Connect(function()
    autoClickActive = false
    autoRebirthActive = false
end)


Tab:Select()
