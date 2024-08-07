(self, keySelector) ->
    tempArray = {}
    
    if @isParallel
        tempData = self\processInParallel @data, (result, key, value) ->
            result[key] = keySelector value
        
        for key, value in pairs @data
            tempArray[#tempArray + 1] = { key: key, value: value, sortKey: tempData[key] }
    else
        for _, value in pairs @data
            tempArray[#tempArray + 1] = { value: value, sortKey: keySelector(value) }
  
    table.sort tempArray, (a, b) -> a.sortKey < b.sortKey
  
    sortedData = {}
    for _, item in ipairs tempArray
        table.insert sortedData, item.value
  
    Linq sortedData