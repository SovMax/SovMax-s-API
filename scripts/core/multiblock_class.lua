Multiblock = { index = nil, length = nil }

Multiblock.all_multi_blocks = {}

--Переписать класс
function Multiblock:init(input_table, array)

end

function Multiblock:self_paste()
    for i = 1, #Multiblock.all_multi_blocks, 1 do
        Multiblock.all_multi_blocks[i]:self_paste()
    end
end
