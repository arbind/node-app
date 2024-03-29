express = (require 'express')
routes = (require './routes')
user = (require './routes/user')
http = (require 'http')
path = (require 'path')
connectAssets = (require 'connect-assets')

app = express()
assetsPipeline = connectAssets src: 'app/assets'
css.root = 'stylesheets'
js.root = 'javascripts'


app.configure ->
  app.set 'port', (process.env.PORT || 3000)
  app.set 'views', (__dirname + '/views')
  app.set 'view engine', 'jade'
  app.use express.favicon()
  app.use express.logger('dev')
  app.use express.bodyParser()
  app.use express.methodOverride()
  app.use express.cookieParser('your secret here')
  app.use express.session()
  app.use app.router
  app.use express.static(path.join(__dirname, 'public'))
  app.use assetsPipeline
  # app.use(require('stylus').middleware(__dirname + '/public'));

app.configure 'development', ->
  app.use express.errorHandler()

app.get '/', routes.index
app.get '/users', user.list

(http.createServer app).listen app.get('port'), ->
  console.log "Express server listening on port " + app.get('port')