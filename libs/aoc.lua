local M = {}

function M.getInput(filepath)
    local f = assert(io.open(filepath, 'rb'))
    local content = f:read('*all')
    f:close()
    return content
end

function M.split(str, sep)
    local t = table.new()
    if sep == nil then
        sep = '%s'
    end
    for s in string.gmatch(str, '[^' .. sep .. ']+') do
        table.insert(t, s)
    end
    return t
end

function M.isDigit(char)
    return char:match('%d') ~= nil
end

function string.startsWith(str, prefix)
    return str:find('^' .. prefix) ~= nil
end

function string.split(str, sep)
    return M.split(str, sep)
end

function string.isDigit(char)
    return M.isDigit(char)
end

-- Creating a table using `new` allows me to invoke table methods on the table 
-- instance directly, i.e., instead of doing `table.unpack(t)`, I can do `t:unpack()`.
table.new = function(s)
    if s == nil then
        local t = {}
        local mt = { __index = table }
        setmetatable(t, mt)
        return t
    end
end

return M
