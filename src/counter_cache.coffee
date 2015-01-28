
class CounterCache
  
  constructor: ->
    @cache = {}
    @trackingCache = {}
    
  flushToWithSource: (queue) ->
    for name of @trackingCache
      console.log(@trackingCache)
      console.log(name)
    	for source of @trackingCache[name]
        console.log(source)
        console.log('s')
        console.log(@trackingCache[name][source])
        value = @trackingCache[name][source]
        queue.push {name, value: value, source}
      delete @trackingCache[name]
    
  increment: (name, value=1) ->
    @cache[name] ?= 0
    @cache[name] += value

  track: (name, value, source) ->
    console.log('here')
    console.log(name)
    @trackingCache[name] ?= {}
    (@trackingCache[name])[source] ?= 0
    (@trackingCache[name])[source] += value

module.exports = CounterCache

