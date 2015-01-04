module.exports =  (grunt) ->
  grunt.initConfig
    default: 
      tasks: ['coffeelint', 'simplemocha', 'coffee']
    coffee: 
      glob_to_multiple: 
        expand: true
        flatten: true
        cwd: './'
        src: ['./src/*.coffee']
        dest: './lib/'
        ext: '.js'
    coffeelint:
      app: ['./src/*.coffee']
    simplemocha:
      all: ['./test/**/*.coffee']
        

  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-coffeelint'
  grunt.loadNpmTasks 'grunt-simple-mocha'
  grunt.registerMultiTask 'default', 'running all tasks', () ->
    grunt.task.run(@data)
