(self, keySelector) ->
    orderedData = {}
    
    if @isParallel
        orderedData = self\processInParallel @data, (result, key, value) ->
            result[key] = { key: keySelector(value), value: value }
    else
        for key, value in pairs @data
            orderedData[key] = { key: keySelector(value), value: value }
    
    table.sort orderedData, (a, b) -> keySelector(b.value) < keySelector(a.value)

    sortedData = {}
    for _, kv in ipairs(orderedData)
        sortedData[#sortedData + 1] = kv.value

    Linq sortedData