# Stage 1: Build React/Vite application
FROM node:20-alpine AS build
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# Stage 2: Production static file server with SPA routing support
FROM node:20-alpine
WORKDIR /app
RUN npm install -g serve
COPY --from=build /app/dist /app/dist
EXPOSE 3000
ENV PORT=3000
CMD ["sh", "-c", "serve -s dist -l ${PORT:-3000}"]
