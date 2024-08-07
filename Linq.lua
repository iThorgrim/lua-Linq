local Linq
do
  local _class_0
  local _base_0 = {
    where = function(self, predicate)
      local result = { }
      for key, value in pairs(self.data) do
        if predicate(value) then
          result[key] = value
        end
      end
      return Linq(result)
    end,
    select = function(self, selector)
      local result = { }
      for key, value in pairs(self.data) do
        result[key] = selector(value)
      end
      return Linq(result)
    end,
    orderBy = function(self, keySelector)
      local result = {}
      for _, value in ipairs(self.data) do
        table.insert(result, value)
      end
      table.sort(result, function(a, b)
        return keySelector(a) < keySelector(b)
      end)
      return Linq(result)
    end,
    toList = function(self)
      local result = { }
      for _, value in pairs(self.data) do
        table.insert(result, value)
      end
      return result
    end,
    toString = function(self)
      local function serialize(value, depth)
        depth = depth or 0
        local indent = string.rep("  ", depth)

        if type(value) == "table" then
          local result = "{\n"
          for k, v in pairs(value) do
            local key = type(k) == "number" and "[" .. k .. "]" or tostring(k)
            result = result .. indent .. "  " .. key .. " = " .. serialize(v, depth + 1) .. ",\n"
          end
          return result .. indent .. "}"
        elseif type(value) == "string" then
          return "\"" .. value .. "\""
        else
          return tostring(value)
        end
      end

      return serialize(self.data)
    end,
    any = function(self, predicate)
      for _, value in pairs(self.data) do
        if predicate(value) then
          return true
        end
      end
      return false
    end,
    all = function(self, predicate)
      for _, value in pairs(self.data) do
        if not predicate(value) then
          return false
        end
      end
      return true
    end,
    first = function(self, predicate)
      for _, value in ipairs(self.data) do
        if predicate(value) then
          return value
        end
      end
      return nil
    end,
    sum = function(self, selector)
      local sum = 0
      for _, value in pairs(self.data) do
        sum = sum + selector(value)
      end
      return sum
    end,
    average = function(self, selector)
      local sum = 0
      local count = 0
      for _, value in pairs(self.data) do
        sum = sum + selector(value)
        count = count + 1
      end
      return count > 0 and sum / count or 0
    end,
    max = function(self, selector)
      local maxVal = nil
      for _, value in pairs(self.data) do
        local val = selector(value)
        if maxVal == nil or val > maxVal then
          maxVal = val
        end
      end
      return maxVal
    end,
    min = function(self, selector)
      local minVal = nil
      for _, value in pairs(self.data) do
        local val = selector(value)
        if minVal == nil or val < minVal then
          minVal = val
        end
      end
      return minVal
    end,
    flatten = function(self, depth)
      local function flattenHelper(t, d)
        if d == 0 then return t end
        local result = {}
        for _, v in ipairs(t) do
          if type(v) == "table" then
            for _, subV in ipairs(flattenHelper(v, d - 1)) do
              table.insert(result, subV)
            end
          else
            table.insert(result, v)
          end
        end
        return result
      end
      return Linq(flattenHelper(self.data, depth or 1))
    end,
    groupBy = function(self, keySelector)
      local groups = {}
      for _, value in pairs(self.data) do
        local key = keySelector(value)
        if not groups[key] then
          groups[key] = {}
        end
        table.insert(groups[key], value)
      end
      return Linq(groups)
    end,
    distinct = function(self, keySelector)
      local seen = {}
      local result = {}
      for _, value in pairs(self.data) do
        local key = keySelector(value)
        if not seen[key] then
          seen[key] = true
          table.insert(result, value)
        end
      end
      return Linq(result)
    end,
    zip = function(self, tbl2, selector)
      local result = {}
      local len = math.min(#self.data, #tbl2)
      for i = 1, len do
        table.insert(result, selector(self.data[i], tbl2[i]))
      end
      return Linq(result)
    end,
    append = function(self, tbl2)
      local result = {table.unpack(self.data)}
      for _, value in ipairs(tbl2) do
        table.insert(result, value)
      end
      return Linq(result)
    end
  }
  _base_0.__index = _base_0
  _class_0 = setmetatable({
    __init = function(self, data)
      self.data = data
    end,
    __base = _base_0,
    __name = "Linq"
  }, {
    __index = _base_0,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  Linq = _class_0
end
_G["Linq"] = Linq
