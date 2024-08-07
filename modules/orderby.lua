return function(self, keySelector)
  local tempArray = { }
  if self.isParallel then
    local tempData = self:processInParallel(self.data, function(result, key, value)
      result[key] = keySelector(value)
    end)
    for key, value in pairs(self.data) do
      tempArray[#tempArray + 1] = {
        key = key,
        value = value,
        sortKey = tempData[key]
      }
    end
  else
    for _, value in pairs(self.data) do
      tempArray[#tempArray + 1] = {
        value = value,
        sortKey = keySelector(value)
      }
    end
  end
  table.sort(tempArray, function(a, b)
    return a.sortKey < b.sortKey
  end)
  local sortedData = { }
  for _, item in ipairs(tempArray) do
    table.insert(sortedData, item.value)
  end
  return Linq(sortedData)
end
