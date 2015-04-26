#框架主脚本
require './tumo/BaseInit'
#初始化express
express = require('express')
config = require('./config')
module.exports = app = express()
ExpressInit = require('./tumo/ExpressInit')
ExpressInit app