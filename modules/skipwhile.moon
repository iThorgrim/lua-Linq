(self, predicate) ->
  skipping = true
  results = {}
  
  if self.isParallel
    results = self\processInParallel self.data, (results, key, value) ->
      if skipping and predicate value
        return
      skipping = false
      results[key] = value
  else
    for key, value in pairs self.data
      if not skipping or not predicate(value)
        skipping = false
        results[key] = value

  Linq results