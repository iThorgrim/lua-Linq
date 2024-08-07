return function(self, selector)
  local results = { }
  if self.isParallel then
    results = self:processInParallel(self.data, function(results, key, value)
      for innerKey, innerValue in pairs(selector(value)) do
        results[#results + 1] = innerValue
      end
    end)
  else
    for _, value in pairs(self.data) do
      for innerKey, innerValue in pairs(selector(value)) do
        results[#results + 1] = innerValue
      end
    end
  end
  return Linq(results)
end
