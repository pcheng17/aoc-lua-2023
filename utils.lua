local M = {}

function M.getData(filepath)
    local file = io.open(filepath, 'r')
    local data = {}
    if not file then
        return data
    end
    for line in file:lines() do
        table.insert(data, line)
    end
    file:close()
    return data
end

function M.split(str, sep)
    local t = {}
    if sep == nil then
        sep = '%s'
    end
    for s in string.gmatch(str, '[^' .. sep .. ']+') do
        table.insert(t, s)
    end
    return t
end

return M
