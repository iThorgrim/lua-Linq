-- (self, tbl2, selector) ->
--     zipHelper = (data1, data2, sel) ->
--         result = {}
--         len = math.min(#data1, #data2)
--         for i in [1..len]
--             table.insert result, sel(data1[i], data2[i])
--         result
  
--     if @isParallel
--         result = @processInParallel(@data, (res, key, value) ->
--             if key <= #tbl2
--             res[key] = selector(value, tbl2[key])
--         )
--     else
--         result = zipHelper(@data, tbl2, selector)
  
--     Linq result