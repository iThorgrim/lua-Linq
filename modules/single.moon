(self, predicate) ->
    result = nil
    found = false

    if @isParallel
        results = @processInParallel @data, (result, key, value) ->
            if predicate value
                if not found
                    found = true
                    result[key] = value
            
        for key, value in pairs results
            if found
                result = value
                break
    else
        for key, value in pairs @data
            if predicate value
                if not found
                    found = true
                    result = value
                    
    Linq result