FROM botpress/server:latest

# Ensure proper permissions
USER root
RUN chmod +x /botpress/bp

# Switch back to botpress user
USER botpress

# Set working directory
WORKDIR /botpress

# Expose port (Railway will override with $PORT)
EXPOSE 3000

# Use shell form to allow PORT variable expansion
CMD sh -c "./bp --port ${PORT:-3000}"
