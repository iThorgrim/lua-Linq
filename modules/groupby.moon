(self, keySelector) ->
    groups = {}

    if @isParallel
        groups = @processInParallel @data, (groups, _, value) ->
            key = keySelector value
            groups[key] = groups[key] or {}
            groups[key][#groups[key] + 1] = value
    else
        for _, value in pairs @data
            key = keySelector value
            groups[key] = groups[key] or {}
            groups[key][#groups[key] + 1] = value
  
    Linq groups