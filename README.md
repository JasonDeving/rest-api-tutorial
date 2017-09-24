# rest-api-tutorial
rest api tutorial

This is rest API tutorial with EPILOGUE this is the fastest REST API ever made. :smile:

Create Files:
* app.js
* npm init 

# app.js

```js
var Sequelize = require('sequelize'),
    epilogue = require('epilogue'),
    http = require('http');

// Define your models
var database = new Sequelize('restdb', 'root', '', {dialect: 'mysql'});
var User = database.define('User', {
  username: Sequelize.STRING,
  email: Sequelize.STRING
});

// Initialize server
var server, app;
if (process.env.USE_RESTIFY) {
  var restify = require('restify');

  app = server = restify.createServer()
  app.use(restify.queryParser());
  app.use(restify.bodyParser());
} else {
  var express = require('express'),
      bodyParser = require('body-parser');

  var app = express();
  app.use(bodyParser.json());
  app.use(bodyParser.urlencoded({ extended: false }));
  server = http.createServer(app);
}

// Initialize epilogue
epilogue.initialize({
  app: app,
  sequelize: database
});

// Create REST resource
var userResource = epilogue.resource({
  model: User,
  endpoints: ['/users', '/users/:id']
});

// Create database and listen
database
  .sync({ force: true })
  .then(function() {
    server.listen(function() {
      var host = server.address().address,
          port = server.address().port;

      console.log('listening at http://%s:%s', host, port);
    });
  });
```

# Dependencies USED - package.json

```js
"dependencies": {
    "body-parser": "^1.18.2",
    "epilogue": "^0.7.1",
    "express": "^4.15.4",
    "mysql": "^2.14.1",
    "mysql2": "^1.4.2",
    "restify": "^6.0.1",
    "sequelize": "^4.10.3"
  }
```

# terminal to load

```html
node app.js
```
