import http from 'node:http'

const server = http.createServer({});

const PORT = process.env.PORT || 3000;
server.listen(PORT, () => {
  console.log(`Server started in port ${PORT}`)
})
