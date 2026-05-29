# Stage 1: build
FROM node:18-alpine AS builder
WORKDIR /app
COPY package*.json ./
RUN npm install --no-cache
COPY . .
RUN npm run build

# Stage 2: produccion
FROM node:18-alpine AS production
WORKDIR /app
RUN adduser -D appuser
COPY --from=builder --chown=appuser:appuser /app/dist ./dist
COPY --from=builder --chown=appuser:appuser /app/package*.json ./
RUN npm install --no-cache
USER appuser
EXPOSE 4173
CMD ["npm", "run", "preview", "--", "--host", "0.0.0.0"]
