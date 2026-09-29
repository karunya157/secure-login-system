import react from '@vitejs/plugin-react'
import { defineConfig } from 'vite'

// https://vite.dev/config/
export default defineConfig({
  plugins: [react()],
  server: {
    port: 5174,
    strictPort: true,
  },
  preview: {
    port: process.env.PORT ? parseInt(process.env.PORT) : 5174,
    host: '0.0.0.0',
    allowedHosts: true,
  },
})
