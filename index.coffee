#框架主脚本
require './tumo/BaseInit'
loopback = require('loopback');

module.exports = app = loopback()
boot = require('loopback-boot')
boot app,__dirname+'/server'


ExpressInit = require('./tumo/ExpressInit')
ExpressInit app
