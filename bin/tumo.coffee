util = require('util')
fse = require('fs-extra')
path = require('path')

tumo =
  create: ->
    console.log util.inspect({act:'crate'},colors:true)

  createController: (name, xpath)->
    cliPath = path.resolve('.')
    content = fse.readFileSync(path.join(__dirname, '../templates/controller.coffee'))
    content = content.toString().replace(/\{\{name\}\}/g, name)
    dirPath = path.join(cliPath, 'controllers', xpath)
    fse.ensureDirSync dirPath
    file = path.join(cliPath, 'controllers', xpath, name + '.coffee')
    fse.writeFileSync file, content, 'utf-8'
    console.log('act succ')

  createView: (name, xpath)->
    cliPath = path.resolve('.')
    content = fse.readFileSync(path.join(__dirname, '../templates/view.html'))
    content = content.toString().replace(/\{\{name\}\}/g, name)
    dirPath = path.join(cliPath, 'views', xpath)
    fse.ensureDirSync dirPath
    file = path.join(cliPath, 'views', xpath, name + '.html')
    fse.writeFileSync file, content, 'utf-8'
    console.log('act succ')

  createService: (name)->
    cliPath = path.resolve('.')
    content = fse.readFileSync(path.join(__dirname, '../templates/service.coffee'))
    content = content.toString().replace(/\{\{name\}\}/g, name)
    dirPath = path.join(cliPath, 'services')
    fse.ensureDirSync dirPath
    file = path.join(cliPath, 'services', name + '.coffee')
    fse.writeFileSync file, content, 'utf-8'
    console.log('act succ')

  createFilter: (name)->
    cliPath = path.resolve('.')
    content = fse.readFileSync(path.join(__dirname, '../templates/filter.coffee'))
    content = content.toString().replace(/\{\{name\}\}/g, name)
    dirPath = path.join(cliPath, 'filters')
    fse.ensureDirSync dirPath
    file = path.join(cliPath, 'filters', name + '.coffee')
    fse.writeFileSync file, content, 'utf-8'
    console.log('act succ')



module.exports = tumo