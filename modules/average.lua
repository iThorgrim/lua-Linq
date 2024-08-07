return function(self, selector)
  local total = 0
  local count = 0
  if self.isParallel then
    local partial_sums = self:processInParallel(self.data, function(results, key, value)
      total = total + selector(value)
      count = count + 1
    end)
  else
    for _, value in pairs(self.data) do
      total = total + selector(value)
      count = count + 1
    end
  end
  if count == 0 then
    return nil
  end
  return total / count
end
