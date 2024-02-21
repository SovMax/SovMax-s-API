Vector3 = load_script("sovmax_api:scripts/core/vector3.lua", true)
All_classes = load_script("sovmax_api:scripts/core/all_classes.lua", true)

Mblock = {}

local mblock_mt = { __type = "Mblock" }

setmetatable(Mblock,
    {
        __call = function(self, key)
            local new_mblock = {}
            new_mblock.all_keys = {}
            new_mblock.__type = mblock_mt.__type

            All_classes[key] = setmetatable(new_mblock, mblock_mt)
            table.insert(All_classes.all_keys, key)
            return All_classes[key]
        end
    }
)

mblock_mt.__index = Mblock

return Mblock












-- Mblock = {}

-- local mblock_mt = { __type = "Mblock" }

-- setmetatable(Mblock,
--     {
--         __call = function(self, name, ...)
--             local new_mblock = {}

--             new_mblock.elements = { ... }
--             for i = 1, #new_mblock.elements do
--                 local block = new_mblock.elements[i]
--                 local old_array = block.array
--                 block:reindex_blocks(old_array)
--                 table.remove(old_array, block.index)

--                 block.array = new_mblock.elements
--                 block.index = i

--                 block:reindex_blocks(old_array)
--                 block:reindex_blocks(block.array)
--             end


--             return setmetatable(new_mblock, mblock_mt)
--         end
--     }
-- )
-- mblock_mt.__index = Mblock

-- mblock_mt.__tostring = function(self)
--     return "Amount elements: " .. #self.elements .. "\n"
--         .. "Index: " .. self.index .. "\n"
-- end

-- function Mblock:set(id, state)
--     for i = 1, #self.elements do
--         self.elements[i]:set(id, state)
--     end
-- end

-- function Mblock:paste(bool)
--     bool = bool == nil and true or bool
--     if bool == true then
--         for i = 1, #self.elements do
--             self.elements[i]:paste()
--         end
--     end
-- end

-- function Mblock:remove()
--     table.remove(self.array, self.index)
--     Block:reindex_blocks(self.array)
-- end

-- function Mblock:insert(array)
--     array = array or Mblock.all_mblocks
--     self.array = array
--     table.insert(array, self)
--     Block:reindex_blocks(self.array)
-- end

-- function Mblock:del()
--     self:set()
--     self:remove()
-- end

-- function Mblock:move_to(array)
--     self:remove()
--     self:insert(array)
-- end

-- function Mblock:get_mblock(vector, array)
--     array = array or Mblock.all_mblocks
--     for i = 1, #array do
--         local mblock = array[i]
--         for l = 1, #mblock.elements do
--             local block = mblock.elements[l]
--             if block.position == vector then
--                 return mblock
--             end
--         end
--     end
-- end

-- function Mblock:is_replaceable_at()
--     for i = 1, #self.elements do
--         local block = self.elements[i]
--         if block:is_replaceable_at() == false then
--             return false
--         end
--     end
--     return true
-- end

-- return Mblock
