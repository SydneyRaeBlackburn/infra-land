import express from "express"
import os from "os"

const app = express()
const port = process.env.PORT || 3000
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
    message: `Hello from ${serverName}!`
  })
})

app.get('/health', (req, res) => {
  res.json({ 
    status: 'healty',
    server: serverName
  })
})

app.get('/slow', (req, res) => {
  setTimeout(() => {
    res.json({
      server: serverName,
      message: 'Slow response'
    })
  }, 2000)
})

app.listen(port, '0.0.0.0', () => {
  console.log(`${serverName} running on port ${port}`)
})