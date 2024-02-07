load_script("sovmax_api:scripts/core/tool_class.lua", true)


Block = { position = { nil, nil, nil }, id = nil, state = nil, func = nil, array = nil, index = nil }

Block.all_blocks = {}

function Block:new(position, str_id, state, func, array)
    local res_state, res_func, res_array = self:get_default_values(position, state, func, array)
    local new_block = {
        position = position,
        id = block_index(str_id),
        state = res_state,
        func = res_func,
        array = res_array,
        index = #res_array + 1
    }
    self.__index = self
    local object_block = setmetatable(new_block, self)
    table.insert(res_array, object_block)
    Tool.Block.reindex_blocks(res_array)
    return object_block
end

function Block:self_del()
    Tool.Block.del_block(self, self.array)
end

function Block:self_paste()
    Tool.Block.paste_block(self)
end

function Block:self_is_replaceable()
    return Tool.Block.is_replaceable(self)
end

function Block:get_default_values(input_pos, input_state, input_func, input_array)
    local x, y, z = Vector.get_position(input_pos)
    local function default_func() print("Test func") end

    local state = Tool.Block.get_value(input_state, get_block_states(x, y, z))
    local func = Tool.Block.get_value(input_func, default_func)
    local array = Tool.Block.get_value(input_array, Block.all_blocks)

    return state, func, array
end

function Block:print_block_info()
    local x, y, z = Vector.get_position(self.position)
    print(string.format("Position: %d %d %d", x, y, z))
    print(string.format("State: %d", self.state))
    print(string.format("Id: %d", self.id))
    print("Array:", self.array)
    print(string.format("Index: %d", self.index))
    print("\n")
end
