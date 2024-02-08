load_script("sovmax_api:scripts/core/tool_class.lua", true)
load_script("sovmax_api:scripts/core/block_class.lua", true)
load_script("sovmax_api:scripts/core/multiblock_class.lua", true)
function created_new_blocks(pos)
    local pos = pos
    local obj1 = Block:new(pos, "sovmax_api:test_block")

    local dir = Vector.get_vector_dir_state(pos, get_block_X)
    local new_pos = Vector.add_vectors({ pos, dir })
    local obj2 = Block:new(new_pos, "sovmax_api:test_block")

    dir = Vector.get_vector_dir_state(pos, get_block_Z)
    new_pos = Vector.subtract_vectors({ pos, dir })
    local obj3 = Block:new(new_pos, "sovmax_api:test_block")

    local dir1 = Vector.get_vector_dir_state(pos, get_block_X)
    local dir2 = Vector.get_vector_dir_state(pos, get_block_Z)
    local new_vetcor1 = Vector.subtract_vectors({ dir1, dir2 })
    new_pos = Vector.add_vectors({ pos, new_vetcor1 })
    local obj4 = Block:new(new_pos, "sovmax_api:test_block")
    return { obj1, obj2, obj3, obj4 }
end

local new_multiblock
function on_placed(x, y, z, playerid)
    local array_blocks = created_new_blocks({ x, y, z })

    -- print("All Blocks:\n")
    -- Priter.array(Block.all_blocks)
    new_multiblock = Multiblock:new(array_blocks, nil, nil)
    new_multiblock:self_paste()
    -- print("All Blocks:\n")
    -- Priter.array(Block.all_blocks)
    -- print("All Multiblocks:\n")
    -- Priter.array(Multiblock.all_multi_blocks)
    -- print(string.format("All Blocks Element: %d\n", 1))
    -- Priter.array(Multiblock.all_multi_blocks[1].elements)
end

function on_broken(x, y, z, playerid)
    local multi_obj = Tool.Multiblock.get_multiblock_with_pos({ x, y, z }, Multiblock.all_multi_blocks)
    multi_obj:self_del()
    return true
end

function on_interact(x, y, z, playerid)

end

-- -- # Contert Ticks to Sec(@by Zaksen)
-- local every_secs_update = 0.2
-- local MAX_UPDATE_TICK = every_secs_update * 20
-- local curent_tick = 0
-- function on_blocks_tick(tps)
--     if curent_tick < MAX_UPDATE_TICK then
--         curent_tick = curent_tick + 1
--     else
--         curent_tick = 0
--         for l, block in ipairs(Block.all_blocks) do
--             block.func(block)
--         end
--     end
-- end
