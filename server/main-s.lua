local link = ''
local botName = 'Coords'
local color = 0x1cd5ff -- HEX COLOR

RegisterCommand('savepos', function(source, args)
    local _src = source
    if _src == 0 then
        print('[^1fgs-coords^0]: You can\'t use this command from console!')
        return
    end

    local sourceCoords = GetEntityCoords(GetPlayerPed(_src))
    local locationName = table.concat(args, ' ')

    local webhookMsg = {
        {
            ['color'] = color,
            ['title'] = string.format('Player: **%s** saved a position', GetPlayerName(_src)),
            ['description'] = string.format('```\nLocation name: %s\nvector3(%s, %s, %s)\n{x = %s, y = %s, z = %s}\n```', locationName, string.format('%.2f', sourceCoords.x), string.format('%.2f', sourceCoords.y), string.format('%.2f', sourceCoords.z), string.format('%.2f', sourceCoords.x), string.format('%.2f', sourceCoords.y), string.format('%.2f', sourceCoords.z)),
            ['footer'] = {
                ['text'] = 'fgs-coords | ' .. os.date('%H:%M - %d. %m. %Y', os.time()),
            },
        }
    }

    PerformHttpRequest(link, function(err, text, headers) end, 'POST', json.encode({username = botName, embeds = webhookMsg}), { ['Content-Type'] = 'application/json' }) 	
end)
