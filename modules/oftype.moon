(self, stype) ->
    results = {}
    if @isParallel
        results = @processInParallel @data, (results, key, value) ->
            if type(value) == stype
                results[key] = value
    else
        for key, value in pairs @data
            if type(value) == stype
                results[key] = value
    Linq results