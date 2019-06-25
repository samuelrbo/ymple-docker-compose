FROM node:10.16.0-alpine
LABEL author="Samuel Ramon <samuelrbo@gmail.com>"

USER root

# Install git
RUN apk add --no-cache git

RUN mkdir /app
RUN chmod 775 /app

RUN npm -g install sails
RUN npm -g install grunt-cli

RUN git clone https://github.com/Ymple/ymple-ecommerce.git /app

ENV NODE_PATH=/app/node_modules
ENV PATH=$NODE_PATH/.bin:$PATH

WORKDIR /app

RUN sed -i "s/host: 'localhost'/host: 'mongodb'/g" config/connections.js

RUN npm install

# Default ymple port
EXPOSE 1338

VOLUME [ "/app" ]

CMD [ "node", "app.js" ]
