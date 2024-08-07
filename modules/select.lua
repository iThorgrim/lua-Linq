return function(self, selector)
  local results = { }
  if self.isParallel then
    results = self:processInParallel(self.data, function(results, key, value)
      results[key] = selector(value)
    end)
  else
    results = { }
    for key, value in pairs(self.data) do
      results[key] = selector(value)
    end
  end
  return Linq(results)
end
