return function(self, predicate)
  local skipping = true
  local results = { }
  if self.isParallel then
    results = self:processInParallel(self.data, function(results, key, value)
      if skipping and predicate(value) then
        return 
      end
      skipping = false
      results[key] = value
    end)
  else
    for key, value in pairs(self.data) do
      if not skipping or not predicate(value) then
        skipping = false
        results[key] = value
      end
    end
  end
  return Linq(results)
end
