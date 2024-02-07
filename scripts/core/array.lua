Array = {}
function Array.clear_array(array)
    for i in pairs(array) do
        array[i] = nil
    end
end

function Array.get_default_array(array, default)
    if type(array) == "table" then
        return array
    else
        return default
    end
end
