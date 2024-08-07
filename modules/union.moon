(self, other) ->
    result = {}
    if self.isParallel
        allData = {}
        for k, v in pairs @data
            allData[k] = v
        for k, v in pairs other
            allData[#allData + 1] = v

        result = self\processInParallel allData, (results, key, value) ->
            results[key] = value
    else
        result = {}
        for k, v in pairs @data
            result[k] = v
        for k, v in pairs other
            result[#result + 1] = v

    Linq result