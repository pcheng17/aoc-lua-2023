local aoc = require('libs.aoc')

local function partA(data)
    local groups = data:split('\n\n')

    for _, g in ipairs(groups) do
        print(g)
        print()
    end

    local seeds = table.new()
    for _, y in ipairs(groups[1]:split(':')[2]:split(' ')) do
        seeds:insert(tonumber(y))
    end


    local maps = table.new()
    for i = 2, #groups do
        local map = table.new()
        local lines = groups[i]:split('\n')
        for j = 2, #lines do
            local a, b, c = lines[j]:split(' '):unpack()
            print(a, b, c)

        end
        
    end
    return 0


end

local function partB(data)
    return 0
end

local data = aoc.getInput('./inputs/05.txt')
print('Part A: ' .. partA(data))
print('Part B: ' .. partB(data))
