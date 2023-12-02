local utils = require('utils')
local dataPath = './inputs/q01.txt'

local function isDigit(char)
    return char:match('%d') ~= nil
end

local function partA(data)
    local total = 0
    for i = 1, #data do
        for j = 1, #data[i] do
            local c = data[i]:sub(j, j)
            if isDigit(c) then
                total = total + 10 * tonumber(c)
                break
            end
        end

        for j = #data[i], 1, -1 do
            local c = data[i]:sub(j, j)
            if isDigit(c) then
                total = total + tonumber(c)
                break
            end
        end
    end
    return total
end

local function partB(data)
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

    for i = 1, #data do
        for k, v in pairs(replacements) do
            data[i] = data[i]:gsub(k, v)
        end
    end

    return partA(data)
end

local data = utils.getData(dataPath)
print('Part A: ' .. partA(data))
print('Part B: ' .. partB(data))
