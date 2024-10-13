FROM node:20 as build

WORKDIR /app

COPY package.json ./

RUN npm install

COPY . .

RUN npm run build --staging

FROM nginx:alpine

COPY --from=build /app/build/digital-book-frontend-angular /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
