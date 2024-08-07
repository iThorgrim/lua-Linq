return function(self, selector)
  local minValue = nil
  if self.isParallel then
    local results = self:processInParallel(self.data, function(results, key, value)
      local selectedValue = selector(value)
      if minValue == nil or selectedValue < minValue then
        minValue = selectedValue
      end
    end)
  else
    for _, value in pairs(self.data) do
      local selectedValue = selector(value)
      if minValue == nil or selectedValue < minValue then
        minValue = selectedValue
      end
    end
  end
  return minValue
end
