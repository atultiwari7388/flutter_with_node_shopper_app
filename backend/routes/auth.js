const express = require('express')

const authRouter = express.Router()

authRouter.get('/', (req, res) => {
  res.send('Welcome to Shopper App!')
})

authRouter.get('/signUp', (req, res) => {
  res.send('Hello, this is a signup endpoint!')
})

authRouter.get('/login', (req, res) => {
  res.send('Hello, this is a login endpoint!')
})

module.exports = authRouter
