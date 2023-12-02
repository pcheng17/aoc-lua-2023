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

return M
