import React from 'react'
import ReactDOM from 'react-dom/client'

function App() {
  const env = import.meta.env.VITE_APP_ENV;
  return (
    <div>
      <h1>{env === 'production' ? 'Main Dashboard' : 'Dev Dashboard'}</h1>
    </div>
  )
}

// This part is crucial if you don't have a main.jsx/index.js
ReactDOM.createRoot(document.getElementById('root')).render(
  <React.StrictMode>
    <App />
  </React.StrictMode>
)
