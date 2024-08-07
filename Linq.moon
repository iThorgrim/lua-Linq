class Linq
    new: (data) =>
        @data = data
        @isParallel = false
        @modules = {}
        @registerBaseModules!
    
    registerBaseModules: () =>
        baseModules = {
            select:   require 'modules.select',
            selectMany:   require 'modules.selectmany',
            
            orderBy: require 'modules.orderby',
            orderByDescending: require 'modules.orderbydescending',

            sum: require 'modules.sum',
            average: require 'modules.average',
            min: require 'modules.min',
            max: require 'modules.max',
            count: require 'modules.count',

            groupBy: require 'modules.groupby',
            
            -- Don't work for the moment
            -- join: require 'modules.join',
            -- joinGroup: require 'modules.joingroup',
            
            take:   require 'modules.take',
            skip:   require 'modules.skip',
            takeWhile:   require 'modules.takewhile',
            skipWhile:   require 'modules.skipwhile',
            
            concat:    require 'modules.concat',
            
            -- Don't work for the moment
            -- cast:    require 'modules.cast',
            ofType:    require 'modules.oftype',

            first:    require 'modules.first',
            last:    require 'modules.last',
            single:    require 'modules.single',
            elementAt:    require 'modules.elementat',

            range:    require 'modules.range',
            -- Don't work for the moment
            -- repeat:    require 'modules.repeat',

            distinct:    require 'modules.distinct',
            union:    require 'modules.union',
            intersect:    require 'modules.intersect',
            except:    require 'modules.except',

            where:    require 'modules.where',
        }

        for name, mod in pairs baseModules
            @registerModule name, mod
    
    registerModule: (name, mod) =>
        @modules[name] = mod
        @[name] = (_, ...) -> mod self, ...

    unregisterModule: (name) =>
        @modules[name] = nil
        @[name] = nil

    asParallel: () =>
        @isParallel = true
        @

    processInParallel: (data, action) =>
        result = {}
        threads = {}

        for key, value in pairs data
            thread = coroutine.create(() -> action(result, key, value))
            threads[#threads + 1] = thread
        
        for _, thread in pairs threads
            coroutine.resume thread

        all_done = false
        while not all_done
            all_done = true
            for _, thread in pairs threads
                if coroutine.status(thread) != "dead"
                    all_done = false
                    coroutine.resume thread

        result

    toList: () =>
        result = {}
        for key, value in pairs @data
            result[#result + 1] = value
        result
    
_G["Linq"] = Linq