FROM node:16.15.1-alpine AS development

WORKDIR /www/html/docker-svisni-nest/src

COPY package*.json ./

RUN npm install glob rimraf

RUN npm install --only=development

COPY . .

RUN npm run build

FROM node:16.15.1-alpine as production

ARG NODE_ENV=production
ENV NODE_ENV=${NODE_ENV}

WORKDIR /www/html/docker-svisni-nest/src

COPY package*.json ./

RUN npm install --only=production

COPY . .

COPY --from=development /www/html/docker-svisni-nest/dist ./dist

CMD ["node", "dist/main"]