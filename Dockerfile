FROM node:21 AS mera_bhai
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
CMD ["npm", "start"]


FROM node:slim
COPY --from=mera_bhai /app .
EXPOSE 3000
CMD ["npm", "start"]