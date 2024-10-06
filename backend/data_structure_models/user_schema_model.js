const mongoose = require('mongoose')

const userSchema = mongoose.Schema({
  userName: {
    type: String,
    required: true,
    unique: true,
    trim: true,
  },
  userEmail: {
    type: String,
    required: true,
    unique: true,
    match: [/\S+@\S+\.\S+/, 'Invalid email address'],
    lowercase: true,
  },

  userPassword: {
    type: String,
    required: true,
  },

  userAddress: {
    type: String,
    default: '',
  },

  userType: {
    type: String,
    default: 'user',
  },
})

const UserModel = mongoose.model('users', userSchema)
module.exports = UserModel
