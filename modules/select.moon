(self, selector) ->
    results = {}
    if @isParallel
        results = self\processInParallel @data, (results, key, value) ->
            results[key] = selector value
    else
        results = {}
        for key, value in pairs @data
            results[key] = selector value
    Linq results