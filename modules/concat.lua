return function(self, other)
  local combined_data = { }
  if self.isParallel then
    local self_data = self:processInParallel(self.data, function(result, key, value)
      combined_data[#combined_data + 1] = value
    end)
    local other_data = self:processInParallel(other.data, function(result, key, value)
      combined_data[#combined_data + 1] = value
    end)
  else
    for _, value in pairs(self.data) do
      combined_data[#combined_data + 1] = value
    end
    for _, value in pairs(other.data) do
      combined_data[#combined_data + 1] = value
    end
  end
  return Linq(combined_data)
end
