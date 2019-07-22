const http = require('http');

const server = http.createServer((req, res) => {
    console.log('Request IN: ' + req.url);
    res.end('It works');
});
server.listen(3000, function () {
    console.log('Server started at 3000')
});