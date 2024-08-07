return function(self, count)
  local results = { }
  local taken = {
    count = 0
  }
  if self.isParallel then
    results = self:processInParallel(self.data, function(results, key, value)
      if taken.count < count then
        taken.count = taken.count + 1
        results[key] = value
      end
    end)
  else
    for key, value in pairs(self.data) do
      if taken.count < count then
        results[key] = value
        taken.count = taken.count + 1
      else
        break
      end
    end
  end
  return Linq(results)
end
