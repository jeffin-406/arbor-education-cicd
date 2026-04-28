import React from 'react';

function App() {
  const isDev = import.meta.env.VITE_APP_ENV === 'development';

  return (
    <div style={{ padding: '20px', textAlign: 'center' }}>
      <h1>{isDev ? "⚠️ DEV DASHBOARD" : "🚀 MAIN DASHBOARD"}</h1>
      <p>Currently running in <b>{import.meta.env.VITE_APP_ENV}</b> mode.</p>
    </div>
  );
}

export default App;
