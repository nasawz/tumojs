/**
 * Created by nasa on 15/4/26.
 */


module.exports = function base(app) {
    var loopback = require('loopback')
    app.middleware('initial', loopback.favicon());

    app.middleware('initial', loopback.compress());

    app.middleware('session', loopback.session({ saveUninitialized: true,
        resave: true, secret: 'keyboard cat' }));
};