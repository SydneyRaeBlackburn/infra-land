import express from "express"
import os from "os"

const app = express()
const port = process.env.port || 3000
const serverName = process.env.SERVER_NAME || 'unknown'

// Request counter for this instance
let requestCount = 0

app.get('/', (req, res) => {
  requestCount++
  res.json({
    server: serverName,
    hostname: os.hostname(),
    port: port,
    requests: requestCount,
    timestamp: new Date().toISOString(),
    message: `Hello from ${serverName}!`,
    body: req.headers
  })
})

app.listen(port, '0.0.0.0', () => {
  console.log(`${serverName} running on port ${port}`)
})