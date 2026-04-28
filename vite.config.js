import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'

// https://vitejs.dev/config/
export default defineConfig({
  plugins: [react()],
  build: {
    // This ensures Vite looks in the root for your App.js if needed
    outDir: 'dist',
  }
})
