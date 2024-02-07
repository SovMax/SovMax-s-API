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
