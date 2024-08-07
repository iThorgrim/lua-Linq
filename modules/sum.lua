return function(self, selector)
  local total = 0
  if self.isParallel then
    local partial_sums = self:processInParallel(self.data, function(partial_sums, key, value)
      local local_sum = selector(value)
      partial_sums[#partial_sums + 1] = local_sum
    end)
    for _, partial_sum in pairs(partial_sums) do
      total = total + partial_sum
    end
  else
    for _, value in pairs(self.data) do
      total = total + selector(value)
    end
  end
  return total
end
