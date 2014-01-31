
/**
 * Module dependencies
 */
var connect		= require('connect')
  , express		= require('express')
  , app			= express()
  , httpd		= require('http').createServer(app)
  , io			= require('socket.io')
  , routes		= require('./routes')
  , config		= require('./config')
  ;

/**
 * Express configuration
 */
app.configure(function(){
	app.set('views', __dirname + '/views');
	app.set('view engine', 'ejs');
	app.use(express.logger('dev'));
	app.use(connect.bodyParser());
	app.use(express.cookieParser());
	app.use(express.session({ secret: config.session_key }));
	app.use(connect.static(__dirname + '/static'));
	app.use(app.router);

	app.use(function (error, req, res, next) {
		if(error instanceof NotFound) {
			res.render('app/404', {
				locals: {
					title: '404'
				,	description: ''
				,	author: ''
				,	analyticssiteid: 'XXXXXXX'
				,	status: 404
				}
			});
		} else {
			res.render('app/500', {
				locals: {
					title: '500'
				,	description: ''
				,	author: ''
				,	analyticssiteid: 'XXXXXXX'
				,	error: error
				,	status: 500
				}
			});
		}
	});
});

app.configure('development', function(){
	app.set('port', process.env.PORT || 8081);
	app.use(express.errorHandler());
});

app.configure('test', function(){
	app.set('port', process.env.PORT || 8082);
});

app.configure('production', function(){
	app.set('port', process.env.PORT || 8083);
});

httpd.listen(app.get('port'));

/**
 * Socket.IO server
 */
var io = io.listen(httpd);

io.sockets.on('connection', function (socket) {
	console.log('Client connected');

	socket.on('message', function (data) {
		socket.broadcast.emit('server_message', data);
		socket.emit('server_message', data);
	});

	socket.on('disconnect', function () {
		console.log('Client disconnected.');
	});
});

/**
 * Routes definitions
 */

// Homepage
app.get('/', routes.index);

// A Route for Creating a 500 Error (Useful to keep around)
app.get('/500', function (req, res) {
	throw new Error('The server encountered an error. We are aware of this issue and are working to get it fixed.');
});

// The 404 Route (ALWAYS Keep this as the last route)
app.get('/*', function (req, res) {
	throw new NotFound;
});

function NotFound (msg) {
	this.name = 'NotFound';
	Error.call(this, msg);
	Error.captureStackTrace(this, arguments.callee);
}

console.log('Listening on http://0.0.0.0:' + app.get("port") );