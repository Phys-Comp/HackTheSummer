const fs = require('fs');
const https = require('https');
const express = require('express');
const mysql = require('mysql');

// HTTPS server options
const options = {
	key: fs.readFileSync('key.pem'),
	cert: fs.readFileSync('cert.pem')
};

// Express webapp
const app = express();
app.set('view engine','pug');
app.set('views', 'views');

// MySQL database
var database = mysql.createConnection({
	host: 'localhost',
	user: '<YOUR_USERNAME>',
	password: '<YOUR_PASSWORD>',
	database: 'Product_Database'
});

// Creating the https server
https.createServer(options, app).listen(443, function() {
	console.log('Server running on port 443!');
	
	database.connect(function(err) {
		if(err) throw err;
		console.log('Database connected!');
	});
});

// Defining the webserver requests
app.use(express.static('public'));
app.get('/raw/*', onRawReq);
app.get('/product/*', onProductReq);

// Displays raw json data from database
function onRawReq(req, res) {
	var id = req.url.substring(5);
	if(id == '') return;
	
	queryProduct(id, function(result) {
		res.writeHead(200, {'Content-Type': 'application/json'});
		res.write(JSON.stringify(result));
		res.end();
	});
}

// Renders product info from databae
function onProductReq(req, res) {
	var id = req.url.substring(9);
	if(id == '') return;
	
	queryProduct(id, function(result) {
		res.render(result.class + '_view', result);
	});
}

// Queries product information from database
function queryProduct(id, callback) {
	database.query("SELECT * FROM Products WHERE id = '" + id + "' LIMIT 1", function(err, result, fields) {
		if(err || typeof result[0] == 'undefined') return;
		
		result = result[0];
		for(var key in result) {
			if(result[key] instanceof String || typeof result[key] == 'string') {
				if(result[key][0] == '{' || result[key][0] == '[')
					result[key] = JSON.parse(result[key]);
			}
		}
		queryIcons(function(icons) {
			var intolerances = [];
			icons.forEach(function(icon, index) {
				intolerances[index] = {
					name: icon.name,
					url: icon.url,
					contains: result.intolerances.includes(icon.id),
					free: result.intolerances.includes('no_' + icon.id)
				};
				intolerances[index].name = intolerances[index].contains ? ('enthält ' + icon.name) :
						(intolerances[index].free ? ('ohne ' + icon.name) : ('kann ' + icon.name + ' enthalten'));
			});
			result.intolerances = intolerances;
			callback(result);
		});
	});
}

// Queries intolerance icons from database
function queryIcons(callback) {
	database.query("SELECT * FROM Intolerance_Icons WHERE 1", function(err, icons, fields) {
		if(err || typeof icons == 'undefined') return;
		
		callback(icons);
	});
}
