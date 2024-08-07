local Linq
do
  local _class_0
  local _base_0 = {
    registerBaseModules = function(self)
      local baseModules = {
        average = require('modules.average'),
        concat = require('modules.concat'),
        count = require('modules.count'),
        distinct = require('modules.distinct'),
        elementAt = require('modules.elementat'),
        except = require('modules.except'),
        first = require('modules.first'),
        flatten = require('modules.flatten'),
        groupBy = require('modules.groupby'),
        intersect = require('modules.intersect'),
        last = require('modules.last'),
        max = require('modules.max'),
        min = require('modules.min'),
        ofType = require('modules.oftype'),
        orderBy = require('modules.orderby'),
        orderByDescending = require('modules.orderbydescending'),
        range = require('modules.range'),
        select = require('modules.select'),
        selectMany = require('modules.selectmany'),
        single = require('modules.single'),
        skip = require('modules.skip'),
        skipWhile = require('modules.skipwhile'),
        sum = require('modules.sum'),
        take = require('modules.take'),
        takeWhile = require('modules.takewhile'),
        union = require('modules.union'),
        where = require('modules.where')
      }
      for name, mod in pairs(baseModules) do
        self:registerModule(name, mod)
      end
    end,
    registerModule = function(self, name, mod)
      self.modules[name] = mod
      self[name] = function(_, ...)
        return mod(self, ...)
      end
    end,
    unregisterModule = function(self, name)
      self.modules[name] = nil
      self[name] = nil
    end,
    asParallel = function(self)
      self.isParallel = true
      return self
    end,
    processInParallel = function(self, data, action)
      local result = { }
      local threads = { }
      for key, value in pairs(data) do
        local thread = coroutine.create(function()
          return action(result, key, value)
        end)
        threads[#threads + 1] = thread
      end
      for _, thread in pairs(threads) do
        coroutine.resume(thread)
      end
      local all_done = false
      while not all_done do
        all_done = true
        for _, thread in pairs(threads) do
          if coroutine.status(thread) ~= "dead" then
            all_done = false
            coroutine.resume(thread)
          end
        end
      end
      return result
    end,
    toList = function(self)
      local result = { }
      for key, value in pairs(self.data) do
        table.insert(result, value)
      end
      return result
    end
  }
  _base_0.__index = _base_0
  _class_0 = setmetatable({
    __init = function(self, data)
      self.data = data
      self.isParallel = false
      self.modules = { }
      return self:registerBaseModules()
    end,
    __base = _base_0,
    __name = "Linq"
  }, {
    __index = _base_0,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  Linq = _class_0
end
_G["Linq"] = Linq
