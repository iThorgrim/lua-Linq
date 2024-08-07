(self, count) ->
    results = {}
    taken = { count: 0 }  -- Using a table to ensure shared state in coroutines
  
    if @isParallel
        results = @processInParallel @data, (results, key, value) ->
            if taken.count < count
                taken.count += 1
                results[key] = value
    else
        for key, value in pairs @data
            if taken.count < count
                results[key] = value
                taken.count += 1
            else
                break
  
    Linq results
  