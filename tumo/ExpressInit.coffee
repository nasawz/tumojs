http = require('http')
path = require('path')
config = require('./../config')
rainbow = require('./rainbow')
express = require('express')

module.exports = (app) ->
  app.set 'port', config.run_port
  #模板所在路径
  app.engine '.html', require('ejs').renderFile
  app.set 'view engine', 'html'
  app.use express.favicon()
  app.use '/assets', express['static'](config.base_path + '/assets')
  app.use express.bodyParser()
  app.use express.cookieParser()
  app.use express.cookieSession(secret: config.session_secret)
  app.use express.methodOverride()
  #rainbow配置
  rainbow.route app, config.rainbow
  #404处理
  app.all '*', (req, res, next) ->
    res.render '404.html'
  #所有错误的集中处理，在任何route中调用next(error)即可进入此逻辑
  app.use (err, req, res, next) ->
    console.trace err
    res.render '502.html', error: err
  #静态资源头，本地开发用本地，线上可以用cdn
  app.locals.assets_head = config.assets_head
  return