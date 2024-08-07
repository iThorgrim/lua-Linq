return function(self, selector)
  local maxValue = nil
  if self.isParallel then
    local results = self:processInParallel(self.data, function(results, key, value)
      local selectedValue = selector(value)
      if maxValue == nil or selectedValue > maxValue then
        maxValue = selectedValue
      end
    end)
  else
    for _, value in pairs(self.data) do
      local selectedValue = selector(value)
      if maxValue == nil or selectedValue > maxValue then
        maxValue = selectedValue
      end
    end
  end
  return maxValue
end
