local aoc = require('aoc')

local function isSymbol(c)
    return not aoc.isDigit(c) and c ~= '.'
end

local function isGear(c)
    return c == '*'
end

local function findNumbers(data)
    local numbers = {}
    for i, line in ipairs(data) do
        local start = 1
        while start <= #line do
            local x, y = line:find('%d+', start)
            if x == nil then
                break
            end

            numbers[#numbers+1] = {
                row = i,
                start = x,
                stop = y,
                number = tonumber(line:sub(x, y))
            }

            start = y + 1
        end
    end
    return numbers
end

local function partA(data)
    local rows = #data
    local cols = #(data[1])
    local numbers = findNumbers(data)

    local total = 0
    for _, n in ipairs(numbers) do
        for ii = n.row - 1, n.row + 1 do
            for jj = n.start - 1, n.stop + 1 do
                if 1 <= ii and ii <= rows and 1 <= jj and jj <= cols then
                    if isSymbol(data[ii]:sub(jj, jj)) then
                        total = total + n.number
                        goto included
                    end
                end
            end
        end
        :: included ::
    end
    return total
end

local function partB(data)
    local rows = #data
    local cols = #(data[1])
    local numbers = findNumbers(data)
    
    local gearNeighbors = {}
    for _, n in ipairs(numbers) do
        for ii = n.row - 1, n.row + 1 do
            for jj = n.start - 1, n.stop + 1 do
                if 1 <= ii and ii <= rows and 1 <= jj and jj <= cols then
                    if isGear(data[ii]:sub(jj, jj)) then
                        local flatIdx = ii * cols + jj
                        if gearNeighbors[flatIdx] ~= nil then
                            gearNeighbors[flatIdx][#(gearNeighbors[flatIdx])+1] = n.number
                        else
                            gearNeighbors[flatIdx] = {n.number}
                        end
                    end
                end
            end
        end
    end

    local total = 0
    for k, v in pairs(gearNeighbors) do
        if #v == 2 then
            total = total + v[1] * v[2]
        end
    end
    return total
end

local data = aoc.getInput('./inputs/03.txt')
print('Part A: ' .. partA(data))
print('Part B: ' .. partB(data))
