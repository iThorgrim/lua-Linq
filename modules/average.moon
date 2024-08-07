(self, selector) ->
    total = 0
    count = 0
    
    if @isParallel
        partial_sums = @processInParallel @data, (results, key, value) ->
            total += selector value
            count += 1
    else
        for _, value in pairs @data
            total += selector value
            count += 1
            
    if count == 0
        return nil
    total / count