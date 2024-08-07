(self, selector) ->
    total = 0
    
    if @isParallel
        partial_sums = @processInParallel @data, (partial_sums, key, value) ->
            local_sum = selector value
            partial_sums[#partial_sums + 1] = local_sum

        for _, partial_sum in pairs partial_sums
            total += partial_sum
    else
        for _, value in pairs @data
            total += selector value

    total