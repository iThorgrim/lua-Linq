return function(self, index)
  local result = nil
  if self.isParallel then
    self:processInParallel(self.data, function(res, key, value)
      if key == index or key == tostring(index) then
        result = value
      end
    end)
  else
    for key, value in pairs(self.data) do
      if key == index or key == tostring(index) then
        result = value
      end
    end
  end
  return Linq(result)
end
