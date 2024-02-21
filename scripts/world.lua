---@diagnostic disable: undefined-global
Json = load_script("sovmax_api:scripts/core/json.lua", true)
Block = load_script("sovmax_api:scripts/core/block_class.lua", true)
Mblock = load_script("sovmax_api:scripts/core/multiblock_class.lua", true)
Utils = load_script("sovmax_api:scripts/core/util.lua", true)
Box = load_script("sovmax_api:scripts/core/box_class.lua", true)
All_classes = load_script("sovmax_api:scripts/core/all_classes.lua", true)

-- local array = {}

-- local block = Block(Vector3(10, 10, 10), 1, 0, array)
-- block:remove()


function on_world_open()
    -- local new_block = block
    -- local full_path = file.resolve("world:test.json")
    -- local data = Json.encode(new_block)
    -- file.write(full_path, data)
    -- local content = file.read(full_path)
    -- print(content)
    -- local block = Json.decode(content)
    -- print(block)
    -- local new_mblock = Mblock("Mblock1")

    local new_mblock = Mblock("Mblock1")
    local new_block = Block("Block1", new_mblock, Vector3(10, 10, 10), 10, 3, true, true)


    print(new_block)
    new_block:remove(new_mblock)
    Utils:get_all_classes(new_mblock)

    print(Utils.type(new_mblock))
    local data = Json.encode(All_classes)
    local full_path = file.resolve("world:test.json")
    file.write(full_path, data)
    --
    print(file.read(full_path))
    local table = Json.decode(file.read(full_path))
end

function on_world_save()

end

-- Box = load_script("sovmax_api:scripts/core/box_class.lua", true)

--     local array = Box("lol")

-- local full_path = file.resolve("world:test.json")
--     local result = file.read(full_path)
--     local table = Json.decode(result)
--     print(Block.all_blocks, table)
--     table.position = Vector3(table.position.x, table.position.y, table.position.z)
--     local block = Block(table.position, table.id, table.state)
--     block:insert(array)
--     print(Block.all_blocks[1])
