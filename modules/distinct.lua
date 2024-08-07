return function(self, keySelector)
  if keySelector == nil then
    keySelector = function(x)
      return x
    end
  end
  local result = { }
  local seen = { }
  if self.isParallel then
    self:processInParallel(self.data, function(result, _, value)
      local key = keySelector(value)
      if not seen[key] then
        seen[key] = true
        result[#result + 1] = value
      end
    end)
  else
    for _, value in pairs(self.data) do
      local key = keySelector(value)
      if not seen[key] then
        seen[key] = true
        result[#result + 1] = value
      end
    end
  end
  return Linq(result)
end
