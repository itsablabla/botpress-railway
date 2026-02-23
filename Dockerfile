FROM bot press/server:latest

# Set environment to production
ENV NODE_ENV=production

# Expose Botpress port (Railway will use $PORT)
EXPOSE 3000

# Working directory
WORKDIR /botpress

# Health check
HEALTHCHECK --interval=30s --timeout=10s --start-period=60s --retries=3 \
  CMD wget --no-verbose --tries=1 --spider http://localhost:${PORT:-3000}/status || exit 1

# Start Botpress with PORT variable support
# If PORT is set by Railway, use it; otherwise default to 3000
CMD ["sh", "-c", "exec ./bp --port ${PORT:-3000}"]
