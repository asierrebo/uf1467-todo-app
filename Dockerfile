FROM node:20-alpine AS builder

WORKDIR /app

COPY package*.json yarn.lock* ./

RUN yarn install --frozen-lockfile || npm install

COPY . .

RUN yarn build || npm run build

FROM nginx:stable-alpine

COPY --from=builder /app/build /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]

