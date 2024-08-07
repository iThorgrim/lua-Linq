(self, depth = 1) ->
    flattenHelper = (t, d) ->
        if d == 0 then return t
        result = {}
        for _, v in ipairs t
            if type(v) == "table"
                for _, subV in ipairs flattenHelper(v, d - 1)
                    table.insert result, subV
            else
                table.insert result, v
        result
  
    if @isParallel
        result = @processInParallel(@data, (res, _, value) -> flattenHelper(value, depth))
    else
        result = flattenHelper(@data, depth)
  
    Linq result
  