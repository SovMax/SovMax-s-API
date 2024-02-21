---@diagnostic disable: undefined-global
Json = load_script("sovmax_api:scripts/core/json.lua", true)

All_classes = {}

local Utils = {}

Utils.dir_path = "world:meta"
Utils.arrays_path = "world:meta\\arrays.json"
Utils.blocks_path = "world:meta\\blocks.json"
Utils.mblock_path = "world:meta\\mblocks.json"

-- function TableUtils.print_table(tbl, indent)
--     if not indent then indent = 0 end
--     for k, v in pairs(tbl) do
--         local formatting = string.rep("  ", indent) .. k .. ": "
--         if type(v) == "table" then
--             print(formatting)
--             TableUtils.print_table(v, indent + 1)
--         else
--             print(formatting .. tostring(v))
--         end
--     end
-- end


function Utils.type(x)
    return x.__type
end

function Utils:get_all_classes(input_table)
    local result = {}
    for i = 1, #input_table.all_keys do
        table.insert(result, input_table[input_table.all_keys[i]])
    end
end

-- local _type = type
-- function type(x)
--     if _type(x) == "table" then
--         return getmetatable(x).__type or "table"
--     end
--     return _type(x)
-- end

function Utils.mkdir(path)
    if file.exists(path) == false then
        local pathdir = file.resolve(path)
        file.mkdir(pathdir)
    end
end

function Utils.save(path, ...)
    Utils.mkdir(Utils.dir_path)
    local str_data = Json.encode({ ... })
    file.write(path, str_data)
end

function Utils.load(path)
    if file.exists(path) == true then
        file.read(path)
    end
end

function Utils.construct_obj(table)
    for i = 1, #table do
        if Utils.type(table[i]) == "Block" then

        elseif Utils.type(table[i]) == "Mblock" then

        elseif Utils.type(table[i]) == "Array" then

        end
    end
end

function Utils.construct_block(block)
    block.position = Vector3(block.position.x, block.position.y, block.position.z)
    local new_block = Block(block.position, block.id, block.state)
end

return Utils
