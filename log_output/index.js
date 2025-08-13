import http from 'node:http'

const PORT = process.env.PORT || 3000;
const randomUUID = crypto.randomUUID();

const getOutput = () => {
  const date = new Date().toISOString();

  return `${date} ${randomUUID}`
}


const server = http.createServer((req, res) => {
  if (req.method === 'GET' && req.url === '/') {
    res.writeHead(200, { 'Content-Type': 'text/plain' });
    res.end(getOutput());
  } else {
    res.writeHead(404, { 'Content-Type': 'text/plain' });
    res.end('Not Found');
  }
});

server.listen(PORT, () => {
  console.log(`Server started in port ${PORT}`)
})
