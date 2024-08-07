(self, selector) ->
    results = {}
    if self.isParallel
        results = self\processInParallel self.data, (results, key, value) ->
            results[key] = selector value
    else
        results = {}
        for key, value in pairs self.data
            results[key] = selector value
    Linq results