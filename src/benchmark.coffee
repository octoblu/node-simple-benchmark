global_ids = null

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
    "#{@id}: #{@elapsed()}"

  print: =>
    console.log @toString()

  @resetIds: =>
    global_ids = {}

Benchmark.resetIds()
module.exports = Benchmark
