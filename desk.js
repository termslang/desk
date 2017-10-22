const spawn   = require('child_process').spawn;
const express = require('express');
const fs = require('fs');
const app = express();



const bodyParser = require('body-parser')
app.use(bodyParser.json())
app.use(bodyParser.urlencoded({ extended: false }))


app.get('/', function(req, res) {
  res.sendFile(__dirname + '/public/index.html');
});


app.post('/ajax-request', function(req, res) {
  var input = req.body.input;
  fs.writeFile('input.t', input, (err) => {
    var command = spawn(__dirname + '/terms', ['input.t']);
    var output = [];
    command.stdout.on('data', function(chunk) {
      output.push(chunk);
    });
    command.on('close', function(code) {
      if (code === 0)
        res.send(Buffer.concat(output));
      else
        res.sendStatus(500); //fail
    });
    if (err) throw err;
  });

//  res.send(input);
});





app.listen(3000);
