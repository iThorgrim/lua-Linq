(self, predicate = nil) ->
  result = nil
  if @isParallel
      result = self\processInParallel @data, (result, key, value) ->
      if ((predicate and predicate value) or (not predicate))
          result = value
  else
      last_value = nil
      for key, value in pairs @data
          if (predicate and predicate value) or (not predicate)
              result = value
  Linq result