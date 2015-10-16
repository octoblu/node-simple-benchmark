global_ids = null
colors     = require 'colors'

class Benchmark
  constructor: (options={}) ->
    {label} = options
    global_ids[label] ?= 0
    global_ids[label] += 1
    @id = "#{label}-#{global_ids[label]}"
    @startTime = Date.now()

  elapsed: =>
    Date.now() - @startTime

  toString: =>
    "#{@id}: #{@elapsed()}ms"

  print: =>
    console.log @toString()

  prettyPrint: =>
    console.log "#{colors.magenta(@id)}: #{colors.green(@elapsed())}ms"

  @resetIds: =>
    global_ids = {}

Benchmark.resetIds()
module.exports = Benchmark
