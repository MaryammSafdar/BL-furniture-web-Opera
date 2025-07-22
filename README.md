\\Authentication 
import React, { useState } from 'react';
import axios from 'axios';
import { Link } from 'react-router-dom';
import './LoginPage.css';

const SignUpPage = () => {
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [confirmPassword, setConfirmPassword] = useState('');

  const handleSignUp = async () => {
    if (password !== confirmPassword) {
      alert('Passwords do not match!');
      return;
    }

    try {
      const response = await axios.post('http://localhost:5000/signup', {
        email,
        password,
      });
      alert(' ' + response.data.message);
    } catch (error) {
      if (error.response) {
        alert(' ' + error.response.data.message);
      } else {
        alert(' Sign up failed!');
      }
    }
  };

  return (
    <div className="login-page">
      <div className="login-container">
        <h2>Sign Up</h2>

        <label>Email Address</label>
        <input
          type="email"
          placeholder="you@example.com"
          value={email}
          onChange={(e) => setEmail(e.target.value)}
        />

        <label>Password</label>
        <input
          type="password"
          placeholder="Enter 6 characters or more"
          value={password}
          onChange={(e) => setPassword(e.target.value)}
        />

        <label>Confirm Password</label>
        <input
          type="password"
          placeholder="Confirm your password"
          value={confirmPassword}
          onChange={(e) => setConfirmPassword(e.target.value)}
        />
        <p>
          Already have an account?{' '}
          <Link to="/login" style={{ color: '#e11d48', fontWeight: 500, textDecoration: 'none' }}>
            Login
          </Link>
        </p>
        <button onClick={handleSignUp}>Sign Up</button>


        <div className="social-buttons">
          <button className="google">
            <img src="https://img.icons8.com/color/20/000000/google-logo.png" alt="Google" />
            Google
          </button>
          <button className="facebook">
            <img src="https://img.icons8.com/ios-filled/20/3b5998/facebook-new.png" alt="Facebook" />
            Facebook
          </button>
        </div>
      </div>
    </div>
  );
};

export default SignUpPage;
// Authorization
const User = require('./models/User');
const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');
const sendEmail = require('../utils/sendEmail');

const JWT_SECRET = process.env.JWT_SECRET;
const CLIENT_URL = process.env.CLIENT_URL;

// REGISTER
exports.register = async (req, res) => {
    try {
        const { name, email, password } = req.body;

        const existingUser = await User.findOne({ email });
        if (existingUser) return res.status(400).json({ message: 'User already exists' });

        const hashedPassword = await bcrypt.hash(password, 10);
        const user = await User.create({ name, email, password: hashedPassword });

        res.status(201).json({ message: 'User registered successfully' });
    } catch (err) {
        res.status(500).json({ message: 'Server error' });
    }
};

// LOGIN
exports.login = async (req, res) => {
    try {
        const { email, password } = req.body;

        const user = await User.findOne({ email });
        if (!user) return res.status(400).json({ message: 'Invalid credentials' });

        const isMatch = await bcrypt.compare(password, user.password);
        if (!isMatch) return res.status(400).json({ message: 'Invalid credentials' });

        const token = jwt.sign({ id: user._id }, JWT_SECRET, { expiresIn: '1h' });

        res.json({ token, user: { id: user._id, name: user.name, email: user.email } });
    } catch (err) {
        res.status(500).json({ message: 'Server error' });
    }
};
// FORGOT PASSWORD
// exports.forgotPassword = async (req, res) => {
//     try {
//         const { email } = req.body;

//         const user = await User.findOne({ email });
//         if (!user) return res.status(404).json({ message: 'User not found' });

//         const token = jwt.sign({ id: user._id }, JWT_SECRET, { expiresIn: '15m' });

//         const url = `${CLIENT_URL}/ResetPassword/${token}`;
//         await sendEmail(email, 'Reset Password', `Click here to reset your password: ${url}`);

//         res.json({ message: 'Reset link sent to your email' });
//     } catch (err) {
//         res.status(500).json({ message: 'Error sending email' });
//     }
// };

// RESET PASSWORD
// exports.resetPassword = async (req, res) => {
//     try {
//         const { token } = req.params;
//         const { password } = req.body;

//         const decoded = jwt.verify(token, JWT_SECRET);
//         const hashedPassword = await bcrypt.hash(password, 10);

//         await User.findByIdAndUpdate(decoded.id, { password: hashedPassword });

//         res.json({ message: 'Password reset successfully' });
//     } catch (err) {
//         res.status(400).json({ message: 'Invalid or expired token' });
//     }
// };
