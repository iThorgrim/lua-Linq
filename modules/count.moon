(self, predicate = nil) ->
    count = 0

    if @isParallel
        @processInParallel @data, (result, key, value) ->
            if not predicate or predicate(value)
                count += 1
    else
        for _, value in pairs @data
            if not predicate or predicate(value)
                count += 1

    count