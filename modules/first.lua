return function(self, predicate)
  if predicate == nil then
    predicate = nil
  end
  local result = nil
  if self.isParallel then
    result = self:processInParallel(self.data, function(result, key, value)
      if not result.first and ((predicate and predicate(value)) or (not predicate)) then
        result.first = value
      end
    end)
    result = result.first
  else
    for key, value in pairs(self.data) do
      if (predicate and predicate(value)) or (not predicate) then
        result = value
      end
    end
  end
  return Linq(result)
end
