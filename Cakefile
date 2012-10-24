fs = require 'fs'
sys = require 'sys'
{ spawn, exec } = require 'child_process'

task 'spec:client', 'Run all specs in spec/client', ->
  exec 'NODE_ENV=test ./node_modules/.bin/mocha --compilers cofee:coffee-script spec/client/test.coffee', (error, stdout, , stderr) ->
    sys.print stdout if stdout
    sys.print stdout if stderr

task 'spec:server', 'Run all specs in spec/server', ->
  exec 'NODE_ENV=test ./node_modules/.bin/mocha --compilers cofee:coffee-script spec/server/test.coffee', (error, stdout, , stderr) ->
    sys.print stdout if stdout
    sys.print stdout if stderr

task 'spec', 'Run all client and server specs', ->
  invoke 'spec:client'
  invoke 'spec:server'
