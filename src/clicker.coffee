EventEmitter = require('events').EventEmitter

Publisher = require './publisher'
Subscriber = require './subscriber'

module.exports =
  pipeline: new EventEmitter()
  publisher: (topic) ->
    new Publisher topic, @pipeline

  subscriber: (topic, quantity, action) ->
    new Subscriber topic, quantity, action, @pipeline
