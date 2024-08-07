return function(self, predicate)
  local result = { }
  if self.isParallel then
    result = self:processInParallel(self.data, function(result, key, value)
      if predicate(value) then
        result[key] = value
      else
        return coroutine.yield()
      end
    end)
  else
    for key, value in pairs(self.data) do
      if predicate(value) then
        result[key] = value
      else
        break
      end
    end
  end
  return Linq(result)
end
