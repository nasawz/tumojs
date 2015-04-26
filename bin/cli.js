#!/usr/bin/env node
require('coffee-script/register')
var program = require('commander');
var libInfo = require('../package');
var updateCLI = require('./tumo')


program
    .version(libInfo.version)


program
    .command('create')
    .description('create a project')
    .action(function(options) {
        updateCLI.create(options)
    });

program
    .command('controller')
    .option('-n, --name', 'controller name')
    .option('-p, --path', 'controller path')
    .description('create controller')
    .action(function(name,xpath) {
        updateCLI.createController(name,xpath)
    });

program
    .command('view')
    .option('-n, --name', 'view name')
    .option('-p, --path', 'view path')
    .description('create view')
    .action(function(name,xpath) {
        updateCLI.createView(name,xpath)
    });

program
    .command('service')
    .option('-n, --name', 'service name')
    .description('create service')
    .action(function(name,xpath) {
        updateCLI.createService(name,xpath)
    });

program
    .command('filter')
    .option('-n, --name', 'program name')
    .description('create program')
    .action(function(name,xpath) {
        updateCLI.createFilter(name,xpath)
    });

program.parse(process.argv);