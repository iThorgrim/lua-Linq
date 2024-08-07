return function(self, n)
  local result = { }
  local index = 0
  if self.isParallel then
    result = self:processInParallel(self.data, function(result, key, value)
      index = index + 1
      if index > n then
        result[key] = value
      end
    end)
  else
    for key, value in pairs(self.data) do
      index = index + 1
      if index > n then
        result[key] = value
      end
    end
  end
  return Linq(result)
end
