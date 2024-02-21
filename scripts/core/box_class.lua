Box = {}
Box.all_box = {}

local box_mt = {}
setmetatable(Box,
    {
        __call = function(self, name, ...)
            for i = 1, #Box.all_box do
                if Box.all_box[i].name == name then
                    return Box.all_box[i]
                end
            end
            local new_box = {}

            table.insert(Box.all_box, new_box)

            new_box.name = name
            local data = { ... }
            for i = 1, #data do
                table.insert(new_box, data[i])
            end


            return setmetatable(new_box, box_mt)
        end
    }
)
box_mt.__index = Box

box_mt.__tostring = function(self)
    return "Name: " .. self.name
end

function Box:insert(array)
    array = array or Box.all_box
    table.insert(array, self)
end

function Box:init()
    Utils.mkdir(Utils.arrays_path)
end

return Box
