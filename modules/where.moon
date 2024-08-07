(self, predicate) ->
    results = {}
    if self.isParallel
        results = self\processInParallel self.data, (results, key, value) ->
            if predicate value
                results[key] = value
    else
        for key, value in pairs self.data
            if predicate value
                results[key] = value
    Linq results