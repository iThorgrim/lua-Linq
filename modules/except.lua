return function(self, other, comparator)
  local results = { }
  if not comparator then
    comparator = function(a, b)
      return a == b
    end
  end
  local other_set = { }
  for _, value in pairs(other.data) do
    other_set[value] = true
  end
  if self.isParallel then
    results = self:processInParallel(self.data, function(results, key, value)
      local found = false
      for _, ovalue in pairs(other.data) do
        if comparator(value, ovalue) then
          found = true
          break
        end
      end
      if not found then
        results[key] = value
      end
    end)
  else
    for key, value in pairs(self.data) do
      local found = false
      for _, ovalue in pairs(other.data) do
        if comparator(value, ovalue) then
          found = true
          break
        end
      end
      if not found then
        results[key] = value
      end
    end
  end
  return Linq(results)
end
