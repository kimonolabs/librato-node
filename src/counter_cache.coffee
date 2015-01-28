
class CounterCache
  
  constructor: ->
    @cache = {}
    @trackingCache = {}
    
  flushToWithSource: (queue) ->
    for name of @trackingCache
    	for source of @trackingCache[name]
        value = @trackingCache[name][source]
        queue.push {name, value: value, source}
      delete @trackingCache[name]
    
  increment: (name, value=1) ->
    @cache[name] ?= 0
    @cache[name] += value

  track: (name, value, source) ->
    @trackingCache[name] ?= {}
    (@trackingCache[name])[source] ?= 0
    (@trackingCache[name])[source] += value

module.exports = CounterCache

