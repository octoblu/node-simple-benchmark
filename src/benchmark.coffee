global_ids = null
colors     = require 'colors'
now        = require 'performance-now'

class Benchmark
  constructor: (options={}) ->
    {label} = options
    global_ids[label] ?= 0
    global_ids[label] += 1
    @id = "#{label}-#{global_ids[label]}"
    @startTime = now()

  elapsed: =>
    return Math.round(now() - @startTime)

  toString: =>
    "#{@id}: #{@elapsed()}ms"

  print: =>
    console.log @toString()

  prettyPrint: =>
    elaspsedString = "#{@elapsed()}ms"
    console.log "#{colors.magenta(@id)}: #{colors.green(elaspsedString)}"

  @resetIds: =>
    global_ids = {}

Benchmark.resetIds()
module.exports = Benchmark
