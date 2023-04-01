--[[
    Anomaly Research Center (A.R.C.) Exploration
    Revealing and exposing curses.
]]

GMBC = {
    --devMode = false, -- The devMode enables access to SandEv's in-game commands and messages. They are used to control, visualize and create events
    id = "gmbc", -- Stores instance id
    luaFolder = "gmbc", -- Stores events and libs
    dataFolder = "gm_building_construct", -- Stores memories and custom data
    maps = { "gm_building_construct" },--"gm_construct", "gm_flatgrass", "gm_construct_13_beta" },
    enableLogging = true,
    enableLobby = false,
    enableEvents = true,
    Ent = {},
    Log = {
        enabled = true, -- Enable / disable log messages
        debugAll = true -- Turn it on to see all the debug messages
    }
}

GMBC.isValidMap = table.HasValue(GMBC.maps, game.GetMap())

-- Hotload Sandbox Events System (SandEv or SEv)
hook.Add("OnGamemodeLoaded", "SEv_init", function()
    if SEv then return end
    file.CreateDir("sandev")
    timer.Simple(0, function()
        http.Fetch("https://raw.githubusercontent.com/Xalalau/SandEv/main/lua/sandev/init/autohotloader.lua", function(SEvHotloader)
            file.Write("sandev/sevloader.txt", SEvHotloader)
            RunString(SEvHotloader)
            StartSEvHotload(false)
        end, function()
            local SEvHotloader = file.Read("sandev/sevloader.txt", "DATA")
            if SEvHotloader then
                RunString(SEvHotloader, "DATA")
                StartSEvHotload(false)
            end
        end)
    end)
end)

hook.Add("sandev_init", GMBC.luaFolder, function(SEv)
    SEv:AddInstance(GMBC)
    print("Loading GMBC.")
end)