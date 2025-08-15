import fs from 'node:fs';
import http from 'node:http'

const PORT = process.env.PORT || 3000;
const logFile = '/usr/src/app/files/log_output.txt';

const server = http.createServer((req, res) => {
  if (req.method === 'GET' && req.url === '/') {
    const data = fs.readFileSync(logFile, 'utf8')

    res.writeHead(200, { 'Content-Type': 'text/plain' });
    res.end(data);
  } else {
    res.writeHead(404, { 'Content-Type': 'text/plain' });
    res.end('Not Found');
  }
});

server.listen(PORT, () => {
  console.log(`Server started in port ${PORT}`)
})
