(function() {
  var Publisher;

  module.exports = Publisher = (function() {
    Publisher.prototype.topic = null;

    Publisher.prototype.pipeline = null;

    function Publisher(topic, pipeline) {
      this.topic = topic;
      this.pipeline = pipeline;
    }

    Publisher.prototype.publish = function(data, callback) {
      return this.pipeline.emit(this.topic, data, callback);
    };

    return Publisher;

  })();

}).call(this);
