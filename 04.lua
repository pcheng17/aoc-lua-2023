local aoc = require('aoc')

local function partA(data)
    local total = 0
    for _, line in ipairs(data) do
        local tmpA = line:split(':')
        local tmpB = tmpA[2]:split('|')
        local winning = tmpB[1]:split()
        local mine = tmpB[2]:split()
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
    local cards = {}
    for i = 1, #data do
        cards[i] = 0
    end

    for i, line in ipairs(data) do
        cards[i] = cards[i] + 1
        local _, right = table.unpack(line:split(':'))
        local a, b = table.unpack(right:split('|'))
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
        for j = i + 1, math.min(i + matches, #data) do
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