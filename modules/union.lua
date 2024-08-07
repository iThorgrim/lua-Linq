return function(self, other)
  local result = { }
  if self.isParallel then
    local allData = { }
    for k, v in pairs(self.data) do
      allData[k] = v
    end
    for k, v in pairs(other) do
      allData[#allData + 1] = v
    end
    result = self:processInParallel(allData, function(results, key, value)
      results[key] = value
    end)
  else
    result = { }
    for k, v in pairs(self.data) do
      result[k] = v
    end
    for k, v in pairs(other) do
      result[#result + 1] = v
    end
  end
  return Linq(result)
end
