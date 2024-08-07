(self, other) ->
    combined_data = {}
    if @isParallel
        self_data = @processInParallel(@data, (result, key, value) ->
            combined_data[#combined_data + 1] = value
        )
      
        other_data = @processInParallel(other.data, (result, key, value) ->
            combined_data[#combined_data + 1] = value
        )
    else
        for _, value in pairs(@data)
            combined_data[#combined_data + 1] = value
        for _, value in pairs(other.data)
            combined_data[#combined_data + 1] = value

    Linq combined_data