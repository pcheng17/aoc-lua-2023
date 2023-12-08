local aoc = require('libs.aoc')

local function isDigit(char)
    return char:match('%d') ~= nil
end

local function partA(data)
    local lines = data:split('\n')
    local total = 0
    for i = 1, #lines do
        for j = 1, #lines[i] do
            local c = lines[i]:sub(j, j)
            if isDigit(c) then
                total = total + 10 * tonumber(c)
                break
            end
        end

        for j = #lines[i], 1, -1 do
            local c = lines[i]:sub(j, j)
            if isDigit(c) then
                total = total + tonumber(c)
                break
            end
        end
    end
    return total
end

local function partB(data)
    local lines = data:split('\n')
    local replacements = {}
    replacements['one'] = 'o1e'
    replacements['two'] = 't2o'
    replacements['three'] = 't3e'
    replacements['four'] = 'f4r'
    replacements['five'] = 'f5e'
    replacements['six'] = 's6x'
    replacements['seven'] = 's7n'
    replacements['eight'] = 'e8t'
    replacements['nine'] = 'n9e'

    for i = 1, #lines do
        for k, v in pairs(replacements) do
            lines[i] = lines[i]:gsub(k, v)
        end
    end

    return partA(data)
end

local data = aoc.getInput('./inputs/01.txt')
print('Part A: ' .. partA(data))
print('Part B: ' .. partB(data))
