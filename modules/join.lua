return function(self, other, keySelectorSelf, keySelectorOther, resultSelector)
  local results = { }
  if self.isParallel then
    results = self:processInParallel(self.data, function(results, key, value)
      local keySelf = keySelectorSelf(value)
      for _, otherValue in pairs(other.data) do
        print(otherValue.userId, otherValue)
        if keySelectorOther(otherValue) == keySelf then
          results[#results + 1] = resultSelector(value, otherValue)
        end
      end
    end)
  else
    for _, value in pairs(self.data) do
      local keySelf = keySelectorSelf(value)
      for _, otherValue in pairs(other.data) do
        if keySelectorOther(otherValue) == keySelf then
          results[#results + 1] = resultSelector(value, otherValue)
        end
      end
    end
  end
  return Linq(results)
end
