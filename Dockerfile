# Build Stage
FROM node:20-alpine as build
WORKDIR /app

# Copy package files first for better caching
COPY package*.json ./

# Install ALL dependencies (including devDependencies like vite plugins)
RUN npm install

# Copy the rest of the code (including index.html, App.js, vite.config.js)
COPY . .

# Pass build arguments for your Secrets
ARG VITE_APP_ENV
ENV VITE_APP_ENV=$VITE_APP_ENV

# Run the build
RUN npm run build

# Production Stage
FROM nginx:stable-alpine
# Copy the build output from the first stage
COPY --from=build /app/dist /usr/share/nginx/html
# Copy your nginx config
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
