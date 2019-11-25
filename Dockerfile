FROM node:alpine AS builder
WORKDIR /app/
COPY package.json .
RUN npm install
COPY . .
RUN npm run build
#CMD ["sleep","5000"]
#################################

FROM nginx
EXPOSE 80
COPY --from=builder /app/build/ /usr/share/nginx/html/