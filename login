body,
html {
  margin: 0;
  padding: 0;
  height: 100%;
  font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

.login-page {
  background: linear-gradient(135deg, rgba(11, 30, 61, 0.9), rgba(0, 0, 0, 0.95));
  background-size: cover;
  background-position: center;
  height: 100vh;
  width: 100vw;
  position: relative;
  display: flex;
  align-items: center;
  justify-content: center;
  overflow: hidden;
}

/* Subtle image overlay */
.login-page::before {
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background-image: url('/src/assets/images.jpeg');
  background-size: cover;
  background-position: center;
  opacity: 0.15;
  filter: blur(3px);
  z-index: 0;
}

/* Vignette effect */
.login-page::after {
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background: radial-gradient(circle at center, transparent 50%, rgba(0, 0, 0, 0.6) 100%);
  z-index: 0;
  pointer-events: none;
}

.login-container {
  z-index: 1;
  width: 100%;
  max-width: 400px;
  background: rgba(11, 30, 61, 0.7);
  padding: 30px;
  border-radius: 10px;
  border: 1px solid rgba(58, 123, 213, 0.3);
  box-shadow: 0 8px 32px rgba(0, 0, 0, 0.3);
  backdrop-filter: blur(8px);
  display: flex;
  flex-direction: column;
  gap: 16px;
  opacity: 0;
  animation: fadeIn 1s ease forwards;
}

/* Heading */
.login-container h2 {
  margin: 0;
  font-size: 28px;
  font-weight: 700;
  text-align: center;
  color: #3A7BD5;
  opacity: 0;
  animation: fadeIn 1s ease forwards;
  animation-delay: 0.2s;
}

/* Paragraphs and Links */
.login-container p {
  margin: 0;
  font-size: 14px;
  color: #CFE6FF;
  opacity: 0;
  animation: fadeIn 1s ease forwards;
  animation-delay: 0.4s;
}

.login-container a {
  color: #3A7BD5;
  text-decoration: none;
  font-weight: 500;
  transition: color 0.3s ease;
}

.login-container a:hover {
  color: #5DA9E9;
}

/* Labels */
.login-container label {
  font-size: 14px;
  font-weight: 600;
  color: #CFE6FF;
  margin-bottom: 4px;
  opacity: 0;
  animation: fadeIn 1s ease forwards;
  animation-delay: 0.6s;
}

.login-container label a {
  color: #3A7BD5;
  font-size: 13px;
}

.login-container label a:hover {
  color: #5DA9E9;
}

/* Inputs */
.login-container input {
  border: 1px solid rgba(58, 123, 213, 0.3);
  border-radius: 8px;
  padding: 12px;
  font-size: 14px;
  margin-bottom: 6px;
  background: rgba(207, 230, 255, 0.1);
  color: #CFE6FF;
  transition: border-color 0.3s ease, box-shadow 0.3s ease;
  opacity: 0;
  animation: fadeIn 1s ease forwards;
  animation-delay: 0.8s;
}

.login-container input:focus {
  border-color: #3A7BD5;
  box-shadow: 0 0 8px rgba(58, 123, 213, 0.3);
  outline: none;
}

/* Remember Me Checkbox */
.remember {
  display: flex;
  align-items: center;
  font-size: 13px;
  color: #CFE6FF;
  gap: 6px;
  opacity: 0;
  animation: fadeIn 1s ease forwards;
  animation-delay: 1s;
}

/* (Login/Sign Up) */
button {
  width: 100%;
  padding: 12px;
  border: none;
  background: #3A7BD5;
  color: #0B1E3D;
  border-radius: 8px;
  font-weight: bold;
  font-size: 16px;
  cursor: pointer;
  transition: transform 0.3s ease, box-shadow 0.3s ease;
  box-shadow: 0 4px 15px rgba(58, 123, 213, 0.3);
  opacity: 0;
  animation: fadeIn 1s ease forwards;
  animation-delay: 1.2s;
}

button:hover {
  transform: scale(1.05);
  box-shadow: 0 6px 20px rgba(58, 123, 213, 0.5);
}

button:active {
  background: #5DA9E9;
  color: #0B1E3D;
  transform: scale(0.95);
  box-shadow: 0 2px 10px rgba(93, 169, 233, 0.5);
}

/* Divider */
.divider {
  display: flex;
  align-items: center;
  text-align: center;
  color: #CFE6FF;
  font-size: 13px;
  margin: 20px 0;
  opacity: 0;
  animation: fadeIn 1s ease forwards;
  animation-delay: 1.4s;
}

.divider::before,
.divider::after {
  content: '';
  flex: 1;
  height: 1px;
  background: linear-gradient(to right, #3A7BD5, transparent);
  margin: 0 10px;
}

/* Social Buttons */
.social-buttons {
  display: flex;
  gap: 10px;
  opacity: 0;
  animation: fadeIn 1s ease forwards;
  animation-delay: 1.6s;
}

.social-buttons button {
  flex: 1;
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 8px;
  padding: 10px;
  font-size: 14px;
  font-weight: 500;
  border-radius: 8px;
  cursor: pointer;
  background: rgba(207, 230, 255, 0.1);
  transition: transform 0.3s ease, background-color 0.3s ease, box-shadow 0.3s ease;
}

/* Google */
.google {
  border: 1.5px solid #3A7BD5;
  color: #3A7BD5;
}

.google:hover {
  background-color: #3A7BD5;
  color: #0B1E3D;
  transform: scale(1.05);
  box-shadow: 0 4px 15px rgba(58, 123, 213, 0.4);
}

/* Facebook */
.facebook {
  border: 1.5px solid #CFE6FF;
  color: #CFE6FF;
}

.facebook:hover {
  background-color: #CFE6FF;
  color: #0B1E3D;
  transform: scale(1.05);
  box-shadow: 0 4px 15px rgba(207, 230, 255, 0.4);
}

/* Fade-in animation */
@keyframes fadeIn {
  from {
    opacity: 0;
    transform: translateY(20px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}
