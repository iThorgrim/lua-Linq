return function(self, predicate)
  local result = nil
  local found = false
  if self.isParallel then
    local results = self:processInParallel(self.data, function(result, key, value)
      if predicate(value) then
        if not found then
          found = true
          result[key] = value
        end
      end
    end)
    for key, value in pairs(results) do
      if found then
        result = value
        break
      end
    end
  else
    for key, value in pairs(self.data) do
      if predicate(value) then
        if not found then
          found = true
          result = value
        end
      end
    end
  end
  return Linq(result)
end
