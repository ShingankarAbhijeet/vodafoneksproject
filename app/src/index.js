const http = require('http')

const server = http.createServer((req, res) => {
  if (req.url === '/health') {
    res.writeHead(200)
    res.end(JSON.stringify({ status: 'ok' }))
    return
  }
  res.writeHead(200)
  res.end(JSON.stringify({ message: 'WCPG pipeline works', env: process.env.APP_ENV || 'local' }))
})

server.listen(3000, () => console.log('Running on :3000'))