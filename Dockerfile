FROM node:13.12.0-alpine as build

WORKDIR /project
COPY . /project

RUN npm install

RUN npm run build
RUN ls "-lah"

FROM nginx:stable-alpine
COPY --from=build /project/build /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]