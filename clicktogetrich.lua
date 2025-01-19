local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local isRebirthing = false;
local isClicking = false;

local Window = Fluent:CreateWindow({
    Title = "Clicker To Get Richer",
    SubTitle = "by Jae",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true, -- The blur may be detectable, setting this to false disables blur entirely
    Theme = "Aqua",
    MinimizeKey = Enum.KeyCode.RightShift -- Used when theres no MinimizeKeybind
})

--Fluent provides Lucide Icons https://lucide.dev/icons/ for the tabs, icons are optional
local Tabs = {
    AutoClicker = Window:AddTab({ Title = "Auto Clicker", Icon = "mouse-pointer-click" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
}

local Options = Fluent.Options

local Toggle = Tabs.AutoClicker:AddToggle("Auto Clicker", {
    Title = "Auto Click",
    Default = false,
    Callback = function(value)
        if value then
            isClicking = true
            autoclick() 
        else
            isClicking = false 
        end
    end
})

local RebirthToggle = Tabs.AutoClicker:AddToggle("Auto Rebirth", {
    Title = "Auto Rebirth",
    Default = false,
    Callback = function(value)
        if value then
            isRebirthing = true
            autoRebirth() 
        else
            isRebirthing = false 
        end
    end
})

function autoclick()
    while isClicking and task.wait() do
        coroutine.wrap(function()
            game:GetService("ReplicatedStorage"):FindFirstChild("events-shared/network@GlobalEvents").placeBlock:FireServer()
            task.wait(0)
        end)()
    end
end

function autoRebirth()
    while isRebirthing and task.wait() do
        coroutine.wrap(function()
            local args = {
            [1] = 85
            }
            game:GetService("ReplicatedStorage"):FindFirstChild("functions-shared/network@GlobalFunctions"):FindFirstChild("s:rebirth"):FireServer(unpack(args))
            task.wait(0) 
        end)()
    end
end

--local Dropdown = Tabs.AutoClicker:AddDropdown("Dropdown", {
--        Title = "Buys Eggs",
--       Values = {"Grass Egg", "Stone Egg", "Cactus Egg", "Sandstone Egg", "Snowman Egg", "Ice Egg"},
--        Multi = false,
--        Default = 1,
--    })

--    Dropdown:SetValue("six")

--    Dropdown:OnChanged(function(Value)
--        print("Dropdown changed:", Value)
 --   end)


do
    Fluent:Notify({
        Title = "Clicker to get richer",
        Content = "js a menu",
        --SubContent = "SubContent", -- Optional
        Duration = 5 -- Set to nil to make the notification not disappear
    })


	--settings

    Tabs.Settings:AddParagraph({
        Title = "Scripter's",
        Content = "Thanks for using my script if you are reading this jae loves you! ❤"
    })



    --local Toggle = Tabs.Main:AddToggle("MyToggle", {Title = "Toggle", Default = false })

    Toggle:OnChanged(function()
        print("Toggle changed:", Options.MyToggle.Value)
    end)

    Options.MyToggle:SetValue(false)
end


-- Addons:
-- SaveManager (Allows you to have a configuration system)
-- InterfaceManager (Allows you to have a interface managment system)

-- Hand the library over to our managers
SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)

-- Ignore keys that are used by ThemeManager.
-- (we dont want configs to save themes, do we?)
SaveManager:IgnoreThemeSettings()

-- You can add indexes of elements the save manager should ignore
SaveManager:SetIgnoreIndexes({})

-- use case for doing it this way:
-- a script hub could have themes in a global folder
-- and game configs in a separate folder per game
InterfaceManager:SetFolder("FluentScriptHub")
SaveManager:SetFolder("FluentScriptHub/specific-game")

InterfaceManager:BuildInterfaceSection(Tabs.Settings)
SaveManager:BuildConfigSection(Tabs.Settings)


Window:SelectTab(1)

Fluent:Notify({
    Title = "RIP",
    Content = "The script has been loaded.",
    Duration = 8
})

-- You can use the SaveManager:LoadAutoloadConfig() to load a config
-- which has been marked to be one that auto loads!
SaveManager:LoadAutoloadConfig()
