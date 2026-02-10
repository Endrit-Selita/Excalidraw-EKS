# FROM node:20-alpine AS builder
# WORKDIR /app
# COPY package*.json yarn.lock ./
# RUN yarn install --frozen-lockfile
# COPY . .
# RUN yarn build

# FROM node:20-alpine
# RUN addgroup -S eksgroup && adduser -S k81 -G eksgroup
# WORKDIR /app
# COPY --from=builder /app/build ./build
# RUN chown -R k81:eksgroup /app
# RUN yarn global add serve
# USER devone
# ENV PORT=8080
# EXPOSE 8080
# CMD ["serve", "-s", "build", "-l", "8080"]

# =========================================
# Stage 1: Build the React.js Application
# =========================================

# Use a lightweight Node.js image for building (customizable via ARG)
FROM node:20-alpine AS builder

# Set the working directory inside the container
WORKDIR /app

# Copy package-related files first to leverage Docker's caching mechanism
COPY package*.json yarn.lock ./

COPY excalidraw-app/package.json ./excalidraw-app/package.json

# Install project dependencies using npm ci (ensures a clean, reproducible install)
RUN yarn install --frozen-lockfile

# Copy the rest of the application source code into the container
COPY . .

RUN yarn add -W cross-env

# Build the React.js application (outputs to /app/dist)
RUN yarn build

# =========================================
# Stage 2: Prepare Nginx to Serve Static Files
# =========================================

FROM nginx:alpine AS runner

# Copy custom Nginx config
COPY nginx.conf /etc/nginx/nginx.conf

# Copy the static build output from the build stage to Nginx's default HTML serving directory
COPY --chown=nginx:nginx --from=builder /app/excalidraw-app/build /usr/share/nginx/html

# Use a non-root user for security best practices
USER nginx

# Expose port 8080 to allow HTTP traffic
# Note: The default NGINX container now listens on port 8080 instead of 80 
EXPOSE 8080

# Start Nginx directly with custom config
ENTRYPOINT ["nginx", "-c", "/etc/nginx/nginx.conf"]
CMD ["-g", "daemon off;"]























#FROM --platform=${BUILDPLATFORM} node:18 AS build

#WORKDIR /opt/node_app

#COPY . .

# do not ignore optional dependencies:
# Error: Cannot find module @rollup/rollup-linux-x64-gnu


#RUN --mount=type=cache,target=/root/.cache/yarn \
    #npm_config_target_arch=${TARGETARCH} yarn --network-timeout 600000

#ARG NODE_ENV=production

#RUN npm_config_target_arch=${TARGETARCH} yarn build:app:docker

#FROM --platform=${TARGETPLATFORM} nginx:1.27-alpine

#COPY --from=build /opt/node_app/excalidraw-app/build /usr/share/nginx/html

# HEALTHCHECK CMD wget -q -O /dev/null http://localhost || exit 1
