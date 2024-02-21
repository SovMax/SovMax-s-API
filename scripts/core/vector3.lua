Vector3 = {}

local vec_mt = { type = "Vector3" }
setmetatable(Vector3,
    {
        __call = function(self, x, y, z, dir_func)
            if dir_func == nil then
                return setmetatable({ x = x, y = y, z = z }, vec_mt)
            end
            local dir_x, dir_y, dir_z = dir_func(x, y, z)
            return setmetatable({ x = dir_x, y = dir_y, z = dir_z }, vec_mt)
        end
    }
)
vec_mt.__index = Vector3

function Vector3:clone()
    return Vector3(self.x, self.y, self.z)
end

function Vector3:tostring()
    return self.x .. "," .. self.y .. "," .. self.z
end

vec_mt.__add = function(self, value)
    return Vector3(self.x + value.x, self.y + value.y, self.z + value.z)
end

vec_mt.__sub = function(self, value)
    return Vector3(self.x - value.x, self.y - value.y, self.z - value.z)
end

vec_mt.__eq = function(self, value)
    if self.x == value.x and self.y == value.y and self.z == value.z then
        return true
    end
    return false
end

vec_mt.__unm = function(self)
    return Vector3(-self.x, -self.y, -self.z)
end

vec_mt.__tostring = function(self)
    return self.x .. "," .. self.y .. "," .. self.z
end

return Vector3
