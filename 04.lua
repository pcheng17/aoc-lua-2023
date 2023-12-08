local aoc = require('libs.aoc')

local function partA(data)
    local lines = aoc.split(data, '\n')
    local total = 0
    for _, line in ipairs(lines) do
        local _, right = line:split(':'):unpack()
        local a, b = right:split('|'):unpack()
        local winning = a:split()
        local mine = b:split()
        local matches = 0
        for _, x in ipairs(mine) do
            for _, y in ipairs(winning) do
                if tonumber(x) == tonumber(y) then
                    matches = matches + 1
                end
            end
        end
        if matches > 0 then
            total = total + 2 ^ (matches - 1)
        end
    end
    return total
end

local function partB(data)
    local lines = aoc.split(data, '\n')
    local cards = {}
    for i = 1, #lines do
        cards[i] = 0
    end

    for i, line in ipairs(lines) do
        cards[i] = cards[i] + 1
        local _, right = line:split(':'):unpack()
        local a, b = right:split('|'):unpack()
        local winning = a:split()
        local mine = b:split()
        local matches = 0
        for _, x in ipairs(mine) do
            for _, y in ipairs(winning) do
                if tonumber(x) == tonumber(y) then
                    matches = matches + 1
                end
            end
        end
        for j = i + 1, math.min(i + matches, #lines) do
            cards[j] = cards[j] + cards[i]
        end
    end

    local total = 0
    for _, v in ipairs(cards) do
        total = total + v
    end
    return total
end

local data = aoc.getInput('./inputs/04.txt')
print('Part A: ' .. partA(data))
print('Part B: ' .. partB(data))
