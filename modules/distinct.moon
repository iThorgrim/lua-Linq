(self, keySelector = (x) -> x) ->
    result = {}
    seen = {}
  
    if self.isParallel
      self\processInParallel self.data, (result, _, value) ->
        key = keySelector value
        if not seen[key]
          seen[key] = true
          result[#result + 1] = value
    else
      for _, value in pairs self.data
        key = keySelector value
        if not seen[key]
          seen[key] = true
          result[#result + 1] = value
  
    Linq result