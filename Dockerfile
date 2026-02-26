FROM node:18-alpine

WORKDIR /app

# Copy dependency files first for better layer caching
COPY package.json package-lock.json ./

# Install dependencies
RUN npm install

# Copy the rest of the source code
COPY . .

# Expose Next.js dev server port
EXPOSE 3000

# Enable polling for file watching inside container
ENV WATCHPACK_POLLING=true

# Run the dev server, binding to all interfaces
CMD ["npm", "run", "dev"]
