class Linq
    new: (data) =>
        @data = data
        @isParallel = false
        @modules = {}
        @registerBaseModules!
    
    registerBaseModules: () =>
        baseModules = {
            average:            require 'modules.average',
            concat:             require 'modules.concat',
            count:              require 'modules.count',
            distinct:           require 'modules.distinct',
            elementAt:          require 'modules.elementat',
            except:             require 'modules.except',
            first:              require 'modules.first',
            flatten:            require 'modules.flatten',
            groupBy:            require 'modules.groupby',
            intersect:          require 'modules.intersect',
            last:               require 'modules.last',
            max:                require 'modules.max',
            min:                require 'modules.min',
            ofType:             require 'modules.oftype',
            orderBy:            require 'modules.orderby',
            orderByDescending:  require 'modules.orderbydescending',
            range:              require 'modules.range',            
            select:             require 'modules.select',
            selectMany:         require 'modules.selectmany',
            single:             require 'modules.single',
            skip:               require 'modules.skip',
            skipWhile:          require 'modules.skipwhile',
            sum:                require 'modules.sum',
            take:               require 'modules.take',
            takeWhile:          require 'modules.takewhile',
            union:              require 'modules.union',
            where:              require 'modules.where',

            -- This don't work for the moment
            -- join:               require 'modules.join',
            -- joinGroup:          require 'modules.joingroup',
            -- cast:               require 'modules.cast',
            -- repeat:             require 'modules.repeat',
            -- zip:                require 'modules.zip',
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
            table.insert(result, value)
        result
    
_G["Linq"] = Linq