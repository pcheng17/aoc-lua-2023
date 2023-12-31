local aoc = require('libs.aoc')

local function partA(data)
    local lines = data:split('\n')
    local split = aoc.split
    local maxs = { red = 12, green = 13, blue = 14}
    local total = 0

    for _, line in ipairs(lines) do
        local left, right = split(line, ':'):unpack()
        local gameID = tonumber(split(left)[2])
        local games = split(right, ';')
        local possible = true

        for _, game in ipairs(games) do
            for _, draw in ipairs(split(game, ',')) do
                local balls = split(draw)
                if tonumber(balls[1]) > maxs[balls[2]] then
                    possible = false
                    break
                end
            end 
            if not possible then break end
        end

        if possible then
            total = total + gameID
        end
    end
    return total
end

local function partB(data)
    local lines = data:split('\n')
    local split = aoc.split
    local total = 0

    for _, line in ipairs(lines) do
        local mins = { red = 0, green = 0, blue = 0 }

        local _, right = split(line, ':'):unpack()
        local games = split(right, ';')

        for _, game in ipairs(games) do
            for _, draw in ipairs(split(game, ',')) do
                local balls = aoc.split(draw)
                if tonumber(balls[1]) > mins[balls[2]] then
                    mins[balls[2]] = tonumber(balls[1])
                end
            end
        end

        total = total + mins.red * mins.green * mins.blue
    end
    return total
end

local data = aoc.getInput('./inputs/02.txt')
print('Part A: ' .. partA(data))
print('Part B: ' .. partB(data))
