(self, predicate) ->
    result = {}
    if self.isParallel
      result = self\processInParallel self.data, (result, key, value) ->
        if predicate value
          result[key] = value
        else
          -- Break the loop by stopping further processing
          coroutine.yield()
    else
      for key, value in pairs self.data
        if predicate value
          result[key] = value
        else
          break
    
    Linq result