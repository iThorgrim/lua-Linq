(self, other, comparator) ->
    results = {}
  
    if not comparator
        comparator = (a, b) -> a == b
  
    other_set = {}
    for _, value in pairs other.data
        other_set[value] = true
    
    if self.isParallel
        results = self\processInParallel self.data, (results, key, value) ->
            for _, ovalue in pairs other.data
                if comparator(value, ovalue)
                    results[key] = value
                    break
    else
        for key, value in pairs self.data
            for _, ovalue in pairs other.data
                if comparator(value, ovalue)
                    results[key] = value
                    break
                    
    Linq results  