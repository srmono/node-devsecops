FROM mhart/alpine-node
  
COPY . /app

COPY package*.json ./

RUN npm install

#CMD node /app/app.js

EXPOSE  3000

CMD [ "node", "/app/app.js" ]
