(self, index) ->
    result = nil
    
    if self.isParallel
        self\processInParallel self.data, (res, key, value) ->
            if key == index or key == tostring(index)
                result = value
    else
        for key, value in pairs @data
            if key == index or key == tostring(index)
                result = value
    Linq result