const express = require('express')
const UserModel = require('../data_structure_models/user_schema_model')
const bcryptHashing = require('bcryptjs')

const authRouter = express.Router()

/** Sign up Api */

authRouter.post('/api/auth/signup', async (req, res) => {
  try {
    const { userName, userEmail, userPassword } = req.body
    const isEmailExist = await UserModel.findOne({ userEmail })

    if (isEmailExist == true) {
      return res
        .status(400)
        .json({ message: 'Email already exists in the database' })
    } else {
      const securedHashPassword = await bcryptHashing.hash(userPassword, 9)
      var userInfo = new UserModel({
        userName,
        userEmail,
        userPassword: securedHashPassword,
      })

      userInfo = await userInfo.save()
      res.json({ userInfo })
    }
  } catch (error) {
    console.log(error.message)
    res.status(500).json({ error: error.message })
  }
})

module.exports = authRouter
