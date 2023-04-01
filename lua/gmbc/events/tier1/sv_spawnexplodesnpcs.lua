local eventName = "spawnHatesNPCs"

local function CreateEvent()
    GMBC.Log:Info("Made Event?")
    for k, spawnPoint in ipairs(ents.FindByClass("info_player_start")) do
        local pos = spawnPoint:GetPos()
        local pointA = pos + Vector(20, 20, 20)
        local pointB = pos - Vector(20, 20, 20)

        local spawnArea = ents.Create("sev_trigger")
        spawnArea:Setup(GMBC, eventName, "spawnArea" .. k, pointA, pointB)

        function spawnArea:StartTouch(ent)
            GMBC.Log:Info("Ent:ExplodeNPC")
            GMBC.Ent:ExplodeNPC(ent)
        end
    end

    return true
end

GMBC.Event:SetCall(eventName, CreateEvent)