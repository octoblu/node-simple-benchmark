{describe,it,expect,beforeEach} = global
_ = require 'lodash'
Benchmark = require '../'

describe 'Benchmark', ->
  it 'should exist', ->
    expect(new Benchmark).to.exist

  describe '-> elapsed', ->
    beforeEach ->
      @sut = new Benchmark

    describe 'when stop is called 100 milliseconds later', ->
      beforeEach (done) ->
        _.delay =>
          @result = @sut.elapsed()
          done()
        , 100

      it 'should have around 100ms of elapsed time', ->
        expect(@result).to.be.closeTo 100, 10

    describe 'when stop is called 50 milliseconds later', ->
      beforeEach (done) ->
        _.delay =>
          @result = @sut.elapsed()
          done()
        , 50

      it 'should have around 50ms of elapsed time', ->
        expect(@result).to.be.closeTo 50, 10

  describe '-> id', ->
    beforeEach ->
      Benchmark.resetIds()
      @sut = new Benchmark label: 'test'

    it 'should have a unique id, combined with a constructor param', ->
      expect(@sut.id).to.deep.equal 'test-1'

    describe 'creating a second benchmark with the same label', ->
      beforeEach ->
        @sut = new Benchmark label: 'test'

      it 'should increment the id', ->
        expect(@sut.id).to.deep.equal 'test-2'

    describe 'creating a second benchmark with a different label', ->
      beforeEach ->
        @sut = new Benchmark label: 'whatever'

      it 'should have a unique id, combined with a constructor param', ->
        expect(@sut.id).to.deep.equal 'whatever-1'
