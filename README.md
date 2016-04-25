
[![Build Status](https://travis-ci.org/octoblu/node-simple-benchmark.svg?branch=master)](https://travis-ci.org/octoblu/node-simple-benchmark)
[![Code Climate](https://codeclimate.com/github/octoblu/node-simple-benchmark/badges/gpa.svg)](https://codeclimate.com/github/octoblu/node-simple-benchmark)
[![Test Coverage](https://codeclimate.com/github/octoblu/node-simple-benchmark/badges/coverage.svg)](https://codeclimate.com/github/octoblu/node-simple-benchmark)
[![npm version](https://badge.fury.io/js/node-simple-benchmark.svg)](http://badge.fury.io/js/node-simple-benchmark)
[![Gitter](https://badges.gitter.im/octoblu/help.svg)](https://gitter.im/octoblu/help)

Install
```
npm install simple-benchmark
```

Example
```js
var SimpleBenchmark = require('simple-benchmark');

benchmark = new SimpleBenchmark({label: 'something'});
benchmark.prettyPrint()

setTimeout(function(){
  benchmark.prettyPrint();
}, 2000);
```
