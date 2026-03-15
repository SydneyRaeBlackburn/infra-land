import express from "express"
import os from "os"

const app = express()
const port = process.env.PORT || 8080
const serverName = process.env.SERVER_NAME || 'unknown'
const deploymentStrategy = process.env.DEPLOYMENT_STRATEGY || 'unknown'

app.get('/', (req, res) => {
  res.json({
    server: serverName,
    hostname: os.hostname(),
    port: port,
    timestamp: new Date().toISOString(),
    message: `This app is using a ${deploymentStrategy} deployment strategy!`,
    body: req.headers
  })
})

app.listen(port, '0.0.0.0', () => {
  console.log(`${serverName} running on port ${port}`)
})