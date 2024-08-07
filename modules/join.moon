(self, other, keySelectorSelf, keySelectorOther, resultSelector) ->
    results = {}
    if @isParallel
        results = @processInParallel @data, (results, key, value) ->
            keySelf = keySelectorSelf value
            for _, otherValue in pairs other.data
                print(otherValue.userId, otherValue)
                if keySelectorOther(otherValue) == keySelf
                    results[#results + 1] = resultSelector value, otherValue
    else
      for _, value in pairs @data
        keySelf = keySelectorSelf value
        for _, otherValue in pairs other.data
            if keySelectorOther(otherValue) == keySelf
                results[#results + 1] = resultSelector value, otherValue
    Linq results