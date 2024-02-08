Multiblock = { elements = {}, func = nil, index = nil, array = nil }

Multiblock.all_multi_blocks = {}

--Переписать класс

function Multiblock:new(table_blocks, func, array)
    local res_array = self:get_default_values(array)
    local new_block = {
        elements = {},
        func = func,
        array = res_array,
        index = #res_array + 1
    }

    for i = 1, #table_blocks, 1 do
        Tool.Block.move_to_array(table_blocks[i], new_block.elements)
    end

    self.__index = self
    local object_block = setmetatable(new_block, self)
    table.insert(res_array, object_block)
    Tool.Block.reindex_blocks(res_array)
    return object_block
end

function Multiblock:self_paste()
    for i = 1, #self.elements, 1 do
        self.elements[i]:self_paste()
    end
end

function Multiblock:paste_element(index)
    self.elements[index]:self_paste()
end

function Multiblock:self_del()
    while #self.elements ~= 0 do
        self.elements[1]:self_del()
    end
end

function Multiblock:del_element(index)
    self.elements[index]:self_del()
end

function Multiblock:get_default_values(array)
    local array = Tool.get_value(array, Multiblock.all_multi_blocks)
    return array
end

function Multiblock:print_element_info(index)
    Priter.print_block_info(self.elements[index])
end

function Multiblock:print_multiblock_info()
    for i = 1, #self.elements, 1 do
        Priter.print_block_info(self.elements[i])
    end
end
