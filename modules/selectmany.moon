(self, selector) ->
    results = {}
    if @isParallel
        results = self\processInParallel @data, (results, key, value) ->
            for innerKey, innerValue in pairs(selector value)
                results[#results + 1] = innerValue
    else
        for _, value in pairs @data
            for innerKey, innerValue in pairs(selector value)
                results[#results + 1] = innerValue
    Linq results