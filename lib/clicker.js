(function() {
  var EventEmitter, Publisher, Subscriber;

  EventEmitter = require('events').EventEmitter;

  Publisher = require('./publisher');

  Subscriber = require('./subscriber');

  module.exports = {
    pipeline: new EventEmitter(),
    publisher: function(topic) {
      return new Publisher(topic, this.pipeline);
    },
    subscriber: function(topic, quantity, action) {
      return new Subscriber(topic, quantity, action, this.pipeline);
    }
  };

}).call(this);
