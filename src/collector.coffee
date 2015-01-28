CounterCache = require './counter_cache'
Aggregator = require './aggregator'

class Collector

  constructor: ->
    @counters = new CounterCache()
    @aggregate = new Aggregator()

  increment: (args...) ->
    @counters.increment(args...)

  track: (args...) ->
    @counters.track(args...)

  timing: (args...) ->
    @aggregate.timing(args...)

  flushTo: (queue) ->
    @counters.flushTo(queue)
    @aggregate.flushTo(queue)

  flushToWithSource: (queue) ->
    @counters.flushToWithSource(queue)

module.exports = Collector

