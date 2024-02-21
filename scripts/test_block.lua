---@diagnostic disable: undefined-global
Block = load_script("sovmax_api:scripts/core/block_class.lua", true)
Mblock = load_script("sovmax_api:scripts/core/multiblock_class.lua", true)
Vector3 = load_script("sovmax_api:scripts/core/vector3.lua", true)
Box = load_script("sovmax_api:scripts/core/box_class.lua", true)
Json = load_script("sovmax_api:scripts/core/json.lua", true)

-- local array = {}

-- function offset_paste(mblock, ...)
--     local vec = { ... }
--     for i = 1, #vec do
--         local new_mblock = mblock
--         for l = 1, #mblock.elements do
--             local block = new_mblock.elements[l]
--             block.position = block.position + vec[i]
--             new_mblock.elements[l] = block
--         end
--         if new_mblock:is_replaceable_at() == true then
--             return new_mblock
--         end
--     end
--     return mblock
-- end


function on_placed(x, y, z, playerid)

end

function on_broken(x, y, z, playerid)
    -- local mblock = Mblock:get_mblock(Vector3(x, y, z), array)
    -- mblock:del()
end

function on_interact(x, y, z, playerid)
    -- local mblock = Mblock:get_mblock(Vector3(x, y, z), array)
    -- print(mblock)
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
