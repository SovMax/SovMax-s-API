load_script("sovmax_api:scripts/core/tool_class.lua", true)
load_script("sovmax_api:scripts/core/block_class.lua", true)
load_script("sovmax_api:scripts/core/multiblock_class.lua", true)

function test_func(block)
    local x, y, z = Vector.get_position(block.position)
    local dep = Vector.get_vector_dep_state({ x, y, z }, get_block_Z)
    local new_pos = Vector.subtract_vectors({ { x, y, z }, dep })
    if Tool.Block.is_replaceable(new_pos) == true then
        set_block(x, y, z)
        block.position = new_pos
        Tool.Block.paste_block(block)
    end
end

function on_placed(x, y, z, playerid)
    Block:new({ x, y, z }, "sovmax_api:test_block", nil, test_func, nil)
end

function on_broken(x, y, z, playerid)
    local obj = Tool.Block.get_block_with_pos({ x, y, z }, Block.all_blocks)
    obj:self_del()
end

function on_interact(x, y, z, playerid)

end

-- # Contert Ticks to Sec(@by Zaksen)
local every_secs_update = 0.2
local MAX_UPDATE_TICK = every_secs_update * 20
local curent_tick = 0
function on_blocks_tick(tps)
    if curent_tick < MAX_UPDATE_TICK then
        curent_tick = curent_tick + 1
    else
        curent_tick = 0
        for l, block in ipairs(Block.all_blocks) do
            test_func(block)
        end
    end
end
