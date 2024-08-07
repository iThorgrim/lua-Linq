return function(self, depth)
  if depth == nil then
    depth = 1
  end
  local flattenHelper
  flattenHelper = function(t, d)
    if d == 0 then
      return t
    end
    local result = { }
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
  if self.isParallel then
    local result = self:processInParallel(self.data, function(res, _, value)
      return flattenHelper(value, depth)
    end)
  else
    local result = flattenHelper(self.data, depth)
  end
  return Linq(result)
end
