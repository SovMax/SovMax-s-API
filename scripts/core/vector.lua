Vector = {}

function Vector.get_position(vector3)
    return vector3[1], vector3[2], vector3[3]
end

function Vector.add_vectors(array_vectors)
    local result = { 0, 0, 0 }
    for i = 1, #array_vectors, 1 do
        for l, number in ipairs(array_vectors[i]) do
            result[l] = result[l] + number
        end
    end
    return result
end

function Vector.subtract_vectors(array_vectors)
    local result = { 0, 0, 0 }
    for i = 1, #array_vectors, 1 do
        for l, number in ipairs(array_vectors[i]) do
            if i == 1 then
                result[l] = result[l] + number
            else
                result[l] = result[l] - number
            end
        end
    end
    return result
end

function Vector.get_vector_dir_state(pos_vector3, func)
    local x, y, z = func(pos_vector3[1], pos_vector3[2], pos_vector3[3])
    return ({ x, y, z })
end
