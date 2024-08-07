return function(self, predicate)
  if predicate == nil then
    predicate = nil
  end
  local count = 0
  if self.isParallel then
    self:processInParallel(self.data, function(result, key, value)
      if not predicate or predicate(value) then
        count = count + 1
      end
    end)
  else
    for _, value in pairs(self.data) do
      if not predicate or predicate(value) then
        count = count + 1
      end
    end
  end
  return count
end
