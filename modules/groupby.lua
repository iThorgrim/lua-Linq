return function(self, keySelector)
  local groups = { }
  if self.isParallel then
    groups = self:processInParallel(self.data, function(groups, _, value)
      local key = keySelector(value)
      groups[key] = groups[key] or { }
      groups[key][#groups[key] + 1] = value
    end)
  else
    for _, value in pairs(self.data) do
      local key = keySelector(value)
      groups[key] = groups[key] or { }
      groups[key][#groups[key] + 1] = value
    end
  end
  return Linq(groups)
end
