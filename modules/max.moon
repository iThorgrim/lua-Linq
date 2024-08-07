(self, selector) ->
    maxValue = nil
    
    if @isParallel
        results = @processInParallel @data, (results, key, value) ->
            selectedValue = selector value
            if maxValue == nil or selectedValue > maxValue
                maxValue = selectedValue
    else
        for _, value in pairs @data
            selectedValue = selector value
            if maxValue == nil or selectedValue > maxValue
                maxValue = selectedValue
                
    maxValue