const express = require('express')
const UserModel = require('../data_structure_models/user_schema_model')
const bcryptHashing = require('bcryptjs')
const jwt = require('jsonwebtoken')

const authRouter = express.Router()

/** Sign up Api */

authRouter.post('/api/auth/signup', async (req, res) => {
  try {
    const { userName, userEmail, userPassword } = req.body
    const isEmailExist = await UserModel.findOne({ userEmail })

    if (isEmailExist) {
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

/** Login API */

// authRouter.post('/api/auth/login', async (req, res) => {
//   try {
//     const { userEmail, userPassword } = req.body
//     const isEmailExist = await UserModel.findOne({ userEmail })

//     if (!isEmailExist) {
//       return res.status(400).json({
//         message:
//           'This email is not associated with any user.Try correct email.',
//       })
//     } else {
//       const userData = isEmailExist
//       const passwordCheck = await bcryptHashing.compare(
//         userPassword,
//         userData.userPassword
//       )

//       if (!passwordCheck) {
//         return res.status(400).json({
//           message: 'Incorrect Password.',
//         })
//       } else {
//         const token = jwt.sign({ id: userData._id }, 'secretPass')
//         res.json({ token, ...userData._doc })
//       }
//     }
//   } catch (error) {
//     console.log(error.message)
//     res.status(500).json({ error: error.message })
//   }
// })

authRouter.post('/api/auth/login', async (req, res) => {
  try {
    const { userEmail, userPassword } = req.body

    if (!userEmail || !userPassword) {
      return res
        .status(400)
        .json({ message: 'Email and password are required' })
    }

    const isEmailExist = await UserModel.findOne({ userEmail })

    if (!isEmailExist) {
      return res.status(400).json({
        message:
          'This email is not associated with any user. Try correct email.',
      })
    }

    const userData = isEmailExist

    // Check if password is being passed correctly
    if (!userData.userPassword) {
      throw new Error('Stored password is undefined.')
    }

    const passwordCheck = await bcryptHashing.compare(
      userPassword,
      userData.userPassword
    )

    if (!passwordCheck) {
      return res.status(400).json({ message: 'Incorrect Password.' })
    } else {
      const token = jwt.sign({ id: userData._id }, 'secretPass')
      const { userPassword, ...userDataWithoutSensitiveInfo } = userData._doc
      res.json({ token, ...userDataWithoutSensitiveInfo })
    }
  } catch (error) {
    console.log(error.message)
    res.status(500).json({ error: error.message })
  }
})

module.exports = authRouter
