assert = require 'assert'
clicker = require '../src/clicker'

describe 'clicker', () ->
  describe 'Order of operations', () ->
    it 'publish then subscribe', () ->
      sub = clicker.subscriber 'publish then subscribe', 1, (data, callback) ->
        callback()
      pub = clicker.publisher 'publish then subscribe'
      pub.publish {}, () ->
    it 'subscribe then publish', () ->
      sub = clicker.subscriber 'subscribe then publish', 1, (data, callback) ->
        callback()
      pub = clicker.publisher 'subscribe then publish'
      pub.publish {}, () ->