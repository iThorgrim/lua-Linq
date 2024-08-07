class Linq
    new: (data) =>
        @data = data
        @isParallel = false
        @modules = {}
        @registerBaseModules!
    
    registerBaseModules: () =>
        baseModules = {
            select:   require 'modules.select',
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
        for _, value in pairs @data
            result[#result + 1] = value
        result

_G["Linq"] = Linq