(self, n) ->
    result = {}
    index = 0
    if @isParallel
        result = @processInParallel @data, (result, key, value) ->
            index += 1
            if index > n
                result[key] = value
    else
        for key, value in pairs @data
            index += 1
            if index > n
                result[key] = value
    Linq result
  