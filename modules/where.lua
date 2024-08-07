return function(self, predicate)
  local results = { }
  if self.isParallel then
    results = self:processInParallel(self.data, function(results, key, value)
      if predicate(value) then
        results[key] = value
      end
    end)
  else
    for key, value in pairs(self.data) do
      if predicate(value) then
        results[key] = value
      end
    end
  end
  return Linq(results)
end
