# Innovatech Front Despacho

Repositorio del frontend de la tienda Innovatech, desarrollado con React + Vite + Tailwind CSS.

## Tecnologías
- React
- Vite
- Tailwind CSS
- Node 18 (Alpine)
- Docker

## Estructura del proyecto
- `src/` — componentes y lógica de la aplicación
- `public/` — archivos estáticos
- `Dockerfile` — imagen multi-stage para producción
- `docker-compose.yml` — stack del servicio frontend
- `.github/workflows/deploy.yml` — pipeline CI/CD

## Contenedorización

### Dockerfile
Se utilizó un Dockerfile multi-stage:
- **Stage 1 (builder):** instala dependencias y construye la app con `npm run build`
- **Stage 2 (production):** copia el build generado, crea usuario sin privilegios root y expone el puerto 4173

### Docker Compose
Levanta el servicio frontend en el puerto 4173 con variables de entorno y política de reinicio automático.

## Cómo ejecutar

### Con Docker Compose
```bash
docker-compose up -d
```

### Manualmente
```bash
docker build -t innovatech-front-despacho:latest .
docker run -d -p 4173:4173 --name frontend_despacho innovatech-front-despacho:latest
```

## Verificar que funciona
```bash
curl http://localhost:4173
```

## Pipeline CI/CD
El pipeline se activa con cada push a la rama `deploy` y realiza:
1. Build de la imagen Docker
2. Push a Docker Hub
3. Deploy automático en el servidor via SSH

### Secrets requeridos en GitHub
- `DOCKER_USERNAME` — usuario de Docker Hub
- `DOCKER_PASSWORD` — token de acceso de Docker Hub

## Autores
- Joaquín Zenteno
- John Beiza
