---@diagnostic disable: undefined-global
Vector3 = load_script("sovmax_api:scripts/core/vector3.lua", true)
Box = load_script("sovmax_api:scripts/core/box_class.lua", true)
All_classes = load_script("sovmax_api:scripts/core/all_classes.lua", true)

Block = {}

local block_mt = { __type = "Block" }
setmetatable(Block,
    {
        __call = function(self, key, part_of, position, id, state, is_solid, is_replace)
            local new_block = {}
            new_block.__type = block_mt.__type

            new_block.position = position
            new_block.id = id
            new_block.state = state
            new_block.is_solid = is_solid
            new_block.is_replace = is_replace

            part_of[key] = setmetatable(new_block, block_mt)
            table.insert(part_of.all_keys, key)
            return part_of[key]
        end
    }
)

block_mt.__index = Block

block_mt.__tostring = function(self)
    return "Position:" .. self.position:tostring() .. "\n"
        .. "Id:" .. self.id .. "\n"
        .. "State:" .. self.state .. "\n"
        .. "Is Solid:" .. tostring(self.is_solid) .. "\n"
        .. "Is Replace:" .. tostring(self.is_replace) .. "\n"
end

function Block:paste()
    local x, y, z = self.position.x, self.position.y, self.position.z

    set_block(x, y, z, self.id, self.state)
end

function Block:set(id, state)
    set_block(x, y, z, id, state)
end

--Дописать
function Block:remove(part_of)
    table.remove(part_of.all_keys, i)
    part_of[self.key] = nil
end

return Block





























-- Block = {}

-- local block_mt = { __type = "Block" }
-- setmetatable(Block,
--     {
--         __call = function(self, position, id, state)
--             local new_block = {}
--             table.insert(All_classes, new_block)

--             new_block.position = position
--             new_block.id = type(id) == "number" and id or block_index(id)
--             new_block.state = state or 0
--             new_block.array_name = "All_classes"
--             new_block.index = #array

--             return setmetatable(new_block, block_mt)
--         end
--     }
-- )
-- block_mt.__index = Block

-- block_mt.__tostring = function(self)
--     return "Position: " .. self.position:tostring() .. "\n"
--         .. "Id: " .. self.id .. "\n"
--         .. "State: " .. self.state .. "\n"
--         .. "index: " .. self.index .. "\n"
-- end

-- function Block:set(id, state)
--     id, state = id or 0, state or 0
--     set_block(self.position.x, self.position.y, self.position.z, id, state)
-- end

-- function Block:paste(bool)
--     bool = bool == nil and true or bool
--     if bool == true then
--         self:set(self.id, self.state)
--     end
-- end

-- function Block:remove()
--     table.remove(self.array, self.index)
--     Block:reindex_blocks(self.array)
-- end

-- function Block:insert(array)
--     array = array or Block.all_blocks
--     self.array = array
--     table.insert(array, self)
--     Block:reindex_blocks(self.array)
-- end

-- function Block:del()
--     self:set()
--     self:remove()
-- end

-- function Block:move_to(array)
--     self:remove()
--     self:insert(array)
-- end

-- function Block:get_block(vector, array)
--     array = array or Block.all_blocks
--     for i = 1, #array do
--         if array[i].position == vector then
--             return array[i]
--         end

--         if array[i].index == vector then
--             return array[i]
--         end
--     end
-- end

-- function Block:is_replaceable_at()
--     local x, y, z = self.position.x, self.position.y, self.position.z
--     if is_replaceable_at(x, y, z) == true then
--         return true
--     end
--     return false
-- end

-- function Block:reindex_blocks(array)
--     for i = 1, #array do
--         array[i].index = i
--     end
-- end

-- return Block
