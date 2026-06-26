FROM node:20-slim

WORKDIR /app

# System deps (curl for healthcheck, ca-certs for HTTPS proxy fetch)
RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Install deps first (better caching)
COPY package*.json ./
RUN npm install --omit=dev

# Copy rest
COPY . .

# Ensure scripts dir writable
RUN mkdir -p /app/scripts && chmod -R 755 /app/scripts

ENV NODE_ENV=production
ENV PORT=3000
EXPOSE 3000

CMD ["node", "server.js"]
