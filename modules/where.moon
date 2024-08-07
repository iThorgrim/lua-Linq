(self, predicate) ->
    results = {}
    if @isParallel
        results = self\processInParallel @data, (results, key, value) ->
            if predicate value
                results[key] = value
    else
        for key, value in pairs @data
            if predicate value
                results[key] = value
    Linq results