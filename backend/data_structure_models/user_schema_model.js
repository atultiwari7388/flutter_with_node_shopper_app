const mongoose = require('mongoose')

const userSchema = mongoose.Schema({
  userName: {
    type: String,
    required: true,
    unique: true,
    minlength: 3,
    maxlength: 20,
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
    minlength: 8,
    maxlength: 255,
    select: false, // This will not be returned in the response
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
