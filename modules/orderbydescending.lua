return function(self, keySelector)
  local orderedData = { }
  if self.isParallel then
    orderedData = self:processInParallel(self.data, function(result, key, value)
      result[key] = {
        key = keySelector(value),
        value = value
      }
    end)
  else
    for key, value in pairs(self.data) do
      orderedData[key] = {
        key = keySelector(value),
        value = value
      }
    end
  end
  table.sort(orderedData, function(a, b)
    return keySelector(b.value) < keySelector(a.value)
  end)
  local sortedData = { }
  for _, kv in ipairs(orderedData) do
    sortedData[#sortedData + 1] = kv.value
  end
  return Linq(sortedData)
end
