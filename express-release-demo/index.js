const express = require('express')
const app = express()

const message = process.env.APP_MESSAGE || 'Hello from the automated Express deployment pipeline!'

app.get('/', (req, res) => {
  res.send(`
    <main style="font-family: system-ui, sans-serif; margin: 3rem;">
      <h1>${message}</h1>
      <p>Image built by GitHub Actions and refreshed by Watchtower.</p>
    </main>
  `)
})

app.get('/health', (req, res) => {
  res.json({ status: 'ok' })
})

const PORT = process.env.PORT || 8080

app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`)
})
