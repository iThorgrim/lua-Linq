(self, predicate = nil) ->
    result = nil
    if @isParallel
        result = self\processInParallel @data, (result, key, value) ->
            if not result.first and ((predicate and predicate value) or (not predicate))
                result.first = value
        result = result.first
    else
        for key, value in pairs @data
            if (predicate and predicate value) or (not predicate)
                result = value
    Linq result