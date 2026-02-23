# Botpress for Railway

This repository contains a Railway-optimized Botpress deployment.

## Features
- ✅ Properly configured to use Railway's `$PORT` environment variable
- ✅ Binds to `0.0.0.0` for external access
- ✅ Based on official Botpress server image

## Deploy to Railway

[![Deploy on Railway](https://railway.app/button.svg)](https://railway.app/new/template)

## Manual Deployment

1. Create a new service in Railway
2. Connect this GitHub repository
3. Set environment variables:
   - `BP_PRODUCTION=true`
   - `EXTERNAL_URL=https://your-app.railway.app`
4. Deploy!

## Environment Variables

- `BP_PRODUCTION`: Set to `true` for production mode
- `EXTERNAL_URL`: Your Railway deployment URL
- `PORT`: Automatically provided by Railway

## How it Works

The Dockerfile uses `CMD sh -c "./bp --port ${PORT:-3000}"` which:
- Reads Railway's dynamic `$PORT` environment variable
- Falls back to port 3000 if PORT is not set
- Allows Railway to properly proxy requests to Botpress

Built with ❤️ for Railway
