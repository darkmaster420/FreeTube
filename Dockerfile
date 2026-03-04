FROM node:22-alpine

# Install dependencies for native modules and yarn
RUN apk add --no-cache git python3 make g++

# Enable Corepack for Yarn
RUN corepack enable

WORKDIR /app

# Copy package manifests first for better layer caching
COPY package.json yarn.lock ./

# Install dependencies
RUN yarn install --frozen-lockfile

# Copy the rest of the source
COPY . .

EXPOSE 9080
