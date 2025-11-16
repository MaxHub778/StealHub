local Fluent = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/refs/heads/main/source.lua"))()

local Window = Fluent:CreateWindow({
    Title = "Steal Hub",
    SubTitle = "Script Selector",
    TabWidth = 120,
    Size = UDim2.fromOffset(500, 350),
    Acrylic = true,
    Theme = "Dark",
})

local Main = Window:AddTab({
    Title = "Scripts",
    Icon = "rbxassetid://10734916634"
})

local Hubs = {
    {
        Name = "Steal Brainrot",
        URL  = "https://raw.githubusercontent.com/MaxHub778/StealHub/refs/heads/main/StealBrainrot.lua"
    },

    {
        Name = "Dupe Brainrot",
        URL  = "https://raw.githubusercontent.com/SeuUser/TeusHub/main/source.lua"
    }
}

for _,hub in ipairs(Hubs) do
    Main:AddButton({
        Title = hub.Name,
        Description = "Load",
        Callback = function()

            Window:Notify({
                Title = "Loading...",
                Content = "Open: " .. hub.Name,
                Duration = 3
            })

            task.wait(1)

            -- Fecha a interface Fluent atual
            pcall(function()
                Fluent:Destroy()
            end)

            task.wait(0.3)
            loadstring(game:HttpGet(hub.URL))()
        end,
    })
end
