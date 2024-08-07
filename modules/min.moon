(self, selector) ->
    minValue = nil
    
    if @isParallel
        results = @processInParallel @data, (results, key, value) ->
            selectedValue = selector value
            if minValue == nil or selectedValue < minValue
                minValue = selectedValue
    else
        for _, value in pairs @data
            selectedValue = selector value
            if minValue == nil or selectedValue < minValue
                minValue = selectedValue

    minValue