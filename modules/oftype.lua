return function(self, stype)
  local results = { }
  if self.isParallel then
    results = self:processInParallel(self.data, function(results, key, value)
      if type(value) == stype then
        results[key] = value
      end
    end)
  else
    for key, value in pairs(self.data) do
      if type(value) == stype then
        results[key] = value
      end
    end
  end
  return Linq(results)
end
