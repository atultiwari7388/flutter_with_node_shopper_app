const express = require('express')
const authRouter = require('./routes/auth')
const mongoose = require('mongoose') // renamed 'mongo' to 'mongoose' for clarity
const PORT = 3000

const app = express()

// Middleware to parse incoming JSON requests
app.use(express.json()) // Add this line to parse JSON

// Use the authentication router
app.use(authRouter)

const mongoDBURL =
  'mongodb+srv://tiwariatul9526:Pax1Bj8WTMosehty@db.b5ndli9.mongodb.net/db'

// Connect to MongoDB
mongoose
  .connect(mongoDBURL, { useNewUrlParser: true, useUnifiedTopology: true }) // Best practice to add options for better compatibility
  .then(() => {
    console.log('DB connected')
  })
  .catch((err) => {
    console.error('Database connection error:', err)
  })

// Start the server
app.listen(PORT, () => {
  console.log(`Server running at http://localhost:${PORT}`)
})
