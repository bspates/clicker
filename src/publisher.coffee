module.exports = class Publisher

  topic: null
  pipeline: null
  
  constructor: (topic, pipeline) ->
    @topic = topic
    @pipeline = pipeline

  publish: (data, callback) ->
    @pipeline.emit @topic, data, callback

