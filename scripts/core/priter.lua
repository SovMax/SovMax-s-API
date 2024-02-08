Priter = {}

function Priter.type(input_data)
    print(type(input_data))
end

function Priter.vector(vector3)
    print(Vector.get_position(vector3))
end

function Priter.array(array)
    for i = 1, #array, 1 do
        print(array[i])
    end
    print("\n")
end

function Priter.print_block_info(block)
    local x, y, z = Vector.get_position(block.position)
    print(string.format("Position: %d %d %d", x, y, z))
    print(string.format("State: %d", block.state))
    print(string.format("Id: %d", block.id))
    print("Array:", block.array)
    print(string.format("Index: %d", block.index))
    print("\n")
end
