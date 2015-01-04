async = require 'async'

module.exports = class Subscriber

  topic: null
  pipeline: null
  q: null

  constructor: (topic, quantity, action, pipeline) ->
    @topic = topic
    @pipeline = pipeline
    @q = async.queue (taskData, callback) ->
      action taskData, callback
    , quantity

    @pipeline.on @topic, @enqueue

  unsubscribe: () ->
    @pipeline.removeListener @topic, @enqueue

  subscribe: (topic) ->
    @topic = topic
    @unsubscribe()
    @pipeline.on @topic, @enqueue

  enqueue: (data, callback) =>
    @q.push data, callback
