load_script("sovmax_api:scripts/core/vector.lua", true)
load_script("sovmax_api:scripts/core/array.lua", true)
load_script("sovmax_api:scripts/core/priter.lua", true)

Tool = { Block = {} }


function Tool.Block.del_block(object, array)
    local x, y, z = Vector.get_position(object.position)

    set_block(x, y, z, 0, 0)
    table.remove(array, object.index) --if object was table
    Tool.Block.reindex_blocks(array)
end

function Tool.Block.paste_block(object)
    local x, y, z = Vector.get_position(object.position)

    set_block(x, y, z, object.id, object.state)
end

function Tool.Block.is_replaceable(vector3)
    local x, y, z = Vector.get_position(vector3)

    if is_replaceable_at(x, y, z) == true then
        return true
    else
        return false
    end
end

--Get Block

function Tool.Block.get_block_with_pos(pos_vector3, array)
    local x, y, z = Vector.get_position(pos_vector3)
    for i = 1, #array, 1 do
        local b_x, b_y, b_z = Vector.get_position(array[i].position)

        if x == b_x and y == b_y and z == b_z then
            do return array[i] end
            break
        end
    end
end

function Tool.Block.get_block_with_index(index, array)
    for i = 1, #array, 1 do
        if index == array[i].index then
            do return array[i] end
            break
        end
    end
end

--Work with arrrays

function Tool.Block.reindex_blocks(array)
    for i = 1, #array do
        if array[i].index ~= i then
            array[i].index = i
        end
    end
end

function Tool.Block.move_to_array(block, input_array)
    table.remove(block.array, block.index)
    Tool.Block.reindex_blocks(block.array)
    block.array = input_array
    table.insert(input_array, block)
    Tool.Block.reindex_blocks(input_array)
end

--Other
function Tool.Block.get_value(value, default)
    if value == nil then
        return default
    else
        return value
    end
end
