clicker
=======

Simple Channel Implementation in NodeJS

Install
-------

`npm install clicker --save`


Example
-------

**CoffeeScript**
```coffeescript
clicker = require 'clicker'

pub = clicker.publisher 'topic one'
sub = clicker.subscriber 'topic one', 1, (data, callback) ->
  console.log data
  callback()

pub.publish 'Jah!', () ->
  console.log 'Rasta!'

```
