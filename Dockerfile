FROM node:20-alpine as build
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .

# These ARGs allow GitHub Secrets to pass into the React build
ARG VITE_APP_ENV
ENV VITE_APP_ENV=$VITE_APP_ENV

RUN npm run build

FROM nginx:stable-alpine
COPY --from=build /app/dist /usr/share/nginx/html
# Custom nginx config for SPA routing
COPY nginx.conf /etc/nginx/conf.d/default.conf 
EXPOSE 80
