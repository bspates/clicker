(function() {
  var Subscriber, async,
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  async = require('async');

  module.exports = Subscriber = (function() {
    Subscriber.prototype.topic = null;

    Subscriber.prototype.pipeline = null;

    Subscriber.prototype.q = null;

    function Subscriber(topic, quantity, action, pipeline) {
      this.enqueue = __bind(this.enqueue, this);
      this.topic = topic;
      this.pipeline = pipeline;
      this.q = async.queue(function(taskData, callback) {
        return action(taskData, callback);
      }, quantity);
      this.pipeline.on(this.topic, this.enqueue);
    }

    Subscriber.prototype.unsubscribe = function() {
      return this.pipeline.removeListener(this.topic, this.enqueue);
    };

    Subscriber.prototype.subscribe = function(topic) {
      this.topic = topic;
      this.unsubscribe();
      return this.pipeline.on(this.topic, this.enqueue);
    };

    Subscriber.prototype.enqueue = function(data, callback) {
      return this.q.push(data, callback);
    };

    return Subscriber;

  })();

}).call(this);
