var express = require('express');
var app = express();
var sql = require('mssql');

var config = {

    user: "csci3432",
    password: "Vb764wo?!gBD",
    server: "den1.mssql8.gear.host",
    database: "help"

}

var server = app.listen(8081, function () {
    
    var host = server.address().address
    var port = server.address().port
    
    console.log("app listening at http://%s:%s", host, port)
    
});